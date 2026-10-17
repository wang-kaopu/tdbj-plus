# 项目说明

## 接口说明

## 数据库表

项目使用 MySQL，ShardingSphere 将数据分布在 `tdbj_0` 和 `tdbj_1` 两个数据库中。建表脚本和示例数据位于 `sql/tdbj_0.sql`、`sql/tdbj_1.sql`；`sql/1_create_database.sql` 用于创建数据库。

| 表 | 用途 |
| --- | --- |
| `tb_blog` | 用户发布的探店笔记 |
| `tb_blog_comments` | 笔记评论及回复 |
| `tb_follow` | 用户关注关系 |
| `tb_rollback_failure_log` | Redis 秒杀数据回滚失败记录 |
| `tb_shop` | 商铺资料 |
| `tb_shop_type` | 商铺类型 |
| `tb_sign` | 用户签到记录 |
| `tb_user`、`tb_user_info`、`tb_user_phone` | 用户基础资料、扩展资料和手机号；按用户 ID 或手机号分库分表 |
| `tb_voucher`、`tb_seckill_voucher` | 优惠券及秒杀券库存；按优惠券 ID 分库分表 |
| `tb_voucher_order` | 秒杀优惠券订单；按用户 ID 分库、优惠券 ID 分表 |
| `tb_voucher_order_router` | 订单路由信息；按订单 ID 分库分表 |
| `tb_voucher_reconcile_log` | 秒杀订单与 Redis 库存对账记录；按订单 ID 分库分表 |

`tb_blog`、`tb_blog_comments`、`tb_follow`、`tb_rollback_failure_log`、`tb_shop`、`tb_shop_type` 和 `tb_sign` 是广播表，在两个数据库中各有一份。其余带 `_0`、`_1` 后缀的表由 ShardingSphere 按对应分片字段路由。

## Redis 键值

Redis 保存登录状态、缓存、秒杀状态和业务索引。以下键名中的 `%s` 表示运行时填入的业务 ID 或日期；秒杀相关键中的 `{}` 用于 Redis Cluster 的 Hash Tag，让同一优惠券的数据位于同一槽位。

| 键名示例 | 值和用途 |
| --- | --- |
| `login:code:{phone}`、`login:token:{token}` | 手机验证码和登录用户信息 |
| `cache:shop:{shopId}`、`cache:shop_null:{shopId}`、`user:info:{userId}` | 商铺及用户资料缓存；空值键用于短时缓存未命中结果 |
| `seckill:stock:{voucherId}`、`seckill:user:{voucherId}`、`seckill:voucher:{voucherId}` | 秒杀库存、已下单用户集合、秒杀券资料 |
| `seckill:trace:log:{voucherId}` | 秒杀库存操作记录，用于回滚和对账 |
| `seckill:limit:*`、`seckill:block:*`、`seckill:violation:*` | 秒杀请求限流、临时封禁和违规计数 |
| `seckill:access:token:{voucherId}:{userId}` | 秒杀访问令牌 |
| `seckill:subscribe:user:{voucherId}`、`seckill:subscribe:zset:{voucherId}`、`seckill:subscribe:status:{voucherId}` | 优惠券订阅用户、订阅队列和订阅状态 |
| `seckill:user:level:{level}:members` | 指定会员等级的用户集合 |
| `seckill:shop:topbuyers:daily:{shopId}:{yyyyMMdd}` | 商铺每日购买排行 ZSET，分值记录购买次数 |
| `blog:liked:{blogId}`、`feed:{userId}` | 笔记点赞用户和用户动态列表，均使用 ZSET 保存 |
| `shop:geo:{typeId}`、`sign:{userId}:{yyyyMM}` | 按类型保存的商铺 GEO 数据和用户月签到位图 |

## Kafka 消息

Kafka 主题默认使用 `tdbj-` 前缀，前缀可通过 `prefix.distinction.name` 配置。

| 主题 | 消息内容 | 用途 |
| --- | --- | --- |
| `tdbj-seckill_voucher_topic` | `SeckillVoucherMessage`：`userId`、`voucherId`、`orderId`、`traceId`、库存变更前后数量、变更数量及 `autoIssue` 标记 | 异步处理秒杀下单和订单持久化；消息延迟超过 10 秒时执行库存回滚并记录对账信息 |
| `tdbj-seckill_voucher_cache_invalidation_topic` | `SeckillVoucherInvalidationMessage`：`voucherId`、`reason` | 通知各实例清除对应秒杀券的 Redis 和本地缓存 |
| `tdbj-seckill_voucher_cache_invalidation_topic.DLQ` | 秒杀券缓存失效消息 | 接收处理失败后转入的消息；消费者记录审计日志，供排查处理 |

Kafka 消息外层使用 `MessageExtend`，包含消息体、消息键、消息头、唯一 `uuid` 和生产时间。主题名称中的 `tdbj` 会随 `prefix.distinction.name` 的配置值变化。

### 用户

- `POST /user/code`：发送手机验证码。
- `POST /user/login`：用户登录。
- `POST /user/logout`：退出登录。
- `GET /user/me`：获取当前登录用户。
- `GET /user/info/{id}`：获取用户详细资料。
- `POST /user/level/update`：更新当前用户等级。
- `GET /user/{id}`：根据 ID 获取用户信息。
- `POST /user/sign`：用户签到。
- `GET /user/sign/count`：查询当前用户连续签到天数。

### 商铺

- `GET /shop/{id}`：查询商铺详情。
- `POST /shop`：创建商铺。
- `PUT /shop`：更新商铺。
- `GET /shop/of/type`：按类型查询商铺。
- `GET /shop/of/nearby`：查询附近商铺。
- `GET /shop/of/name`：按名称查询商铺。
- `GET /shop-type/list`：查询商铺类型列表。

### 笔记

- `POST /blog`：发布笔记。
- `DELETE /blog/{id}`：删除笔记。
- `PUT /blog/like/{id}`：点赞或取消点赞。
- `GET /blog/of/me`：查询当前用户发布的笔记。
- `GET /blog/hot`：查询热门笔记。
- `GET /blog/{id}`：查询笔记详情。
- `GET /blog/likes/{id}`：查询笔记点赞用户。
- `GET /blog/of/user`：查询指定用户发布的笔记。
- `GET /blog/of/follow`：查询关注用户的笔记动态。

### 关注

- `PUT /follow/{id}/{isFollow}`：关注或取消关注用户。
- `DELETE /follow/{id}`：取消关注用户。
- `GET /follow/{id}`：查询用户关注列表。
- `GET /follow/fans/{id}`：查询用户粉丝列表。
- `GET /follow/or/not/{id}`：查询当前用户是否关注指定用户。
- `GET /follow/common/{id}`：查询共同关注用户。

### 优惠券

- `POST /voucher/get`：查询秒杀优惠券详情。
- `POST /voucher/seckill`：创建秒杀优惠券。
- `POST /voucher/update/seckill`：更新秒杀优惠券。
- `POST /voucher/update/seckill/stock`：更新秒杀优惠券库存。
- `POST /voucher`：创建优惠券。
- `GET /voucher/list/{shopId}`：查询商铺优惠券列表。
- `POST /voucher/subscribe`：订阅优惠券提醒。
- `POST /voucher/unsubscribe`：取消优惠券提醒订阅。
- `POST /voucher/get/subscribe/status`：查询优惠券订阅状态。
- `POST /voucher/get/subscribe/status/batch`：批量查询优惠券订阅状态。
- `POST /voucher/delay/voucher/reminder`：设置优惠券提醒。

### 优惠券订单

- `GET /voucher-order/seckill/token/{id}`：获取秒杀访问令牌。
- `POST /voucher-order/seckill/{id}`：秒杀优惠券并创建订单。
- `POST /voucher-order/get/seckill/voucher/order-id`：查询秒杀优惠券订单 ID。
- `POST /voucher-order/get/seckill/voucher/order-id/by/voucher-id`：根据优惠券 ID 查询秒杀订单 ID。
- `POST /voucher-order/cancel`：取消优惠券订单。
- `POST /voucher-order/reconciliation/task/all`：执行全部订单对账任务。

### 图片上传

- `POST /upload/blog`：上传笔记图片。
- `DELETE /upload/blog/delete`：删除笔记图片。

### 监控测试

- `任意请求方法 /test/meter`：写入测试监控指标。

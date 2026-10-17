# 接口说明

## 用户

- `POST /user/code`：发送手机验证码。
- `POST /user/login`：用户登录。
- `POST /user/logout`：退出登录。
- `GET /user/me`：获取当前登录用户。
- `GET /user/info/{id}`：获取用户详细资料。
- `POST /user/level/update`：更新当前用户等级。
- `GET /user/{id}`：根据 ID 获取用户信息。
- `POST /user/sign`：用户签到。
- `GET /user/sign/count`：查询当前用户连续签到天数。

## 商铺

- `GET /shop/{id}`：查询商铺详情。
- `POST /shop`：创建商铺。
- `PUT /shop`：更新商铺。
- `GET /shop/of/type`：按类型查询商铺。
- `GET /shop/of/nearby`：查询附近商铺。
- `GET /shop/of/name`：按名称查询商铺。
- `GET /shop-type/list`：查询商铺类型列表。

## 笔记

- `POST /blog`：发布笔记。
- `DELETE /blog/{id}`：删除笔记。
- `PUT /blog/like/{id}`：点赞或取消点赞。
- `GET /blog/of/me`：查询当前用户发布的笔记。
- `GET /blog/hot`：查询热门笔记。
- `GET /blog/{id}`：查询笔记详情。
- `GET /blog/likes/{id}`：查询笔记点赞用户。
- `GET /blog/of/user`：查询指定用户发布的笔记。
- `GET /blog/of/follow`：查询关注用户的笔记动态。

## 关注

- `PUT /follow/{id}/{isFollow}`：关注或取消关注用户。
- `DELETE /follow/{id}`：取消关注用户。
- `GET /follow/{id}`：查询用户关注列表。
- `GET /follow/fans/{id}`：查询用户粉丝列表。
- `GET /follow/or/not/{id}`：查询当前用户是否关注指定用户。
- `GET /follow/common/{id}`：查询共同关注用户。

## 优惠券

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

## 优惠券订单

- `GET /voucher-order/seckill/token/{id}`：获取秒杀访问令牌。
- `POST /voucher-order/seckill/{id}`：秒杀优惠券并创建订单。
- `POST /voucher-order/get/seckill/voucher/order-id`：查询秒杀优惠券订单 ID。
- `POST /voucher-order/get/seckill/voucher/order-id/by/voucher-id`：根据优惠券 ID 查询秒杀订单 ID。
- `POST /voucher-order/cancel`：取消优惠券订单。
- `POST /voucher-order/reconciliation/task/all`：执行全部订单对账任务。

## 图片上传

- `POST /upload/blog`：上传笔记图片。
- `DELETE /upload/blog/delete`：删除笔记图片。

## 监控测试

- `任意请求方法 /test/meter`：写入测试监控指标。

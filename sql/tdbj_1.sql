SET NAMES utf8mb4;
USE tdbj_1;
/*!40101 SET @saved_cs_client = @@character_set_client */;

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
                           `id` bigint unsigned NOT NULL COMMENT '主键',
                           `shop_id` bigint NOT NULL COMMENT '商户id',
                           `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                           `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
                           `images` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '探店的照片，最多9张，多张以","隔开',
                           `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '探店的文字描述',
                           `liked` int unsigned DEFAULT '0' COMMENT '点赞数量',
                           `comments` int unsigned DEFAULT NULL COMMENT '评论数量',
                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog`
--

LOCK TABLES `tb_blog` WRITE;
/*!40000 ALTER TABLE `tb_blog` DISABLE KEYS */;
INSERT INTO `tb_blog` VALUES (4,4,1987042234935279617,'无尽浪漫的夜晚丨在万花丛中摇晃着红酒杯🍷品战斧牛排🥩','/imgs/blogs/7/14/4771fefb-1a87-4252-816c-9f7ec41ffa4a.jpg,/imgs/blogs/4/10/2f07e3c9-ddce-482d-9ea7-c21450f8d7cd.jpg,/imgs/blogs/2/6/b0756279-65da-4f2d-b62a-33f74b06454a.jpg,/imgs/blogs/10/7/7e97f47d-eb49-4dc9-a583-95faa7aed287.jpg,/imgs/blogs/1/2/4a7b496b-2a08-4af7-aa95-df2c3bd0ef97.jpg,/imgs/blogs/14/3/52b290eb-8b5d-403b-8373-ba0bb856d18e.jpg','生活就是一半烟火·一半诗意<br/>手执烟火谋生活·心怀诗意以谋爱·<br/>当然<br/>\r\n男朋友给不了的浪漫要学会自己给🍒<br/>\n无法重来的一生·尽量快乐.<br/><br/>🏰「小筑里·神秘浪漫花园餐厅」🏰<br/><br/>\n💯这是一家最最最美花园的西餐厅·到处都是花餐桌上是花前台是花  美好无处不在\n品一口葡萄酒，维亚红酒马瑟兰·微醺上头工作的疲惫消失无际·生如此多娇🍃<br/><br/>📍地址:延安路200号(家乐福面)<br/><br/>🚌交通:地铁①号线定安路B口出右转过下通道右转就到啦～<br/><br/>--------------🥣菜品详情🥣---------------<br/><br/>「战斧牛排]<br/>\n超大一块战斧牛排经过火焰的炙烤发出阵阵香，外焦里嫩让人垂涎欲滴，切开牛排的那一刻，牛排的汁水顺势流了出来，分熟的牛排肉质软，简直细嫩到犯规，一刻都等不了要放入嘴里咀嚼～<br/><br/>「奶油培根意面」<br/>太太太好吃了💯<br/>我真的无法形容它的美妙，意面混合奶油香菇的香味真的太太太香了，我真的舔盘了，一丁点美味都不想浪费‼️<br/><br/><br/>「香菜汁烤鲈鱼」<br/>这个酱是辣的 真的绝好吃‼️<br/>鲈鱼本身就很嫩没什么刺，烤过之后外皮酥酥的，鱼肉蘸上酱料根本停不下来啊啊啊啊<br/>能吃辣椒的小伙伴一定要尝尝<br/><br/>非常可 好吃子🍽\n<br/>--------------🍃个人感受🍃---------------<br/><br/>【👩🏻‍🍳服务】<br/>小姐姐特别耐心的给我们介绍彩票 <br/>推荐特色菜品，拍照需要帮忙也是尽心尽力配合，太爱他们了<br/><br/>【🍃环境】<br/>比较有格调的西餐厅 整个餐厅的布局可称得上的万花丛生 有种在人间仙境的感觉🌸<br/>集美食美酒与鲜花为一体的风格店铺 令人向往<br/>烟火皆是生活 人间皆是浪漫<br/>',1,104,'2021-12-28 11:50:01','2025-11-08 06:28:33'),(5,1,1987042234935279617,'人均30💰杭州这家港式茶餐厅我疯狂打call‼️','/imgs/blogs/4/7/863cc302-d150-420d-a596-b16e9232a1a6.jpg,/imgs/blogs/11/12/8b37d208-9414-4e78-b065-9199647bb3e3.jpg,/imgs/blogs/4/1/fa74a6d6-3026-4cb7-b0b6-35abb1e52d11.jpg,/imgs/blogs/9/12/ac2ce2fb-0605-4f14-82cc-c962b8c86688.jpg,/imgs/blogs/4/0/26a7cd7e-6320-432c-a0b4-1b7418f45ec7.jpg,/imgs/blogs/15/9/cea51d9b-ac15-49f6-b9f1-9cf81e9b9c85.jpg','又吃到一家好吃的茶餐厅🍴环境是怀旧tvb港风📺边吃边拍照片📷几十种菜品均价都在20+💰可以是很平价了！<br>·<br>店名：九记冰厅(远洋店)<br>地址：杭州市丽水路远洋乐堤港负一楼（溜冰场旁边）<br>·<br>✔️黯然销魂饭（38💰）<br>这碗饭我吹爆！米饭上盖满了甜甜的叉烧 还有两颗溏心蛋🍳每一粒米饭都裹着浓郁的酱汁 光盘了<br>·<br>✔️铜锣湾漏奶华（28💰）<br>黄油吐司烤的脆脆的 上面洒满了可可粉🍫一刀切开 奶盖流心像瀑布一样流出来  满足<br>·<br>✔️神仙一口西多士士（16💰）<br>简简单单却超级好吃！西多士烤的很脆 黄油味浓郁 面包体超级柔软 上面淋了炼乳<br>·<br>✔️怀旧五柳炸蛋饭（28💰）<br>四个鸡蛋炸成蓬松的炸蛋！也太好吃了吧！还有大块鸡排 上淋了酸甜的酱汁 太合我胃口了！！<br>·<br>✔️烧味双拼例牌（66💰）<br>选了烧鹅➕叉烧 他家烧腊品质真的惊艳到我！据说是每日广州发货 到店现烧现卖的黑棕鹅 每口都是正宗的味道！肉质很嫩 皮超级超级酥脆！一口爆油！叉烧肉也一点都不柴 甜甜的很入味 搭配梅子酱很解腻 ！<br>·<br>✔️红烧脆皮乳鸽（18.8💰）<br>乳鸽很大只 这个价格也太划算了吧， 肉质很有嚼劲 脆皮很酥 越吃越香～<br>·<br>✔️大满足小吃拼盘（25💰）<br>翅尖➕咖喱鱼蛋➕蝴蝶虾➕盐酥鸡<br>zui喜欢里面的咖喱鱼！咖喱酱香甜浓郁！鱼蛋很q弹～<br>·<br>✔️港式熊仔丝袜奶茶（19💰）<br>小熊🐻造型的奶茶冰也太可爱了！颜值担当 很地道的丝袜奶茶 茶味特别浓郁～<br>·',2,0,'2021-12-28 12:57:49','2025-11-08 06:28:33'),(6,10,1987041610793484289,'杭州周末好去处｜💰50就可以骑马啦🐎','/imgs/blogs/blog1.jpg','杭州周末好去处｜💰50就可以骑马啦🐎',1,0,'2022-01-11 08:05:47','2025-11-08 06:28:37'),(7,10,1987041610793484289,'杭州周末好去处｜💰50就可以骑马啦🐎','/imgs/blogs/blog1.jpg','杭州周末好去处｜💰50就可以骑马啦🐎',1,0,'2022-01-11 08:05:47','2025-11-08 06:28:37');
DELETE FROM `tb_blog` WHERE `id` = 7;
INSERT INTO `tb_blog` VALUES
(8,3,1987042505555968001,'运河边这家新白鹿，糖醋里脊还是一如既往稳🍖','/imgs/blogs/2/1/7b31a5da-4ee3-4c9e-a38a-2dbc8de0345a.jpg','周末和朋友在运河上街逛完，顺路来吃新白鹿。糖醋里脊外脆里嫩，酱汁酸甜刚好；蛋黄鸡翅和东坡肉也很适合两三个人一起分着吃。两个人点了四道菜，人均大概七十多。饭点要等位，建议早点来。',31,8,'2025-10-12 11:20:00','2025-10-12 11:20:00'),
(9,8,1987042234935279617,'运河上街的寿司店适合下班后来吃🍣','/imgs/blogs/2/2/852f49b7-432c-4d01-b7b1-8e152854f2a9.jpg','工作日晚上过来基本不用排队。炙烤三文鱼寿司有淡淡的焦香，鳗鱼饭分量也够，味道不会太咸。店里位置不算多，想慢慢聊天的话最好避开七点左右。两个人点了寿司拼盘和一份饭，花了九十出头。',24,5,'2025-10-10 18:42:00','2025-10-10 18:42:00'),
(10,2,1987041610793484289,'下雨天就想吃一锅热乎的铜锅涮肉🥢','/imgs/blogs/2/3/39d65be4-af94-458d-b6de-bc8ca20735bb.jpg','和同事下班后来吃，清汤锅底涮羊肉很鲜，麻酱可以自己调，香菜和腐乳都能加。手切羊肉下锅几秒就能吃，冻豆腐吸饱汤汁也很好吃。两个人点了肉和几样蔬菜，人均一百左右，服务员加汤挺及时。',42,11,'2025-10-08 19:05:00','2025-10-08 19:05:00'),
(11,1,1987042505555968001,'第一次吃炉鱼，烤鱼配冰粉比想象中搭🐟','/imgs/blogs/2/4/7ed91c85-975a-40dd-9f36-abb2e87a1155.jpg','选了香辣口味，鱼皮烤得有点焦香，鱼肉还算嫩。配菜里最喜欢年糕和豆芽，煮久一点更入味。辣度对我来说刚好，不能吃辣可以先选微辣。两个人点一条鱼加主食，最后还剩了一点，三四个人吃更合适。',19,4,'2025-10-06 17:30:00','2025-10-06 17:30:00'),
(12,4,1987042234935279617,'乐堤港这家意式小馆，奶油蘑菇意面值得点🍝','/imgs/blogs/2/6/b0756279-65da-4f2d-b62a-33f74b06454a.jpg','周五晚上来吃饭，店里灯光很舒服，靠窗位置可以提前预约。奶油蘑菇意面酱汁浓但不腻，披萨饼底比较薄，趁热吃口感最好。两个人点一份意面、一张披萨和饮料刚好，结账一百六左右。',37,9,'2025-10-04 19:18:00','2025-10-04 19:18:00'),
(13,5,1987041610793484289,'藏在小巷里的咖啡店，周末可以坐一下午☕','/imgs/blogs/3/12/9b19dd28-1eb1-4b70-bdc2-95544eecfeb2.jpg','下午从运河边散步过来，点了冰拿铁和巴斯克。咖啡豆是偏坚果巧克力风味，巴斯克中心比较绵密，不会甜到发腻。店里桌子不多，周末两点后容易坐满，想带电脑的话工作日上午更合适。两杯饮品加一块蛋糕七十多。',16,3,'2025-10-02 14:10:00','2025-10-02 14:10:00'),
(14,1,1987042505555968001,'早起来吃一碗片儿川，雪菜笋片很提鲜🍜','/imgs/blogs/3/14/a6b9ec21-6708-4d6d-8f77-ed31c856e5b2.jpg','附近办事路过，看到店里不少本地人在吃就进来了。面条有嚼劲，雪菜和笋片炒得很香，汤头清爽，想吃得更饱可以加一份腰花。早餐时段出餐挺快，一碗二十多，适合一个人简单吃顿饭。',28,6,'2025-09-29 08:25:00','2025-09-29 08:25:00'),
(15,7,1987042234935279617,'周末和朋友吃烤肉，五花肉配生菜很解腻🥩','/imgs/blogs/11/4/fbfe0547-bd5d-454c-98c4-411e2e0dce65.jpg','店员会帮忙烤肉，五花肉烤到边缘微脆后包生菜，再加一点泡菜和蒜片刚刚好。牛肋条肉味比较足，建议先吃原味再蘸酱。我们三个人点了肉、冷面和小菜，人均一百二左右，周末最好提前取号。',33,7,'2025-09-27 18:50:00','2025-09-27 18:50:00'),
(16,3,1987041610793484289,'这家面包店的碱水结，第二天加热也好吃🥨','/imgs/blogs/11/8/ca9ba6e6-068a-4a09-8b12-5719f86d270c.jpg','路过买了碱水结、奶油卷和一个可颂。碱水结外皮有韧劲，里面组织比较扎实；可颂建议当天吃，回家用空气炸锅热两分钟也能恢复酥脆。店里下午补货，晚一点热门口味可能会卖完。三样一共四十多。',12,2,'2025-09-25 16:35:00','2025-09-25 16:35:00'),
(17,6,1987042505555968001,'朋友生日选了家小酒馆，烤鸡和薯条都不错🍗','/imgs/blogs/14/13/2ec4622e-de82-4bb3-9acf-33b589850cd2.jpg','提前订了靠里面的位置，店里音乐不吵，聊天不用提高音量。烤鸡外皮入味，薯条趁热吃最好，朋友点的气泡酒酸甜清爽。四个人点了几道小食和主菜，人均一百五左右；生日布置可以提前和店员沟通。',21,4,'2025-09-22 20:12:00','2025-09-22 20:12:00');
UPDATE `tb_blog` SET `images` = CASE `id` WHEN 8 THEN '/imgs/blogs/sample-chinese-food.jpg' WHEN 9 THEN '/imgs/blogs/sample-sushi.jpg' WHEN 10 THEN '/imgs/blogs/sample-hotpot.jpg' WHEN 11 THEN '/imgs/blogs/sample-grilled-fish.jpg' WHEN 12 THEN '/imgs/blogs/sample-pasta.jpg' WHEN 13 THEN '/imgs/blogs/sample-cafe.jpg' WHEN 14 THEN '/imgs/blogs/sample-noodles.jpg' WHEN 15 THEN '/imgs/blogs/sample-bbq.jpg' WHEN 16 THEN '/imgs/blogs/sample-croissant.jpg' WHEN 17 THEN '/imgs/blogs/sample-wine-dinner.jpg' END WHERE `id` BETWEEN 8 AND 17;
/*!40000 ALTER TABLE `tb_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_comments`
--

DROP TABLE IF EXISTS `tb_blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_comments` (
                                    `id` bigint unsigned NOT NULL COMMENT '主键',
                                    `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                                    `blog_id` bigint unsigned NOT NULL COMMENT '探店id',
                                    `parent_id` bigint unsigned NOT NULL COMMENT '关联的1级评论id，如果是一级评论，则值为0',
                                    `answer_id` bigint unsigned NOT NULL COMMENT '回复的评论id',
                                    `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复的内容',
                                    `liked` int unsigned DEFAULT NULL COMMENT '点赞数',
                                    `status` tinyint unsigned DEFAULT NULL COMMENT '状态，0：正常，1：被举报，2：禁止查看',
                                    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_comments`
--

LOCK TABLES `tb_blog_comments` WRITE;
/*!40000 ALTER TABLE `tb_blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_follow`
--

DROP TABLE IF EXISTS `tb_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_follow` (
                             `id` bigint NOT NULL COMMENT '主键',
                             `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                             `follow_user_id` bigint unsigned NOT NULL COMMENT '关联的用户id',
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_follow`
--

LOCK TABLES `tb_follow` WRITE;
/*!40000 ALTER TABLE `tb_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rollback_failure_log`
--

DROP TABLE IF EXISTS `tb_rollback_failure_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rollback_failure_log` (
                                           `id` bigint NOT NULL COMMENT '主键',
                                           `voucher_id` bigint unsigned NOT NULL COMMENT '优惠券id',
                                           `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                                           `order_id` bigint DEFAULT NULL COMMENT '订单id',
                                           `trace_id` bigint DEFAULT NULL COMMENT '追踪唯一标识',
                                           `detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '失败详情',
                                           `result_code` int DEFAULT NULL COMMENT 'Lua返回码(BaseCode)',
                                           `retry_attempts` int DEFAULT NULL COMMENT '已尝试的重试次数',
                                           `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源组件',
                                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           KEY `idx_voucher_user` (`voucher_id`,`user_id`) USING BTREE,
                                           KEY `idx_trace_id` (`trace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='Redis回滚失败日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rollback_failure_log`
--

LOCK TABLES `tb_rollback_failure_log` WRITE;
/*!40000 ALTER TABLE `tb_rollback_failure_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_rollback_failure_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seckill_voucher_0`
--

DROP TABLE IF EXISTS `tb_seckill_voucher_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_seckill_voucher_0` (
                                        `id` bigint NOT NULL,
                                        `voucher_id` bigint unsigned NOT NULL COMMENT '关联的优惠券的id',
                                        `init_stock` int NOT NULL COMMENT '初始化的库存',
                                        `stock` int NOT NULL COMMENT '库存',
                                        `allowed_levels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许参与的会员等级，逗号分隔，如："1,2,3"',
                                        `min_level` int DEFAULT NULL COMMENT '最低会员等级',
                                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
                                        `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',
                                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='秒杀优惠券表，与优惠券是一对一关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seckill_voucher_0`
--

LOCK TABLES `tb_seckill_voucher_0` WRITE;
/*!40000 ALTER TABLE `tb_seckill_voucher_0` DISABLE KEYS */;
INSERT INTO `tb_seckill_voucher_0` VALUES (1987043235650076673,1,200,200,'1,2',1,'2025-11-08 06:23:19','2025-11-02 13:00:00','2025-12-02 15:59:59','2025-11-20 07:23:03');
/*!40000 ALTER TABLE `tb_seckill_voucher_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seckill_voucher_1`
--

DROP TABLE IF EXISTS `tb_seckill_voucher_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_seckill_voucher_1` (
                                        `id` bigint NOT NULL,
                                        `voucher_id` bigint unsigned NOT NULL COMMENT '关联的优惠券的id',
                                        `init_stock` int NOT NULL COMMENT '初始化的库存',
                                        `stock` int NOT NULL COMMENT '库存',
                                        `allowed_levels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '允许参与的会员等级，逗号分隔，如："1,2,3"',
                                        `min_level` int DEFAULT NULL COMMENT '最低会员等级',
                                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
                                        `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',
                                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='秒杀优惠券表，与优惠券是一对一关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seckill_voucher_1`
--

LOCK TABLES `tb_seckill_voucher_1` WRITE;
/*!40000 ALTER TABLE `tb_seckill_voucher_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_seckill_voucher_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop`
--

DROP TABLE IF EXISTS `tb_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_shop` (
                           `id` bigint unsigned NOT NULL COMMENT '主键',
                           `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商铺名称',
                           `type_id` bigint unsigned NOT NULL COMMENT '商铺类型的id',
                           `images` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商铺图片，多个图片以'',''隔开',
                           `area` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商圈，例如陆家嘴',
                           `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
                           `x` double unsigned NOT NULL COMMENT '经度',
                           `y` double unsigned NOT NULL COMMENT '维度',
                           `avg_price` bigint unsigned DEFAULT NULL COMMENT '均价，取整数',
                           `sold` int(10) unsigned zerofill NOT NULL COMMENT '销量',
                           `comments` int(10) unsigned zerofill NOT NULL COMMENT '评论数量',
                           `score` int(2) unsigned zerofill NOT NULL COMMENT '评分，1~5分，乘10保存，避免小数',
                           `open_hours` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '营业时间，例如 10:00-22:00',
                           `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`id`) USING BTREE,
                           KEY `foreign_key_type` (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop`
--

LOCK TABLES `tb_shop` WRITE;
/*!40000 ALTER TABLE `tb_shop` DISABLE KEYS */;
INSERT INTO `tb_shop` VALUES (1,'103茶餐厅',1,'https://qcloud.dpfile.com/pc/jiclIsCKmOI2arxKN1Uf0Hx3PucIJH8q0QSz-Z8llzcN56-_QiKuOvyio1OOxsRtFoXqu0G3iT2T27qat3WhLVEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vfCF2ubeXzk49OsGrXt_KYDCngOyCwZK-s3fqawWswzk.jpg,https://qcloud.dpfile.com/pc/IOf6VX3qaBgFXFVgp75w-KKJmWZjFc8GXDU8g9bQC6YGCpAmG00QbfT4vCCBj7njuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg','大关','金华路锦昌文华苑29号',120.149192,30.316078,80,0000004215,0000003035,37,'10:00-22:00','2021-12-22 10:10:39','2022-01-13 09:32:19'),(2,'蔡馬洪涛烤肉·老北京铜锅涮羊肉',1,'https://p0.meituan.net/bbia/c1870d570e73accbc9fee90b48faca41195272.jpg,http://p0.meituan.net/mogu/397e40c28fc87715b3d5435710a9f88d706914.jpg,https://qcloud.dpfile.com/pc/MZTdRDqCZdbPDUO0Hk6lZENRKzpKRF7kavrkEI99OxqBZTzPfIxa5E33gBfGouhFuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg','拱宸桥/上塘','上塘路1035号（中国工商银行旁）',120.151505,30.333422,85,0000002160,0000001460,46,'11:30-03:00','2021-12-22 11:00:13','2022-01-11 08:12:26'),(3,'新白鹿餐厅(运河上街店)',1,'https://p0.meituan.net/biztone/694233_1619500156517.jpeg,https://img.meituan.net/msmerchant/876ca8983f7395556eda9ceb064e6bc51840883.png,https://img.meituan.net/msmerchant/86a76ed53c28eff709a36099aefe28b51554088.png','运河上街','台州路2号运河上街购物中心F5',120.151954,30.32497,61,0000012035,0000008045,47,'10:30-21:00','2021-12-22 11:10:05','2022-01-11 08:12:42'),(4,'Mamala(杭州远洋乐堤港店)',1,'https://img.meituan.net/msmerchant/232f8fdf09050838bd33fb24e79f30f9606056.jpg,https://qcloud.dpfile.com/pc/rDe48Xe15nQOHCcEEkmKUp5wEKWbimt-HDeqYRWsYJseXNncvMiXbuED7x1tXqN4uzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg','拱宸桥/上塘','丽水路66号远洋乐堤港商城2期1层B115号',120.146659,30.312742,290,0000013519,0000009529,49,'11:00-22:00','2021-12-22 11:17:15','2022-01-11 08:12:51'),(5,'海底捞火锅(水晶城购物中心店）',1,'https://img.meituan.net/msmerchant/054b5de0ba0b50c18a620cc37482129a45739.jpg,https://img.meituan.net/msmerchant/59b7eff9b60908d52bd4aea9ff356e6d145920.jpg,https://qcloud.dpfile.com/pc/Qe2PTEuvtJ5skpUXKKoW9OQ20qc7nIpHYEqJGBStJx0mpoyeBPQOJE4vOdYZwm9AuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg','大关','上塘路458号水晶城购物中心F6',120.15778,30.310633,104,0000004125,0000002764,49,'10:00-07:00','2021-12-22 11:20:58','2022-01-11 08:13:01'),(6,'幸福里老北京涮锅（丝联店）',1,'https://img.meituan.net/msmerchant/e71a2d0d693b3033c15522c43e03f09198239.jpg,https://img.meituan.net/msmerchant/9f8a966d60ffba00daf35458522273ca658239.jpg,https://img.meituan.net/msmerchant/ef9ca5ef6c05d381946fe4a9aa7d9808554502.jpg','拱宸桥/上塘','金华南路189号丝联166号',120.148603,30.318618,130,0000009531,0000007324,46,'11:00-13:50,17:00-20:50','2021-12-22 11:24:53','2022-01-11 08:13:09'),(7,'炉鱼(拱墅万达广场店)',1,'https://img.meituan.net/msmerchant/909434939a49b36f340523232924402166854.jpg,https://img.meituan.net/msmerchant/32fd2425f12e27db0160e837461c10303700032.jpg,https://img.meituan.net/msmerchant/f7022258ccb8dabef62a0514d3129562871160.jpg','北部新城','杭行路666号万达商业中心4幢2单元409室(铺位号4005)',120.124691,30.336819,85,0000002631,0000001320,47,'00:00-24:00','2021-12-22 11:40:52','2022-01-11 08:13:19'),(8,'浅草屋寿司（运河上街店）',1,'https://img.meituan.net/msmerchant/cf3dff697bf7f6e11f4b79c4e7d989e4591290.jpg,https://img.meituan.net/msmerchant/0b463f545355c8d8f021eb2987dcd0c8567811.jpg,https://img.meituan.net/msmerchant/c3c2516939efaf36c4ccc64b0e629fad587907.jpg','运河上街','拱墅区金华路80号运河上街B1',120.150526,30.325231,88,0000002406,0000001206,46,' 11:00-21:30','2021-12-22 11:51:06','2022-01-11 08:13:25'),(9,'羊老三羊蝎子牛仔排北派炭火锅(运河上街店)',1,'https://p0.meituan.net/biztone/163160492_1624251899456.jpeg,https://img.meituan.net/msmerchant/e478eb16f7e31a7f8b29b5e3bab6de205500837.jpg,https://img.meituan.net/msmerchant/6173eb1d18b9d70ace7fdb3f2dd939662884857.jpg','运河上街','台州路2号运河上街购物中心F5',120.150598,30.325251,101,0000002763,0000001363,44,'11:00-21:30','2021-12-22 11:53:59','2022-01-11 08:13:34'),(10,'开乐迪KTV（运河上街店）',2,'https://p0.meituan.net/joymerchant/a575fd4adb0b9099c5c410058148b307-674435191.jpg,https://p0.meituan.net/merchantpic/68f11bf850e25e437c5f67decfd694ab2541634.jpg,https://p0.meituan.net/dpdeal/cb3a12225860ba2875e4ea26c6d14fcc197016.jpg','运河上街','台州路2号运河上街购物中心F4',120.149093,30.324666,67,0000026891,0000000902,37,'00:00-24:00','2021-12-22 12:25:16','2021-12-22 12:25:16'),(11,'INLOVE KTV(水晶城店)',2,'https://p0.meituan.net/dpmerchantpic/53e74b200211d68988a4f02ae9912c6c1076826.jpg,https://qcloud.dpfile.com/pc/4iWtIvzLzwM2MGgyPu1PCDb4SWEaKqUeHm--YAt1EwR5tn8kypBcqNwHnjg96EvT_Gd2X_f-v9T8Yj4uLt25Gg.jpg,https://qcloud.dpfile.com/pc/WZsJWRI447x1VG2x48Ujgu7vwqksi_9WitdKI4j3jvIgX4MZOpGNaFtM93oSSizbGybIjx5eX6WNgCPvcASYAw.jpg','水晶城','上塘路458号水晶城购物中心6层',120.15853,30.310002,75,0000035977,0000005684,47,'11:30-06:00','2021-12-22 12:29:02','2021-12-22 12:39:00'),(12,'魅(杭州远洋乐堤港店)',2,'https://p0.meituan.net/dpmerchantpic/63833f6ba0393e2e8722420ef33f3d40466664.jpg,https://p0.meituan.net/dpmerchantpic/ae3c94cc92c529c4b1d7f68cebed33fa105810.png,','远洋乐堤港','丽水路58号远洋乐堤港F4',120.14983,30.31211,88,0000006444,0000000235,46,'10:00-02:00','2021-12-22 12:34:34','2021-12-22 12:34:34'),(13,'讴K拉量贩KTV(北城天地店)',2,'https://p1.meituan.net/merchantpic/598c83a8c0d06fe79ca01056e214d345875600.jpg,https://qcloud.dpfile.com/pc/HhvI0YyocYHRfGwJWqPQr34hRGRl4cWdvlNwn3dqghvi4WXlM2FY1te0-7pE3Wb9_Gd2X_f-v9T8Yj4uLt25Gg.jpg,https://qcloud.dpfile.com/pc/F5ZVzZaXFE27kvQzPnaL4V8O9QCpVw2nkzGrxZE8BqXgkfyTpNExfNG5CEPQX4pjGybIjx5eX6WNgCPvcASYAw.jpg','D32天阳购物中心','湖州街567号北城天地5层',120.130453,30.327655,58,0000018997,0000001857,41,'12:00-02:00','2021-12-22 12:38:54','2021-12-22 12:40:04'),(14,'星聚会KTV(拱墅区万达店)',2,'https://p0.meituan.net/dpmerchantpic/f4cd6d8d4eb1959c3ea826aa05a552c01840451.jpg,https://p0.meituan.net/dpmerchantpic/2efc07aed856a8ab0fc75c86f4b9b0061655777.jpg,https://qcloud.dpfile.com/pc/zWfzzIorCohKT0bFwsfAlHuayWjI6DBEMPHHncmz36EEMU9f48PuD9VxLLDAjdoU_Gd2X_f-v9T8Yj4uLt25Gg.jpg','北部新城','杭行路666号万达广场C座1-2F',120.128958,30.337252,60,0000017771,0000000685,47,'10:00-22:00','2021-12-22 12:48:54','2021-12-22 12:48:54');
/*!40000 ALTER TABLE `tb_shop` ENABLE KEYS */;
UNLOCK TABLES;

INSERT INTO `tb_shop` (`id`, `name`, `type_id`, `images`, `area`, `address`, `x`, `y`, `avg_price`, `sold`, `comments`, `score`, `open_hours`, `create_time`, `update_time`) VALUES
(15,'运河印象造型',3,'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?auto=format&fit=crop&w=900&q=80','大关','金华路锦昌文华苑29号',120.149192,30.316078,128,0000003280,0000000845,48,'10:00-21:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(16,'乐堤港发型工作室',3,'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=900&q=80','拱宸桥/上塘','丽水路58号远洋乐堤港F2',120.149830,30.312110,168,0000002160,0000000678,49,'10:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(17,'北城造型沙龙',3,'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?auto=format&fit=crop&w=900&q=80','北部新城','杭行路666号万达广场2层',120.128958,30.337252,98,0000001840,0000000426,46,'09:30-21:30',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(18,'运河健身中心',4,'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=900&q=80','运河上街','台州路2号运河上街购物中心3层',120.151954,30.324970,188,0000005620,0000001432,47,'06:30-23:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(19,'大关力量训练馆',4,'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=900&q=80','大关','上塘路458号水晶城购物中心5层',120.157780,30.310633,158,0000004380,0000001085,48,'07:00-22:30',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(20,'北城活力健身房',4,'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?auto=format&fit=crop&w=900&q=80','北部新城','杭行路666号万达广场3层',120.124691,30.336819,128,0000003910,0000000954,46,'07:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(21,'足下时光足疗馆',5,'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=900&q=80','大关','金华南路189号丝联166号2层',120.148603,30.318618,138,0000002480,0000000712,48,'12:00-02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(22,'拱宸舒心按摩',5,'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?auto=format&fit=crop&w=900&q=80','拱宸桥/上塘','上塘路1035号2层',120.151505,30.333422,168,0000001920,0000000568,47,'11:00-01:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(23,'水晶城足道会馆',5,'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=900&q=80','大关','上塘路458号水晶城购物中心4层',120.158530,30.310002,198,0000003170,0000000923,49,'10:00-02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(24,'云水间美容SPA',6,'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=900&q=80','拱宸桥/上塘','丽水路66号远洋乐堤港2层',120.146659,30.312742,328,0000001730,0000000516,49,'10:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(25,'大关悦颜SPA',6,'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?auto=format&fit=crop&w=900&q=80','大关','金华路锦昌文华苑31号',120.150210,30.316420,268,0000001420,0000000385,48,'10:00-21:30',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(26,'北城沐光生活馆',6,'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=900&q=80','北部新城','湖州街567号北城天地2层',120.130453,30.327655,358,0000001260,0000000342,47,'10:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(27,'运河亲子乐园',7,'https://images.unsplash.com/photo-1472162072942-cd5147eb3902?auto=format&fit=crop&w=900&q=80','运河上街','台州路2号运河上街购物中心3层',120.150526,30.325231,96,0000004310,0000001126,48,'10:00-21:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(28,'水晶城儿童探索馆',7,'https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?auto=format&fit=crop&w=900&q=80','大关','上塘路458号水晶城购物中心3层',120.157780,30.310633,128,0000003650,0000000942,47,'10:00-21:30',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(29,'北城家庭游乐场',7,'https://images.unsplash.com/photo-1471286174890-9c112ffca5b4?auto=format&fit=crop&w=900&q=80','北部新城','杭行路666号万达广场3层',120.124691,30.336819,88,0000002890,0000000734,46,'10:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(30,'运河微醺酒吧',8,'https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=900&q=80','运河上街','台州路2号运河上街购物中心1层',120.149093,30.324666,126,0000002630,0000000678,47,'17:00-02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(31,'乐堤港夜色酒馆',8,'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?auto=format&fit=crop&w=900&q=80','拱宸桥/上塘','丽水路58号远洋乐堤港1层',120.149830,30.312110,158,0000002180,0000000591,48,'16:00-02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(32,'大关月光清吧',8,'https://images.unsplash.com/photo-1513558161293-cdaf765edfd7?auto=format&fit=crop&w=900&q=80','大关','上塘路458号水晶城购物中心1层',120.158530,30.310002,98,0000001760,0000000437,46,'17:00-01:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(33,'运河派对空间',9,'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=900&q=80','运河上街','台州路2号运河上街购物中心5层',120.151954,30.324970,688,0000000860,0000000248,48,'10:00-次日02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(34,'水晶城欢聚轰趴馆',9,'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=900&q=80','大关','上塘路458号水晶城购物中心6层',120.158530,30.310002,888,0000000730,0000000196,47,'10:00-次日02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(35,'北城家庭派对馆',9,'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=80','北部新城','杭行路666号万达广场4层',120.128958,30.337252,768,0000000610,0000000162,46,'10:00-次日02:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(36,'美甲日记工作室',10,'https://images.unsplash.com/photo-1604654894610-df63bc536371?auto=format&fit=crop&w=900&q=80','大关','金华路锦昌文华苑29号2层',120.149192,30.316078,128,0000002810,0000000734,49,'10:00-21:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(37,'乐堤港指尖美学',10,'https://images.unsplash.com/photo-1610992015732-2449b76344bc?auto=format&fit=crop&w=900&q=80','拱宸桥/上塘','丽水路66号远洋乐堤港2层',120.146659,30.312742,168,0000001940,0000000521,48,'10:00-22:00',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(38,'北城美睫美甲屋',10,'https://images.unsplash.com/photo-1632345031435-8727f6897d53?auto=format&fit=crop&w=900&q=80','北部新城','湖州街567号北城天地1层',120.130453,30.327655,148,0000001630,0000000438,47,'10:00-21:30',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

--
-- Table structure for table `tb_shop_type`
--

DROP TABLE IF EXISTS `tb_shop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_shop_type` (
                                `id` bigint unsigned NOT NULL COMMENT '主键',
                                `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型名称',
                                `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
                                `sort` int unsigned DEFAULT NULL COMMENT '顺序',
                                `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_type`
--

LOCK TABLES `tb_shop_type` WRITE;
/*!40000 ALTER TABLE `tb_shop_type` DISABLE KEYS */;
INSERT INTO `tb_shop_type` VALUES (1,'美食','/types/ms.png',1,'2021-12-22 12:17:47','2021-12-23 03:24:31'),(2,'KTV','/types/KTV.png',2,'2021-12-22 12:18:27','2021-12-23 03:24:31'),(3,'丽人·美发','/types/lrmf.png',3,'2021-12-22 12:18:48','2021-12-23 03:24:31'),(4,'健身运动','/types/jsyd.png',10,'2021-12-22 12:19:04','2021-12-23 03:24:31'),(5,'按摩·足疗','/types/amzl.png',5,'2021-12-22 12:19:27','2021-12-23 03:24:31'),(6,'美容SPA','/types/spa.png',6,'2021-12-22 12:19:35','2021-12-23 03:24:31'),(7,'亲子游乐','/types/qzyl.png',7,'2021-12-22 12:19:53','2021-12-23 03:24:31'),(8,'酒吧','/types/jiuba.png',8,'2021-12-22 12:20:02','2021-12-23 03:24:31'),(9,'轰趴馆','/types/hpg.png',9,'2021-12-22 12:20:08','2021-12-23 03:24:31'),(10,'美睫·美甲','/types/mjmj.png',4,'2021-12-22 12:21:46','2021-12-23 03:24:31');
/*!40000 ALTER TABLE `tb_shop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sign`
--

DROP TABLE IF EXISTS `tb_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sign` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
                           `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                           `year` year NOT NULL COMMENT '签到的年',
                           `month` tinyint NOT NULL COMMENT '签到的月',
                           `date` date NOT NULL COMMENT '签到的日期',
                           `is_backup` tinyint unsigned DEFAULT NULL COMMENT '是否补签',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sign`
--

LOCK TABLES `tb_sign` WRITE;
/*!40000 ALTER TABLE `tb_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_0`
--

DROP TABLE IF EXISTS `tb_user_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_0` (
                             `id` bigint unsigned NOT NULL COMMENT '主键',
                             `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
                             `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码，加密存储',
                             `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '昵称，默认是用户id',
                             `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '人物头像',
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE KEY `uniqe_key_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_0`
--

LOCK TABLES `tb_user_0` WRITE;
/*!40000 ALTER TABLE `tb_user_0` DISABLE KEYS */;
INSERT INTO `tb_user_0` VALUES (1987041610793484289,'13686869696','','小鱼同学','/imgs/blogs/blog1.jpg','2025-11-08 06:16:52','2025-11-08 06:17:40'),(1987042234935279617,'13838411438','','可可今天不吃肉','/imgs/icons/kkjtbcr.jpg','2025-11-08 06:19:20','2025-11-08 06:19:55'),(1987042505555968001,'13456789001','','可爱多','/imgs/icons/user5-icon.png','2025-11-08 06:20:25','2025-11-08 06:20:47');
/*!40000 ALTER TABLE `tb_user_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_1`
--

DROP TABLE IF EXISTS `tb_user_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_1` (
                             `id` bigint unsigned NOT NULL COMMENT '主键',
                             `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
                             `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码，加密存储',
                             `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '昵称，默认是用户id',
                             `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '人物头像',
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE KEY `uniqe_key_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_1`
--

LOCK TABLES `tb_user_1` WRITE;
/*!40000 ALTER TABLE `tb_user_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info_0`
--

DROP TABLE IF EXISTS `tb_user_info_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_info_0` (
                                  `id` bigint unsigned NOT NULL COMMENT '主键',
                                  `user_id` bigint unsigned NOT NULL COMMENT '主键，用户id',
                                  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '城市名称',
                                  `introduce` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个人介绍，不要超过128个字符',
                                  `fans` int unsigned DEFAULT '0' COMMENT '粉丝数量',
                                  `followee` int unsigned DEFAULT '0' COMMENT '关注的人的数量',
                                  `gender` tinyint unsigned DEFAULT '0' COMMENT '性别，0：男，1：女',
                                  `birthday` date DEFAULT NULL COMMENT '生日',
                                  `credits` int unsigned DEFAULT '0' COMMENT '积分',
                                  `level` tinyint unsigned DEFAULT '0' COMMENT '会员级别，0~9级,0代表未开通会员',
                                  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info_0`
--

LOCK TABLES `tb_user_info_0` WRITE;
/*!40000 ALTER TABLE `tb_user_info_0` DISABLE KEYS */;
INSERT INTO `tb_user_info_0` VALUES (1987041610868981762,1987041610793484289,'',NULL,0,0,0,NULL,0,1,'2025-11-08 06:16:52','2025-11-08 06:16:52'),(1987042234943668226,1987042234935279617,'',NULL,0,0,0,NULL,0,1,'2025-11-08 06:19:20','2025-11-08 06:19:20'),(1987042505560162305,1987042505555968001,'',NULL,0,0,0,NULL,0,1,'2025-11-08 06:20:25','2025-11-08 06:20:25');
/*!40000 ALTER TABLE `tb_user_info_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info_1`
--

DROP TABLE IF EXISTS `tb_user_info_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_info_1` (
                                  `id` bigint unsigned NOT NULL COMMENT '主键',
                                  `user_id` bigint unsigned NOT NULL COMMENT '主键，用户id',
                                  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '城市名称',
                                  `introduce` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个人介绍，不要超过128个字符',
                                  `fans` int unsigned DEFAULT '0' COMMENT '粉丝数量',
                                  `followee` int unsigned DEFAULT '0' COMMENT '关注的人的数量',
                                  `gender` tinyint unsigned DEFAULT '0' COMMENT '性别，0：男，1：女',
                                  `birthday` date DEFAULT NULL COMMENT '生日',
                                  `credits` int unsigned DEFAULT '0' COMMENT '积分',
                                  `level` tinyint unsigned DEFAULT '0' COMMENT '会员级别，0~9级,0代表未开通会员',
                                  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info_1`
--

LOCK TABLES `tb_user_info_1` WRITE;
/*!40000 ALTER TABLE `tb_user_info_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_info_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_phone_0`
--

DROP TABLE IF EXISTS `tb_user_phone_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_phone_0` (
                                   `id` bigint NOT NULL COMMENT '主键id',
                                   `user_id` bigint NOT NULL COMMENT '用户id',
                                   `phone` varchar(512) NOT NULL COMMENT '手机号',
                                   `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   PRIMARY KEY (`id`),
                                   KEY `phone_idx` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户手机表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_phone_0`
--

LOCK TABLES `tb_user_phone_0` WRITE;
/*!40000 ALTER TABLE `tb_user_phone_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_phone_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_phone_1`
--

DROP TABLE IF EXISTS `tb_user_phone_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_phone_1` (
                                   `id` bigint NOT NULL COMMENT '主键id',
                                   `user_id` bigint NOT NULL COMMENT '用户id',
                                   `phone` varchar(512) NOT NULL COMMENT '手机号',
                                   `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   PRIMARY KEY (`id`),
                                   KEY `phone_idx` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户手机表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_phone_1`
--

LOCK TABLES `tb_user_phone_1` WRITE;
/*!40000 ALTER TABLE `tb_user_phone_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_phone_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_0`
--

DROP TABLE IF EXISTS `tb_voucher_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_0` (
                                `id` bigint unsigned NOT NULL COMMENT '主键',
                                `shop_id` bigint unsigned DEFAULT NULL COMMENT '商铺id',
                                `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代金券标题',
                                `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '副标题',
                                `rules` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用规则',
                                `pay_value` bigint unsigned NOT NULL COMMENT '支付金额，单位是分。例如200代表2元',
                                `actual_value` bigint NOT NULL COMMENT '抵扣金额，单位是分。例如200代表2元',
                                `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0,普通券；1,秒杀券',
                                `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1,上架; 2,下架; 3,过期',
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_0`
--

LOCK TABLES `tb_voucher_0` WRITE;
/*!40000 ALTER TABLE `tb_voucher_0` DISABLE KEYS */;
INSERT INTO `tb_voucher_0` VALUES (1,1,'80元代金券','周一至周日均可使用','无规则',20,100,1,1,'2025-11-08 06:23:19','2025-11-20 07:23:03');
/*!40000 ALTER TABLE `tb_voucher_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_1`
--

DROP TABLE IF EXISTS `tb_voucher_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_1` (
                                `id` bigint unsigned NOT NULL COMMENT '主键',
                                `shop_id` bigint unsigned DEFAULT NULL COMMENT '商铺id',
                                `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代金券标题',
                                `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '副标题',
                                `rules` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用规则',
                                `pay_value` bigint unsigned NOT NULL COMMENT '支付金额，单位是分。例如200代表2元',
                                `actual_value` bigint NOT NULL COMMENT '抵扣金额，单位是分。例如200代表2元',
                                `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0,普通券；1,秒杀券',
                                `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1,上架; 2,下架; 3,过期',
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_1`
--

LOCK TABLES `tb_voucher_1` WRITE;
/*!40000 ALTER TABLE `tb_voucher_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_order_0`
--

DROP TABLE IF EXISTS `tb_voucher_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_order_0` (
                                      `id` bigint NOT NULL COMMENT '主键',
                                      `user_id` bigint unsigned NOT NULL COMMENT '下单的用户id',
                                      `voucher_id` bigint unsigned NOT NULL COMMENT '购买的代金券id',
                                      `pay_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '支付方式 1：余额支付；2：支付宝；3：微信',
                                      `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '订单状态，1：正常；2：已取消；',
                                      `reconciliation_status` tinyint NOT NULL DEFAULT '1' COMMENT '对账状态：1待处理；2异常；3不一致；4一致',
                                      `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
                                      `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
                                      `use_time` timestamp NULL DEFAULT NULL COMMENT '核销时间',
                                      `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间',
                                      `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_order_0`
--

LOCK TABLES `tb_voucher_order_0` WRITE;
/*!40000 ALTER TABLE `tb_voucher_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_order_1`
--

DROP TABLE IF EXISTS `tb_voucher_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_order_1` (
                                      `id` bigint NOT NULL COMMENT '主键',
                                      `user_id` bigint unsigned NOT NULL COMMENT '下单的用户id',
                                      `voucher_id` bigint unsigned NOT NULL COMMENT '购买的代金券id',
                                      `pay_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '支付方式 1：余额支付；2：支付宝；3：微信',
                                      `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '订单状态，1：正常；2：已取消；',
                                      `reconciliation_status` tinyint NOT NULL DEFAULT '1' COMMENT '对账状态：1待处理；2异常；3不一致；4一致',
                                      `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
                                      `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
                                      `use_time` timestamp NULL DEFAULT NULL COMMENT '核销时间',
                                      `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间',
                                      `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_order_1`
--

LOCK TABLES `tb_voucher_order_1` WRITE;
/*!40000 ALTER TABLE `tb_voucher_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_order_router_0`
--

DROP TABLE IF EXISTS `tb_voucher_order_router_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_order_router_0` (
                                             `id` bigint NOT NULL COMMENT '主键',
                                             `order_id` bigint NOT NULL COMMENT '订单id',
                                             `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                                             `voucher_id` bigint unsigned NOT NULL COMMENT '代金券id',
                                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_order_router_0`
--

LOCK TABLES `tb_voucher_order_router_0` WRITE;
/*!40000 ALTER TABLE `tb_voucher_order_router_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_order_router_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_order_router_1`
--

DROP TABLE IF EXISTS `tb_voucher_order_router_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_order_router_1` (
                                             `id` bigint NOT NULL COMMENT '主键',
                                             `order_id` bigint NOT NULL COMMENT '订单id',
                                             `user_id` bigint unsigned NOT NULL COMMENT '用户id',
                                             `voucher_id` bigint unsigned NOT NULL COMMENT '代金券id',
                                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_order_router_1`
--

LOCK TABLES `tb_voucher_order_router_1` WRITE;
/*!40000 ALTER TABLE `tb_voucher_order_router_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_order_router_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_reconcile_log_0`
--

DROP TABLE IF EXISTS `tb_voucher_reconcile_log_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_reconcile_log_0` (
                                              `id` bigint NOT NULL COMMENT '主键',
                                              `order_id` bigint NOT NULL COMMENT '订单id',
                                              `user_id` bigint unsigned NOT NULL COMMENT '下单的用户id',
                                              `voucher_id` bigint unsigned NOT NULL COMMENT '购买的代金券id',
                                              `message_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Kafka消息uuid',
                                              `detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '差异说明',
                                              `before_qty` int DEFAULT NULL COMMENT '改变之前库存数量',
                                              `change_qty` int DEFAULT NULL COMMENT '本次改变数量',
                                              `after_qty` int DEFAULT NULL COMMENT '改变之后库存数量',
                                              `trace_id` bigint DEFAULT NULL COMMENT '追踪唯一标识',
                                              `log_type` int DEFAULT '-1' COMMENT '记录类型 -1:扣减 1:恢复',
                                              `business_type` int DEFAULT '1' COMMENT '业务类型：1创建订单成功；2创建订单超时；3创建订单失败',
                                              `reconciliation_status` int NOT NULL DEFAULT '1' COMMENT '对账状态：1待处理；2异常；3不一致；4一致',
                                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              KEY `idx_order_id` (`order_id`) USING BTREE,
                                              KEY `idx_message_id` (`message_id`) USING BTREE,
                                              KEY `idx_trace_id` (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_reconcile_log_0`
--

LOCK TABLES `tb_voucher_reconcile_log_0` WRITE;
/*!40000 ALTER TABLE `tb_voucher_reconcile_log_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_reconcile_log_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher_reconcile_log_1`
--

DROP TABLE IF EXISTS `tb_voucher_reconcile_log_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher_reconcile_log_1` (
                                              `id` bigint NOT NULL COMMENT '主键',
                                              `order_id` bigint NOT NULL COMMENT '订单id',
                                              `user_id` bigint unsigned NOT NULL COMMENT '下单的用户id',
                                              `voucher_id` bigint unsigned NOT NULL COMMENT '购买的代金券id',
                                              `message_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Kafka消息uuid',
                                              `detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '差异说明',
                                              `before_qty` int DEFAULT NULL COMMENT '改变之前库存数量',
                                              `change_qty` int DEFAULT NULL COMMENT '本次改变数量',
                                              `after_qty` int DEFAULT NULL COMMENT '改变之后库存数量',
                                              `trace_id` bigint DEFAULT NULL COMMENT '追踪唯一标识',
                                              `log_type` int DEFAULT '-1' COMMENT '记录类型 -1:扣减 1:恢复',
                                              `business_type` int DEFAULT '1' COMMENT '业务类型：1创建订单成功；2创建订单超时；3创建订单失败',
                                              `reconciliation_status` int NOT NULL DEFAULT '1' COMMENT '对账状态：1待处理；2异常；3不一致；4一致',
                                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              KEY `idx_order_id` (`order_id`) USING BTREE,
                                              KEY `idx_message_id` (`message_id`) USING BTREE,
                                              KEY `idx_trace_id` (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher_reconcile_log_1`
--

LOCK TABLES `tb_voucher_reconcile_log_1` WRITE;
/*!40000 ALTER TABLE `tb_voucher_reconcile_log_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_voucher_reconcile_log_1` ENABLE KEYS */;
UNLOCK TABLES;

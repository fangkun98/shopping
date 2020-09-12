/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : graduate

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 12/09/2020 16:40:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 14, '浪里小白龙', '12345678901', '山东省', '泰安市', '岱岳区', 1);
INSERT INTO `address` VALUES (2, 14, '时天晦大雪', '12345678901', '北京', '朝阳', '三里屯', 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'zhangsan', '123', 'http://39.98.143.196:8080/group1/M00/00/00/rBqyn17B5aKAVObpAAQZlsZZFmc360.png');
INSERT INTO `admin` VALUES (2, 'lisi', '1234', 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2573656230,1462506823&fm=111&gp=0.jpg');
INSERT INTO `admin` VALUES (3, 'wanger', '12345', 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2573656230,1462506823&fm=111&gp=0.jpg');
INSERT INTO `admin` VALUES (4, 'zhaoliu', '123456', 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2573656230,1462506823&fm=111&gp=0.jpg');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(30, 0) NOT NULL,
  `sum` int(10) NOT NULL DEFAULT 1,
  `uid` int(30) NOT NULL,
  `pid` int(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kind` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES (1, '小米手机', '2019-12-12 08:21:59');
INSERT INTO `kind` VALUES (2, 'Redmi 红米', '2019-12-02 08:22:07');
INSERT INTO `kind` VALUES (3, '电视', '2019-12-06 08:22:15');
INSERT INTO `kind` VALUES (4, '笔记本', '2019-08-14 08:22:25');
INSERT INTO `kind` VALUES (5, '家电', '2019-03-13 08:22:46');
INSERT INTO `kind` VALUES (6, '路由器', '2020-04-06 10:27:10');
INSERT INTO `kind` VALUES (7, '智能硬件', '2020-04-06 10:27:14');

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES (142, '222.209.107.2', 'admin', '2020-03-28 16:43:21', '四川省,成都市');
INSERT INTO `loginlog` VALUES (144, '222.209.107.2', 'admin', '2020-03-28 16:52:12', '四川省,成都市');
INSERT INTO `loginlog` VALUES (145, '222.209.107.2', 'admin', '2020-03-28 16:55:58', '四川省,成都市');
INSERT INTO `loginlog` VALUES (148, '39.85.126.189', 'admin', '2020-03-29 23:33:08', '山东省,泰安市');
INSERT INTO `loginlog` VALUES (178, '39.85.126.189', 'zhangsan', '2020-05-10 16:31:28', '山东省,泰安市');
INSERT INTO `loginlog` VALUES (236, '39.85.126.189', 'zhangsan', '2020-05-13 00:15:20', '山东省,泰安市');
INSERT INTO `loginlog` VALUES (241, '39.85.126.189', 'zhangsan', '2020-05-16 10:02:57', '山东省,泰安市');
INSERT INTO `loginlog` VALUES (245, '39.85.126.189', 'zhangsan', '2020-05-22 14:36:33', '山东省,泰安市');
INSERT INTO `loginlog` VALUES (246, '39.85.126.189', 'zhangsan', '2020-06-08 12:00:49', '山东省,泰安市');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(10) NOT NULL,
  `price` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `order_state` int(2) NOT NULL DEFAULT -1,
  `address_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, 14, 1, '小米10 Pro', 9, '4999', '44991', '2020-05-06 21:51:11', 0, 2);
INSERT INTO `orders` VALUES (3, 14, 4, '小米CC9e', 1, '1299', '1299', '2020-05-06 21:51:11', 0, 2);
INSERT INTO `orders` VALUES (4, 14, 39, '小米米家智能门锁', 1, '1199', '1199', '2020-05-06 21:51:11', 0, 2);
INSERT INTO `orders` VALUES (5, 14, 8, 'Redmi K30 Pro 变焦版', 6, '4499', '26994', '2020-05-06 21:51:11', 0, 2);
INSERT INTO `orders` VALUES (6, 14, 25, '空调C1（1.5匹/变频/一级能效）', 1, '1599', '1599', '2020-05-06 22:18:46', 1, 1);
INSERT INTO `orders` VALUES (7, 14, 28, '米家互联网洗烘一体机10kg', 1, '1999', '1999', '2020-05-06 22:18:46', 1, 1);
INSERT INTO `orders` VALUES (8, 15, 24, 'sdgfsdgf', 3, '666', '666', '2020-05-11 23:58:09', -1, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `trade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(50, 0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `stars` int(10) NOT NULL,
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cate_id` int(10) NULL DEFAULT NULL,
  `path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '小米10 Pro', 4999, '2019-12-11 15:18:18', 6, '骁龙865处理器 / 1亿像素8K电影相机，50倍数字变焦，10倍混合光学变焦 / 双模5G / 新一代LPDDR5内存 / 50W极速闪充+30W无线闪充+10W无线反充 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配WiFi 6 / 超强VC液冷散热 / 4500mAh大电量 / 多功能NFC', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1581493329.10251213.jpg');
INSERT INTO `product` VALUES (2, '小米10', 3999, '2019-12-12 15:20:02', 5, '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1581493999.49592807.jpg');
INSERT INTO `product` VALUES (3, '小米CC9', 1699, '2019-12-21 15:20:51', 4, '前置3200万自拍 / 索尼4800万超广角三摄 / 多色炫彩轻薄机身 / 6.39英寸三星 AMOLED水滴屏 /4030mAh大电量 / 骁龙710处理器 / 屏幕指纹 / NFC功能 / 红外遥控功能 / Game Turbo2.0游戏加速', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1562056090.0987631.jpg');
INSERT INTO `product` VALUES (4, '小米CC9e', 1299, '2019-11-26 10:28:39', 4, '前置3200万自拍 / 索尼4800万超广角三摄 / 4030mAh大电量 / 3D全曲面玻璃机身，浪漫满分的全新配色 / 6.088英寸三星 AMOLED水滴屏 /第七代屏幕指纹 / 首发骁龙665处理器 / 全新Mimoji萌拍 / 红外遥控功能', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1562074232.48198375.jpg');
INSERT INTO `product` VALUES (5, '小米CC9 8GB+256GB 美图定制版', 1999, '2019-12-10 10:35:00', 7, '100%美图相机，前置3200万，自拍美得更自然 / 索尼4800万超广角三摄，拍风景、建筑、多人合影，画面更震撼 / 美图经典人像，不修图也好看 / AI弱光人像，暗光环境也能拍出水光肌 / 全身美型，变美不变形 / 4030mAh大电量，足够尽兴玩一天 / 美图定制仙女配色、轻薄机身 / 6.39英寸三星 AMOLED水滴屏 / 骁龙710处理器 / 第七代屏幕指纹解锁 / 支持NFC和红外遥控', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1563191339.42782395.jpg');
INSERT INTO `product` VALUES (6, '小米MIX Alpha', 19999, '2019-12-11 10:35:26', 9, '创新环绕屏，极具未来感的智能交互体验 / 1亿像素超高清相机，超大感光元件 / 5G双卡全网通超高速网络 / 骁龙855Plus旗舰处理器 / 纳米硅基锂离子4050mAh电池，40W超级快充 / 钛合金+精密陶瓷+蓝宝石镜片前沿工艺', 1, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569297737.97669352.jpg');
INSERT INTO `product` VALUES (7, 'Redmi K30 Pro', 3699, '2019-12-08 10:35:56', 4, '双模5G / 高通骁龙865 / 弹出式超光感全面屏 /索尼 6400万高清四摄 / 8K视频拍摄 / 超大面积VC立体散热 / 4700mAh+33W疾速闪充 / 多功能NFC / 红外遥控', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1585031954.54576337.jpg');
INSERT INTO `product` VALUES (8, 'Redmi K30 Pro 变焦版', 4499, '2019-11-07 11:53:06', 7, '双模5G / 高通骁龙865 / 弹出式超光感全面屏 / 索尼6400万双光学防抖四摄 / 8K视频拍摄 / 30倍变焦 / 超大面积VC立体散热 / 4700mAh+33W疾速闪充 / 多功能NFC / 红外遥控', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584945309.54424595.jpg');
INSERT INTO `product` VALUES (9, 'Redmi K30', 1699, '2019-11-28 14:25:09', 6, '120Hz高帧率流速屏 / 索尼6400万前后六摄 / 6.67\'\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575881713.96322514.jpg');
INSERT INTO `product` VALUES (10, 'Redmi K30 5G', 2399, '2020-04-07 11:06:41', 6, '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575882086.62224334.jpg');
INSERT INTO `product` VALUES (11, 'Redmi 8A', 699, '2019-11-13 11:07:41', 5, '5000mAh大电量 / 最高可选4GB+64GB版本 / 支持18W快充 / Type-C充电接口 / 6.22\"水滴全面屏 / AI人脸解锁 / 骁龙八核处理器 / 超大音量 / 支持无线FM收音机', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1574763053.46429660.jpg');
INSERT INTO `product` VALUES (12, 'Redmi Note 8', 999, '2019-08-20 11:08:31', 6, '4800万全场景四摄 / 前置1300万美颜相机 / 骁龙665处理器 / 4000mAh超长续航 / 标配18W快充 / 超线性扬声器 / 90%高屏占比 / 康宁大猩猩保护玻璃 / 6.3英寸水滴全面屏', 2, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1567422141.04018158.jpg');
INSERT INTO `product` VALUES (13, 'Redmi 智能电视 MAX 98\'\'', 19999, '2020-04-17 11:11:40', 9, '大视野带来超震撼的沉浸感/4K HDR超高清画质 逼真画面栩栩如生/杜比+DTS双解码 清澈立体的声音环绕整个客厅/MEMC运动补偿 无拖尾无重影/4G+64G大存储 畅快不卡顿/海量片源 观影更爽/智能家居控制中心', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584958755.36428250.jpg');
INSERT INTO `product` VALUES (14, 'Redmi 红米电视 70英寸', 3199, '2020-04-06 11:12:36', 7, '70英寸震撼巨屏 / 4K画质 细腻如真 / 杜比音效 身临其境 / PatchWall智能系统 内置小爱同学 / 海量好内容 / U盘文件直读 轻松办公 / 无线投屏 分享更方便', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1566998167.20454521.jpg');
INSERT INTO `product` VALUES (15, '小米壁画电视 65英寸', 6999, '2020-04-02 11:13:47', 7, '壁画外观 / 全面屏设计 / 4K HDR精良画质 / 2GB+32GB大内存 / 四核处理器 / 13.9mm纤薄机身 / 支持远场语音 / 内置小爱同学 / 首次安装免费', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1555935546.09711490.jpg');
INSERT INTO `product` VALUES (16, '小米全面屏电视E55A', 1749, '2020-04-05 11:14:31', 6, '全面屏设计 / 4K超高清+HDR / 纤薄机身 / 2GB+8GB大内存 / 64位四核处理器 / 内置小爱同学', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1562138486.16379871.jpg');
INSERT INTO `product` VALUES (17, '小米电视4A 32英寸', 699, '2020-04-06 11:15:20', 6, '64位四核处理器 / 1GB+4GB大内存 / 高清液晶屏 / 第6代画质引擎 / 人工智能系统PatchWall / 轻至4kg', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1500287084.72131750.jpg');
INSERT INTO `product` VALUES (18, '小米电视4A 55英寸', 1699, '2020-04-13 11:16:11', 7, '超高清屏 / 2GB+8GB / 真四核64位高性能处理器 / 超窄边框 / 智能语音 / 杜比解码 / 海量高清片源 / 支持壁挂', 3, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1535100756.34411219.jpg');
INSERT INTO `product` VALUES (19, 'RedmiBook 13 全面屏', 4499, '2020-04-07 11:17:05', 7, '四窄边全面屏 / 全新十代酷睿™处理器 / 全金属超轻机身 / MX250 高性能独显 / 小米互传 / 专业「飓风」散热系统 / 11小时长续航', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575878438.26468221.jpg');
INSERT INTO `product` VALUES (20, 'Pro 15 增强版', 6799, '2020-03-30 19:59:57', 6, '全新十代酷睿处理器 / 大满贯接口 / 100%sRGB高色域 / 全尺寸背光键盘', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1571559783.51144034.jpg');
INSERT INTO `product` VALUES (21, 'RedmiBook 14 增强版', 3999, '2020-04-09 20:01:17', 6, '全新十代酷睿处理器 / MX250独显 / 14英寸超窄边框高清屏 / 小米手环极速解锁 / 炫酷多彩任你挑选', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1566878924.57393022.jpg');
INSERT INTO `product` VALUES (22, '游戏本2019款', 8999, '2020-04-08 20:02:06', 7, '九代酷睿标压处理器 / 144Hz 刷新率 / 3+2包围式热管 / 12V 台机级别散热风扇 / 72%色域', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1570689391.53131779.jpg');
INSERT INTO `product` VALUES (23, '小米笔记本15.6\" 2019款 独显版', 4299, '2020-03-11 20:02:50', 6, '独立显卡/ 英特尔四核处理器 / 最高512G高速固态硬盘 / 独立数字键盘 / 全面均衡的国民轻薄本', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1553738425.08569829.jpg');
INSERT INTO `product` VALUES (24, '小米笔记本Air 12.5\" 2019款', 3599, '2020-03-06 20:03:43', 6, '高清屏幕 / 长续航全金属 / 超窄边框 / 像杂志一样随身携带 / 哈曼高品质扬声器', 4, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1561023757.11032583.jpg');
INSERT INTO `product` VALUES (25, '空调C1（1.5匹/变频/一级能效）', 1599, '2020-04-07 20:04:47', 7, '智能互联 / 节能省电 / 自清洁', 5, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1554108362.70322107.jpg');
INSERT INTO `product` VALUES (26, '空调（1.5匹/变频/一级能效）', 1999, '2020-04-13 20:05:23', 8, '智能互联 / 节能省电 / 抑菌滤网', 5, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/819f7dcde77a8626052e05b8cb6678e6.jpeg');
INSERT INTO `product` VALUES (27, 'Redmi全自动波轮洗衣机1A 8kg', 779, '2020-03-10 20:06:08', 8, '8kg大容量 / 10种洗涤模式 / 10挡水位调节 / 耐腐蚀金属机身 / 桶自洁、桶风干模式避免细菌滋生 / 空气阻尼减震 / 免运费及基础安装费', 5, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1552868299.23297041.jpg');
INSERT INTO `product` VALUES (28, '米家互联网洗烘一体机10kg', 1999, '2020-04-06 20:06:57', 7, '国标最高A+级洗净能力 / 烘干除菌率达99.9%+ / 智能空气洗 / 高温筒自洁 / 一级能效，省水省电', 5, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1545975727.39139364.jpg');
INSERT INTO `product` VALUES (29, '米家风冷对开门冰箱 483L', 2199, '2020-04-07 20:07:32', 6, '风冷无霜不结冰 / 环绕立体出风，长久锁水保鲜 / 全直流双变频，高效制冷低噪节能 / 低能耗，1天不到1度电 / 20格储物分区 / 自动恒温校准', 5, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1570670535.6211177.jpg');
INSERT INTO `product` VALUES (30, '米家两门冰箱 160L', 899, '2020-03-12 20:08:14', 8, '占地小，约0.25㎡占地面积 / 7挡温控调节 / 鲜肉微冻区，冻肉即取即切 / 一天仅用耗电0.58度 / 两门三温区，多效保鲜更实用', 5, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1570623930.31966844.jpg');
INSERT INTO `product` VALUES (31, '小米AIoT路由器 AX3600', 599, '2020-04-01 20:09:07', 7, '三千兆无线速率 / 高通6核处理器 / 6根高性能外置信号放大器 / 512MB大内存 / AIoT智能天线 / WPA3网络加密', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1581411766.33688586.jpg');
INSERT INTO `product` VALUES (32, 'Redmi路由器AC2100', 169, '2020-03-30 20:09:56', 7, '2033Mbps无线速率 / 2.4G/5G双频并发 / 全千兆网口 / 双核四线程CPU 6根高增益全向天线 / 6路高性能信号放大器 / 小米智能家居优化连接 / 128M大内存 / 内置网易UU游戏加速 / 包装内自带网线', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575364048.00449310.jpg');
INSERT INTO `product` VALUES (33, '小米路由器AC2100', 229, '2020-03-30 20:10:48', 8, '2100M高速路由 / 全终端游戏加速 / 全千兆网口 / 双核CPU高速并发多任务 / 360°隐藏天线 / 全方向均匀覆盖 / 包装内自带网线', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1568604846.84268885.jpg');
INSERT INTO `product` VALUES (34, '小米路由器Mesh（两只装）', 999, '2020-04-01 20:11:45', 7, '多通道高速混合传输 / 高通4核CPU / 4颗独立信号放大器 / 256MB超大内存 / 千兆电力线 / 不分子母 / 专为小米智能家居优化', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557490451.12337413.jpg');
INSERT INTO `product` VALUES (35, '小米路由器4A千兆版', 129, '2020-04-04 20:12:33', 6, '双核CPU千兆网口 ／ 双频AC1200 ／ 高增益4天线 ／ 128MB大内存 ／ 安全防蹭网 ／ 儿童安全上网 ／ 专为小米智能家居优化', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1552376822.09637089.jpg');
INSERT INTO `product` VALUES (36, '小米路由器4C', 59, '2019-12-18 20:13:04', 8, '高增益天线，信号更强 / 64MB 内存，运行稳定 / APP智能管理 / 红包 WiFi，帮你赚钱', 6, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1532604005.80875371.jpg');
INSERT INTO `product` VALUES (37, '小米米家智能摄像机云台版', 179, '2020-04-07 20:13:55', 8, '1080P高清画质 ／ 360度云台全景视角 ／ 红外夜视 ／ 双向语音 / AI 增强移动侦测 / H.265 编码 / 倒置安装', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1567393585.49577260.jpg');
INSERT INTO `product` VALUES (38, '小米「小爱老师」', 429, '2020-04-11 20:14:31', 8, '便携学习机 / 科学背单词 / 优质听力资源 / 持久录音笔 / 海量内容持续引入 / 随身翻译机', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1560222533.85047588.jpg');
INSERT INTO `product` VALUES (39, '小米米家智能门锁', 1199, '2020-04-04 20:15:08', 8, '新增霸王锁体 / 直插芯C级智能锁芯 / 德国红点设计大奖 / 一体化3D半导体指纹 / 6大开锁方式 / 7大安全检测 / 十余项安全黑科技 / 丰富的智能联动', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1578042981.26456773.jpg');
INSERT INTO `product` VALUES (40, '小米小爱触屏音箱', 199, '2020-04-04 20:16:07', 7, '智能家居，看得见，触得到 / 视频也可定制专属闹钟 / 连接门铃和摄像头，监控更方便 / 爱奇艺海量影视 / QQ音乐曲库', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1550719656.70567332.jpg');
INSERT INTO `product` VALUES (41, 'Redmi小爱触屏音箱 8英寸', 349, '2020-04-06 20:16:46', 8, '8英寸高清大屏 / 热门视频平台 / 智能家居中控 / 儿童模式 / 第三代小爱同学', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1584930592.87981629.jpg');
INSERT INTO `product` VALUES (42, 'Redmi小爱音箱 Play', 79, '2020-04-01 20:17:37', 8, '听音乐、语音遥控家电的人工智能音箱', 7, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575427252.066093.jpg');

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `food_id` int(6) NULL DEFAULT NULL,
  `num` int(6) NULL DEFAULT NULL,
  `total` int(6) NULL DEFAULT NULL,
  `desk_id` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_food_id_1`(`food_id`) USING BTREE,
  INDEX `FK_desk_id_1`(`desk_id`) USING BTREE,
  CONSTRAINT `FK_desk_id_1` FOREIGN KEY (`desk_id`) REFERENCES `tb_desk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_food_id_1` FOREIGN KEY (`food_id`) REFERENCES `tb_food` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_desk
-- ----------------------------
DROP TABLE IF EXISTS `tb_desk`;
CREATE TABLE `tb_desk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT 0 COMMENT '1 预定 0 空闲',
  `booktime` datetime(0) NULL DEFAULT NULL,
  `del` int(1) NULL DEFAULT 0 COMMENT '1 删除  0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_desk
-- ----------------------------
INSERT INTO `tb_desk` VALUES (1, '纽约', 0, NULL, 0);
INSERT INTO `tb_desk` VALUES (2, '巴黎', 1, '2020-02-29 11:35:21', 0);
INSERT INTO `tb_desk` VALUES (3, '丹麦', 0, NULL, 0);
INSERT INTO `tb_desk` VALUES (4, '伦敦', 1, '2020-02-29 11:35:19', 0);
INSERT INTO `tb_desk` VALUES (5, '东京', 0, NULL, 1);
INSERT INTO `tb_desk` VALUES (6, '首尔', 1, '2020-02-29 11:35:09', 0);
INSERT INTO `tb_desk` VALUES (8, '尼泊尔', 1, '2020-02-29 11:35:55', 0);
INSERT INTO `tb_desk` VALUES (9, '澳大利亚', 1, '2020-02-29 11:35:53', 0);
INSERT INTO `tb_desk` VALUES (10, '巴基斯兰', 1, '2020-02-29 11:35:52', 0);
INSERT INTO `tb_desk` VALUES (11, '北京', 1, '2020-02-29 12:28:30', 0);
INSERT INTO `tb_desk` VALUES (12, '首尔', 0, NULL, 0);
INSERT INTO `tb_desk` VALUES (13, '首尔', 0, NULL, 0);

-- ----------------------------
-- Table structure for tb_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_food`;
CREATE TABLE `tb_food`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `vip_price` double NULL DEFAULT NULL,
  `description` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int(6) NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_type_id`(`type_id`) USING BTREE,
  CONSTRAINT `FK_type_id` FOREIGN KEY (`type_id`) REFERENCES `tb_foodtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_food
-- ----------------------------
INSERT INTO `tb_food` VALUES (1, '白灼虾', 36, 23, '很美味', 2, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (2, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (3, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (4, '东坡肉', 222, 333, '东坡肉好吃', 2, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (5, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (6, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (7, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (8, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (9, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (10, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (11, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (12, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (13, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (14, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (15, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (16, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (17, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (18, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (19, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (20, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (21, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (22, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (23, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (24, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (25, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (26, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (27, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (28, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (29, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (30, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (31, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (32, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (33, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (34, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (35, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (36, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (37, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (38, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (39, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (40, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (41, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (42, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (43, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (44, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (45, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (46, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (47, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (48, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (49, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (50, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (51, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (52, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (53, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (54, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (55, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (56, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (57, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (58, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (59, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (60, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (61, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (62, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (63, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (64, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (65, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (66, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (67, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (68, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (69, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (70, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (71, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (72, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (73, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (74, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (75, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (76, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (77, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (78, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (79, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (80, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (81, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (82, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (83, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (84, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (85, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (86, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (87, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (88, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (89, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (90, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (91, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (92, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (93, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (94, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (95, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (96, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (97, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (98, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (99, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (100, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (101, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (102, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (103, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (104, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (105, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (106, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (107, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (108, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (109, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (110, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (111, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (112, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (113, '白灼虾', 36, 23, '很美味', 2, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (114, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (115, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (116, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (117, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (118, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (119, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (120, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (121, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (122, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (123, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (124, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (125, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (126, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (127, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (128, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (129, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (130, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (131, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (132, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (133, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (134, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (135, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (136, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (137, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (138, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (139, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (140, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (141, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (142, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (143, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (144, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (145, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (146, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (147, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (148, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (149, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (150, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (151, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (152, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (153, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (154, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (155, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (156, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (157, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (158, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (159, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (160, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (161, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (162, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (163, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (164, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (165, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (166, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (167, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (168, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (169, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (170, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (171, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (172, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (173, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (174, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (175, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (176, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (177, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (178, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (179, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (180, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (181, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (182, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (183, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (184, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (185, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (186, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (187, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (188, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (189, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (190, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (191, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (192, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (193, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (194, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (195, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (196, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (197, '白灼虾', 36, 23, '很美味', 1, 'fd729778-a2ff-47c6-b2df-de2fc217df70.jpg', 0);
INSERT INTO `tb_food` VALUES (198, '白切鸡11', 69, 59, '好吃的很1111', 7, 'f128045a-f32a-4464-8041-91d9348abce0.jpg', 0);
INSERT INTO `tb_food` VALUES (199, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (200, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (201, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (202, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (203, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (204, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (205, '鱼香肉丝', 50, 40, '很香的', 6, 'e5e69a60-26fc-49e1-b7d9-560592e814be.jpg', 0);
INSERT INTO `tb_food` VALUES (206, '东坡肉', 222, 333, '东坡肉好吃', 1, '62868761-d75c-4132-826d-7996d78b33af.jpg', 0);
INSERT INTO `tb_food` VALUES (207, '肉汁米饭', 100, 80, '肉汁米饭肉汁米饭', 1, '71d9ca7c-4c05-4d7a-b5df-c16e5efba537.jpg', 0);
INSERT INTO `tb_food` VALUES (208, '公婆肉1', 222, 223, '测试', 1, '301e70bb-ace3-4723-97df-b5fcda6ccb27.jpg', 0);
INSERT INTO `tb_food` VALUES (209, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);
INSERT INTO `tb_food` VALUES (210, '小鸡炖蘑菇', 50, 40, '小鸡炖蘑菇小鸡炖蘑菇', 4, 'bf335f5f-8742-4a0b-9a9b-8302d5e9b10d.jpg', 0);

-- ----------------------------
-- Table structure for tb_foodtype
-- ----------------------------
DROP TABLE IF EXISTS `tb_foodtype`;
CREATE TABLE `tb_foodtype`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_foodtype
-- ----------------------------
INSERT INTO `tb_foodtype` VALUES (1, '粤菜', 1);
INSERT INTO `tb_foodtype` VALUES (2, '苏菜', 0);
INSERT INTO `tb_foodtype` VALUES (4, '东北菜', 0);
INSERT INTO `tb_foodtype` VALUES (6, '浙菜', 0);
INSERT INTO `tb_foodtype` VALUES (7, '鲁菜', 0);
INSERT INTO `tb_foodtype` VALUES (8, '徽菜', 0);
INSERT INTO `tb_foodtype` VALUES (9, '徽菜', 0);

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `order_id` int(6) NULL DEFAULT NULL,
  `food_id` int(6) NULL DEFAULT NULL,
  `num` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_id`(`order_id`) USING BTREE,
  INDEX `FK_food_id`(`food_id`) USING BTREE,
  CONSTRAINT `FK_food_id` FOREIGN KEY (`food_id`) REFERENCES `tb_food` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES (9, 8, 10, 2);
INSERT INTO `tb_item` VALUES (10, 8, 15, 1);
INSERT INTO `tb_item` VALUES (11, 9, 5, 1);
INSERT INTO `tb_item` VALUES (12, 9, 11, 1);
INSERT INTO `tb_item` VALUES (13, 9, 15, 1);
INSERT INTO `tb_item` VALUES (14, 10, 5, 1);
INSERT INTO `tb_item` VALUES (15, 10, 10, 2);
INSERT INTO `tb_item` VALUES (16, 10, 15, 1);
INSERT INTO `tb_item` VALUES (17, 12, 5, 1);
INSERT INTO `tb_item` VALUES (18, 12, 10, 2);
INSERT INTO `tb_item` VALUES (19, 12, 15, 1);
INSERT INTO `tb_item` VALUES (20, 13, 6, 1);
INSERT INTO `tb_item` VALUES (21, 13, 113, 1);
INSERT INTO `tb_item` VALUES (22, 14, 15, 1);
INSERT INTO `tb_item` VALUES (23, 14, 5, 1);
INSERT INTO `tb_item` VALUES (24, 14, 4, 1);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `oid` int(6) NOT NULL AUTO_INCREMENT,
  `desk_id` int(6) NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  `totalfee` double NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT 0 COMMENT '0 未结账 1 结账',
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FK_desk_id`(`desk_id`) USING BTREE,
  CONSTRAINT `FK_desk_id` FOREIGN KEY (`desk_id`) REFERENCES `tb_desk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (8, 11, '2020-03-02 10:44:11', 480, 0);
INSERT INTO `tb_order` VALUES (9, 6, '2020-03-02 11:28:09', 236, 0);
INSERT INTO `tb_order` VALUES (10, 11, '2020-03-02 12:16:11', 580, 0);
INSERT INTO `tb_order` VALUES (11, 11, '2020-03-02 12:16:48', 0, 0);
INSERT INTO `tb_order` VALUES (12, 11, '2020-03-02 12:20:13', 580, 0);
INSERT INTO `tb_order` VALUES (13, 5, '2020-03-25 23:14:16', 258, 0);
INSERT INTO `tb_order` VALUES (14, 11, '2020-03-26 11:00:17', 358, 0);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '八戒', 'admin123', '2020-02-28 13:10:16');
INSERT INTO `tb_user` VALUES (2, '悟空', 'admin321', '2020-02-22 13:10:35');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regist_time` datetime(0) NOT NULL,
  `salt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (14, 'zhangsan', 'be9513d1876d78d8d39b1642a266089d890097a60b9e7d9a7af3a0ea1b4e071860121dc4333c204c6957cd0216cc7f21cda6030ae12c3b9fba4d39e42ce36c4d', '12345678@qq.com', '男', '2020-04-13 09:48:57', 'd017d19b-0c8a-47fb-8b9d-2e15cf2a4e31');
INSERT INTO `user` VALUES (15, 'zhangsan1', '7ae84b465cd31e4c36b6e2c006d40c5cd90d180966433a1c1e7824ba1558dfcbc4ba5de30b1a8525b7a49b6884dcd1ffcfb49c8e28e5febeee99f39d10ec13c0', '12345678@qq.com', '男', '2020-04-13 09:51:01', 'e9a6007b-c294-40cc-8ae8-41dfa32acedd');
INSERT INTO `user` VALUES (16, 'admin123', 'fcf2fd736eff22c1584e2a1df44059b8f5c3d1d5bed40c103c6e0b121a0c4e24ec433894abe0cfe7aa6cb5c8ef11c6983493fb20f4dc1c0e1afde1b3e333df0e', '12345678@qq.com', '男', '2020-04-17 09:36:08', '9dee25e7-61fe-4571-9fd4-79a0969df329');

SET FOREIGN_KEY_CHECKS = 1;

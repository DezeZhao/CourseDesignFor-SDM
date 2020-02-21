/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : digital

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/09/2019 18:43:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_detail
-- ----------------------------
DROP TABLE IF EXISTS `admin_detail`;
CREATE TABLE `admin_detail`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '管理员地址',
  `realname` varchar(8) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '管理员真实姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(16) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `pwd` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '密码',
  `role` int(4) NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for functions
-- ----------------------------
DROP TABLE IF EXISTS `functions`;
CREATE TABLE `functions`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '功能菜单',
  `parentid` int(4) NULL DEFAULT NULL COMMENT '父id',
  `url` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '链接',
  `isleaf` bit(1) NULL DEFAULT NULL COMMENT '订单是否离开',
  `nodeorder` int(4) NULL DEFAULT NULL COMMENT '订单顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '订单明细id',
  `oid` int(4) NULL DEFAULT NULL COMMENT '订单id',
  `pid` int(4) NULL DEFAULT NULL COMMENT '产品id',
  `num` int(4) NULL DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `order_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (87, 54, 21, 1);
INSERT INTO `order_detail` VALUES (88, 54, 6, 2);
INSERT INTO `order_detail` VALUES (89, 54, 10, 1);
INSERT INTO `order_detail` VALUES (90, 55, 3, 1);

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '订单信息id',
  `uid` int(4) NULL DEFAULT NULL COMMENT '用户id',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单处理状态',
  `ordertime` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `orderprice` decimal(8, 2) NULL DEFAULT NULL COMMENT '订单总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (54, 1, '未处理', '2019-09-04 22:45:40', 13135.00);
INSERT INTO `order_info` VALUES (55, 1, '未处理', '2019-09-05 18:12:08', 6299.00);

-- ----------------------------
-- Table structure for powers
-- ----------------------------
DROP TABLE IF EXISTS `powers`;
CREATE TABLE `powers`  (
  `aid` int(4) NOT NULL COMMENT '管理员编号',
  `fid` int(4) NOT NULL COMMENT '功能编号',
  PRIMARY KEY (`aid`, `fid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  CONSTRAINT `powers_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `powers_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `functions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `tid` int(4) NULL DEFAULT NULL COMMENT '商品类别',
  `brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `inventory` int(4) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品库存',
  `price` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品单价',
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品简介',
  `status` int(4) NULL DEFAULT 1 COMMENT '商品状态',
  `credit` int(5) NULL DEFAULT NULL COMMENT '商品积分',
  `shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品售卖店铺',
  `location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家所在地',
  `img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品其他图片2',
  `img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品其他图片3',
  `img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品其他图片4',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '198023', '苹果Apple MacBook Air', 1, '苹果(Apple)', 'MacBook.jpg', 0099, 0000009999, '苹果Apple MacBook Air 2019新款Apple/苹果 MacBook Air 八代i5 8G/256G SSD /MQD32CH/A 超薄笔记本电脑灰银金', 1, 600, '苹果官方旗舰店', '广州', 'MacBook-2.jpg', 'MacBook-3.jpg', 'MacBook-4.jpg');
INSERT INTO `product_info` VALUES (2, '123313', '联想拯救者Y7000', 1, '联想 (Lenovo)', 'Lenovo.jpg', 0097, 0000004199, '联想拯救者Y7000  2019款游戏本笔记本电脑九代酷睿i5吃鸡15.6英寸 i5-9300H/16G/256G固态/GTX1650-4G独显', 1, 450, '联想官方旗舰店', '上海', 'Lenovo-2.jpg', 'Lenovo-3.jpg', 'Lenovo-4.jpg');
INSERT INTO `product_info` VALUES (3, '199993', '华硕灵耀S2代S4300FN', 1, '华硕(ASUS)', 'ASUS.jpg', 0099, 0000006299, '华硕灵耀S2代S4300FN 8代i5超薄笔记本电脑 英特尔 酷睿八代i5-8265U MX150-2G独显', 1, 400, '华硕官方旗舰店', '南京', 'ASUS-2.jpg', 'ASUS-3.jpg', 'ASUS-4.jpg');
INSERT INTO `product_info` VALUES (4, '143354', '微软 Surface Book  Pro6', 1, '微软(Microsoft)', 'Microsoft.jpg', 0100, 0000010788, '微软 Surface Book Pro6 笔记本电脑  12.3寸 英特尔第八代酷睿i7/8G/512G/GTX1060-8G独显 ', 1, 600, '微软官方旗舰店', '上海', 'Microsoft-2.jpg', 'Microsoft-3.jpg', 'Microsoft-4.jpg');
INSERT INTO `product_info` VALUES (5, '823125', '小米mi9  6+128G', 7, '小米(Xiaomi)', 'mi9.jpg', 0100, 0000002599, '小米mi9  6+128G 骁龙855,，索尼4800w三摄 绝对的性价比，绝对的运行流畅度', 1, 230, '小米官方旗舰店', '北京', 'mi9-2.jpg', 'mi9-3.jpg', 'mi9-4.jpg');
INSERT INTO `product_info` VALUES (6, '124356', '华为P30 Pro 6+128G', 7, '华为(Huawei)', 'HuaweiP30Pro.jpg', 0089, 0000004988, '华为P30 Pro  6+128G 年度拍照机皇，4000w徕卡三摄，麒麟980芯片曲面屏时尚手机', 1, 260, '华为官方旗舰店', '重庆', 'HuaweiP30Pro-2.jpg', 'HuaweiP30Pro-3.jpg', 'HuaweiP30Pro-4.jpg');
INSERT INTO `product_info` VALUES (7, '187973', '苹果iPhone XR 128G', 7, '苹果(Apple）', 'iPhoneXR.jpg', 0098, 0000005088, '苹果iPhone XR 128G A12仿生芯片超流畅iOS系统 后置1200w双摄 retina视网膜屏 提升你的视听体验', 1, 300, '苹果官方旗舰店', '深圳', 'iPhoneXR-2.jpg', 'iPhoneXR-3.jpg', 'iPhoneXR-4.jpg');
INSERT INTO `product_info` VALUES (8, '123435', '荣耀honor20 Pro 8+128G', 7, '荣耀(honor)', 'honor20Pro.jpg', 0078, 0000003199, '荣耀honor20 Pro 8+128G 新品30倍数字变焦全焦段AI四摄全面屏手机 前置3200w自拍 照出最美自己', 1, 280, '荣耀官方旗舰店', '西安', 'honor20Pro-2.jpg', 'honor20Pro-3.jpg', 'honor20Pro-4.jpg');
INSERT INTO `product_info` VALUES (9, '127352', '海尔Haier 电视机', 3, '海尔Haier', 'Haier-t.jpg', 0088, 0000001799, 'Haier_海尔 LS58A51 58英寸4K超高清智能网络LED液晶平板电视机60-tmall.com天猫', 1, 230, '海尔官方旗舰店', '上海', 'Haier-t-2.jpg', 'Haier-t-3.jpg', 'Haier-t-4.jpg');
INSERT INTO `product_info` VALUES (10, '132485', 'TCL   电视机', 3, 'TCL', 'TCL.jpg', 0026, 0000001899, 'TCL D55A730U 55英寸4KHDR全面屏高清智能网络平板液晶家用电视机', 1, 330, 'TCL官方旗舰店', '北京', 'TCL-2.jpg', 'TCL-3.jpg', 'TCL-4.jpg');
INSERT INTO `product_info` VALUES (11, '554555', '长虹 changhong 电视机', 3, '长虹 changhong ', 'changhong.jpg', 0004, 0000001699, 'Changhong_长虹 55A4U 55英寸电视机4K智能网络wifi平板液晶彩电', 1, 220, '长虹官方旗舰店', '广州', 'changhong-2.jpg', 'changhong-3.jpg', 'changhong-4.jpg');
INSERT INTO `product_info` VALUES (12, '479985', '康佳 Konka 电视机', 3, '康佳 Konka ', 'Konka-t.jpg', 0033, 0000002599, 'Konka_康佳 LED65X7 65英寸4K超高清智能wifi网络液晶电视机5575', 1, 233, '康佳官方旗舰店', '深圳', 'Konka-t-2.jpg', 'Konka-t-3.jpg', 'Konka-t-4.jpg');
INSERT INTO `product_info` VALUES (13, '235689', '海尔Haier  冰箱', 2, '海尔Haier ', 'Haier-b.jpg', 2236, 0000000999, 'Haier_海尔 BCD-258WDPM三门无霜节能小型冰箱电脑控温家用冰箱', 1, 165, '海尔官方旗舰店', '上海', 'Haier-b-2.jpg', 'Haier-b-3.jpg', 'Haier-b-4.jpg');
INSERT INTO `product_info` VALUES (14, '789456', '美的Midea 冰箱', 2, '美的Midea ', 'Midea.jpg', 5566, 0000001799, '美的 BCD-230WTM(E)冰箱小型风冷无霜节能静音家用三门电冰箱', 1, 177, '美的官方旗舰店', '北京', 'Midea-2.jpg', 'Midea-3.jpg', 'Midea-4.jpg');
INSERT INTO `product_info` VALUES (15, '888888', '松下    冰箱', 2, '松下Panasonic', '松下-b.jpg', 4455, 0000002690, '松下 NR-EC25WS1-N 特价三开门智能家用三门式电冰箱节能风冷无霜', 1, 224, '松下官方旗舰店', '深圳', '松下-b-2.jpg', '松下-b-3.jpg', '松下-b-4.jpg');
INSERT INTO `product_info` VALUES (16, '555555', '康佳 Konka 冰箱', 2, '康佳 Konka ', 'Konka-b.jpg', 6418, 0000001899, '康佳351升风冷无霜十字对开门冰箱家用双开门四门多门双门电冰箱', 1, 335, '康佳官方旗舰店', '深圳', 'Konka-b-2.jpg', 'Konka-b-3.jpg', 'Konka-b-4.jpg');
INSERT INTO `product_info` VALUES (17, '546261', '索尼 Sony 数码相机', 5, '索尼 Sony', 'Sony.jpg', 5589, 0000003280, 'Sony索尼HX400高清家用学生旅游入门级长焦变焦单反数码相机微单', 1, 456, '索尼官方旗舰店', '北京', 'Sony-2.jpg', 'Sony-3.jpg', 'Sony-4.jpg');
INSERT INTO `product_info` VALUES (18, '456892', '松下    数码相机', 5, '松下Panasonic', '松下-c.jpg', 0034, 0000003398, '官方旗舰店Panasonic_松下LX10长焦高清4K黑卡自拍美颜vlog相机', 1, 489, '松下官方旗舰店', '深圳', '松下-c-2.jpg', '松下-c-3.jpg', '松下-c-4.jpg');
INSERT INTO `product_info` VALUES (19, '423156', '尼康   数码相机', 5, '尼康', '尼康.jpg', 0035, 0000002999, '尼康D3500套机18-55单反入门级高清数码照相机18-105_18-140镜头', 1, 475, '尼康官方旗舰店', '上海', '尼康-2.jpg', '尼康-3.jpg', '尼康-4.jpg');
INSERT INTO `product_info` VALUES (20, '456721', '柯达Kodak  数码相机', 5, '柯达Kodak', 'Kodak.jpg', 0036, 0000002180, 'Kodak_柯达 AZ901 90倍长焦高清数码相机wifi翻转屏摄月旅游神器', 1, 220, '柯达官方旗舰店', '上海', '柯达-2.jpg', '柯达-3.jpg', '柯达-4.jpg');
INSERT INTO `product_info` VALUES (21, '642678', '尤尼克斯 Yonex 羽毛球拍', 4, '尤尼克斯 Yonex', '尤尼克斯.jpg', 0037, 0000001260, '2019新款官网正品YONEX尤尼克斯羽毛球拍单拍疾光NF700速度进攻型', 1, 256, '尤尼克斯专营店', '广州', '尤尼克斯-2.jpg', '尤尼克斯-3.jpg', '尤尼克斯-4.jpg');
INSERT INTO `product_info` VALUES (22, '546655', '李宁 Lining   羽毛球拍', 4, '李宁 Lining ', '李宁.jpg ', 0038, 0000000299, '李宁羽毛球双拍正品耐打全碳素纤维成人学生业余初级学健身耐用型', 1, 244, '李宁官方旗舰店', '北京', ' 李宁-2.jpg ', ' 李宁-3.jpg ', ' 李宁-4.jpg ');
INSERT INTO `product_info` VALUES (23, '488522', '阿迪达斯 Adidas  羽毛球拍', 4, '阿迪达斯 Adidas ', 'Adidas.jpg', 0039, 0000000389, '羽毛球拍阿迪达斯正品耐用型球拍全碳素超轻双拍进攻型成人小学生', 1, 251, '阿迪达斯专营店', '北京', 'Adidas-2.jpg', 'Adidas-3.jpg', 'Adidas-4.jpg');
INSERT INTO `product_info` VALUES (24, '746812', '川崎  Kawasaki   羽毛球', 4, '川崎  Kawasaki   ', '川崎.jpg', 0040, 0000001180, '川崎 全碳素羽毛球拍 矛11 18 蜘蛛侠9900 雷蛇19 王者K9 大师800', 1, 234, '川崎官方旗舰店', '深圳', '川崎-2.jpg', '川崎-3.jpg', '川崎-4.jpg');
INSERT INTO `product_info` VALUES (25, '753159', '三星    Samsung  打印机', 6, '三星    Samsung', '三星.jpg', 0041, 0000001579, '三星SCX-4621NS激光打印机多功能网络复印机扫描仪商用办公一体机', 1, 355, '三星官方旗舰店', '北京', '三星-2.jpg', '三星-3.jpg', '三星-4.jpg');
INSERT INTO `product_info` VALUES (26, '357951', 'HP    打印机', 6, 'HP', 'HP.jpg', 0042, 0000001479, 'HP惠普132nw黑白激光标签打印机扫描复印一体机手机平板无线wifi家用小型办公', 1, 350, 'HP  官方旗舰店', '北京', 'HP-2.jpg', 'HP-3.jpg', 'HP-4.jpg');
INSERT INTO `product_info` VALUES (27, '267423', '佳能   打印机', 6, '佳能', '佳能.jpg', 0043, 0000000648, '佳能TS8280照片打印机,家用小型六色高清彩色多功能喷墨一体机,家庭相片办公复印扫描三合一', 1, 233, '佳能官方旗舰店', '广州', '佳能-2.jpg', '佳能-3.jpg', '佳能-4.jpg');
INSERT INTO `product_info` VALUES (28, '852258', '松下   打印机', 6, '松下Panasonic', '松下-p.jpg', 0046, 0000000999, '松下KX-MB2178CN激光黑白自动双面打印机复印多功能一体机无线WiFi扫描办公家用商用四合一高速办公室官方-tmall.com天猫', 1, 289, '松下官方旗舰店', '上海', '松下-p-2.jpg', '松下-p-3.jpg', '松下-p-4.jpg');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `name` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '电脑');
INSERT INTO `type` VALUES (2, '冰箱');
INSERT INTO `type` VALUES (3, '电视机');
INSERT INTO `type` VALUES (4, '羽毛球拍');
INSERT INTO `type` VALUES (5, '数码相机');
INSERT INTO `type` VALUES (6, '运动鞋');
INSERT INTO `type` VALUES (7, '手机');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `regDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'tom', '123456', '汤姆', '女', '江苏省苏州市吴中区', 'tom@123.com', '2013-07-14');
INSERT INTO `user_info` VALUES (2, 'john', '123456', '约翰', '女', '江苏省南京市玄武区', 'wen@135.com', '2013-07-14');
INSERT INTO `user_info` VALUES (3, 'my', '123456', 'my', '男', '江苏省南京市玄武区', 'a@135.com', '2015-09-16');
INSERT INTO `user_info` VALUES (4, 'sj', '123456', 'sj', '男', '江苏省南京市玄武区', 'b@135.com', '2015-09-16');
INSERT INTO `user_info` VALUES (5, 'lxf', '123456', 'lxf', '男', '江苏省南京市玄武区', 'c@135.com', '2015-09-16');
INSERT INTO `user_info` VALUES (6, 'lj', '123456', 'lj', '男', '江苏省南京市玄武区', 'a@135.com', '2015-09-20');
INSERT INTO `user_info` VALUES (58, 'zdzz', '12345678', '找新的', NULL, '甘肃从四川的似乎差点死', '2132131@qq.com', '2019-08-26');
INSERT INTO `user_info` VALUES (59, 'zqq', 'qazwsxedc', '赵得泽', NULL, '甘肃省武威市民勤县大滩镇大西村七社7号', '2132131@qq.com', '2019-08-26');
INSERT INTO `user_info` VALUES (60, 'zdzz', '12345678', 'zdz', NULL, '甘肃从四川的似乎差点死', '2132131@qq.com', '2019-08-26');
INSERT INTO `user_info` VALUES (61, 'zdzz', '12345678', '赵得泽', NULL, '甘肃省武威市民勤县大滩镇大西村七社7号', '2132131@qq.com', '2019-08-26');
INSERT INTO `user_info` VALUES (62, 'zdzz', '123456789', 'zha', NULL, '甘肃省兰州市嘉定路12号', '2132131@qq.com', '2019-08-27');
INSERT INTO `user_info` VALUES (63, 'zqqz', 'qwertyui', '赵得泽', NULL, '甘肃省武威市民勤县大滩镇大西村七社7号', '2132131@qq.com', '2019-08-27');
INSERT INTO `user_info` VALUES (64, 'zdzz', '111111111', '去玩儿', NULL, '甘肃省武威市民勤县大滩镇大西村七社7号', '2132131@qq.com', '2019-08-27');
INSERT INTO `user_info` VALUES (65, 'zdzz', 'qwertyui', '赵得泽', NULL, '甘肃省武威市民勤县大滩镇大西村七社7号', '2132131@qq.com', '2019-08-29');
INSERT INTO `user_info` VALUES (66, 'zdzd', '123456789', 'zhao deze', NULL, '曹安公路4800号同济大学', '1360536767@qq.com', '2019-09-05');
INSERT INTO `user_info` VALUES (67, '爱上擦擦是', '12345678', '爱上擦擦是', NULL, 'cascade', '2132131@qq.com', NULL);

-- ----------------------------
-- Procedure structure for sp_sale
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sale`;
delimiter ;;
CREATE PROCEDURE `sp_sale`(c int)
BEGIN	
	declare stmt varchar(2000);
	set @sqlstr=concat("SELECT p.id AS id, p.name AS NAME,SUM(od.num) AS total ,SUM(od.num)*price AS money
	FROM order_detail od, product_info p 
	WHERE p.id=od.p_id 
	GROUP BY p.id,p.name,p.price ORDER BY total DESC LIMIT 1,",c);
     prepare stmt from @sqlstr;
     execute stmt;
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

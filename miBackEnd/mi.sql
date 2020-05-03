/*
 Navicat MySQL Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 119.28.7.180:3306
 Source Schema         : mi

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/04/2020 18:50:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` int(255) NOT NULL DEFAULT 0 COMMENT '类型 1手机 2电视',
  `second_type` int(11) NOT NULL DEFAULT 0 COMMENT '二级类型 1-1小米手机 1-2红米手机 2-1电视',
  `explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `second_type`(`second_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '小米 10', 1, 1, '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC');
INSERT INTO `goods` VALUES (2, '小米cc9 pro', 1, 1, '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器');
INSERT INTO `goods` VALUES (3, 'Redmi K30', 1, 2, '120Hz高帧率流速屏 / 索尼6400万前后六摄 / 6.67\'\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC');
INSERT INTO `goods` VALUES (4, 'Redmi K30 5G', 1, 2, '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC');
INSERT INTO `goods` VALUES (5, '小米电视4C', 2, 1, '「小米电视\"居家影音节\"超值特惠！」人工智能系统 | 64位处理器 | 1GB+4GB 内存');
INSERT INTO `goods` VALUES (6, 'Redmi Note 8 Pro', 1, 2, '6400万旗舰级全场景四摄 / 前置2000万 AI美颜相机 / G90T专业游戏芯片，液冷散热 / 6.53英寸水滴全面屏 / 4500mAh大电量 / 标配18W快充 / 康宁大猩猩保护玻璃 / 多功能NFC / 红外遥控功能 / Game Turbo2.0游戏加速');

-- ----------------------------
-- Table structure for goods_color
-- ----------------------------
DROP TABLE IF EXISTS `goods_color`;
CREATE TABLE `goods_color`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '颜色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品颜色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_color
-- ----------------------------
INSERT INTO `goods_color` VALUES (1, 2, '魔法绿镜');
INSERT INTO `goods_color` VALUES (2, 2, '冰雪极光');
INSERT INTO `goods_color` VALUES (3, 2, '暗夜魅影');
INSERT INTO `goods_color` VALUES (4, 1, '钛银黑');
INSERT INTO `goods_color` VALUES (5, 1, '冰海蓝');
INSERT INTO `goods_color` VALUES (6, 3, '深海微光');
INSERT INTO `goods_color` VALUES (7, 3, '紫玉幻境');
INSERT INTO `goods_color` VALUES (8, 4, '深海微光');
INSERT INTO `goods_color` VALUES (9, 4, '紫玉幻境');
INSERT INTO `goods_color` VALUES (10, 5, '黑色');
INSERT INTO `goods_color` VALUES (11, 6, '贝母白');
INSERT INTO `goods_color` VALUES (12, 6, '冰翡翠');

-- ----------------------------
-- Table structure for goods_version
-- ----------------------------
DROP TABLE IF EXISTS `goods_version`;
CREATE TABLE `goods_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `version_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本名称',
  `configured` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_version
-- ----------------------------
INSERT INTO `goods_version` VALUES (1, 2, '小米CC9 Pro', '8G+128GB', 2799.00);
INSERT INTO `goods_version` VALUES (2, 2, '小米CC9 Pro', '6G+128GB', 2599.00);
INSERT INTO `goods_version` VALUES (3, 2, '小米CC9 Pro', '8G+256GB', 3199.00);
INSERT INTO `goods_version` VALUES (4, 1, '小米 10', '8GB+128GB', 3999.00);
INSERT INTO `goods_version` VALUES (5, 1, '小米 10', '8GB+256GB', 4299.00);
INSERT INTO `goods_version` VALUES (6, 3, 'Redmi K30', '6GB+128GB', 1699.00);
INSERT INTO `goods_version` VALUES (7, 3, 'Redmi K30', '8GB+128GB', 1899.00);
INSERT INTO `goods_version` VALUES (8, 4, 'Redmi K30 5G', '8GB+128GB', 2399.00);
INSERT INTO `goods_version` VALUES (9, 4, 'Redmi K30 5G', '8GB+256GB', 2699.00);
INSERT INTO `goods_version` VALUES (10, 5, '小米电视4C 32英寸', '32寸', 699.00);
INSERT INTO `goods_version` VALUES (11, 6, 'Redmi Note 8 Pro\r\n', '6GB+64GB', 1299.00);
INSERT INTO `goods_version` VALUES (12, 6, 'Redmi Note 8 Pro\r\n', '8GB+128GB', 1599.00);

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(255) NOT NULL DEFAULT 0 COMMENT '大小 1小图 2大图 3banner',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `color_id` int(11) NOT NULL DEFAULT 0 COMMENT '颜色表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `color_id`(`color_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES (1, 3, '红米note8', 'http://119.28.7.180:8080/img/1.webp', '', 0, 0);
INSERT INTO `img` VALUES (2, 3, '小米电视4c', 'http://119.28.7.180:8080/img/2.webp', '', 0, 0);
INSERT INTO `img` VALUES (3, 3, '红米k30', 'http://119.28.7.180:8080/img/3.jpg', '', 0, 0);
INSERT INTO `img` VALUES (4, 0, '小米note10', 'http://119.28.7.180:8080/img/l1.webp', '', 1, 0);
INSERT INTO `img` VALUES (5, 0, '小米note10 pro', 'http://119.28.7.180:8080/img/l2.webp', '', 0, 0);
INSERT INTO `img` VALUES (6, 0, '小米cc9 pro', 'http://119.28.7.180:8080/img/l3.webp', '', 2, 0);
INSERT INTO `img` VALUES (7, 0, '小米电视4C', 'http://119.28.7.180:8080/img/d1.jpg', '', 5, 0);
INSERT INTO `img` VALUES (8, 0, 'Redmi K30', 'http://119.28.7.180:8080/img/h1.webp', '', 3, 0);
INSERT INTO `img` VALUES (9, 0, 'Redmi K30 5G', 'http://119.28.7.180:8080/img/h2.webp', '', 4, 0);
INSERT INTO `img` VALUES (10, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/1.jpg', '', 0, 1);
INSERT INTO `img` VALUES (11, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/2.jpg', '', 0, 1);
INSERT INTO `img` VALUES (12, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/3.jpg', '', 0, 1);
INSERT INTO `img` VALUES (13, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/4.jpg', '', 0, 1);
INSERT INTO `img` VALUES (14, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/5.jpg', '', 0, 1);
INSERT INTO `img` VALUES (15, 0, '', 'http://119.28.7.180:8080/img/goods_color/1/6.jpg', '', 0, 1);
INSERT INTO `img` VALUES (16, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/1.jpg', '', 0, 2);
INSERT INTO `img` VALUES (17, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/2.jpg', '', 0, 2);
INSERT INTO `img` VALUES (18, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/3.jpg', '', 0, 2);
INSERT INTO `img` VALUES (19, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/4.jpg', '', 0, 2);
INSERT INTO `img` VALUES (20, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/5.jpg', '', 0, 2);
INSERT INTO `img` VALUES (21, 0, '', 'http://119.28.7.180:8080/img/goods_color/2/6.jpg', '', 0, 2);
INSERT INTO `img` VALUES (22, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/1.jpg', '', 0, 3);
INSERT INTO `img` VALUES (23, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/2.jpg', '', 0, 3);
INSERT INTO `img` VALUES (24, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/3.jpg', '', 0, 3);
INSERT INTO `img` VALUES (25, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/4.jpg', '', 0, 3);
INSERT INTO `img` VALUES (26, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/5.jpg', '', 0, 3);
INSERT INTO `img` VALUES (27, 0, '', 'http://119.28.7.180:8080/img/goods_color/3/6.jpg', '', 0, 3);
INSERT INTO `img` VALUES (28, 0, '', 'http://119.28.7.180:8080/img/goods_color/4/1.jpg', '', 0, 4);
INSERT INTO `img` VALUES (29, 0, '', 'http://119.28.7.180:8080/img/goods_color/4/2.jpg', '', 0, 4);
INSERT INTO `img` VALUES (30, 0, '', 'http://119.28.7.180:8080/img/goods_color/4/3.jpg', '', 0, 4);
INSERT INTO `img` VALUES (31, 0, '', 'http://119.28.7.180:8080/img/goods_color/4/4.jpg', '', 0, 4);
INSERT INTO `img` VALUES (32, 0, '', 'http://119.28.7.180:8080/img/goods_color/5/1.jpg', '', 0, 5);
INSERT INTO `img` VALUES (33, 0, '', 'http://119.28.7.180:8080/img/goods_color/5/2.jpg', '', 0, 5);
INSERT INTO `img` VALUES (34, 0, '', 'http://119.28.7.180:8080/img/goods_color/5/3.jpg', '', 0, 5);
INSERT INTO `img` VALUES (35, 0, '', 'http://119.28.7.180:8080/img/goods_color/5/4.jpg', '', 0, 5);
INSERT INTO `img` VALUES (36, 0, '', 'http://119.28.7.180:8080/img/goods_color/6/1.jpg', '', 0, 6);
INSERT INTO `img` VALUES (37, 0, '', 'http://119.28.7.180:8080/img/goods_color/6/2.jpg', '', 0, 6);
INSERT INTO `img` VALUES (38, 0, '', 'http://119.28.7.180:8080/img/goods_color/6/3.jpg', '', 0, 6);
INSERT INTO `img` VALUES (39, 0, '', 'http://119.28.7.180:8080/img/goods_color/6/4.jpg', '', 0, 6);
INSERT INTO `img` VALUES (40, 0, '', 'http://119.28.7.180:8080/img/goods_color/7/1.jpg', '', 0, 7);
INSERT INTO `img` VALUES (41, 0, '', 'http://119.28.7.180:8080/img/goods_color/7/2.jpg', '', 0, 7);
INSERT INTO `img` VALUES (42, 0, '', 'http://119.28.7.180:8080/img/goods_color/7/3.jpg', '', 0, 7);
INSERT INTO `img` VALUES (43, 0, '', 'http://119.28.7.180:8080/img/goods_color/7/4.jpg', '', 0, 7);
INSERT INTO `img` VALUES (44, 0, '', 'http://119.28.7.180:8080/img/goods_color/8/1.jpg', '', 0, 8);
INSERT INTO `img` VALUES (45, 0, '', 'http://119.28.7.180:8080/img/goods_color/8/2.jpg', '', 0, 8);
INSERT INTO `img` VALUES (46, 0, '', 'http://119.28.7.180:8080/img/goods_color/8/3.jpg', '', 0, 8);
INSERT INTO `img` VALUES (47, 0, '', 'http://119.28.7.180:8080/img/goods_color/8/4.jpg', '', 0, 8);
INSERT INTO `img` VALUES (48, 0, '', 'http://119.28.7.180:8080/img/goods_color/8/5.jpg', '', 0, 8);
INSERT INTO `img` VALUES (49, 0, '', 'http://119.28.7.180:8080/img/goods_color/9/1.jpg', '', 0, 9);
INSERT INTO `img` VALUES (50, 0, '', 'http://119.28.7.180:8080/img/goods_color/9/2.jpg', '', 0, 9);
INSERT INTO `img` VALUES (51, 0, '', 'http://119.28.7.180:8080/img/goods_color/9/3.jpg', '', 0, 9);
INSERT INTO `img` VALUES (52, 0, '', 'http://119.28.7.180:8080/img/goods_color/9/4.jpg', '', 0, 9);
INSERT INTO `img` VALUES (53, 0, '', 'http://119.28.7.180:8080/img/goods_color/9/5.jpg', '', 0, 9);
INSERT INTO `img` VALUES (54, 0, '', 'http://119.28.7.180:8080/img/goods_color/10/1.jpg', '', 0, 10);
INSERT INTO `img` VALUES (55, 0, '', 'http://119.28.7.180:8080/img/goods_color/10/2.jpg', '', 0, 10);
INSERT INTO `img` VALUES (56, 0, '', 'http://119.28.7.180:8080/img/goods_color/10/3.jpg', '', 0, 10);
INSERT INTO `img` VALUES (57, 0, '', 'http://119.28.7.180:8080/img/goods_color/11/1.png', '', 6, 11);
INSERT INTO `img` VALUES (58, 0, '', 'http://119.28.7.180:8080/img/goods_color/11/2.png', '', 0, 11);
INSERT INTO `img` VALUES (59, 0, '', 'http://119.28.7.180:8080/img/goods_color/11/3.png', '', 0, 11);
INSERT INTO `img` VALUES (60, 0, '', 'http://119.28.7.180:8080/img/goods_color/11/4.png', '', 0, 11);
INSERT INTO `img` VALUES (61, 0, '', 'http://119.28.7.180:8080/img/goods_color/11/5.png', '', 0, 11);
INSERT INTO `img` VALUES (62, 0, '', 'http://119.28.7.180:8080/img/goods_color/12/1.jpg', '', 0, 12);
INSERT INTO `img` VALUES (63, 0, '', 'http://119.28.7.180:8080/img/goods_color/12/2.png', '', 0, 12);
INSERT INTO `img` VALUES (64, 0, '', 'http://119.28.7.180:8080/img/goods_color/12/3.png', '', 0, 12);
INSERT INTO `img` VALUES (65, 0, '', 'http://119.28.7.180:8080/img/goods_color/12/4.png', '', 0, 12);
INSERT INTO `img` VALUES (66, 0, '', 'http://119.28.7.180:8080/img/goods_color/12/5.png', '', 0, 12);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '0',
  `version_id` int(11) NOT NULL DEFAULT 0 COMMENT '配置id',
  `color_id` int(11) NOT NULL DEFAULT 0 COMMENT '颜色id',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品状态 0删除 1购物车 2等待支付',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `color_id`(`color_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (5, 1, 2, 1, 1, 1, '1', '2020-03-28 16:03:33', NULL);
INSERT INTO `shopping_cart` VALUES (6, 5, 2, 2, 3, 1, '1', '2020-03-28 16:03:01', NULL);
INSERT INTO `shopping_cart` VALUES (7, 5, 2, 1, 2, 1, '2', '2020-03-28 18:53:12', '2020-03-31 18:48:30');
INSERT INTO `shopping_cart` VALUES (8, 5, 2, 3, 1, 1, '1', '2020-03-28 18:53:21', NULL);
INSERT INTO `shopping_cart` VALUES (9, 5, 2, 3, 3, 1, '1', '2020-03-28 19:40:38', NULL);
INSERT INTO `shopping_cart` VALUES (10, 5, 2, 3, 2, 1, '1', '2020-03-29 22:33:35', NULL);
INSERT INTO `shopping_cart` VALUES (11, 5, 6, 11, 12, 9, '1', '2020-03-31 11:20:53', NULL);
INSERT INTO `shopping_cart` VALUES (12, 7, 2, 1, 1, 1, '1', '2020-04-08 14:29:42', NULL);
INSERT INTO `shopping_cart` VALUES (13, 7, 2, 2, 2, 1, '2', '2020-04-08 14:29:50', '2020-04-08 14:30:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `api_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remember_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `api_token`(`api_token`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '111111', '$2y$10$P9avnhlZ67mf2ovHO1Y7vekrHY.GfKliQUv9ZV/YRN6aOnH313Pue', '', '', '', '2020-03-24 19:44:09', '2020-03-24 19:44:09');
INSERT INTO `users` VALUES (2, '222222', '$2y$10$58kTe74nLyl2tj9Hssiw2.aJfTLaJFmfQ91KdAgSVGNm69mwOa3R.', '', '', '', '2020-03-24 20:06:59', '2020-03-24 20:06:59');
INSERT INTO `users` VALUES (3, '333333', '$2y$10$/4rbosM.SzsykADbHGJVleuk7AidQlhDHahJ8qZVjEp88jRsLaJVC', '', '', '', '2020-03-28 16:10:33', '2020-03-28 16:10:33');
INSERT INTO `users` VALUES (4, '444444', '$2y$10$rzOhDPGrX0lUbNLXcF0EZOe6BYlQCowbniwbRMSkwBbi4tPuC8xVa', '', '', '', '2020-03-28 16:12:09', '2020-03-28 16:12:09');
INSERT INTO `users` VALUES (5, '555555', '$2y$10$XQBAwzHAQv88MUbLg.6KKuDR7G5iOHQ0kdrk0YZHOGbDzLlYHt75u', '', '', '', '2020-03-28 16:16:25', '2020-03-28 16:16:25');
INSERT INTO `users` VALUES (6, '666666', '$2y$10$51w695hS54UGQzGXc8iWmuzJdWIpnV3dXPmYGJbzu78EbySyKLbVS', '', '', '', '2020-03-28 17:13:10', '2020-03-28 17:13:10');
INSERT INTO `users` VALUES (7, '777777', '$2y$10$MkHNtEijmtzXuM4emtxVt.d8c9Ik1TYKlE6Eenxs4P3xjFB7eN5ui', '', '', '', '2020-04-08 14:29:24', '2020-04-08 14:29:24');
INSERT INTO `users` VALUES (8, 'asdfgh', '$2y$10$DObw0hUtVGQSkErRNvthHubNvHyGVwCoz6qpMW9am4qS.JqadeaoC', '', '', '', '2020-04-22 14:39:55', '2020-04-22 14:39:55');

SET FOREIGN_KEY_CHECKS = 1;

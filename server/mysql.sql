/*
 Navicat Premium Data Transfer

 Source Server         : Gelx
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : mysql

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 02/06/2021 14:00:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for innodb_index_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_index_stats`;
CREATE TABLE `innodb_index_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `stat_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(0) UNSIGNED NOT NULL,
  `sample_size` bigint(0) UNSIGNED NULL DEFAULT NULL,
  `stat_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`, `index_name`, `stat_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Records of innodb_index_stats
-- ----------------------------
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'menus', 'PRIMARY', '2021-06-02 12:51:39', 'n_diff_pfx01', 9, 1, 'menu_id');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'menus', 'PRIMARY', '2021-06-02 12:51:39', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'menus', 'PRIMARY', '2021-06-02 12:51:39', 'size', 1, NULL, 'Number of pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'roles', 'PRIMARY', '2021-05-30 23:21:03', 'n_diff_pfx01', 2, 1, 'role_id');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'roles', 'PRIMARY', '2021-05-30 23:21:03', 'n_diff_pfx02', 2, 1, 'role_id,role_name');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'roles', 'PRIMARY', '2021-05-30 23:21:03', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'roles', 'PRIMARY', '2021-05-30 23:21:03', 'size', 1, NULL, 'Number of pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'user_logs', 'PRIMARY', '2021-06-02 12:02:32', 'n_diff_pfx01', 17, 1, 'user_log_id');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'user_logs', 'PRIMARY', '2021-06-02 12:02:32', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'user_logs', 'PRIMARY', '2021-06-02 12:02:32', 'size', 1, NULL, 'Number of pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users', 'PRIMARY', '2021-05-30 23:21:13', 'n_diff_pfx01', 2, 1, 'user_id');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users', 'PRIMARY', '2021-05-30 23:21:13', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users', 'PRIMARY', '2021-05-30 23:21:13', 'size', 1, NULL, 'Number of pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users_roles', 'PRIMARY', '2021-05-30 23:21:23', 'n_diff_pfx01', 2, 1, 'user_role_id');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users_roles', 'PRIMARY', '2021-05-30 23:21:23', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('mysql', 'users_roles', 'PRIMARY', '2021-05-30 23:21:23', 'size', 1, NULL, 'Number of pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('sys', 'sys_config', 'PRIMARY', '2021-05-11 00:15:59', 'n_diff_pfx01', 6, 1, 'variable');
INSERT INTO `innodb_index_stats` VALUES ('sys', 'sys_config', 'PRIMARY', '2021-05-11 00:15:59', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index');
INSERT INTO `innodb_index_stats` VALUES ('sys', 'sys_config', 'PRIMARY', '2021-05-11 00:15:59', 'size', 1, NULL, 'Number of pages in the index');

-- ----------------------------
-- Table structure for innodb_table_stats
-- ----------------------------
DROP TABLE IF EXISTS `innodb_table_stats`;
CREATE TABLE `innodb_table_stats`  (
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `n_rows` bigint(0) UNSIGNED NOT NULL,
  `clustered_index_size` bigint(0) UNSIGNED NOT NULL,
  `sum_of_other_index_sizes` bigint(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic STATS_PERSISTENT = 0 TABLESPACE = `mysql`;

-- ----------------------------
-- Records of innodb_table_stats
-- ----------------------------
INSERT INTO `innodb_table_stats` VALUES ('mysql', 'menus', '2021-06-02 12:51:39', 9, 1, 0);
INSERT INTO `innodb_table_stats` VALUES ('mysql', 'roles', '2021-05-30 23:21:03', 2, 1, 0);
INSERT INTO `innodb_table_stats` VALUES ('mysql', 'user_logs', '2021-06-02 12:02:32', 17, 1, 0);
INSERT INTO `innodb_table_stats` VALUES ('mysql', 'users', '2021-05-30 23:21:13', 2, 1, 0);
INSERT INTO `innodb_table_stats` VALUES ('mysql', 'users_roles', '2021-05-30 23:21:23', 2, 1, 0);
INSERT INTO `innodb_table_stats` VALUES ('sys', 'sys_config', '2021-05-11 00:15:59', 6, 1, 0);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `menu_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) NOT NULL COMMENT '上级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由组件',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '隐藏',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (7, 0, '系统管理', 0, 'M', 'component', 'System', 'Layout', '/system', '/system/user', NULL, 0, NULL, '2020-05-24 18:51:21');
INSERT INTO `menus` VALUES (8, 7, '菜单管理', 0, 'C', 'list', 'Menu', '/system/menu', '/system/menu', '', 'system:menu', 0, NULL, '2020-05-24 18:52:26');
INSERT INTO `menus` VALUES (9, 7, '角色管理', 0, 'C', 'peoples', 'Role', '/system/role', '/system/role', '', 'system:role', 0, NULL, '2020-05-24 18:53:31');
INSERT INTO `menus` VALUES (10, 7, '用户管理', 1, 'C', 'user', 'User', '/system/user', '/system/user', '', 'system:user', 0, '2020-05-24 18:58:01', '2020-05-24 18:54:26');
INSERT INTO `menus` VALUES (11, 7, '登录日志', 0, 'C', 'log', 'Log', '/system/log', '/system/log', '', 'system:log', 0, NULL, '2020-05-24 18:55:20');
INSERT INTO `menus` VALUES (12, 0, '识别模块', 0, 'M', 'example', '识别模块', 'Layout', '/demo', '', NULL, 0, '2020-05-30 15:00:24', '2020-05-25 20:31:21');
INSERT INTO `menus` VALUES (13, 12, '人脸识别', 0, 'C', 'example', '人脸识别', '/demo/demo-1', '/demo/demo-1', '', NULL, 0, '2021-06-02 12:51:17', '2020-05-25 20:32:13');
INSERT INTO `menus` VALUES (14, 12, '人体识别', 0, 'C', 'example', '人体识别', '/demo/demo-2', '/demo/demo-2', '', NULL, 0, '2021-06-02 12:52:00', '2020-05-25 20:32:54');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '状态',
  `menu_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单ID',
  `buttons` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`role_id`, `role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理员', '拥有全部权限', 1, '[7,10,8,9,11,12,13,15,14,16]', '[{\"menu_id\":10,\"btns\":[\"system:user:query\",\"system:user:add\",\"system:user:edit\",\"system:user:del\"]},{\"menu_id\":8,\"btns\":[\"system:menu:del\",\"system:menu:edit\",\"system:menu:add\",\"system:menu:query\"]},{\"menu_id\":9,\"btns\":[\"system:role:query\",\"system:role:add\",\"system:role:del\",\"system:role:edit\"]},{\"menu_id\":11,\"btns\":[\"system:log:query\",\"system:log:del\"]}]', '2020-05-25 20:48:44', '2020-05-16 21:14:50');
INSERT INTO `roles` VALUES (3, '观察者', NULL, 1, '[7,10,8,9,11,12,13,15,14,16]', '[{\"menu_id\":10,\"btns\":[\"system:user:query\"]},{\"menu_id\":8,\"btns\":[\"system:menu:query\"]},{\"menu_id\":11,\"btns\":[\"system:log:query\"]},{\"menu_id\":9,\"btns\":[\"system:role:query\"]}]', '2020-05-25 20:49:08', '2020-05-22 18:50:23');

-- ----------------------------
-- Table structure for user_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs`  (
  `user_log_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `ua` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ua标识',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`user_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
INSERT INTO `user_logs` VALUES (23, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-05-30 23:29:20');
INSERT INTO `user_logs` VALUES (24, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-30 23:32:38');
INSERT INTO `user_logs` VALUES (25, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-01 20:47:28');
INSERT INTO `user_logs` VALUES (26, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-01 21:09:45');
INSERT INTO `user_logs` VALUES (27, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-01 21:10:09');
INSERT INTO `user_logs` VALUES (28, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-01 21:10:40');
INSERT INTO `user_logs` VALUES (29, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-01 21:18:54');
INSERT INTO `user_logs` VALUES (30, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 21:21:56');
INSERT INTO `user_logs` VALUES (31, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 21:33:22');
INSERT INTO `user_logs` VALUES (32, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 21:34:13');
INSERT INTO `user_logs` VALUES (33, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 21:35:54');
INSERT INTO `user_logs` VALUES (34, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 21:36:12');
INSERT INTO `user_logs` VALUES (35, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-01 23:36:43');
INSERT INTO `user_logs` VALUES (36, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 00:10:04');
INSERT INTO `user_logs` VALUES (37, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3868.400 QQBrowser/10.8.4394.400', '2021-06-02 11:39:23');
INSERT INTO `user_logs` VALUES (38, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 11:42:48');
INSERT INTO `user_logs` VALUES (39, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 12:02:32');
INSERT INTO `user_logs` VALUES (40, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 12:03:25');
INSERT INTO `user_logs` VALUES (41, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-06-02 12:44:20');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'gelx', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-06-01 21:36:05', '2020-05-16 21:15:43');
INSERT INTO `users` VALUES (3, 'gelxgx', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-06-01 21:34:30', '2020-05-23 19:43:54');

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `user_role_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL COMMENT '角色ID',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 1, 1, '2020-05-16 21:15:03');
INSERT INTO `users_roles` VALUES (14, 3, 3, '2020-05-24 11:19:35');

SET FOREIGN_KEY_CHECKS = 1;

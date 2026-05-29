/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : game0

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 30/05/2026 04:37:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ob_ad
-- ----------------------------
DROP TABLE IF EXISTS `ob_ad`;
CREATE TABLE `ob_ad`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接',
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片',
  `sort_order` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_ad
-- ----------------------------

-- ----------------------------
-- Table structure for ob_admin
-- ----------------------------
DROP TABLE IF EXISTS `ob_admin`;
CREATE TABLE `ob_admin`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0禁用/1启动',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  `last_login_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `login_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_admin
-- ----------------------------
INSERT INTO `ob_admin` VALUES (1, 'admin', '$2y$10$a7CjNvuecZFnyPr5tQVG6OSCgl0SKDdGhOtrYmgKSso420739OHAC', 1, 1780083801, '127.0.0.1', 241, 0, 1780083801);

-- ----------------------------
-- Table structure for ob_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ob_admin_log`;
CREATE TABLE `ob_admin_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求链接',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '资源类型',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2943 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_admin_log
-- ----------------------------
INSERT INTO `ob_admin_log` VALUES (2939, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/admin/index/editpassword.html', 'POST', 'ajax', '{\"password\":\"123456\",\"new_password\":\"Aa123123\",\"rep_password\":\"Aa123123\"}', '修改了登录密码', 1780083791);
INSERT INTO `ob_admin_log` VALUES (2940, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/admin/index/logout.html', 'GET', 'html', '[]', '退出了后台系统', 1780083795);
INSERT INTO `ob_admin_log` VALUES (2941, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/admin.html', 'POST', 'ajax', '{\"username\":\"admin\",\"password\":\"Aa123123\",\"captcha\":\"8p2z\"}', '登录了后台系统', 1780083801);
INSERT INTO `ob_admin_log` VALUES (2942, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/admin/kalman/del/id/12221.html', 'POST', 'ajax', '{\"id\":\"12221\"}', '删除了卡密', 1780083851);

-- ----------------------------
-- Table structure for ob_article
-- ----------------------------
DROP TABLE IF EXISTS `ob_article`;
CREATE TABLE `ob_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `photo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相册',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `sort_order` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_article
-- ----------------------------

-- ----------------------------
-- Table structure for ob_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group`;
CREATE TABLE `ob_auth_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_auth_group
-- ----------------------------
INSERT INTO `ob_auth_group` VALUES (1, '超级管理员', '', 1, '6,44,43,1,8,34,35,36,7,2,9,28,29,30,10,54,3,11,25,26,27,46,4,12,14,13,45,55,5,16,17,15,18');

-- ----------------------------
-- Table structure for ob_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_group_access`;
CREATE TABLE `ob_auth_group_access`  (
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_auth_group_access
-- ----------------------------
INSERT INTO `ob_auth_group_access` VALUES (1, 1);
INSERT INTO `ob_auth_group_access` VALUES (2, 1);

-- ----------------------------
-- Table structure for ob_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ob_auth_rule`;
CREATE TABLE `ob_auth_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `type` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'nav,auth',
  `index` tinyint(1) NOT NULL DEFAULT 0 COMMENT '快捷导航',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_auth_rule
-- ----------------------------
INSERT INTO `ob_auth_rule` VALUES (2, 0, '首页', '', 'fa fa-users', 3, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (3, 0, '扩展', '', 'fa fa-puzzle-piece', 4, 'nav', 0, 0);
INSERT INTO `ob_auth_rule` VALUES (4, 0, '设置', '', 'fa fa-gear', 5, 'nav', 0, 0);
INSERT INTO `ob_auth_rule` VALUES (5, 0, '权限', '', 'fa fa-lock', 6, 'nav', 0, 0);
INSERT INTO `ob_auth_rule` VALUES (6, 0, '控制台', 'admin/index/index', '', 1, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (9, 2, '会员管理', 'admin/user/index', 'fa fa-users', 0, 'nav', 1, 1);
INSERT INTO `ob_auth_rule` VALUES (10, 9, '会员列表', 'admin/user/index', '', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (12, 4, '基本设置', 'admin/config/setting', 'fa fa-cog', 1, 'nav', 1, 1);
INSERT INTO `ob_auth_rule` VALUES (13, 4, '系统设置', 'admin/config/system', 'fa fa-wrench', 3, 'nav', 1, 1);
INSERT INTO `ob_auth_rule` VALUES (14, 4, '设置管理', 'admin/config/index', 'fa fa-bars', 2, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (15, 5, '权限规则', 'admin/auth/rule', 'fa fa-th-list', 3, 'nav', 1, 1);
INSERT INTO `ob_auth_rule` VALUES (16, 5, '管理员', 'admin/admin/index', 'fa fa-user', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (17, 5, '权限组', 'admin/auth/group', 'fa fa-users', 1, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (18, 5, '管理员日志', 'admin/admin/log', 'fa fa-clock-o', 5, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (20, 14, '编辑', 'admin/config/edit', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (21, 14, '删除', 'admin/config/del', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (22, 15, '添加', 'admin/auth/addRule', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (23, 15, '编辑', 'admin/auth/editRule', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (24, 15, '删除', 'admin/auth/delRule', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (30, 9, '会员日志', 'admin/user/log', 'fa fa-clock-o', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (31, 7, '添加', 'admin/category/add', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (32, 7, '编辑', 'admin/category/edit', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (33, 7, '删除', 'admin/category/del', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (34, 8, '添加', 'admin/article/add', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (35, 8, '编辑', 'admin/article/edit', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (36, 8, '删除', 'admin/article/del', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (37, 16, '添加', 'admin/admin/add', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (38, 16, '编辑', 'admin/admin/edit', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (39, 16, '删除', 'admin/admin/del', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (40, 17, '添加', 'admin/auth/addGroup', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (41, 17, '编辑', 'admin/auth/editGroup', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (42, 17, '删除', 'admin/auth/delGroup', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (43, 6, '修改密码', 'admin/index/editPassword', '', 2, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (44, 6, '清除缓存', 'admin/index/clear', '', 1, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (45, 4, '上传设置', 'admin/config/upload', 'fa fa-upload', 4, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (46, 3, '数据管理', 'admin/database/index', 'fa fa-database', 4, 'nav', 1, 1);
INSERT INTO `ob_auth_rule` VALUES (47, 46, '还原', 'admin/database/import', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (48, 46, '备份', 'admin/database/backup', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (49, 46, '优化', 'admin/database/optimize', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (50, 46, '修复', 'admin/database/repair', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (51, 46, '下载', 'admin/database/download', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (52, 46, '删除', 'admin/database/del', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (53, 18, '一键清空', 'admin/admin/truncate', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (54, 10, '一键清空', 'admin/user/truncate', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (55, 4, '邮件设置', 'admin/config/email', 'fa fa-envelope', 5, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (57, 58, '卡密管理', 'admin/kalman/index', 'fa fa-book', 1, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (58, 0, '卡密', 'admin/kalman/index', 'fa fa-at', 7, 'nav', 1, 0);
INSERT INTO `ob_auth_rule` VALUES (59, 57, '添加', 'admin/kalman/add', 'fa fa-at', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (60, 9, '提现管理', 'admin/user/presentation', 'fa fa-calendar-plus-o', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (61, 9, '游戏日志', 'admin/user/game_log', 'fa fa-calendar-plus-o', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (62, 2, '卡密充值', 'admin/kalman/index', 'fa fa-book', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (63, 62, '卡密列表', 'admin/kalman/index', 'fa fa-book', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (64, 2, '系统设置', 'admin/auth/game', 'fa fa-gear', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (65, 64, '概率设置', 'admin/auth/game', 'fa fa-tv', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (66, 64, '基本设置', 'admin/config/setting', 'fa fa-cog', 0, 'nav', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (67, 63, '添加卡密', 'admin/kalman/add', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (68, 10, '编辑用户', 'admin/user/edit', '', 0, 'auth', 0, 1);
INSERT INTO `ob_auth_rule` VALUES (69, 4, '概率设置', 'admin/auth/game', 'fa fa-tv', 0, 'nav', 0, 1);

-- ----------------------------
-- Table structure for ob_category
-- ----------------------------
DROP TABLE IF EXISTS `ob_category`;
CREATE TABLE `ob_category`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `sort_order` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_category
-- ----------------------------
INSERT INTO `ob_category` VALUES (1, 0, '前端开发', 100, '', '');
INSERT INTO `ob_category` VALUES (2, 0, '后端开发', 100, '', '');
INSERT INTO `ob_category` VALUES (3, 0, '移动互联', 100, '', '');
INSERT INTO `ob_category` VALUES (4, 0, '人工智能', 100, '', '');

-- ----------------------------
-- Table structure for ob_config
-- ----------------------------
DROP TABLE IF EXISTS `ob_config`;
CREATE TABLE `ob_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置分组',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置标识',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认值',
  `options` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项值',
  `sort_order` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_config
-- ----------------------------
INSERT INTO `ob_config` VALUES (1, 'website', '网站logo', 'logo', 'image', '/upload/image/20190719/8c443533c454707bd72a31822c33ab52.png', '', 100, 0);
INSERT INTO `ob_config` VALUES (2, 'website', '网站名称', 'site_name', 'input', '水果机', '', 100, 0);
INSERT INTO `ob_config` VALUES (3, 'website', '网站标题', 'site_title', 'input', '水果机', '', 100, 0);
INSERT INTO `ob_config` VALUES (4, 'website', '游戏规则', 'site_keywords', 'textarea', '开发搭建联系QQ：488763443', '', 100, 1);
INSERT INTO `ob_config` VALUES (5, 'website', '分销规则', 'site_description', 'textarea', '复制推广链接发给别人注册成功后，即可成为你的徒弟，你的徒弟每一次的投注，不论输赢，都会自动给你带来1%的金币提成！你徒弟的徒弟，一样可以给你带来1%的提成！总共可以产生二级下线徒弟！', '', 100, 1);
INSERT INTO `ob_config` VALUES (6, 'website', '推广赠送', 'site_copyright', 'input', '0', '', 100, 1);
INSERT INTO `ob_config` VALUES (7, 'website', 'ICP备案号', 'site_icp', 'input', '', '', 100, 0);
INSERT INTO `ob_config` VALUES (8, 'website', '统计代码', 'site_code', 'textarea', '', '', 100, 0);
INSERT INTO `ob_config` VALUES (9, 'contact', '客服二维码', 'company', 'image', '', '', 100, 0);
INSERT INTO `ob_config` VALUES (10, 'contact', '公司地址', 'address', 'input', 'asd', '', 100, 0);
INSERT INTO `ob_config` VALUES (11, 'contact', '客服微信号', 'tel', 'input', '联系QQ：488763443', '', 100, 1);
INSERT INTO `ob_config` VALUES (12, 'contact', '联系邮箱', 'email', 'input', '', '', 100, 0);
INSERT INTO `ob_config` VALUES (37, 'website', '分销提成', 'distribution', 'input', '0.01', '', 100, 1);
INSERT INTO `ob_config` VALUES (38, 'website', '赠送金币', 'money', 'input', '10', '', 100, 1);

-- ----------------------------
-- Table structure for ob_distribution
-- ----------------------------
DROP TABLE IF EXISTS `ob_distribution`;
CREATE TABLE `ob_distribution`  (
  `fx_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_a` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分销用户ID',
  `a_money` float NULL DEFAULT NULL COMMENT '一级分销用户盈利金额',
  `user_b` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级分销用户id',
  `b_money` float NULL DEFAULT NULL COMMENT '二级分销用户盈利金额',
  `fx_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`fx_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 535 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_distribution
-- ----------------------------

-- ----------------------------
-- Table structure for ob_game
-- ----------------------------
DROP TABLE IF EXISTS `ob_game`;
CREATE TABLE `ob_game`  (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `prize` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '水果名称',
  `v` float NOT NULL DEFAULT 0 COMMENT '水果抽中概率',
  `multiple_rate` int(11) NULL DEFAULT 1 COMMENT '倍率默认为一倍',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '所属水果的id，0标识自己本身是水果',
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_game
-- ----------------------------
INSERT INTO `ob_game` VALUES (1, '桔子', 4, 10, 13);
INSERT INTO `ob_game` VALUES (2, '铃铛', 2, 20, 2);
INSERT INTO `ob_game` VALUES (3, 'BAR*50', 0.03, 50, 4);
INSERT INTO `ob_game` VALUES (4, 'BAR', 0, 120, 4);
INSERT INTO `ob_game` VALUES (5, '苹果', 0, 5, 5);
INSERT INTO `ob_game` VALUES (6, '苹果*2', 2, 2, 5);
INSERT INTO `ob_game` VALUES (7, '芒果', 4, 15, 19);
INSERT INTO `ob_game` VALUES (8, '西瓜', 2, 20, 8);
INSERT INTO `ob_game` VALUES (9, '西瓜*2', 10, 2, 8);
INSERT INTO `ob_game` VALUES (10, 'LUCK', 11, 0, 10);
INSERT INTO `ob_game` VALUES (11, '苹果', 10, 5, 5);
INSERT INTO `ob_game` VALUES (12, '桔子*2', 10, 2, 13);
INSERT INTO `ob_game` VALUES (13, '桔子', 4, 10, 13);
INSERT INTO `ob_game` VALUES (14, '铃铛', 2, 20, 2);
INSERT INTO `ob_game` VALUES (15, '77*2', 10, 2, 16);
INSERT INTO `ob_game` VALUES (16, '77', 1, 40, 16);
INSERT INTO `ob_game` VALUES (17, '苹果', 10, 5, 5);
INSERT INTO `ob_game` VALUES (18, '芒果*2', 10, 2, 19);
INSERT INTO `ob_game` VALUES (19, '芒果', 4, 15, 19);
INSERT INTO `ob_game` VALUES (20, '星星', 2, 30, 20);
INSERT INTO `ob_game` VALUES (21, '星星*2', 10, 2, 20);
INSERT INTO `ob_game` VALUES (22, 'LUCK', 11, 0, 10);
INSERT INTO `ob_game` VALUES (23, '苹果', 4, 5, 5);
INSERT INTO `ob_game` VALUES (24, '铃铛*2', 50, 2, 2);

-- ----------------------------
-- Table structure for ob_game_log
-- ----------------------------
DROP TABLE IF EXISTS `ob_game_log`;
CREATE TABLE `ob_game_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '所属用户ID',
  `money` float NOT NULL COMMENT '下注金额',
  `in_money` float NOT NULL COMMENT '中奖金额',
  `profit` float NOT NULL COMMENT '盈利',
  `log_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抽奖时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1641 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_game_log
-- ----------------------------
INSERT INTO `ob_game_log` VALUES (1602, 10219, 5, 0, -5, '1780083702');
INSERT INTO `ob_game_log` VALUES (1603, 10219, 6, 0, -6, '1780083984');
INSERT INTO `ob_game_log` VALUES (1604, 10219, 6, 2, -4, '1780084133');
INSERT INTO `ob_game_log` VALUES (1605, 10219, 4, 0, -4, '1780084247');
INSERT INTO `ob_game_log` VALUES (1606, 10219, 6, 4, -2, '1780084262');
INSERT INTO `ob_game_log` VALUES (1607, 10219, 4, 2, -2, '1780084677');
INSERT INTO `ob_game_log` VALUES (1608, 10219, 2, 30, 28, '1780084719');
INSERT INTO `ob_game_log` VALUES (1609, 10219, 2, 4, 2, '1780084731');
INSERT INTO `ob_game_log` VALUES (1610, 10219, 2, 4, 2, '1780084738');
INSERT INTO `ob_game_log` VALUES (1611, 10219, 2, 0, -2, '1780085332');
INSERT INTO `ob_game_log` VALUES (1612, 10219, 2, 0, -2, '1780085342');
INSERT INTO `ob_game_log` VALUES (1613, 10219, 2, 0, -2, '1780085364');
INSERT INTO `ob_game_log` VALUES (1614, 10219, 2, 0, -2, '1780085370');
INSERT INTO `ob_game_log` VALUES (1615, 10219, 2, 0, -2, '1780085377');
INSERT INTO `ob_game_log` VALUES (1616, 10219, 2, 0, -2, '1780085391');
INSERT INTO `ob_game_log` VALUES (1617, 10219, 2, 0, -2, '1780085399');
INSERT INTO `ob_game_log` VALUES (1618, 10219, 2, 0, -2, '1780086740');
INSERT INTO `ob_game_log` VALUES (1619, 10219, 2, 0, -2, '1780086760');
INSERT INTO `ob_game_log` VALUES (1620, 10219, 2, 0, -2, '1780086837');
INSERT INTO `ob_game_log` VALUES (1621, 10219, 2, 0, -2, '1780086851');
INSERT INTO `ob_game_log` VALUES (1622, 10219, 2, 0, -2, '1780086862');
INSERT INTO `ob_game_log` VALUES (1623, 10219, 8, 0, -8, '1780086871');
INSERT INTO `ob_game_log` VALUES (1624, 10219, 8, 4, -4, '1780086878');
INSERT INTO `ob_game_log` VALUES (1625, 10219, 8, 0, -8, '1780086886');
INSERT INTO `ob_game_log` VALUES (1626, 10219, 8, 20, 12, '1780086891');
INSERT INTO `ob_game_log` VALUES (1627, 10219, 8, 0, -8, '1780086903');
INSERT INTO `ob_game_log` VALUES (1628, 10219, 8, 10, 2, '1780086911');
INSERT INTO `ob_game_log` VALUES (1629, 10219, 8, 10, 2, '1780086921');
INSERT INTO `ob_game_log` VALUES (1630, 10219, 8, 30, 22, '1780086935');
INSERT INTO `ob_game_log` VALUES (1631, 10219, 8, 30, 22, '1780086942');
INSERT INTO `ob_game_log` VALUES (1632, 10219, 8, 10, 2, '1780086950');
INSERT INTO `ob_game_log` VALUES (1633, 10219, 8, 4, -4, '1780086957');
INSERT INTO `ob_game_log` VALUES (1634, 10219, 8, 0, -8, '1780086965');
INSERT INTO `ob_game_log` VALUES (1635, 10219, 8, 10, 2, '1780086971');
INSERT INTO `ob_game_log` VALUES (1636, 10219, 8, 4, -4, '1780086978');
INSERT INTO `ob_game_log` VALUES (1637, 10219, 8, 20, 12, '1780087012');
INSERT INTO `ob_game_log` VALUES (1638, 10219, 8, 4, -4, '1780087019');
INSERT INTO `ob_game_log` VALUES (1639, 10219, 8, 10, 2, '1780087025');
INSERT INTO `ob_game_log` VALUES (1640, 10219, 8, 0, -8, '1780087032');

-- ----------------------------
-- Table structure for ob_images
-- ----------------------------
DROP TABLE IF EXISTS `ob_images`;
CREATE TABLE `ob_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_images
-- ----------------------------

-- ----------------------------
-- Table structure for ob_kalman
-- ----------------------------
DROP TABLE IF EXISTS `ob_kalman`;
CREATE TABLE `ob_kalman`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generation_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡密生成时间',
  `generate_admin` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生成的管理员',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '是否使用 0 未使用  1已经使用',
  `effective_time` int(11) NULL DEFAULT NULL COMMENT '用户领取时间',
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡密使用者',
  `number` int(10) NOT NULL COMMENT '充值金币数量',
  `kalman_pwd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '生成卡密',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12227 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡密管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_kalman
-- ----------------------------
INSERT INTO `ob_kalman` VALUES (11202, '1730874867', '1', 1, 1730874920, '10183', 1000, 'KCPGIKNK');
INSERT INTO `ob_kalman` VALUES (11203, '1731288423', '1', 1, 1731288451, '10187', 100, '6DXOMTH6');
INSERT INTO `ob_kalman` VALUES (11204, '1733585855', '1', 1, 1733587239, '10189', 100, '84HBGBAD');
INSERT INTO `ob_kalman` VALUES (11205, '1733586185', '1', 1, 1733587259, '10189', 1000, 'MR7AUBXM');
INSERT INTO `ob_kalman` VALUES (11206, '1733586185', '1', 1, 1733586208, '10188', 1000, 'O00SKRS2');
INSERT INTO `ob_kalman` VALUES (11207, '1733586448', '1', 1, 1733586466, '10188', 10000, '49LT3JDH');
INSERT INTO `ob_kalman` VALUES (11208, '1733588052', '1', 1, 1733588081, '10189', 100000, '3PH0VQAN');
INSERT INTO `ob_kalman` VALUES (11209, '1733640827', '1', 1, 1733640846, '10188', 1000000, 'QA6SRNKM');
INSERT INTO `ob_kalman` VALUES (11210, '1734000298', '1', 1, 1734000670, '10191', 100, 'DM1T1S1K');
INSERT INTO `ob_kalman` VALUES (11211, '1734000747', '1', 1, 1734000784, '10191', 100, 'JT9XLEL9');
INSERT INTO `ob_kalman` VALUES (11212, '1734001612', '1', 1, 1734001643, '10191', 1000, 'K1TSX1QW');
INSERT INTO `ob_kalman` VALUES (11213, '1734001956', '1', 1, 1734002071, '10192', 100, 'YIBQOAKE');
INSERT INTO `ob_kalman` VALUES (11214, '1734002565', '1', 1, 1734002597, '10192', 100, 'N2U58Q6G');
INSERT INTO `ob_kalman` VALUES (11215, '1734004769', '1', 1, 1734004855, '10194', 100, 'SDWC4EYP');
INSERT INTO `ob_kalman` VALUES (11216, '1734011594', '1', 1, 1734011698, '10196', 500, 'TFEDE476');
INSERT INTO `ob_kalman` VALUES (11217, '1734012300', '1', 1, 1734012385, '10199', 500, '0OWLNLL5');
INSERT INTO `ob_kalman` VALUES (11218, '1734082060', '1', 1, 1734113346, '10191', 100, '0NQOYLRP');
INSERT INTO `ob_kalman` VALUES (11219, '1734082350', '1', 1, 1734082410, '10206', 500, '145NM5WT');
INSERT INTO `ob_kalman` VALUES (11220, '1734083969', '1', 1, 1734084035, '10209', 1000, 'W0GOYL8Q');
INSERT INTO `ob_kalman` VALUES (11221, '1734112954', '1', 1, 1734112993, '10191', 1000, 'UYSB8OQO');
INSERT INTO `ob_kalman` VALUES (11222, '1734182810', '1', 1, 1734182873, '10212', 1000, 'E3Y8YF9W');
INSERT INTO `ob_kalman` VALUES (11223, '1745048678', '1', 0, NULL, NULL, 1, '687N91PE');
INSERT INTO `ob_kalman` VALUES (11224, '1745048678', '1', 0, NULL, NULL, 1, 'K2M8GBFG');
INSERT INTO `ob_kalman` VALUES (11225, '1745048678', '1', 0, NULL, NULL, 1, '60TWU16S');
INSERT INTO `ob_kalman` VALUES (11226, '1745048678', '1', 0, NULL, NULL, 1, '0TG0H8X1');
INSERT INTO `ob_kalman` VALUES (11227, '1745048678', '1', 0, NULL, NULL, 1, 'CU1EXOY0');
INSERT INTO `ob_kalman` VALUES (11228, '1745048678', '1', 0, NULL, NULL, 1, '1ERV0H88');
INSERT INTO `ob_kalman` VALUES (11229, '1745048678', '1', 0, NULL, NULL, 1, 'PHETXEP7');
INSERT INTO `ob_kalman` VALUES (11230, '1745048678', '1', 0, NULL, NULL, 1, 'B8MPBSXH');
INSERT INTO `ob_kalman` VALUES (11231, '1745048678', '1', 0, NULL, NULL, 1, '16Y7AFD7');
INSERT INTO `ob_kalman` VALUES (11232, '1745048678', '1', 0, NULL, NULL, 1, 'CH9GHO6G');
INSERT INTO `ob_kalman` VALUES (11233, '1745048678', '1', 0, NULL, NULL, 1, 'E4GUXF9I');
INSERT INTO `ob_kalman` VALUES (11234, '1745048678', '1', 0, NULL, NULL, 1, 'PFF7OOAC');
INSERT INTO `ob_kalman` VALUES (11235, '1745048678', '1', 0, NULL, NULL, 1, '57DH0L1W');
INSERT INTO `ob_kalman` VALUES (11236, '1745048678', '1', 0, NULL, NULL, 1, 'NY7RII27');
INSERT INTO `ob_kalman` VALUES (11237, '1745048678', '1', 0, NULL, NULL, 1, '92DX7T81');
INSERT INTO `ob_kalman` VALUES (11238, '1745048678', '1', 0, NULL, NULL, 1, '3LSJBFV2');
INSERT INTO `ob_kalman` VALUES (11239, '1745048678', '1', 0, NULL, NULL, 1, '4253R7S5');
INSERT INTO `ob_kalman` VALUES (11240, '1745048678', '1', 0, NULL, NULL, 1, '8IK69F50');
INSERT INTO `ob_kalman` VALUES (11241, '1745048678', '1', 0, NULL, NULL, 1, '70L9OYC9');
INSERT INTO `ob_kalman` VALUES (11242, '1745048678', '1', 0, NULL, NULL, 1, 'YMFTN1CR');
INSERT INTO `ob_kalman` VALUES (11243, '1745048678', '1', 0, NULL, NULL, 1, 'HG2E7R9X');
INSERT INTO `ob_kalman` VALUES (11244, '1745048678', '1', 0, NULL, NULL, 1, 'GNHG6RTU');
INSERT INTO `ob_kalman` VALUES (11245, '1745048678', '1', 0, NULL, NULL, 1, '1K6FHJK7');
INSERT INTO `ob_kalman` VALUES (11246, '1745048678', '1', 0, NULL, NULL, 1, 'ELLCF4GI');
INSERT INTO `ob_kalman` VALUES (11247, '1745048678', '1', 0, NULL, NULL, 1, '56FK2Q5Q');
INSERT INTO `ob_kalman` VALUES (11248, '1745048678', '1', 0, NULL, NULL, 1, 'B1HKKBKY');
INSERT INTO `ob_kalman` VALUES (11249, '1745048678', '1', 0, NULL, NULL, 1, 'LJBXF9YX');
INSERT INTO `ob_kalman` VALUES (11250, '1745048678', '1', 0, NULL, NULL, 1, 'JCXROEPC');
INSERT INTO `ob_kalman` VALUES (11251, '1745048678', '1', 0, NULL, NULL, 1, 'LSEV6VGU');
INSERT INTO `ob_kalman` VALUES (11252, '1745048678', '1', 0, NULL, NULL, 1, 'AI982JW1');
INSERT INTO `ob_kalman` VALUES (11253, '1745048678', '1', 0, NULL, NULL, 1, 'KQSO6J7R');
INSERT INTO `ob_kalman` VALUES (11254, '1745048678', '1', 0, NULL, NULL, 1, 'IOR4OCWV');
INSERT INTO `ob_kalman` VALUES (11255, '1745048678', '1', 0, NULL, NULL, 1, '39Y5WBA8');
INSERT INTO `ob_kalman` VALUES (11256, '1745048678', '1', 0, NULL, NULL, 1, 'I619SH7Y');
INSERT INTO `ob_kalman` VALUES (11257, '1745048678', '1', 0, NULL, NULL, 1, 'O2GE9K0T');
INSERT INTO `ob_kalman` VALUES (11258, '1745048678', '1', 0, NULL, NULL, 1, 'TAQKFJO1');
INSERT INTO `ob_kalman` VALUES (11259, '1745048678', '1', 0, NULL, NULL, 1, 'BU32OIY7');
INSERT INTO `ob_kalman` VALUES (11260, '1745048678', '1', 0, NULL, NULL, 1, 'O0BK3OJK');
INSERT INTO `ob_kalman` VALUES (11261, '1745048678', '1', 0, NULL, NULL, 1, '43RBNKVB');
INSERT INTO `ob_kalman` VALUES (11262, '1745048678', '1', 0, NULL, NULL, 1, '6PG63USY');
INSERT INTO `ob_kalman` VALUES (11263, '1745048678', '1', 0, NULL, NULL, 1, 'I0YW31VY');
INSERT INTO `ob_kalman` VALUES (11264, '1745048678', '1', 0, NULL, NULL, 1, 'W5LNT258');
INSERT INTO `ob_kalman` VALUES (11265, '1745048678', '1', 0, NULL, NULL, 1, 'D18OYLF7');
INSERT INTO `ob_kalman` VALUES (11266, '1745048678', '1', 0, NULL, NULL, 1, 'BQB57MVH');
INSERT INTO `ob_kalman` VALUES (11267, '1745048678', '1', 0, NULL, NULL, 1, 'PXSAAU3G');
INSERT INTO `ob_kalman` VALUES (11268, '1745048678', '1', 0, NULL, NULL, 1, 'O72V1VWO');
INSERT INTO `ob_kalman` VALUES (11269, '1745048678', '1', 0, NULL, NULL, 1, 'ROJ5P05V');
INSERT INTO `ob_kalman` VALUES (11270, '1745048678', '1', 0, NULL, NULL, 1, 'POJCKKBQ');
INSERT INTO `ob_kalman` VALUES (11271, '1745048678', '1', 0, NULL, NULL, 1, '2GMLH9LJ');
INSERT INTO `ob_kalman` VALUES (11272, '1745048678', '1', 0, NULL, NULL, 1, 'EL0MKTHB');
INSERT INTO `ob_kalman` VALUES (11273, '1745048678', '1', 0, NULL, NULL, 1, 'GH9SXNS9');
INSERT INTO `ob_kalman` VALUES (11274, '1745048678', '1', 0, NULL, NULL, 1, '95V6OPBA');
INSERT INTO `ob_kalman` VALUES (11275, '1745048678', '1', 0, NULL, NULL, 1, 'LESIJXML');
INSERT INTO `ob_kalman` VALUES (11276, '1745048678', '1', 0, NULL, NULL, 1, '3GIF5PVA');
INSERT INTO `ob_kalman` VALUES (11277, '1745048678', '1', 0, NULL, NULL, 1, 'I4U1IQBJ');
INSERT INTO `ob_kalman` VALUES (11278, '1745048678', '1', 0, NULL, NULL, 1, 'NTRQ8UPV');
INSERT INTO `ob_kalman` VALUES (11279, '1745048678', '1', 0, NULL, NULL, 1, 'AKVERMFA');
INSERT INTO `ob_kalman` VALUES (11280, '1745048678', '1', 0, NULL, NULL, 1, 'CVLKVFDA');
INSERT INTO `ob_kalman` VALUES (11281, '1745048678', '1', 0, NULL, NULL, 1, '3OYCP6EU');
INSERT INTO `ob_kalman` VALUES (11282, '1745048678', '1', 0, NULL, NULL, 1, 'AORJF6PV');
INSERT INTO `ob_kalman` VALUES (11283, '1745048678', '1', 0, NULL, NULL, 1, '8KISGOTO');
INSERT INTO `ob_kalman` VALUES (11284, '1745048678', '1', 0, NULL, NULL, 1, 'DFB9EKPC');
INSERT INTO `ob_kalman` VALUES (11285, '1745048678', '1', 0, NULL, NULL, 1, 'TDPSOF59');
INSERT INTO `ob_kalman` VALUES (11286, '1745048678', '1', 0, NULL, NULL, 1, '6BM1RIOF');
INSERT INTO `ob_kalman` VALUES (11287, '1745048678', '1', 0, NULL, NULL, 1, 'RGWLAXN2');
INSERT INTO `ob_kalman` VALUES (11288, '1745048678', '1', 0, NULL, NULL, 1, 'IF4ARJG4');
INSERT INTO `ob_kalman` VALUES (11289, '1745048678', '1', 0, NULL, NULL, 1, 'LARV1GSW');
INSERT INTO `ob_kalman` VALUES (11290, '1745048678', '1', 0, NULL, NULL, 1, '16ADFG3O');
INSERT INTO `ob_kalman` VALUES (11291, '1745048678', '1', 0, NULL, NULL, 1, 'FEEMOV58');
INSERT INTO `ob_kalman` VALUES (11292, '1745048678', '1', 0, NULL, NULL, 1, 'N196SPW9');
INSERT INTO `ob_kalman` VALUES (11293, '1745048678', '1', 0, NULL, NULL, 1, 'IRCO0PKN');
INSERT INTO `ob_kalman` VALUES (11294, '1745048678', '1', 0, NULL, NULL, 1, 'EDEI319M');
INSERT INTO `ob_kalman` VALUES (11295, '1745048678', '1', 0, NULL, NULL, 1, 'TVN1R49G');
INSERT INTO `ob_kalman` VALUES (11296, '1745048678', '1', 0, NULL, NULL, 1, '3FRURRIF');
INSERT INTO `ob_kalman` VALUES (11297, '1745048678', '1', 0, NULL, NULL, 1, 'F6M5MNVW');
INSERT INTO `ob_kalman` VALUES (11298, '1745048678', '1', 0, NULL, NULL, 1, 'E34E6OVN');
INSERT INTO `ob_kalman` VALUES (11299, '1745048678', '1', 0, NULL, NULL, 1, 'IO085YP6');
INSERT INTO `ob_kalman` VALUES (11300, '1745048678', '1', 0, NULL, NULL, 1, 'MVBOW8DD');
INSERT INTO `ob_kalman` VALUES (11301, '1745048678', '1', 0, NULL, NULL, 1, '3LNHA89H');
INSERT INTO `ob_kalman` VALUES (11302, '1745048678', '1', 0, NULL, NULL, 1, 'N9YR9GJN');
INSERT INTO `ob_kalman` VALUES (11303, '1745048678', '1', 0, NULL, NULL, 1, 'NO3HYSBG');
INSERT INTO `ob_kalman` VALUES (11304, '1745048678', '1', 0, NULL, NULL, 1, 'YQ1O6YU3');
INSERT INTO `ob_kalman` VALUES (11305, '1745048678', '1', 0, NULL, NULL, 1, 'KPQL0HXJ');
INSERT INTO `ob_kalman` VALUES (11306, '1745048678', '1', 0, NULL, NULL, 1, '3RB7OP5O');
INSERT INTO `ob_kalman` VALUES (11307, '1745048678', '1', 0, NULL, NULL, 1, 'R1JJY1PG');
INSERT INTO `ob_kalman` VALUES (11308, '1745048678', '1', 0, NULL, NULL, 1, 'UGF7OIOP');
INSERT INTO `ob_kalman` VALUES (11309, '1745048678', '1', 0, NULL, NULL, 1, 'UWBW3QCN');
INSERT INTO `ob_kalman` VALUES (11310, '1745048678', '1', 0, NULL, NULL, 1, 'YDBIK7WM');
INSERT INTO `ob_kalman` VALUES (11311, '1745048678', '1', 0, NULL, NULL, 1, 'OOVKSVLB');
INSERT INTO `ob_kalman` VALUES (11312, '1745048678', '1', 0, NULL, NULL, 1, '483RUDWO');
INSERT INTO `ob_kalman` VALUES (11313, '1745048678', '1', 0, NULL, NULL, 1, 'R76XI70U');
INSERT INTO `ob_kalman` VALUES (11314, '1745048678', '1', 0, NULL, NULL, 1, 'OC87K5I0');
INSERT INTO `ob_kalman` VALUES (11315, '1745048678', '1', 0, NULL, NULL, 1, 'IL6IYDLS');
INSERT INTO `ob_kalman` VALUES (11316, '1745048678', '1', 0, NULL, NULL, 1, 'K3OP742C');
INSERT INTO `ob_kalman` VALUES (11317, '1745048678', '1', 0, NULL, NULL, 1, 'NUXMYDYG');
INSERT INTO `ob_kalman` VALUES (11318, '1745048678', '1', 0, NULL, NULL, 1, 'B0O6TSIY');
INSERT INTO `ob_kalman` VALUES (11319, '1745048678', '1', 0, NULL, NULL, 1, 'PXC5R1UK');
INSERT INTO `ob_kalman` VALUES (11320, '1745048678', '1', 0, NULL, NULL, 1, 'M5R75P5S');
INSERT INTO `ob_kalman` VALUES (11321, '1745048678', '1', 0, NULL, NULL, 1, 'VDFWXOKD');
INSERT INTO `ob_kalman` VALUES (11322, '1745048678', '1', 0, NULL, NULL, 1, 'WMAXWJ5T');
INSERT INTO `ob_kalman` VALUES (11323, '1745048678', '1', 0, NULL, NULL, 1, 'LJLVEBA2');
INSERT INTO `ob_kalman` VALUES (11324, '1745048678', '1', 0, NULL, NULL, 1, '9SGYV58R');
INSERT INTO `ob_kalman` VALUES (11325, '1745048678', '1', 0, NULL, NULL, 1, 'X992FNIE');
INSERT INTO `ob_kalman` VALUES (11326, '1745048678', '1', 0, NULL, NULL, 1, '5DBMF96X');
INSERT INTO `ob_kalman` VALUES (11327, '1745048678', '1', 0, NULL, NULL, 1, 'WWK6W89B');
INSERT INTO `ob_kalman` VALUES (11328, '1745048678', '1', 0, NULL, NULL, 1, 'K7T4GFG1');
INSERT INTO `ob_kalman` VALUES (11329, '1745048678', '1', 0, NULL, NULL, 1, 'YOOF673Y');
INSERT INTO `ob_kalman` VALUES (11330, '1745048678', '1', 0, NULL, NULL, 1, 'EFREHWFX');
INSERT INTO `ob_kalman` VALUES (11331, '1745048678', '1', 0, NULL, NULL, 1, 'G2SSGLBF');
INSERT INTO `ob_kalman` VALUES (11332, '1745048678', '1', 0, NULL, NULL, 1, '99OJU9Y5');
INSERT INTO `ob_kalman` VALUES (11333, '1745048678', '1', 0, NULL, NULL, 1, 'MQ2S818Y');
INSERT INTO `ob_kalman` VALUES (11334, '1745048678', '1', 0, NULL, NULL, 1, 'V0QR4INO');
INSERT INTO `ob_kalman` VALUES (11335, '1745048678', '1', 0, NULL, NULL, 1, 'EJ81U2HH');
INSERT INTO `ob_kalman` VALUES (11336, '1745048678', '1', 0, NULL, NULL, 1, 'UCRY2P73');
INSERT INTO `ob_kalman` VALUES (11337, '1745048678', '1', 0, NULL, NULL, 1, '88A6QTSU');
INSERT INTO `ob_kalman` VALUES (11338, '1745048678', '1', 0, NULL, NULL, 1, '4YF0U5WD');
INSERT INTO `ob_kalman` VALUES (11339, '1745048678', '1', 0, NULL, NULL, 1, 'X0MI9JDV');
INSERT INTO `ob_kalman` VALUES (11340, '1745048678', '1', 0, NULL, NULL, 1, 'O0WK8C6V');
INSERT INTO `ob_kalman` VALUES (11341, '1745048678', '1', 0, NULL, NULL, 1, '7WJ6O47L');
INSERT INTO `ob_kalman` VALUES (11342, '1745048678', '1', 0, NULL, NULL, 1, 'EUEM5K9Y');
INSERT INTO `ob_kalman` VALUES (11343, '1745048678', '1', 0, NULL, NULL, 1, 'SHDWFKMY');
INSERT INTO `ob_kalman` VALUES (11344, '1745048678', '1', 0, NULL, NULL, 1, '1NM1VQNO');
INSERT INTO `ob_kalman` VALUES (11345, '1745048678', '1', 0, NULL, NULL, 1, 'N197RE4B');
INSERT INTO `ob_kalman` VALUES (11346, '1745048678', '1', 0, NULL, NULL, 1, 'RMMB88SE');
INSERT INTO `ob_kalman` VALUES (11347, '1745048678', '1', 0, NULL, NULL, 1, 'LJ178FUK');
INSERT INTO `ob_kalman` VALUES (11348, '1745048678', '1', 0, NULL, NULL, 1, 'U36T6KLT');
INSERT INTO `ob_kalman` VALUES (11349, '1745048678', '1', 0, NULL, NULL, 1, 'S1VWNJKS');
INSERT INTO `ob_kalman` VALUES (11350, '1745048678', '1', 0, NULL, NULL, 1, 'QUUVQJVK');
INSERT INTO `ob_kalman` VALUES (11351, '1745048678', '1', 0, NULL, NULL, 1, 'D2CAO2IP');
INSERT INTO `ob_kalman` VALUES (11352, '1745048678', '1', 0, NULL, NULL, 1, 'OLRS0DIA');
INSERT INTO `ob_kalman` VALUES (11353, '1745048678', '1', 0, NULL, NULL, 1, 'EL3OAU7M');
INSERT INTO `ob_kalman` VALUES (11354, '1745048678', '1', 0, NULL, NULL, 1, '9EBOKLQ0');
INSERT INTO `ob_kalman` VALUES (11355, '1745048678', '1', 0, NULL, NULL, 1, 'LTOOLC4B');
INSERT INTO `ob_kalman` VALUES (11356, '1745048678', '1', 0, NULL, NULL, 1, '18NEXDPE');
INSERT INTO `ob_kalman` VALUES (11357, '1745048678', '1', 0, NULL, NULL, 1, 'SJDEPQAR');
INSERT INTO `ob_kalman` VALUES (11358, '1745048678', '1', 0, NULL, NULL, 1, 'GGMDLXED');
INSERT INTO `ob_kalman` VALUES (11359, '1745048678', '1', 0, NULL, NULL, 1, 'IT8WYYYY');
INSERT INTO `ob_kalman` VALUES (11360, '1745048678', '1', 0, NULL, NULL, 1, 'P8O5OHF2');
INSERT INTO `ob_kalman` VALUES (11361, '1745048678', '1', 0, NULL, NULL, 1, '3H4K693T');
INSERT INTO `ob_kalman` VALUES (11362, '1745048678', '1', 0, NULL, NULL, 1, 'TSKWE2FW');
INSERT INTO `ob_kalman` VALUES (11363, '1745048678', '1', 0, NULL, NULL, 1, '4F98NWHK');
INSERT INTO `ob_kalman` VALUES (11364, '1745048678', '1', 0, NULL, NULL, 1, 'TEYYB780');
INSERT INTO `ob_kalman` VALUES (11365, '1745048678', '1', 0, NULL, NULL, 1, '74VBFH9L');
INSERT INTO `ob_kalman` VALUES (11366, '1745048678', '1', 0, NULL, NULL, 1, 'ROFOQ0AO');
INSERT INTO `ob_kalman` VALUES (11367, '1745048678', '1', 0, NULL, NULL, 1, 'ICLPB7PX');
INSERT INTO `ob_kalman` VALUES (11368, '1745048678', '1', 0, NULL, NULL, 1, 'WRR822O0');
INSERT INTO `ob_kalman` VALUES (11369, '1745048678', '1', 0, NULL, NULL, 1, 'E5SF5HQN');
INSERT INTO `ob_kalman` VALUES (11370, '1745048678', '1', 0, NULL, NULL, 1, '306VXUTI');
INSERT INTO `ob_kalman` VALUES (11371, '1745048678', '1', 0, NULL, NULL, 1, 'GKHQ66N8');
INSERT INTO `ob_kalman` VALUES (11372, '1745048678', '1', 0, NULL, NULL, 1, 'JOKDQ2GD');
INSERT INTO `ob_kalman` VALUES (11373, '1745048678', '1', 0, NULL, NULL, 1, '9VTR1596');
INSERT INTO `ob_kalman` VALUES (11374, '1745048678', '1', 0, NULL, NULL, 1, '4NHOD9R3');
INSERT INTO `ob_kalman` VALUES (11375, '1745048678', '1', 0, NULL, NULL, 1, '153R9YWH');
INSERT INTO `ob_kalman` VALUES (11376, '1745048678', '1', 0, NULL, NULL, 1, 'LKUX6I9T');
INSERT INTO `ob_kalman` VALUES (11377, '1745048678', '1', 0, NULL, NULL, 1, 'YFMQODRP');
INSERT INTO `ob_kalman` VALUES (11378, '1745048678', '1', 0, NULL, NULL, 1, '3DDYGU2D');
INSERT INTO `ob_kalman` VALUES (11379, '1745048678', '1', 0, NULL, NULL, 1, 'W6T4HUVX');
INSERT INTO `ob_kalman` VALUES (11380, '1745048678', '1', 0, NULL, NULL, 1, 'BGWYXKPJ');
INSERT INTO `ob_kalman` VALUES (11381, '1745048678', '1', 0, NULL, NULL, 1, 'DJLTCPVW');
INSERT INTO `ob_kalman` VALUES (11382, '1745048678', '1', 0, NULL, NULL, 1, 'HOS53K3W');
INSERT INTO `ob_kalman` VALUES (11383, '1745048678', '1', 0, NULL, NULL, 1, '0WEECW0N');
INSERT INTO `ob_kalman` VALUES (11384, '1745048678', '1', 0, NULL, NULL, 1, 'OU602KWW');
INSERT INTO `ob_kalman` VALUES (11385, '1745048678', '1', 0, NULL, NULL, 1, 'FFFR8J4N');
INSERT INTO `ob_kalman` VALUES (11386, '1745048678', '1', 0, NULL, NULL, 1, 'I50R3J2M');
INSERT INTO `ob_kalman` VALUES (11387, '1745048678', '1', 0, NULL, NULL, 1, '6Q5VKRL7');
INSERT INTO `ob_kalman` VALUES (11388, '1745048678', '1', 0, NULL, NULL, 1, '13GPRHH3');
INSERT INTO `ob_kalman` VALUES (11389, '1745048678', '1', 0, NULL, NULL, 1, 'VIQ362JP');
INSERT INTO `ob_kalman` VALUES (11390, '1745048678', '1', 0, NULL, NULL, 1, 'IJQNM3MG');
INSERT INTO `ob_kalman` VALUES (11391, '1745048678', '1', 0, NULL, NULL, 1, '5BX8S59G');
INSERT INTO `ob_kalman` VALUES (11392, '1745048678', '1', 0, NULL, NULL, 1, 'KJF3J8IY');
INSERT INTO `ob_kalman` VALUES (11393, '1745048678', '1', 0, NULL, NULL, 1, 'BF1NYQAO');
INSERT INTO `ob_kalman` VALUES (11394, '1745048678', '1', 0, NULL, NULL, 1, 'O5ALXG8K');
INSERT INTO `ob_kalman` VALUES (11395, '1745048678', '1', 0, NULL, NULL, 1, 'XT62VDGP');
INSERT INTO `ob_kalman` VALUES (11396, '1745048678', '1', 0, NULL, NULL, 1, '8XYQHRDL');
INSERT INTO `ob_kalman` VALUES (11397, '1745048678', '1', 0, NULL, NULL, 1, 'QEL5DI51');
INSERT INTO `ob_kalman` VALUES (11398, '1745048678', '1', 0, NULL, NULL, 1, 'UIIUOPQA');
INSERT INTO `ob_kalman` VALUES (11399, '1745048678', '1', 0, NULL, NULL, 1, 'WQBOU3HM');
INSERT INTO `ob_kalman` VALUES (11400, '1745048678', '1', 0, NULL, NULL, 1, '4CKY37LW');
INSERT INTO `ob_kalman` VALUES (11401, '1745048678', '1', 0, NULL, NULL, 1, 'NWRSYAG9');
INSERT INTO `ob_kalman` VALUES (11402, '1745048678', '1', 0, NULL, NULL, 1, 'RLIHUGGR');
INSERT INTO `ob_kalman` VALUES (11403, '1745048678', '1', 0, NULL, NULL, 1, 'LGTSTKV6');
INSERT INTO `ob_kalman` VALUES (11404, '1745048678', '1', 0, NULL, NULL, 1, 'TAYCSM66');
INSERT INTO `ob_kalman` VALUES (11405, '1745048678', '1', 0, NULL, NULL, 1, 'L7U4XBT0');
INSERT INTO `ob_kalman` VALUES (11406, '1745048678', '1', 0, NULL, NULL, 1, 'RQDA5D1O');
INSERT INTO `ob_kalman` VALUES (11407, '1745048678', '1', 0, NULL, NULL, 1, 'EM2EYU6Q');
INSERT INTO `ob_kalman` VALUES (11408, '1745048678', '1', 0, NULL, NULL, 1, 'AE8K6LQW');
INSERT INTO `ob_kalman` VALUES (11409, '1745048678', '1', 0, NULL, NULL, 1, 'M6E6O01E');
INSERT INTO `ob_kalman` VALUES (11410, '1745048678', '1', 0, NULL, NULL, 1, 'PWAW2DN2');
INSERT INTO `ob_kalman` VALUES (11411, '1745048678', '1', 0, NULL, NULL, 1, 'GSNFJ7NP');
INSERT INTO `ob_kalman` VALUES (11412, '1745048678', '1', 0, NULL, NULL, 1, 'WKN8V5LS');
INSERT INTO `ob_kalman` VALUES (11413, '1745048678', '1', 0, NULL, NULL, 1, 'CPE6GCIA');
INSERT INTO `ob_kalman` VALUES (11414, '1745048678', '1', 0, NULL, NULL, 1, 'R1K7RVOW');
INSERT INTO `ob_kalman` VALUES (11415, '1745048678', '1', 0, NULL, NULL, 1, 'HPX5YY1W');
INSERT INTO `ob_kalman` VALUES (11416, '1745048678', '1', 0, NULL, NULL, 1, '5Y3VFB3X');
INSERT INTO `ob_kalman` VALUES (11417, '1745048678', '1', 0, NULL, NULL, 1, 'PLQCMP9Y');
INSERT INTO `ob_kalman` VALUES (11418, '1745048678', '1', 0, NULL, NULL, 1, 'M9EWXKJU');
INSERT INTO `ob_kalman` VALUES (11419, '1745048678', '1', 0, NULL, NULL, 1, 'TXFWVMBB');
INSERT INTO `ob_kalman` VALUES (11420, '1745048678', '1', 0, NULL, NULL, 1, 'KO1S8GLO');
INSERT INTO `ob_kalman` VALUES (11421, '1745048678', '1', 0, NULL, NULL, 1, 'RVTIDG7F');
INSERT INTO `ob_kalman` VALUES (11422, '1745048678', '1', 0, NULL, NULL, 1, '3XMTX73B');
INSERT INTO `ob_kalman` VALUES (11423, '1745048678', '1', 0, NULL, NULL, 1, 'IQCS2CMM');
INSERT INTO `ob_kalman` VALUES (11424, '1745048678', '1', 0, NULL, NULL, 1, 'IAJ2DLWC');
INSERT INTO `ob_kalman` VALUES (11425, '1745048678', '1', 0, NULL, NULL, 1, 'TIPTGTNP');
INSERT INTO `ob_kalman` VALUES (11426, '1745048678', '1', 0, NULL, NULL, 1, '6HEQ6IAE');
INSERT INTO `ob_kalman` VALUES (11427, '1745048678', '1', 0, NULL, NULL, 1, '5NO2OD9B');
INSERT INTO `ob_kalman` VALUES (11428, '1745048678', '1', 0, NULL, NULL, 1, 'E18XO8OM');
INSERT INTO `ob_kalman` VALUES (11429, '1745048678', '1', 0, NULL, NULL, 1, '4WYRL7IU');
INSERT INTO `ob_kalman` VALUES (11430, '1745048678', '1', 0, NULL, NULL, 1, 'RD2E4V7M');
INSERT INTO `ob_kalman` VALUES (11431, '1745048678', '1', 0, NULL, NULL, 1, 'XN10WJRW');
INSERT INTO `ob_kalman` VALUES (11432, '1745048678', '1', 0, NULL, NULL, 1, '62G4W6PG');
INSERT INTO `ob_kalman` VALUES (11433, '1745048678', '1', 0, NULL, NULL, 1, 'Y54EE17W');
INSERT INTO `ob_kalman` VALUES (11434, '1745048678', '1', 0, NULL, NULL, 1, 'EYQBT5BG');
INSERT INTO `ob_kalman` VALUES (11435, '1745048678', '1', 0, NULL, NULL, 1, 'CL8U8X5X');
INSERT INTO `ob_kalman` VALUES (11436, '1745048678', '1', 0, NULL, NULL, 1, '1PKXWMGH');
INSERT INTO `ob_kalman` VALUES (11437, '1745048678', '1', 0, NULL, NULL, 1, 'PWOQ4RHA');
INSERT INTO `ob_kalman` VALUES (11438, '1745048678', '1', 0, NULL, NULL, 1, 'W2XQTOXJ');
INSERT INTO `ob_kalman` VALUES (11439, '1745048678', '1', 0, NULL, NULL, 1, 'WV7M64UK');
INSERT INTO `ob_kalman` VALUES (11440, '1745048678', '1', 0, NULL, NULL, 1, 'GIB2HRUH');
INSERT INTO `ob_kalman` VALUES (11441, '1745048678', '1', 0, NULL, NULL, 1, 'U7M35K6Q');
INSERT INTO `ob_kalman` VALUES (11442, '1745048678', '1', 0, NULL, NULL, 1, 'GR51NU9R');
INSERT INTO `ob_kalman` VALUES (11443, '1745048678', '1', 0, NULL, NULL, 1, '5VQVQXVF');
INSERT INTO `ob_kalman` VALUES (11444, '1745048678', '1', 0, NULL, NULL, 1, '152JEJ5G');
INSERT INTO `ob_kalman` VALUES (11445, '1745048678', '1', 0, NULL, NULL, 1, 'IBLU015M');
INSERT INTO `ob_kalman` VALUES (11446, '1745048678', '1', 0, NULL, NULL, 1, 'NJSIX7VP');
INSERT INTO `ob_kalman` VALUES (11447, '1745048678', '1', 0, NULL, NULL, 1, 'W1CD20LH');
INSERT INTO `ob_kalman` VALUES (11448, '1745048678', '1', 0, NULL, NULL, 1, 'DJ6TU7AO');
INSERT INTO `ob_kalman` VALUES (11449, '1745048678', '1', 0, NULL, NULL, 1, 'VENF4U2B');
INSERT INTO `ob_kalman` VALUES (11450, '1745048678', '1', 0, NULL, NULL, 1, 'UYLDGM6H');
INSERT INTO `ob_kalman` VALUES (11451, '1745048678', '1', 0, NULL, NULL, 1, 'TG2MESW8');
INSERT INTO `ob_kalman` VALUES (11452, '1745048678', '1', 0, NULL, NULL, 1, '07NL1L3B');
INSERT INTO `ob_kalman` VALUES (11453, '1745048678', '1', 0, NULL, NULL, 1, 'OBDUESKS');
INSERT INTO `ob_kalman` VALUES (11454, '1745048678', '1', 0, NULL, NULL, 1, 'G7TYVNGF');
INSERT INTO `ob_kalman` VALUES (11455, '1745048678', '1', 0, NULL, NULL, 1, 'S3QOU5S0');
INSERT INTO `ob_kalman` VALUES (11456, '1745048678', '1', 0, NULL, NULL, 1, 'RNQUG199');
INSERT INTO `ob_kalman` VALUES (11457, '1745048678', '1', 0, NULL, NULL, 1, '8LXUFTY0');
INSERT INTO `ob_kalman` VALUES (11458, '1745048678', '1', 0, NULL, NULL, 1, 'YP5XMLSP');
INSERT INTO `ob_kalman` VALUES (11459, '1745048678', '1', 0, NULL, NULL, 1, '6O5SVC3N');
INSERT INTO `ob_kalman` VALUES (11460, '1745048678', '1', 0, NULL, NULL, 1, 'HPW0JDG7');
INSERT INTO `ob_kalman` VALUES (11461, '1745048678', '1', 0, NULL, NULL, 1, 'XTGGS577');
INSERT INTO `ob_kalman` VALUES (11462, '1745048678', '1', 0, NULL, NULL, 1, 'O07EBYD3');
INSERT INTO `ob_kalman` VALUES (11463, '1745048678', '1', 0, NULL, NULL, 1, 'TOEQC3M1');
INSERT INTO `ob_kalman` VALUES (11464, '1745048678', '1', 0, NULL, NULL, 1, '7VKFPCMP');
INSERT INTO `ob_kalman` VALUES (11465, '1745048678', '1', 0, NULL, NULL, 1, 'CBIO6BFJ');
INSERT INTO `ob_kalman` VALUES (11466, '1745048678', '1', 0, NULL, NULL, 1, 'WO1U1S2W');
INSERT INTO `ob_kalman` VALUES (11467, '1745048678', '1', 0, NULL, NULL, 1, 'MKV6HS4T');
INSERT INTO `ob_kalman` VALUES (11468, '1745048678', '1', 0, NULL, NULL, 1, '4PXAVGCG');
INSERT INTO `ob_kalman` VALUES (11469, '1745048678', '1', 0, NULL, NULL, 1, '3CMLFJGB');
INSERT INTO `ob_kalman` VALUES (11470, '1745048678', '1', 0, NULL, NULL, 1, 'VL1K287U');
INSERT INTO `ob_kalman` VALUES (11471, '1745048678', '1', 0, NULL, NULL, 1, 'YITUUWRG');
INSERT INTO `ob_kalman` VALUES (11472, '1745048678', '1', 0, NULL, NULL, 1, 'V6RO227L');
INSERT INTO `ob_kalman` VALUES (11473, '1745048678', '1', 0, NULL, NULL, 1, 'WO0S9F8I');
INSERT INTO `ob_kalman` VALUES (11474, '1745048678', '1', 0, NULL, NULL, 1, '1KR80WIL');
INSERT INTO `ob_kalman` VALUES (11475, '1745048678', '1', 0, NULL, NULL, 1, '55NNJW9M');
INSERT INTO `ob_kalman` VALUES (11476, '1745048678', '1', 0, NULL, NULL, 1, '8WG6ESEN');
INSERT INTO `ob_kalman` VALUES (11477, '1745048678', '1', 0, NULL, NULL, 1, '6WGCA8QE');
INSERT INTO `ob_kalman` VALUES (11478, '1745048678', '1', 0, NULL, NULL, 1, '8I32FBRP');
INSERT INTO `ob_kalman` VALUES (11479, '1745048678', '1', 0, NULL, NULL, 1, 'P23U2BLN');
INSERT INTO `ob_kalman` VALUES (11480, '1745048678', '1', 0, NULL, NULL, 1, 'JYJKHEJI');
INSERT INTO `ob_kalman` VALUES (11481, '1745048678', '1', 0, NULL, NULL, 1, 'RIDJWLXC');
INSERT INTO `ob_kalman` VALUES (11482, '1745048678', '1', 0, NULL, NULL, 1, 'U1NNOBAP');
INSERT INTO `ob_kalman` VALUES (11483, '1745048678', '1', 0, NULL, NULL, 1, 'MNKK675O');
INSERT INTO `ob_kalman` VALUES (11484, '1745048678', '1', 0, NULL, NULL, 1, '47XECGQI');
INSERT INTO `ob_kalman` VALUES (11485, '1745048678', '1', 0, NULL, NULL, 1, 'XP1G8CB9');
INSERT INTO `ob_kalman` VALUES (11486, '1745048678', '1', 0, NULL, NULL, 1, '6SUFNM1L');
INSERT INTO `ob_kalman` VALUES (11487, '1745048678', '1', 0, NULL, NULL, 1, 'IS8LDFEO');
INSERT INTO `ob_kalman` VALUES (11488, '1745048678', '1', 0, NULL, NULL, 1, '9U4EKVTJ');
INSERT INTO `ob_kalman` VALUES (11489, '1745048678', '1', 0, NULL, NULL, 1, '79HJAN5T');
INSERT INTO `ob_kalman` VALUES (11490, '1745048678', '1', 0, NULL, NULL, 1, 'OHODL5PI');
INSERT INTO `ob_kalman` VALUES (11491, '1745048678', '1', 0, NULL, NULL, 1, 'XRPXD83F');
INSERT INTO `ob_kalman` VALUES (11492, '1745048678', '1', 0, NULL, NULL, 1, 'GUX3GHDA');
INSERT INTO `ob_kalman` VALUES (11493, '1745048678', '1', 0, NULL, NULL, 1, '7C7TRMXO');
INSERT INTO `ob_kalman` VALUES (11494, '1745048678', '1', 0, NULL, NULL, 1, 'FM6UP4H4');
INSERT INTO `ob_kalman` VALUES (11495, '1745048678', '1', 0, NULL, NULL, 1, '81B2EOOP');
INSERT INTO `ob_kalman` VALUES (11496, '1745048678', '1', 0, NULL, NULL, 1, '1TNLJ78U');
INSERT INTO `ob_kalman` VALUES (11497, '1745048678', '1', 0, NULL, NULL, 1, 'JWQNVSAS');
INSERT INTO `ob_kalman` VALUES (11498, '1745048678', '1', 0, NULL, NULL, 1, 'COQDAKS1');
INSERT INTO `ob_kalman` VALUES (11499, '1745048678', '1', 0, NULL, NULL, 1, 'KMGF3AX9');
INSERT INTO `ob_kalman` VALUES (11500, '1745048678', '1', 0, NULL, NULL, 1, 'FGSORN87');
INSERT INTO `ob_kalman` VALUES (11501, '1745048678', '1', 0, NULL, NULL, 1, 'FTUFRKXT');
INSERT INTO `ob_kalman` VALUES (11502, '1745048678', '1', 0, NULL, NULL, 1, '58HPGA76');
INSERT INTO `ob_kalman` VALUES (11503, '1745048678', '1', 0, NULL, NULL, 1, '9QFE6NVP');
INSERT INTO `ob_kalman` VALUES (11504, '1745048678', '1', 0, NULL, NULL, 1, 'U4NI09RS');
INSERT INTO `ob_kalman` VALUES (11505, '1745048678', '1', 0, NULL, NULL, 1, 'T5YPGOUT');
INSERT INTO `ob_kalman` VALUES (11506, '1745048678', '1', 0, NULL, NULL, 1, 'CB0N2O23');
INSERT INTO `ob_kalman` VALUES (11507, '1745048678', '1', 0, NULL, NULL, 1, 'ONDITF2E');
INSERT INTO `ob_kalman` VALUES (11508, '1745048678', '1', 0, NULL, NULL, 1, '7HCDSPBB');
INSERT INTO `ob_kalman` VALUES (11509, '1745048678', '1', 0, NULL, NULL, 1, '4T1BI5LT');
INSERT INTO `ob_kalman` VALUES (11510, '1745048678', '1', 0, NULL, NULL, 1, 'O7XPX4U6');
INSERT INTO `ob_kalman` VALUES (11511, '1745048678', '1', 0, NULL, NULL, 1, '9WIJW9QD');
INSERT INTO `ob_kalman` VALUES (11512, '1745048678', '1', 0, NULL, NULL, 1, '9QYPA1IJ');
INSERT INTO `ob_kalman` VALUES (11513, '1745048678', '1', 0, NULL, NULL, 1, '4RSGH2NX');
INSERT INTO `ob_kalman` VALUES (11514, '1745048678', '1', 0, NULL, NULL, 1, '8NYGJDII');
INSERT INTO `ob_kalman` VALUES (11515, '1745048678', '1', 0, NULL, NULL, 1, 'OD43LLFD');
INSERT INTO `ob_kalman` VALUES (11516, '1745048678', '1', 0, NULL, NULL, 1, 'OCO99UPN');
INSERT INTO `ob_kalman` VALUES (11517, '1745048678', '1', 0, NULL, NULL, 1, '30HRBJ7F');
INSERT INTO `ob_kalman` VALUES (11518, '1745048678', '1', 0, NULL, NULL, 1, 'UK8EAO00');
INSERT INTO `ob_kalman` VALUES (11519, '1745048678', '1', 0, NULL, NULL, 1, '1S4G3XL9');
INSERT INTO `ob_kalman` VALUES (11520, '1745048678', '1', 0, NULL, NULL, 1, '353LC8VE');
INSERT INTO `ob_kalman` VALUES (11521, '1745048678', '1', 0, NULL, NULL, 1, '3232PYTL');
INSERT INTO `ob_kalman` VALUES (11522, '1745048678', '1', 0, NULL, NULL, 1, 'H8IC4HOJ');
INSERT INTO `ob_kalman` VALUES (11523, '1745048678', '1', 0, NULL, NULL, 1, '3MYUM1RB');
INSERT INTO `ob_kalman` VALUES (11524, '1745048678', '1', 0, NULL, NULL, 1, 'LXSY8NOA');
INSERT INTO `ob_kalman` VALUES (11525, '1745048678', '1', 0, NULL, NULL, 1, 'G9QCWBWJ');
INSERT INTO `ob_kalman` VALUES (11526, '1745048678', '1', 0, NULL, NULL, 1, 'DHY0GOV0');
INSERT INTO `ob_kalman` VALUES (11527, '1745048678', '1', 0, NULL, NULL, 1, 'I34TJCN9');
INSERT INTO `ob_kalman` VALUES (11528, '1745048678', '1', 0, NULL, NULL, 1, 'DI1OVLRE');
INSERT INTO `ob_kalman` VALUES (11529, '1745048678', '1', 0, NULL, NULL, 1, '1C3XCB23');
INSERT INTO `ob_kalman` VALUES (11530, '1745048678', '1', 0, NULL, NULL, 1, 'JHPJQ21P');
INSERT INTO `ob_kalman` VALUES (11531, '1745048678', '1', 0, NULL, NULL, 1, '63XFBEYI');
INSERT INTO `ob_kalman` VALUES (11532, '1745048678', '1', 0, NULL, NULL, 1, 'UA0L3DJD');
INSERT INTO `ob_kalman` VALUES (11533, '1745048678', '1', 0, NULL, NULL, 1, '5GNYTQ9A');
INSERT INTO `ob_kalman` VALUES (11534, '1745048678', '1', 0, NULL, NULL, 1, 'UBO3TO03');
INSERT INTO `ob_kalman` VALUES (11535, '1745048678', '1', 0, NULL, NULL, 1, 'AC1784Q1');
INSERT INTO `ob_kalman` VALUES (11536, '1745048678', '1', 0, NULL, NULL, 1, 'DVLYV72G');
INSERT INTO `ob_kalman` VALUES (11537, '1745048678', '1', 0, NULL, NULL, 1, 'J8F047H0');
INSERT INTO `ob_kalman` VALUES (11538, '1745048678', '1', 0, NULL, NULL, 1, 'EAV3K27D');
INSERT INTO `ob_kalman` VALUES (11539, '1745048678', '1', 0, NULL, NULL, 1, '3JIT22KV');
INSERT INTO `ob_kalman` VALUES (11540, '1745048678', '1', 0, NULL, NULL, 1, '0Q45518J');
INSERT INTO `ob_kalman` VALUES (11541, '1745048678', '1', 0, NULL, NULL, 1, '0SP2NFIN');
INSERT INTO `ob_kalman` VALUES (11542, '1745048678', '1', 0, NULL, NULL, 1, 'FVW15SIR');
INSERT INTO `ob_kalman` VALUES (11543, '1745048678', '1', 0, NULL, NULL, 1, '63XQIOVR');
INSERT INTO `ob_kalman` VALUES (11544, '1745048678', '1', 0, NULL, NULL, 1, 'G6MVG1HC');
INSERT INTO `ob_kalman` VALUES (11545, '1745048678', '1', 0, NULL, NULL, 1, 'D4V4NCIR');
INSERT INTO `ob_kalman` VALUES (11546, '1745048678', '1', 0, NULL, NULL, 1, 'AFG7GNDR');
INSERT INTO `ob_kalman` VALUES (11547, '1745048678', '1', 0, NULL, NULL, 1, 'DJXG3I5O');
INSERT INTO `ob_kalman` VALUES (11548, '1745048678', '1', 0, NULL, NULL, 1, 'AMAAATGE');
INSERT INTO `ob_kalman` VALUES (11549, '1745048678', '1', 0, NULL, NULL, 1, 'ICIRR3C6');
INSERT INTO `ob_kalman` VALUES (11550, '1745048678', '1', 0, NULL, NULL, 1, '476KUBWD');
INSERT INTO `ob_kalman` VALUES (11551, '1745048678', '1', 0, NULL, NULL, 1, 'RY54J5UF');
INSERT INTO `ob_kalman` VALUES (11552, '1745048678', '1', 0, NULL, NULL, 1, 'P38XDANG');
INSERT INTO `ob_kalman` VALUES (11553, '1745048678', '1', 0, NULL, NULL, 1, '0GCHR4X4');
INSERT INTO `ob_kalman` VALUES (11554, '1745048678', '1', 0, NULL, NULL, 1, 'ICWS99IW');
INSERT INTO `ob_kalman` VALUES (11555, '1745048678', '1', 0, NULL, NULL, 1, 'LF4ODA40');
INSERT INTO `ob_kalman` VALUES (11556, '1745048678', '1', 0, NULL, NULL, 1, '8B4MYXMP');
INSERT INTO `ob_kalman` VALUES (11557, '1745048678', '1', 0, NULL, NULL, 1, '4NO54W41');
INSERT INTO `ob_kalman` VALUES (11558, '1745048678', '1', 0, NULL, NULL, 1, 'VAJKC4PN');
INSERT INTO `ob_kalman` VALUES (11559, '1745048678', '1', 0, NULL, NULL, 1, 'Q1I2KD0U');
INSERT INTO `ob_kalman` VALUES (11560, '1745048678', '1', 0, NULL, NULL, 1, 'T0X652GG');
INSERT INTO `ob_kalman` VALUES (11561, '1745048678', '1', 0, NULL, NULL, 1, 'O33M4HSS');
INSERT INTO `ob_kalman` VALUES (11562, '1745048678', '1', 0, NULL, NULL, 1, '35DR0JAB');
INSERT INTO `ob_kalman` VALUES (11563, '1745048678', '1', 0, NULL, NULL, 1, 'WVLEDD6A');
INSERT INTO `ob_kalman` VALUES (11564, '1745048678', '1', 0, NULL, NULL, 1, 'MI2GRLQK');
INSERT INTO `ob_kalman` VALUES (11565, '1745048678', '1', 0, NULL, NULL, 1, 'YTF8KXRT');
INSERT INTO `ob_kalman` VALUES (11566, '1745048678', '1', 0, NULL, NULL, 1, 'YL2TH5GM');
INSERT INTO `ob_kalman` VALUES (11567, '1745048678', '1', 0, NULL, NULL, 1, 'SPN2UHFK');
INSERT INTO `ob_kalman` VALUES (11568, '1745048678', '1', 0, NULL, NULL, 1, 'KONRHJLS');
INSERT INTO `ob_kalman` VALUES (11569, '1745048678', '1', 0, NULL, NULL, 1, 'BEOUMAYN');
INSERT INTO `ob_kalman` VALUES (11570, '1745048678', '1', 0, NULL, NULL, 1, '7S1JXPHQ');
INSERT INTO `ob_kalman` VALUES (11571, '1745048678', '1', 0, NULL, NULL, 1, '3OVI0B0P');
INSERT INTO `ob_kalman` VALUES (11572, '1745048678', '1', 0, NULL, NULL, 1, '29TMKMA3');
INSERT INTO `ob_kalman` VALUES (11573, '1745048678', '1', 0, NULL, NULL, 1, '25GUCAPK');
INSERT INTO `ob_kalman` VALUES (11574, '1745048678', '1', 0, NULL, NULL, 1, 'PGE17PE0');
INSERT INTO `ob_kalman` VALUES (11575, '1745048678', '1', 0, NULL, NULL, 1, 'A1J31LGX');
INSERT INTO `ob_kalman` VALUES (11576, '1745048678', '1', 0, NULL, NULL, 1, 'VBKNRXGN');
INSERT INTO `ob_kalman` VALUES (11577, '1745048678', '1', 0, NULL, NULL, 1, 'PGNSG24P');
INSERT INTO `ob_kalman` VALUES (11578, '1745048678', '1', 0, NULL, NULL, 1, 'TAM9FWML');
INSERT INTO `ob_kalman` VALUES (11579, '1745048678', '1', 0, NULL, NULL, 1, 'RACW6P5H');
INSERT INTO `ob_kalman` VALUES (11580, '1745048678', '1', 0, NULL, NULL, 1, 'MXPNOCGV');
INSERT INTO `ob_kalman` VALUES (11581, '1745048678', '1', 0, NULL, NULL, 1, '3XWIWO0N');
INSERT INTO `ob_kalman` VALUES (11582, '1745048678', '1', 0, NULL, NULL, 1, '5A70XO3G');
INSERT INTO `ob_kalman` VALUES (11583, '1745048678', '1', 0, NULL, NULL, 1, 'KH0N80DI');
INSERT INTO `ob_kalman` VALUES (11584, '1745048678', '1', 0, NULL, NULL, 1, 'ILJAXO0S');
INSERT INTO `ob_kalman` VALUES (11585, '1745048678', '1', 0, NULL, NULL, 1, 'N3TB7NY3');
INSERT INTO `ob_kalman` VALUES (11586, '1745048678', '1', 0, NULL, NULL, 1, '844K6MDT');
INSERT INTO `ob_kalman` VALUES (11587, '1745048678', '1', 0, NULL, NULL, 1, '6134WKP8');
INSERT INTO `ob_kalman` VALUES (11588, '1745048678', '1', 0, NULL, NULL, 1, 'QPSFPGXO');
INSERT INTO `ob_kalman` VALUES (11589, '1745048678', '1', 0, NULL, NULL, 1, 'XREAQF26');
INSERT INTO `ob_kalman` VALUES (11590, '1745048678', '1', 0, NULL, NULL, 1, 'DCROAJ7M');
INSERT INTO `ob_kalman` VALUES (11591, '1745048678', '1', 0, NULL, NULL, 1, 'F09BIC5N');
INSERT INTO `ob_kalman` VALUES (11592, '1745048678', '1', 0, NULL, NULL, 1, 'AIJOI0S1');
INSERT INTO `ob_kalman` VALUES (11593, '1745048678', '1', 0, NULL, NULL, 1, 'BXLK5O0Y');
INSERT INTO `ob_kalman` VALUES (11594, '1745048678', '1', 0, NULL, NULL, 1, 'MANT4M2W');
INSERT INTO `ob_kalman` VALUES (11595, '1745048678', '1', 0, NULL, NULL, 1, 'MRO7AF9X');
INSERT INTO `ob_kalman` VALUES (11596, '1745048678', '1', 0, NULL, NULL, 1, '5DDMW5VK');
INSERT INTO `ob_kalman` VALUES (11597, '1745048678', '1', 0, NULL, NULL, 1, 'W6HOX8YY');
INSERT INTO `ob_kalman` VALUES (11598, '1745048678', '1', 0, NULL, NULL, 1, 'O03N7R6W');
INSERT INTO `ob_kalman` VALUES (11599, '1745048678', '1', 0, NULL, NULL, 1, 'T3WC48NN');
INSERT INTO `ob_kalman` VALUES (11600, '1745048678', '1', 0, NULL, NULL, 1, 'JPJEXICW');
INSERT INTO `ob_kalman` VALUES (11601, '1745048678', '1', 0, NULL, NULL, 1, 'G86REDE2');
INSERT INTO `ob_kalman` VALUES (11602, '1745048678', '1', 0, NULL, NULL, 1, 'IAEMC1Q3');
INSERT INTO `ob_kalman` VALUES (11603, '1745048678', '1', 0, NULL, NULL, 1, '4640JY2P');
INSERT INTO `ob_kalman` VALUES (11604, '1745048678', '1', 0, NULL, NULL, 1, '8J9BJFCY');
INSERT INTO `ob_kalman` VALUES (11605, '1745048678', '1', 0, NULL, NULL, 1, '8IGH432R');
INSERT INTO `ob_kalman` VALUES (11606, '1745048678', '1', 0, NULL, NULL, 1, '96JREO44');
INSERT INTO `ob_kalman` VALUES (11607, '1745048678', '1', 0, NULL, NULL, 1, 'U7YRINP0');
INSERT INTO `ob_kalman` VALUES (11608, '1745048678', '1', 0, NULL, NULL, 1, 'UOB0IUIB');
INSERT INTO `ob_kalman` VALUES (11609, '1745048678', '1', 0, NULL, NULL, 1, '0K4EW5U1');
INSERT INTO `ob_kalman` VALUES (11610, '1745048678', '1', 0, NULL, NULL, 1, 'OIVE8V26');
INSERT INTO `ob_kalman` VALUES (11611, '1745048678', '1', 0, NULL, NULL, 1, '00YNTJ2G');
INSERT INTO `ob_kalman` VALUES (11612, '1745048678', '1', 0, NULL, NULL, 1, 'BFFFMTS5');
INSERT INTO `ob_kalman` VALUES (11613, '1745048678', '1', 0, NULL, NULL, 1, 'OCB3025X');
INSERT INTO `ob_kalman` VALUES (11614, '1745048678', '1', 0, NULL, NULL, 1, '8PX4MQFB');
INSERT INTO `ob_kalman` VALUES (11615, '1745048678', '1', 0, NULL, NULL, 1, 'DXXPRB34');
INSERT INTO `ob_kalman` VALUES (11616, '1745048678', '1', 0, NULL, NULL, 1, 'CO2XOTH2');
INSERT INTO `ob_kalman` VALUES (11617, '1745048678', '1', 0, NULL, NULL, 1, 'U01XK1MS');
INSERT INTO `ob_kalman` VALUES (11618, '1745048678', '1', 0, NULL, NULL, 1, 'VH4SLRDL');
INSERT INTO `ob_kalman` VALUES (11619, '1745048678', '1', 0, NULL, NULL, 1, '4MBNUCHP');
INSERT INTO `ob_kalman` VALUES (11620, '1745048678', '1', 0, NULL, NULL, 1, '6XFGWQR5');
INSERT INTO `ob_kalman` VALUES (11621, '1745048678', '1', 0, NULL, NULL, 1, '3DAREOW3');
INSERT INTO `ob_kalman` VALUES (11622, '1745048678', '1', 0, NULL, NULL, 1, 'RPBUMCO9');
INSERT INTO `ob_kalman` VALUES (11623, '1745048678', '1', 0, NULL, NULL, 1, 'JGBM9N2Y');
INSERT INTO `ob_kalman` VALUES (11624, '1745048678', '1', 0, NULL, NULL, 1, 'IHS7WMS1');
INSERT INTO `ob_kalman` VALUES (11625, '1745048678', '1', 0, NULL, NULL, 1, 'VUCJ0YHR');
INSERT INTO `ob_kalman` VALUES (11626, '1745048678', '1', 0, NULL, NULL, 1, '1KEY2VCT');
INSERT INTO `ob_kalman` VALUES (11627, '1745048678', '1', 0, NULL, NULL, 1, 'KU36YTSM');
INSERT INTO `ob_kalman` VALUES (11628, '1745048678', '1', 0, NULL, NULL, 1, 'QSGDKOK8');
INSERT INTO `ob_kalman` VALUES (11629, '1745048678', '1', 0, NULL, NULL, 1, 'YLXTTS6Y');
INSERT INTO `ob_kalman` VALUES (11630, '1745048678', '1', 0, NULL, NULL, 1, 'L769NLW0');
INSERT INTO `ob_kalman` VALUES (11631, '1745048678', '1', 0, NULL, NULL, 1, 'LV89A32G');
INSERT INTO `ob_kalman` VALUES (11632, '1745048678', '1', 0, NULL, NULL, 1, 'OJOW5O94');
INSERT INTO `ob_kalman` VALUES (11633, '1745048678', '1', 0, NULL, NULL, 1, 'A2NYUVH8');
INSERT INTO `ob_kalman` VALUES (11634, '1745048678', '1', 0, NULL, NULL, 1, 'XTILKQFP');
INSERT INTO `ob_kalman` VALUES (11635, '1745048678', '1', 0, NULL, NULL, 1, 'BBRTS6XO');
INSERT INTO `ob_kalman` VALUES (11636, '1745048678', '1', 0, NULL, NULL, 1, '5L0FGVMO');
INSERT INTO `ob_kalman` VALUES (11637, '1745048678', '1', 0, NULL, NULL, 1, '2C7PKIMW');
INSERT INTO `ob_kalman` VALUES (11638, '1745048678', '1', 0, NULL, NULL, 1, 'R34N65PS');
INSERT INTO `ob_kalman` VALUES (11639, '1745048678', '1', 0, NULL, NULL, 1, 'D17VF0EQ');
INSERT INTO `ob_kalman` VALUES (11640, '1745048678', '1', 0, NULL, NULL, 1, 'EALDO4VF');
INSERT INTO `ob_kalman` VALUES (11641, '1745048678', '1', 0, NULL, NULL, 1, '5WV8D1KD');
INSERT INTO `ob_kalman` VALUES (11642, '1745048678', '1', 0, NULL, NULL, 1, '0SEM1LG4');
INSERT INTO `ob_kalman` VALUES (11643, '1745048678', '1', 0, NULL, NULL, 1, 'GKP75FLT');
INSERT INTO `ob_kalman` VALUES (11644, '1745048678', '1', 0, NULL, NULL, 1, '5TVOR5FS');
INSERT INTO `ob_kalman` VALUES (11645, '1745048678', '1', 0, NULL, NULL, 1, '1UYL7NUG');
INSERT INTO `ob_kalman` VALUES (11646, '1745048678', '1', 0, NULL, NULL, 1, 'VQ1W7785');
INSERT INTO `ob_kalman` VALUES (11647, '1745048678', '1', 0, NULL, NULL, 1, 'EOL02W91');
INSERT INTO `ob_kalman` VALUES (11648, '1745048678', '1', 0, NULL, NULL, 1, '7GVEVF2Y');
INSERT INTO `ob_kalman` VALUES (11649, '1745048678', '1', 0, NULL, NULL, 1, 'D9P6DNCL');
INSERT INTO `ob_kalman` VALUES (11650, '1745048678', '1', 0, NULL, NULL, 1, 'BR9XD0BP');
INSERT INTO `ob_kalman` VALUES (11651, '1745048678', '1', 0, NULL, NULL, 1, 'MT4M70AL');
INSERT INTO `ob_kalman` VALUES (11652, '1745048678', '1', 0, NULL, NULL, 1, 'KOPXS45A');
INSERT INTO `ob_kalman` VALUES (11653, '1745048678', '1', 0, NULL, NULL, 1, 'OFG2JG18');
INSERT INTO `ob_kalman` VALUES (11654, '1745048678', '1', 0, NULL, NULL, 1, 'VOH059PL');
INSERT INTO `ob_kalman` VALUES (11655, '1745048678', '1', 0, NULL, NULL, 1, 'NTOVVFY9');
INSERT INTO `ob_kalman` VALUES (11656, '1745048678', '1', 0, NULL, NULL, 1, 'L307LX5D');
INSERT INTO `ob_kalman` VALUES (11657, '1745048678', '1', 0, NULL, NULL, 1, 'KUEKBMN3');
INSERT INTO `ob_kalman` VALUES (11658, '1745048678', '1', 0, NULL, NULL, 1, 'GK88Q0G4');
INSERT INTO `ob_kalman` VALUES (11659, '1745048678', '1', 0, NULL, NULL, 1, 'JVFLQQPI');
INSERT INTO `ob_kalman` VALUES (11660, '1745048678', '1', 0, NULL, NULL, 1, '5G7LQKBJ');
INSERT INTO `ob_kalman` VALUES (11661, '1745048678', '1', 0, NULL, NULL, 1, 'PGGY5CQQ');
INSERT INTO `ob_kalman` VALUES (11662, '1745048678', '1', 0, NULL, NULL, 1, 'L7LIFYP8');
INSERT INTO `ob_kalman` VALUES (11663, '1745048678', '1', 0, NULL, NULL, 1, '99E78CFW');
INSERT INTO `ob_kalman` VALUES (11664, '1745048678', '1', 0, NULL, NULL, 1, '6X5XX55C');
INSERT INTO `ob_kalman` VALUES (11665, '1745048678', '1', 0, NULL, NULL, 1, 'UHFK9DRN');
INSERT INTO `ob_kalman` VALUES (11666, '1745048678', '1', 0, NULL, NULL, 1, 'NTK9XK66');
INSERT INTO `ob_kalman` VALUES (11667, '1745048678', '1', 0, NULL, NULL, 1, 'DTN88MD8');
INSERT INTO `ob_kalman` VALUES (11668, '1745048678', '1', 0, NULL, NULL, 1, '10OW8SAA');
INSERT INTO `ob_kalman` VALUES (11669, '1745048678', '1', 0, NULL, NULL, 1, '06K8EFRK');
INSERT INTO `ob_kalman` VALUES (11670, '1745048678', '1', 0, NULL, NULL, 1, 'EN5VXXWY');
INSERT INTO `ob_kalman` VALUES (11671, '1745048678', '1', 0, NULL, NULL, 1, 'KKB8OAB2');
INSERT INTO `ob_kalman` VALUES (11672, '1745048678', '1', 0, NULL, NULL, 1, 'ARIGLGSQ');
INSERT INTO `ob_kalman` VALUES (11673, '1745048678', '1', 0, NULL, NULL, 1, 'LUU4XO36');
INSERT INTO `ob_kalman` VALUES (11674, '1745048678', '1', 0, NULL, NULL, 1, 'IDO8I5FB');
INSERT INTO `ob_kalman` VALUES (11675, '1745048678', '1', 0, NULL, NULL, 1, 'PTGS9NFY');
INSERT INTO `ob_kalman` VALUES (11676, '1745048678', '1', 0, NULL, NULL, 1, 'AF0VON2E');
INSERT INTO `ob_kalman` VALUES (11677, '1745048678', '1', 0, NULL, NULL, 1, 'S7PO8VIH');
INSERT INTO `ob_kalman` VALUES (11678, '1745048678', '1', 0, NULL, NULL, 1, 'CNEK544C');
INSERT INTO `ob_kalman` VALUES (11679, '1745048678', '1', 0, NULL, NULL, 1, 'P90Q63PW');
INSERT INTO `ob_kalman` VALUES (11680, '1745048678', '1', 0, NULL, NULL, 1, 'VMAFCYBQ');
INSERT INTO `ob_kalman` VALUES (11681, '1745048678', '1', 0, NULL, NULL, 1, '0M1KTOW0');
INSERT INTO `ob_kalman` VALUES (11682, '1745048678', '1', 0, NULL, NULL, 1, 'VKEBNS50');
INSERT INTO `ob_kalman` VALUES (11683, '1745048678', '1', 0, NULL, NULL, 1, 'OKOTRXJ1');
INSERT INTO `ob_kalman` VALUES (11684, '1745048678', '1', 0, NULL, NULL, 1, 'NQ1MFLSQ');
INSERT INTO `ob_kalman` VALUES (11685, '1745048678', '1', 0, NULL, NULL, 1, 'FOG9FBGY');
INSERT INTO `ob_kalman` VALUES (11686, '1745048678', '1', 0, NULL, NULL, 1, '4YETBCOV');
INSERT INTO `ob_kalman` VALUES (11687, '1745048678', '1', 0, NULL, NULL, 1, 'CN7U6UQ6');
INSERT INTO `ob_kalman` VALUES (11688, '1745048678', '1', 0, NULL, NULL, 1, 'EKJ9GSFV');
INSERT INTO `ob_kalman` VALUES (11689, '1745048678', '1', 0, NULL, NULL, 1, 'AI7AUF6S');
INSERT INTO `ob_kalman` VALUES (11690, '1745048678', '1', 0, NULL, NULL, 1, 'IYGUAENO');
INSERT INTO `ob_kalman` VALUES (11691, '1745048678', '1', 0, NULL, NULL, 1, 'KDMGK6OQ');
INSERT INTO `ob_kalman` VALUES (11692, '1745048678', '1', 0, NULL, NULL, 1, 'P01O7RRY');
INSERT INTO `ob_kalman` VALUES (11693, '1745048678', '1', 0, NULL, NULL, 1, 'B59UEVQY');
INSERT INTO `ob_kalman` VALUES (11694, '1745048678', '1', 0, NULL, NULL, 1, 'JVFDX51E');
INSERT INTO `ob_kalman` VALUES (11695, '1745048678', '1', 0, NULL, NULL, 1, '4CFYX1LP');
INSERT INTO `ob_kalman` VALUES (11696, '1745048678', '1', 0, NULL, NULL, 1, 'NLTB40OE');
INSERT INTO `ob_kalman` VALUES (11697, '1745048678', '1', 0, NULL, NULL, 1, 'MOCO1XBQ');
INSERT INTO `ob_kalman` VALUES (11698, '1745048678', '1', 0, NULL, NULL, 1, '86GW9M4A');
INSERT INTO `ob_kalman` VALUES (11699, '1745048678', '1', 0, NULL, NULL, 1, '8KS5F764');
INSERT INTO `ob_kalman` VALUES (11700, '1745048678', '1', 0, NULL, NULL, 1, 'BITJCSHH');
INSERT INTO `ob_kalman` VALUES (11701, '1745048678', '1', 0, NULL, NULL, 1, 'MFR8RJ2E');
INSERT INTO `ob_kalman` VALUES (11702, '1745048678', '1', 0, NULL, NULL, 1, 'BQCNCNEO');
INSERT INTO `ob_kalman` VALUES (11703, '1745048678', '1', 0, NULL, NULL, 1, '8FH4LT7Q');
INSERT INTO `ob_kalman` VALUES (11704, '1745048678', '1', 0, NULL, NULL, 1, '0NEEA1FN');
INSERT INTO `ob_kalman` VALUES (11705, '1745048678', '1', 0, NULL, NULL, 1, 'FUMQ3ON4');
INSERT INTO `ob_kalman` VALUES (11706, '1745048678', '1', 0, NULL, NULL, 1, 'JOPWI3BE');
INSERT INTO `ob_kalman` VALUES (11707, '1745048678', '1', 0, NULL, NULL, 1, 'RDDOLEWP');
INSERT INTO `ob_kalman` VALUES (11708, '1745048678', '1', 0, NULL, NULL, 1, 'DS9I1X7M');
INSERT INTO `ob_kalman` VALUES (11709, '1745048678', '1', 0, NULL, NULL, 1, 'M0GH3OML');
INSERT INTO `ob_kalman` VALUES (11710, '1745048678', '1', 0, NULL, NULL, 1, 'UR7OUEJO');
INSERT INTO `ob_kalman` VALUES (11711, '1745048678', '1', 0, NULL, NULL, 1, 'B2S24XEF');
INSERT INTO `ob_kalman` VALUES (11712, '1745048678', '1', 0, NULL, NULL, 1, 'TM04WIGA');
INSERT INTO `ob_kalman` VALUES (11713, '1745048678', '1', 0, NULL, NULL, 1, 'R4OMQO3T');
INSERT INTO `ob_kalman` VALUES (11714, '1745048678', '1', 0, NULL, NULL, 1, 'JVSLQ03E');
INSERT INTO `ob_kalman` VALUES (11715, '1745048678', '1', 0, NULL, NULL, 1, '6IEFKR6N');
INSERT INTO `ob_kalman` VALUES (11716, '1745048678', '1', 0, NULL, NULL, 1, 'U6QHDOFN');
INSERT INTO `ob_kalman` VALUES (11717, '1745048678', '1', 0, NULL, NULL, 1, 'I28IPXN0');
INSERT INTO `ob_kalman` VALUES (11718, '1745048678', '1', 0, NULL, NULL, 1, 'O1KM1ACP');
INSERT INTO `ob_kalman` VALUES (11719, '1745048678', '1', 0, NULL, NULL, 1, 'IS3FJ6SB');
INSERT INTO `ob_kalman` VALUES (11720, '1745048678', '1', 0, NULL, NULL, 1, '6LY24VK9');
INSERT INTO `ob_kalman` VALUES (11721, '1745048678', '1', 0, NULL, NULL, 1, '01NEOMYC');
INSERT INTO `ob_kalman` VALUES (11722, '1745048678', '1', 0, NULL, NULL, 1, 'KH9O2Q2N');
INSERT INTO `ob_kalman` VALUES (11723, '1745048678', '1', 0, NULL, NULL, 1, 'RSJ0D21K');
INSERT INTO `ob_kalman` VALUES (11724, '1745048678', '1', 0, NULL, NULL, 1, 'XE4IUAQ1');
INSERT INTO `ob_kalman` VALUES (11725, '1745048678', '1', 0, NULL, NULL, 1, '6EHKH0DL');
INSERT INTO `ob_kalman` VALUES (11726, '1745048678', '1', 0, NULL, NULL, 1, 'M3WJ57CQ');
INSERT INTO `ob_kalman` VALUES (11727, '1745048678', '1', 0, NULL, NULL, 1, 'NAJXCBV2');
INSERT INTO `ob_kalman` VALUES (11728, '1745048678', '1', 0, NULL, NULL, 1, 'D84DF3B5');
INSERT INTO `ob_kalman` VALUES (11729, '1745048678', '1', 0, NULL, NULL, 1, 'MYR0UXSV');
INSERT INTO `ob_kalman` VALUES (11730, '1745048678', '1', 0, NULL, NULL, 1, 'VD845QAE');
INSERT INTO `ob_kalman` VALUES (11731, '1745048678', '1', 0, NULL, NULL, 1, 'DDMKA0D4');
INSERT INTO `ob_kalman` VALUES (11732, '1745048678', '1', 0, NULL, NULL, 1, 'CCM9ME3K');
INSERT INTO `ob_kalman` VALUES (11733, '1745048678', '1', 0, NULL, NULL, 1, 'EVYDNHL4');
INSERT INTO `ob_kalman` VALUES (11734, '1745048678', '1', 0, NULL, NULL, 1, '2WHNKA2H');
INSERT INTO `ob_kalman` VALUES (11735, '1745048678', '1', 0, NULL, NULL, 1, 'JU93PCSI');
INSERT INTO `ob_kalman` VALUES (11736, '1745048678', '1', 0, NULL, NULL, 1, '15SR0FYO');
INSERT INTO `ob_kalman` VALUES (11737, '1745048678', '1', 0, NULL, NULL, 1, '6PR5VUXJ');
INSERT INTO `ob_kalman` VALUES (11738, '1745048678', '1', 0, NULL, NULL, 1, 'PJ278QHJ');
INSERT INTO `ob_kalman` VALUES (11739, '1745048678', '1', 0, NULL, NULL, 1, 'ECEYD5LK');
INSERT INTO `ob_kalman` VALUES (11740, '1745048678', '1', 0, NULL, NULL, 1, 'J9QNELEC');
INSERT INTO `ob_kalman` VALUES (11741, '1745048678', '1', 0, NULL, NULL, 1, 'OVFIGYRP');
INSERT INTO `ob_kalman` VALUES (11742, '1745048678', '1', 0, NULL, NULL, 1, 'V0C339U7');
INSERT INTO `ob_kalman` VALUES (11743, '1745048678', '1', 0, NULL, NULL, 1, 'GLKSNAMR');
INSERT INTO `ob_kalman` VALUES (11744, '1745048678', '1', 0, NULL, NULL, 1, '0YC604AQ');
INSERT INTO `ob_kalman` VALUES (11745, '1745048678', '1', 0, NULL, NULL, 1, 'RFMBM2GE');
INSERT INTO `ob_kalman` VALUES (11746, '1745048678', '1', 0, NULL, NULL, 1, 'AEKD2829');
INSERT INTO `ob_kalman` VALUES (11747, '1745048678', '1', 0, NULL, NULL, 1, 'VO7J7OHO');
INSERT INTO `ob_kalman` VALUES (11748, '1745048678', '1', 0, NULL, NULL, 1, 'JFP6THA2');
INSERT INTO `ob_kalman` VALUES (11749, '1745048678', '1', 0, NULL, NULL, 1, 'TG4WGX96');
INSERT INTO `ob_kalman` VALUES (11750, '1745048678', '1', 0, NULL, NULL, 1, '3L5PBI1G');
INSERT INTO `ob_kalman` VALUES (11751, '1745048678', '1', 0, NULL, NULL, 1, 'CGS01903');
INSERT INTO `ob_kalman` VALUES (11752, '1745048678', '1', 0, NULL, NULL, 1, '4CNRMP3M');
INSERT INTO `ob_kalman` VALUES (11753, '1745048678', '1', 0, NULL, NULL, 1, '121LAWE5');
INSERT INTO `ob_kalman` VALUES (11754, '1745048678', '1', 0, NULL, NULL, 1, 'IXDMVW1R');
INSERT INTO `ob_kalman` VALUES (11755, '1745048678', '1', 0, NULL, NULL, 1, '7RM5VM6U');
INSERT INTO `ob_kalman` VALUES (11756, '1745048678', '1', 0, NULL, NULL, 1, 'OHC69BES');
INSERT INTO `ob_kalman` VALUES (11757, '1745048678', '1', 0, NULL, NULL, 1, '5SLJESOU');
INSERT INTO `ob_kalman` VALUES (11758, '1745048678', '1', 0, NULL, NULL, 1, 'Y2OV8BGW');
INSERT INTO `ob_kalman` VALUES (11759, '1745048678', '1', 0, NULL, NULL, 1, '9F3MGSMP');
INSERT INTO `ob_kalman` VALUES (11760, '1745048678', '1', 0, NULL, NULL, 1, 'FSHQH25H');
INSERT INTO `ob_kalman` VALUES (11761, '1745048678', '1', 0, NULL, NULL, 1, '6XYO75BV');
INSERT INTO `ob_kalman` VALUES (11762, '1745048678', '1', 0, NULL, NULL, 1, 'TFQJDG52');
INSERT INTO `ob_kalman` VALUES (11763, '1745048678', '1', 0, NULL, NULL, 1, '2XLDUGI3');
INSERT INTO `ob_kalman` VALUES (11764, '1745048678', '1', 0, NULL, NULL, 1, '7JKSA38K');
INSERT INTO `ob_kalman` VALUES (11765, '1745048678', '1', 0, NULL, NULL, 1, 'BOJL2TMO');
INSERT INTO `ob_kalman` VALUES (11766, '1745048678', '1', 0, NULL, NULL, 1, 'A730JGHM');
INSERT INTO `ob_kalman` VALUES (11767, '1745048678', '1', 0, NULL, NULL, 1, '9A650BM1');
INSERT INTO `ob_kalman` VALUES (11768, '1745048678', '1', 0, NULL, NULL, 1, 'BO53DVSP');
INSERT INTO `ob_kalman` VALUES (11769, '1745048678', '1', 0, NULL, NULL, 1, 'U3J7OF5M');
INSERT INTO `ob_kalman` VALUES (11770, '1745048678', '1', 0, NULL, NULL, 1, 'JDNDAG92');
INSERT INTO `ob_kalman` VALUES (11771, '1745048678', '1', 0, NULL, NULL, 1, 'HOVUXIFM');
INSERT INTO `ob_kalman` VALUES (11772, '1745048678', '1', 0, NULL, NULL, 1, 'UBOJO4OM');
INSERT INTO `ob_kalman` VALUES (11773, '1745048678', '1', 0, NULL, NULL, 1, 'O2A18LKA');
INSERT INTO `ob_kalman` VALUES (11774, '1745048678', '1', 0, NULL, NULL, 1, '5V0OUCA9');
INSERT INTO `ob_kalman` VALUES (11775, '1745048678', '1', 0, NULL, NULL, 1, '6CM4EGNE');
INSERT INTO `ob_kalman` VALUES (11776, '1745048678', '1', 0, NULL, NULL, 1, 'KXJBSMV6');
INSERT INTO `ob_kalman` VALUES (11777, '1745048678', '1', 0, NULL, NULL, 1, 'OUE134IT');
INSERT INTO `ob_kalman` VALUES (11778, '1745048678', '1', 0, NULL, NULL, 1, 'RDND3EY8');
INSERT INTO `ob_kalman` VALUES (11779, '1745048678', '1', 0, NULL, NULL, 1, 'S0Y1G38O');
INSERT INTO `ob_kalman` VALUES (11780, '1745048678', '1', 0, NULL, NULL, 1, 'IAX6PRIM');
INSERT INTO `ob_kalman` VALUES (11781, '1745048678', '1', 0, NULL, NULL, 1, 'SBLWOB0X');
INSERT INTO `ob_kalman` VALUES (11782, '1745048678', '1', 0, NULL, NULL, 1, '6KWY4KCY');
INSERT INTO `ob_kalman` VALUES (11783, '1745048678', '1', 0, NULL, NULL, 1, '58VEH95S');
INSERT INTO `ob_kalman` VALUES (11784, '1745048678', '1', 0, NULL, NULL, 1, 'KP3K7HVY');
INSERT INTO `ob_kalman` VALUES (11785, '1745048678', '1', 0, NULL, NULL, 1, '9HNODM91');
INSERT INTO `ob_kalman` VALUES (11786, '1745048678', '1', 0, NULL, NULL, 1, '3R66DHKD');
INSERT INTO `ob_kalman` VALUES (11787, '1745048678', '1', 0, NULL, NULL, 1, 'OIO1RXC3');
INSERT INTO `ob_kalman` VALUES (11788, '1745048678', '1', 0, NULL, NULL, 1, 'XF366GK0');
INSERT INTO `ob_kalman` VALUES (11789, '1745048678', '1', 0, NULL, NULL, 1, 'P86GBBA5');
INSERT INTO `ob_kalman` VALUES (11790, '1745048678', '1', 0, NULL, NULL, 1, 'KTIAETMM');
INSERT INTO `ob_kalman` VALUES (11791, '1745048678', '1', 0, NULL, NULL, 1, '8JRIC8OC');
INSERT INTO `ob_kalman` VALUES (11792, '1745048678', '1', 0, NULL, NULL, 1, '0XIRC2P9');
INSERT INTO `ob_kalman` VALUES (11793, '1745048678', '1', 0, NULL, NULL, 1, '62BKV25E');
INSERT INTO `ob_kalman` VALUES (11794, '1745048678', '1', 0, NULL, NULL, 1, 'I03E06EO');
INSERT INTO `ob_kalman` VALUES (11795, '1745048678', '1', 0, NULL, NULL, 1, 'OX1QVRKG');
INSERT INTO `ob_kalman` VALUES (11796, '1745048678', '1', 0, NULL, NULL, 1, '58K6LEKN');
INSERT INTO `ob_kalman` VALUES (11797, '1745048678', '1', 0, NULL, NULL, 1, 'C9C2JOMI');
INSERT INTO `ob_kalman` VALUES (11798, '1745048678', '1', 0, NULL, NULL, 1, '4RAM7XJM');
INSERT INTO `ob_kalman` VALUES (11799, '1745048678', '1', 0, NULL, NULL, 1, '9OYB63W0');
INSERT INTO `ob_kalman` VALUES (11800, '1745048678', '1', 0, NULL, NULL, 1, 'O28OD95H');
INSERT INTO `ob_kalman` VALUES (11801, '1745048678', '1', 0, NULL, NULL, 1, 'UIF4LCQL');
INSERT INTO `ob_kalman` VALUES (11802, '1745048678', '1', 0, NULL, NULL, 1, 'X4PBA96F');
INSERT INTO `ob_kalman` VALUES (11803, '1745048678', '1', 0, NULL, NULL, 1, 'SLLIPGMT');
INSERT INTO `ob_kalman` VALUES (11804, '1745048678', '1', 0, NULL, NULL, 1, '1PV9QWTQ');
INSERT INTO `ob_kalman` VALUES (11805, '1745048678', '1', 0, NULL, NULL, 1, '0JXK7UDS');
INSERT INTO `ob_kalman` VALUES (11806, '1745048678', '1', 0, NULL, NULL, 1, 'B0J12MS2');
INSERT INTO `ob_kalman` VALUES (11807, '1745048678', '1', 0, NULL, NULL, 1, '6EC105FG');
INSERT INTO `ob_kalman` VALUES (11808, '1745048678', '1', 0, NULL, NULL, 1, '6LLOQFTJ');
INSERT INTO `ob_kalman` VALUES (11809, '1745048678', '1', 0, NULL, NULL, 1, 'O3MVQ314');
INSERT INTO `ob_kalman` VALUES (11810, '1745048678', '1', 0, NULL, NULL, 1, '9EUN361P');
INSERT INTO `ob_kalman` VALUES (11811, '1745048678', '1', 0, NULL, NULL, 1, 'X8OFX4NQ');
INSERT INTO `ob_kalman` VALUES (11812, '1745048678', '1', 0, NULL, NULL, 1, '6H8DHS93');
INSERT INTO `ob_kalman` VALUES (11813, '1745048678', '1', 0, NULL, NULL, 1, 'KJ3H28IJ');
INSERT INTO `ob_kalman` VALUES (11814, '1745048678', '1', 0, NULL, NULL, 1, '4OWVHE2N');
INSERT INTO `ob_kalman` VALUES (11815, '1745048678', '1', 0, NULL, NULL, 1, 'EY4A4OTC');
INSERT INTO `ob_kalman` VALUES (11816, '1745048678', '1', 0, NULL, NULL, 1, '0H1BVT1N');
INSERT INTO `ob_kalman` VALUES (11817, '1745048678', '1', 0, NULL, NULL, 1, 'CCY3WX6N');
INSERT INTO `ob_kalman` VALUES (11818, '1745048678', '1', 0, NULL, NULL, 1, 'OJU8OKW5');
INSERT INTO `ob_kalman` VALUES (11819, '1745048678', '1', 0, NULL, NULL, 1, 'HIOSFPNN');
INSERT INTO `ob_kalman` VALUES (11820, '1745048678', '1', 0, NULL, NULL, 1, '1MJJSQ43');
INSERT INTO `ob_kalman` VALUES (11821, '1745048678', '1', 0, NULL, NULL, 1, '6I6YS0OU');
INSERT INTO `ob_kalman` VALUES (11822, '1745048678', '1', 0, NULL, NULL, 1, '6OOC1320');
INSERT INTO `ob_kalman` VALUES (11823, '1745048678', '1', 0, NULL, NULL, 1, 'BFXQML0P');
INSERT INTO `ob_kalman` VALUES (11824, '1745048678', '1', 0, NULL, NULL, 1, '55S2V35E');
INSERT INTO `ob_kalman` VALUES (11825, '1745048678', '1', 0, NULL, NULL, 1, 'Y0KHR5AV');
INSERT INTO `ob_kalman` VALUES (11826, '1745048678', '1', 0, NULL, NULL, 1, 'RNCJKJ3N');
INSERT INTO `ob_kalman` VALUES (11827, '1745048678', '1', 0, NULL, NULL, 1, 'BGTW3CEO');
INSERT INTO `ob_kalman` VALUES (11828, '1745048678', '1', 0, NULL, NULL, 1, 'CE21OO98');
INSERT INTO `ob_kalman` VALUES (11829, '1745048678', '1', 0, NULL, NULL, 1, 'GOYDPP7P');
INSERT INTO `ob_kalman` VALUES (11830, '1745048678', '1', 0, NULL, NULL, 1, '4N2B6RAB');
INSERT INTO `ob_kalman` VALUES (11831, '1745048678', '1', 0, NULL, NULL, 1, 'I6YLM8U7');
INSERT INTO `ob_kalman` VALUES (11832, '1745048678', '1', 0, NULL, NULL, 1, 'RJAHDT5R');
INSERT INTO `ob_kalman` VALUES (11833, '1745048678', '1', 0, NULL, NULL, 1, 'XUV5O9EH');
INSERT INTO `ob_kalman` VALUES (11834, '1745048678', '1', 0, NULL, NULL, 1, 'DXR32VVG');
INSERT INTO `ob_kalman` VALUES (11835, '1745048678', '1', 0, NULL, NULL, 1, '5QG8GQ73');
INSERT INTO `ob_kalman` VALUES (11836, '1745048678', '1', 0, NULL, NULL, 1, 'YOJ4P6OP');
INSERT INTO `ob_kalman` VALUES (11837, '1745048678', '1', 0, NULL, NULL, 1, 'OKIALGLY');
INSERT INTO `ob_kalman` VALUES (11838, '1745048678', '1', 0, NULL, NULL, 1, '9YSYGTK5');
INSERT INTO `ob_kalman` VALUES (11839, '1745048678', '1', 0, NULL, NULL, 1, 'F3KSAH5Y');
INSERT INTO `ob_kalman` VALUES (11840, '1745048678', '1', 0, NULL, NULL, 1, '1R2M6SKX');
INSERT INTO `ob_kalman` VALUES (11841, '1745048678', '1', 0, NULL, NULL, 1, 'O4DWKKWH');
INSERT INTO `ob_kalman` VALUES (11842, '1745048678', '1', 0, NULL, NULL, 1, 'YM1J5EW7');
INSERT INTO `ob_kalman` VALUES (11843, '1745048678', '1', 0, NULL, NULL, 1, 'A3AK0TCB');
INSERT INTO `ob_kalman` VALUES (11844, '1745048678', '1', 0, NULL, NULL, 1, 'WPXXNQYV');
INSERT INTO `ob_kalman` VALUES (11845, '1745048678', '1', 0, NULL, NULL, 1, 'B92X0YCA');
INSERT INTO `ob_kalman` VALUES (11846, '1745048678', '1', 0, NULL, NULL, 1, 'NKIIECY6');
INSERT INTO `ob_kalman` VALUES (11847, '1745048678', '1', 0, NULL, NULL, 1, '6NESO10X');
INSERT INTO `ob_kalman` VALUES (11848, '1745048678', '1', 0, NULL, NULL, 1, 'HSN2MP6S');
INSERT INTO `ob_kalman` VALUES (11849, '1745048678', '1', 0, NULL, NULL, 1, '904O5RYL');
INSERT INTO `ob_kalman` VALUES (11850, '1745048678', '1', 0, NULL, NULL, 1, 'WHCBBKAD');
INSERT INTO `ob_kalman` VALUES (11851, '1745048678', '1', 0, NULL, NULL, 1, 'M8ITBTTN');
INSERT INTO `ob_kalman` VALUES (11852, '1745048678', '1', 0, NULL, NULL, 1, '5IXY5CGP');
INSERT INTO `ob_kalman` VALUES (11853, '1745048678', '1', 0, NULL, NULL, 1, 'Y87AKS2L');
INSERT INTO `ob_kalman` VALUES (11854, '1745048678', '1', 0, NULL, NULL, 1, '9MM62LK9');
INSERT INTO `ob_kalman` VALUES (11855, '1745048678', '1', 0, NULL, NULL, 1, 'E1T73I2B');
INSERT INTO `ob_kalman` VALUES (11856, '1745048678', '1', 0, NULL, NULL, 1, '00FECJOT');
INSERT INTO `ob_kalman` VALUES (11857, '1745048678', '1', 0, NULL, NULL, 1, '3VD48TAO');
INSERT INTO `ob_kalman` VALUES (11858, '1745048678', '1', 0, NULL, NULL, 1, 'G898KQXV');
INSERT INTO `ob_kalman` VALUES (11859, '1745048678', '1', 0, NULL, NULL, 1, 'OUHM2FGD');
INSERT INTO `ob_kalman` VALUES (11860, '1745048678', '1', 0, NULL, NULL, 1, 'UK1PRH0R');
INSERT INTO `ob_kalman` VALUES (11861, '1745048678', '1', 0, NULL, NULL, 1, 'YTRGGQT8');
INSERT INTO `ob_kalman` VALUES (11862, '1745048678', '1', 0, NULL, NULL, 1, 'SU5MYFO9');
INSERT INTO `ob_kalman` VALUES (11863, '1745048678', '1', 0, NULL, NULL, 1, 'MWBY4ONA');
INSERT INTO `ob_kalman` VALUES (11864, '1745048678', '1', 0, NULL, NULL, 1, 'XVRSXA25');
INSERT INTO `ob_kalman` VALUES (11865, '1745048678', '1', 0, NULL, NULL, 1, '7OGD6HSP');
INSERT INTO `ob_kalman` VALUES (11866, '1745048678', '1', 0, NULL, NULL, 1, '9JFATOK0');
INSERT INTO `ob_kalman` VALUES (11867, '1745048678', '1', 0, NULL, NULL, 1, 'OP729L2Y');
INSERT INTO `ob_kalman` VALUES (11868, '1745048678', '1', 0, NULL, NULL, 1, 'QBE6E4O3');
INSERT INTO `ob_kalman` VALUES (11869, '1745048678', '1', 0, NULL, NULL, 1, 'Q48SV9VI');
INSERT INTO `ob_kalman` VALUES (11870, '1745048678', '1', 0, NULL, NULL, 1, 'X4M2MDDM');
INSERT INTO `ob_kalman` VALUES (11871, '1745048678', '1', 0, NULL, NULL, 1, '63S821MK');
INSERT INTO `ob_kalman` VALUES (11872, '1745048678', '1', 0, NULL, NULL, 1, 'C7O9U62S');
INSERT INTO `ob_kalman` VALUES (11873, '1745048678', '1', 0, NULL, NULL, 1, 'KONYDOT2');
INSERT INTO `ob_kalman` VALUES (11874, '1745048678', '1', 0, NULL, NULL, 1, 'OLENQF6T');
INSERT INTO `ob_kalman` VALUES (11875, '1745048678', '1', 0, NULL, NULL, 1, 'QME8GE3N');
INSERT INTO `ob_kalman` VALUES (11876, '1745048678', '1', 0, NULL, NULL, 1, 'MH2E19DJ');
INSERT INTO `ob_kalman` VALUES (11877, '1745048678', '1', 0, NULL, NULL, 1, 'PE60SSJK');
INSERT INTO `ob_kalman` VALUES (11878, '1745048678', '1', 0, NULL, NULL, 1, 'B2HXPBLL');
INSERT INTO `ob_kalman` VALUES (11879, '1745048678', '1', 0, NULL, NULL, 1, 'JFJXUO4N');
INSERT INTO `ob_kalman` VALUES (11880, '1745048678', '1', 0, NULL, NULL, 1, 'FLUAE6RD');
INSERT INTO `ob_kalman` VALUES (11881, '1745048678', '1', 0, NULL, NULL, 1, '9E8YDH0T');
INSERT INTO `ob_kalman` VALUES (11882, '1745048678', '1', 0, NULL, NULL, 1, '92IAO6A2');
INSERT INTO `ob_kalman` VALUES (11883, '1745048678', '1', 0, NULL, NULL, 1, 'LN204OK5');
INSERT INTO `ob_kalman` VALUES (11884, '1745048678', '1', 0, NULL, NULL, 1, '818CMMGW');
INSERT INTO `ob_kalman` VALUES (11885, '1745048678', '1', 0, NULL, NULL, 1, '5ON6E5RH');
INSERT INTO `ob_kalman` VALUES (11886, '1745048678', '1', 0, NULL, NULL, 1, 'E0VVNGXV');
INSERT INTO `ob_kalman` VALUES (11887, '1745048678', '1', 0, NULL, NULL, 1, 'SH9TV40B');
INSERT INTO `ob_kalman` VALUES (11888, '1745048678', '1', 0, NULL, NULL, 1, '7WPQVROA');
INSERT INTO `ob_kalman` VALUES (11889, '1745048678', '1', 0, NULL, NULL, 1, 'TDGE8RWX');
INSERT INTO `ob_kalman` VALUES (11890, '1745048678', '1', 0, NULL, NULL, 1, 'MKIKVCCJ');
INSERT INTO `ob_kalman` VALUES (11891, '1745048678', '1', 0, NULL, NULL, 1, 'TUYVHEBO');
INSERT INTO `ob_kalman` VALUES (11892, '1745048678', '1', 0, NULL, NULL, 1, '6LXLAPX3');
INSERT INTO `ob_kalman` VALUES (11893, '1745048678', '1', 0, NULL, NULL, 1, '6OM1MTC1');
INSERT INTO `ob_kalman` VALUES (11894, '1745048678', '1', 0, NULL, NULL, 1, 'S1AT2CMY');
INSERT INTO `ob_kalman` VALUES (11895, '1745048678', '1', 0, NULL, NULL, 1, '96UR74YR');
INSERT INTO `ob_kalman` VALUES (11896, '1745048678', '1', 0, NULL, NULL, 1, 'PIQOEKIN');
INSERT INTO `ob_kalman` VALUES (11897, '1745048678', '1', 0, NULL, NULL, 1, 'HEW0NTJT');
INSERT INTO `ob_kalman` VALUES (11898, '1745048678', '1', 0, NULL, NULL, 1, 'YEXH15KO');
INSERT INTO `ob_kalman` VALUES (11899, '1745048678', '1', 0, NULL, NULL, 1, '8M6CT1R9');
INSERT INTO `ob_kalman` VALUES (11900, '1745048678', '1', 0, NULL, NULL, 1, 'F1N4I9F3');
INSERT INTO `ob_kalman` VALUES (11901, '1745048678', '1', 0, NULL, NULL, 1, 'MVT8SS4J');
INSERT INTO `ob_kalman` VALUES (11902, '1745048678', '1', 0, NULL, NULL, 1, 'VITIIN4B');
INSERT INTO `ob_kalman` VALUES (11903, '1745048678', '1', 0, NULL, NULL, 1, 'SIH79L7Q');
INSERT INTO `ob_kalman` VALUES (11904, '1745048678', '1', 0, NULL, NULL, 1, 'QAO2P0OK');
INSERT INTO `ob_kalman` VALUES (11905, '1745048678', '1', 0, NULL, NULL, 1, '9IUG4ME5');
INSERT INTO `ob_kalman` VALUES (11906, '1745048678', '1', 0, NULL, NULL, 1, 'OVXQ5BSE');
INSERT INTO `ob_kalman` VALUES (11907, '1745048678', '1', 0, NULL, NULL, 1, 'MGOG0I5C');
INSERT INTO `ob_kalman` VALUES (11908, '1745048678', '1', 0, NULL, NULL, 1, 'QCPQAKOC');
INSERT INTO `ob_kalman` VALUES (11909, '1745048678', '1', 0, NULL, NULL, 1, 'TVUMKMGA');
INSERT INTO `ob_kalman` VALUES (11910, '1745048678', '1', 0, NULL, NULL, 1, '4XA7TE2N');
INSERT INTO `ob_kalman` VALUES (11911, '1745048678', '1', 0, NULL, NULL, 1, 'MUAU37VW');
INSERT INTO `ob_kalman` VALUES (11912, '1745048678', '1', 0, NULL, NULL, 1, 'RPS9050D');
INSERT INTO `ob_kalman` VALUES (11913, '1745048678', '1', 0, NULL, NULL, 1, 'J3QOYDP8');
INSERT INTO `ob_kalman` VALUES (11914, '1745048678', '1', 0, NULL, NULL, 1, 'BJM7YM3B');
INSERT INTO `ob_kalman` VALUES (11915, '1745048678', '1', 0, NULL, NULL, 1, 'ANTQ5WYV');
INSERT INTO `ob_kalman` VALUES (11916, '1745048678', '1', 0, NULL, NULL, 1, 'RS0SV8P1');
INSERT INTO `ob_kalman` VALUES (11917, '1745048678', '1', 0, NULL, NULL, 1, 'IPBLJFBB');
INSERT INTO `ob_kalman` VALUES (11918, '1745048678', '1', 0, NULL, NULL, 1, 'HPF31274');
INSERT INTO `ob_kalman` VALUES (11919, '1745048678', '1', 0, NULL, NULL, 1, 'P0UPKU32');
INSERT INTO `ob_kalman` VALUES (11920, '1745048678', '1', 0, NULL, NULL, 1, '4JX81I9F');
INSERT INTO `ob_kalman` VALUES (11921, '1745048678', '1', 0, NULL, NULL, 1, '6U5EEPLR');
INSERT INTO `ob_kalman` VALUES (11922, '1745048678', '1', 0, NULL, NULL, 1, 'DQQ44Y1V');
INSERT INTO `ob_kalman` VALUES (11923, '1745048678', '1', 0, NULL, NULL, 1, '13QC5GOI');
INSERT INTO `ob_kalman` VALUES (11924, '1745048678', '1', 0, NULL, NULL, 1, 'QAH52Q86');
INSERT INTO `ob_kalman` VALUES (11925, '1745048678', '1', 0, NULL, NULL, 1, 'W5X3048P');
INSERT INTO `ob_kalman` VALUES (11926, '1745048678', '1', 0, NULL, NULL, 1, 'N1MR9W6P');
INSERT INTO `ob_kalman` VALUES (11927, '1745048678', '1', 0, NULL, NULL, 1, 'UW5OOTW5');
INSERT INTO `ob_kalman` VALUES (11928, '1745048678', '1', 0, NULL, NULL, 1, 'LMB5OXGJ');
INSERT INTO `ob_kalman` VALUES (11929, '1745048678', '1', 0, NULL, NULL, 1, 'TOE2OOQO');
INSERT INTO `ob_kalman` VALUES (11930, '1745048678', '1', 0, NULL, NULL, 1, 'O2M9SOLJ');
INSERT INTO `ob_kalman` VALUES (11931, '1745048678', '1', 0, NULL, NULL, 1, 'LQAW4TNC');
INSERT INTO `ob_kalman` VALUES (11932, '1745048678', '1', 0, NULL, NULL, 1, 'TVMOYLD2');
INSERT INTO `ob_kalman` VALUES (11933, '1745048678', '1', 0, NULL, NULL, 1, '75Y2Q9ED');
INSERT INTO `ob_kalman` VALUES (11934, '1745048678', '1', 0, NULL, NULL, 1, '2EW3RYVT');
INSERT INTO `ob_kalman` VALUES (11935, '1745048678', '1', 0, NULL, NULL, 1, '03BTOACF');
INSERT INTO `ob_kalman` VALUES (11936, '1745048678', '1', 0, NULL, NULL, 1, 'O36ACIYD');
INSERT INTO `ob_kalman` VALUES (11937, '1745048678', '1', 0, NULL, NULL, 1, 'TGAWIU8A');
INSERT INTO `ob_kalman` VALUES (11938, '1745048678', '1', 0, NULL, NULL, 1, 'HGOTBTF5');
INSERT INTO `ob_kalman` VALUES (11939, '1745048678', '1', 0, NULL, NULL, 1, 'XWIAL1OK');
INSERT INTO `ob_kalman` VALUES (11940, '1745048678', '1', 0, NULL, NULL, 1, '2KOWHY9N');
INSERT INTO `ob_kalman` VALUES (11941, '1745048678', '1', 0, NULL, NULL, 1, 'U674WVRT');
INSERT INTO `ob_kalman` VALUES (11942, '1745048678', '1', 0, NULL, NULL, 1, 'NIY5Y529');
INSERT INTO `ob_kalman` VALUES (11943, '1745048678', '1', 0, NULL, NULL, 1, 'V8OIJ8G3');
INSERT INTO `ob_kalman` VALUES (11944, '1745048678', '1', 0, NULL, NULL, 1, 'NPQ7J5EY');
INSERT INTO `ob_kalman` VALUES (11945, '1745048678', '1', 0, NULL, NULL, 1, 'NAMGI6TD');
INSERT INTO `ob_kalman` VALUES (11946, '1745048678', '1', 0, NULL, NULL, 1, 'A8578BO9');
INSERT INTO `ob_kalman` VALUES (11947, '1745048678', '1', 0, NULL, NULL, 1, '6TOYVX8R');
INSERT INTO `ob_kalman` VALUES (11948, '1745048678', '1', 0, NULL, NULL, 1, 'P2EEAY9J');
INSERT INTO `ob_kalman` VALUES (11949, '1745048678', '1', 0, NULL, NULL, 1, '8NBCE7HA');
INSERT INTO `ob_kalman` VALUES (11950, '1745048678', '1', 0, NULL, NULL, 1, 'LIXQENWD');
INSERT INTO `ob_kalman` VALUES (11951, '1745048678', '1', 0, NULL, NULL, 1, 'HNKK277D');
INSERT INTO `ob_kalman` VALUES (11952, '1745048678', '1', 0, NULL, NULL, 1, '8L4917O9');
INSERT INTO `ob_kalman` VALUES (11953, '1745048678', '1', 0, NULL, NULL, 1, 'HGTX0126');
INSERT INTO `ob_kalman` VALUES (11954, '1745048678', '1', 0, NULL, NULL, 1, 'TEIOX1LQ');
INSERT INTO `ob_kalman` VALUES (11955, '1745048678', '1', 0, NULL, NULL, 1, 'ER501IC7');
INSERT INTO `ob_kalman` VALUES (11956, '1745048678', '1', 0, NULL, NULL, 1, '5MOSLCXS');
INSERT INTO `ob_kalman` VALUES (11957, '1745048678', '1', 0, NULL, NULL, 1, 'MHDVGDDX');
INSERT INTO `ob_kalman` VALUES (11958, '1745048678', '1', 0, NULL, NULL, 1, 'XJ03B8BY');
INSERT INTO `ob_kalman` VALUES (11959, '1745048678', '1', 0, NULL, NULL, 1, 'XKOMCJSP');
INSERT INTO `ob_kalman` VALUES (11960, '1745048678', '1', 0, NULL, NULL, 1, 'NNH11JJN');
INSERT INTO `ob_kalman` VALUES (11961, '1745048678', '1', 0, NULL, NULL, 1, 'F529EJ1A');
INSERT INTO `ob_kalman` VALUES (11962, '1745048678', '1', 0, NULL, NULL, 1, 'LFSQMEES');
INSERT INTO `ob_kalman` VALUES (11963, '1745048678', '1', 0, NULL, NULL, 1, 'OEHPTGOI');
INSERT INTO `ob_kalman` VALUES (11964, '1745048678', '1', 0, NULL, NULL, 1, 'AIVB7MC6');
INSERT INTO `ob_kalman` VALUES (11965, '1745048678', '1', 0, NULL, NULL, 1, '7RU767WV');
INSERT INTO `ob_kalman` VALUES (11966, '1745048678', '1', 0, NULL, NULL, 1, 'II661PKI');
INSERT INTO `ob_kalman` VALUES (11967, '1745048678', '1', 0, NULL, NULL, 1, 'P6B6OJIS');
INSERT INTO `ob_kalman` VALUES (11968, '1745048678', '1', 0, NULL, NULL, 1, 'U7R3LMFI');
INSERT INTO `ob_kalman` VALUES (11969, '1745048678', '1', 0, NULL, NULL, 1, 'LNGPYG3A');
INSERT INTO `ob_kalman` VALUES (11970, '1745048678', '1', 0, NULL, NULL, 1, 'WNIQAWDK');
INSERT INTO `ob_kalman` VALUES (11971, '1745048678', '1', 0, NULL, NULL, 1, 'CI54P650');
INSERT INTO `ob_kalman` VALUES (11972, '1745048678', '1', 0, NULL, NULL, 1, '70CXIPHY');
INSERT INTO `ob_kalman` VALUES (11973, '1745048678', '1', 0, NULL, NULL, 1, '72YGX0PR');
INSERT INTO `ob_kalman` VALUES (11974, '1745048678', '1', 0, NULL, NULL, 1, 'LMYP4FSI');
INSERT INTO `ob_kalman` VALUES (11975, '1745048678', '1', 0, NULL, NULL, 1, 'OY7B4IDR');
INSERT INTO `ob_kalman` VALUES (11976, '1745048678', '1', 0, NULL, NULL, 1, 'XIDRA25D');
INSERT INTO `ob_kalman` VALUES (11977, '1745048678', '1', 0, NULL, NULL, 1, 'AETLL28W');
INSERT INTO `ob_kalman` VALUES (11978, '1745048678', '1', 0, NULL, NULL, 1, 'BU15PXKR');
INSERT INTO `ob_kalman` VALUES (11979, '1745048678', '1', 0, NULL, NULL, 1, 'AUGQLTOH');
INSERT INTO `ob_kalman` VALUES (11980, '1745048678', '1', 0, NULL, NULL, 1, 'N3Y9BWED');
INSERT INTO `ob_kalman` VALUES (11981, '1745048678', '1', 0, NULL, NULL, 1, 'Y1S433FQ');
INSERT INTO `ob_kalman` VALUES (11982, '1745048678', '1', 0, NULL, NULL, 1, 'PIUOHRW1');
INSERT INTO `ob_kalman` VALUES (11983, '1745048678', '1', 0, NULL, NULL, 1, 'IF33OXXY');
INSERT INTO `ob_kalman` VALUES (11984, '1745048678', '1', 0, NULL, NULL, 1, 'HERN0LMS');
INSERT INTO `ob_kalman` VALUES (11985, '1745048678', '1', 0, NULL, NULL, 1, 'IWGWTE4B');
INSERT INTO `ob_kalman` VALUES (11986, '1745048678', '1', 0, NULL, NULL, 1, 'HLRABPG0');
INSERT INTO `ob_kalman` VALUES (11987, '1745048678', '1', 0, NULL, NULL, 1, 'NWAXY5TV');
INSERT INTO `ob_kalman` VALUES (11988, '1745048678', '1', 0, NULL, NULL, 1, '205UQ33M');
INSERT INTO `ob_kalman` VALUES (11989, '1745048678', '1', 0, NULL, NULL, 1, 'A2159N5W');
INSERT INTO `ob_kalman` VALUES (11990, '1745048678', '1', 0, NULL, NULL, 1, 'OF4TNSWF');
INSERT INTO `ob_kalman` VALUES (11991, '1745048678', '1', 0, NULL, NULL, 1, 'KYJ8OT6J');
INSERT INTO `ob_kalman` VALUES (11992, '1745048678', '1', 0, NULL, NULL, 1, 'GAUIKGR6');
INSERT INTO `ob_kalman` VALUES (11993, '1745048678', '1', 0, NULL, NULL, 1, 'N6WD60LI');
INSERT INTO `ob_kalman` VALUES (11994, '1745048678', '1', 0, NULL, NULL, 1, '0GXKFR1J');
INSERT INTO `ob_kalman` VALUES (11995, '1745048678', '1', 0, NULL, NULL, 1, 'PL26BFM3');
INSERT INTO `ob_kalman` VALUES (11996, '1745048678', '1', 0, NULL, NULL, 1, 'CB52PPDQ');
INSERT INTO `ob_kalman` VALUES (11997, '1745048678', '1', 0, NULL, NULL, 1, 'RER1OEXA');
INSERT INTO `ob_kalman` VALUES (11998, '1745048678', '1', 0, NULL, NULL, 1, 'JITRX5JF');
INSERT INTO `ob_kalman` VALUES (11999, '1745048678', '1', 0, NULL, NULL, 1, 'D8Q23GSS');
INSERT INTO `ob_kalman` VALUES (12000, '1745048678', '1', 0, NULL, NULL, 1, 'O9AMLPSH');
INSERT INTO `ob_kalman` VALUES (12001, '1745048678', '1', 0, NULL, NULL, 1, 'JGHFPWRC');
INSERT INTO `ob_kalman` VALUES (12002, '1745048678', '1', 0, NULL, NULL, 1, '59W9YU0Q');
INSERT INTO `ob_kalman` VALUES (12003, '1745048678', '1', 0, NULL, NULL, 1, 'KOPXUD7F');
INSERT INTO `ob_kalman` VALUES (12004, '1745048678', '1', 0, NULL, NULL, 1, '9H31FVEX');
INSERT INTO `ob_kalman` VALUES (12005, '1745048678', '1', 0, NULL, NULL, 1, 'PEBQ8OK8');
INSERT INTO `ob_kalman` VALUES (12006, '1745048678', '1', 0, NULL, NULL, 1, 'ALO3QX5J');
INSERT INTO `ob_kalman` VALUES (12007, '1745048678', '1', 0, NULL, NULL, 1, 'X9J0F7CM');
INSERT INTO `ob_kalman` VALUES (12008, '1745048678', '1', 0, NULL, NULL, 1, '44OI73WH');
INSERT INTO `ob_kalman` VALUES (12009, '1745048678', '1', 0, NULL, NULL, 1, '8UX5BOJD');
INSERT INTO `ob_kalman` VALUES (12010, '1745048678', '1', 0, NULL, NULL, 1, '7ONLXA5X');
INSERT INTO `ob_kalman` VALUES (12011, '1745048678', '1', 0, NULL, NULL, 1, '677XS734');
INSERT INTO `ob_kalman` VALUES (12012, '1745048678', '1', 0, NULL, NULL, 1, '1602QSQ1');
INSERT INTO `ob_kalman` VALUES (12013, '1745048678', '1', 0, NULL, NULL, 1, 'DQJYYIT5');
INSERT INTO `ob_kalman` VALUES (12014, '1745048678', '1', 0, NULL, NULL, 1, 'Y8JD1KY6');
INSERT INTO `ob_kalman` VALUES (12015, '1745048678', '1', 0, NULL, NULL, 1, 'MHHYOI7K');
INSERT INTO `ob_kalman` VALUES (12016, '1745048678', '1', 0, NULL, NULL, 1, 'YKS2QN6T');
INSERT INTO `ob_kalman` VALUES (12017, '1745048678', '1', 0, NULL, NULL, 1, 'SYCJ55W1');
INSERT INTO `ob_kalman` VALUES (12018, '1745048678', '1', 0, NULL, NULL, 1, 'EKLM4GU4');
INSERT INTO `ob_kalman` VALUES (12019, '1745048678', '1', 0, NULL, NULL, 1, 'MAB7I98J');
INSERT INTO `ob_kalman` VALUES (12020, '1745048678', '1', 0, NULL, NULL, 1, 'OPJDBPY2');
INSERT INTO `ob_kalman` VALUES (12021, '1745048678', '1', 0, NULL, NULL, 1, '820TR0KJ');
INSERT INTO `ob_kalman` VALUES (12022, '1745048678', '1', 0, NULL, NULL, 1, 'POPMM0CO');
INSERT INTO `ob_kalman` VALUES (12023, '1745048678', '1', 0, NULL, NULL, 1, '8LHW6HR6');
INSERT INTO `ob_kalman` VALUES (12024, '1745048678', '1', 0, NULL, NULL, 1, 'ILPF3N73');
INSERT INTO `ob_kalman` VALUES (12025, '1745048678', '1', 0, NULL, NULL, 1, '8YV1YNFA');
INSERT INTO `ob_kalman` VALUES (12026, '1745048678', '1', 0, NULL, NULL, 1, 'YO3BNTKY');
INSERT INTO `ob_kalman` VALUES (12027, '1745048678', '1', 0, NULL, NULL, 1, 'VHY7QOIO');
INSERT INTO `ob_kalman` VALUES (12028, '1745048678', '1', 0, NULL, NULL, 1, 'GYM16FYC');
INSERT INTO `ob_kalman` VALUES (12029, '1745048678', '1', 0, NULL, NULL, 1, '51CJLP14');
INSERT INTO `ob_kalman` VALUES (12030, '1745048678', '1', 0, NULL, NULL, 1, '23RIABI1');
INSERT INTO `ob_kalman` VALUES (12031, '1745048678', '1', 0, NULL, NULL, 1, 'IM21DVKO');
INSERT INTO `ob_kalman` VALUES (12032, '1745048678', '1', 0, NULL, NULL, 1, 'QW1LGA4Y');
INSERT INTO `ob_kalman` VALUES (12033, '1745048678', '1', 0, NULL, NULL, 1, 'X7K1YORI');
INSERT INTO `ob_kalman` VALUES (12034, '1745048678', '1', 0, NULL, NULL, 1, 'QNLPPOW3');
INSERT INTO `ob_kalman` VALUES (12035, '1745048678', '1', 0, NULL, NULL, 1, 'GAKI2FRI');
INSERT INTO `ob_kalman` VALUES (12036, '1745048678', '1', 0, NULL, NULL, 1, 'TGP8HR7N');
INSERT INTO `ob_kalman` VALUES (12037, '1745048678', '1', 0, NULL, NULL, 1, 'W6NID2BO');
INSERT INTO `ob_kalman` VALUES (12038, '1745048678', '1', 0, NULL, NULL, 1, 'F11LJQ3W');
INSERT INTO `ob_kalman` VALUES (12039, '1745048678', '1', 0, NULL, NULL, 1, '3E2946HB');
INSERT INTO `ob_kalman` VALUES (12040, '1745048678', '1', 0, NULL, NULL, 1, '51OXP26L');
INSERT INTO `ob_kalman` VALUES (12041, '1745048678', '1', 0, NULL, NULL, 1, 'WCH630LF');
INSERT INTO `ob_kalman` VALUES (12042, '1745048678', '1', 0, NULL, NULL, 1, 'E3BE4NCR');
INSERT INTO `ob_kalman` VALUES (12043, '1745048678', '1', 0, NULL, NULL, 1, 'W9OGHCHB');
INSERT INTO `ob_kalman` VALUES (12044, '1745048678', '1', 0, NULL, NULL, 1, 'S0WLRBD3');
INSERT INTO `ob_kalman` VALUES (12045, '1745048678', '1', 0, NULL, NULL, 1, '5G6IF4EM');
INSERT INTO `ob_kalman` VALUES (12046, '1745048678', '1', 0, NULL, NULL, 1, 'C18LV380');
INSERT INTO `ob_kalman` VALUES (12047, '1745048678', '1', 0, NULL, NULL, 1, '6IPDC3O4');
INSERT INTO `ob_kalman` VALUES (12048, '1745048678', '1', 0, NULL, NULL, 1, 'IU6F6RWF');
INSERT INTO `ob_kalman` VALUES (12049, '1745048678', '1', 0, NULL, NULL, 1, 'OOP4V9M7');
INSERT INTO `ob_kalman` VALUES (12050, '1745048678', '1', 0, NULL, NULL, 1, 'K93FELXT');
INSERT INTO `ob_kalman` VALUES (12051, '1745048678', '1', 0, NULL, NULL, 1, 'PTM5CRR9');
INSERT INTO `ob_kalman` VALUES (12052, '1745048678', '1', 0, NULL, NULL, 1, 'VGV4XGO9');
INSERT INTO `ob_kalman` VALUES (12053, '1745048678', '1', 0, NULL, NULL, 1, 'X5XN2K8T');
INSERT INTO `ob_kalman` VALUES (12054, '1745048678', '1', 0, NULL, NULL, 1, 'JQLXFXO1');
INSERT INTO `ob_kalman` VALUES (12055, '1745048678', '1', 0, NULL, NULL, 1, 'V89L46FX');
INSERT INTO `ob_kalman` VALUES (12056, '1745048678', '1', 0, NULL, NULL, 1, 'RI67G99O');
INSERT INTO `ob_kalman` VALUES (12057, '1745048678', '1', 0, NULL, NULL, 1, '9VA1VPU9');
INSERT INTO `ob_kalman` VALUES (12058, '1745048678', '1', 0, NULL, NULL, 1, 'OATOP6W4');
INSERT INTO `ob_kalman` VALUES (12059, '1745048678', '1', 0, NULL, NULL, 1, 'QOTFPKB5');
INSERT INTO `ob_kalman` VALUES (12060, '1745048678', '1', 0, NULL, NULL, 1, 'GNER1EB5');
INSERT INTO `ob_kalman` VALUES (12061, '1745048678', '1', 0, NULL, NULL, 1, '4Y7ISMTA');
INSERT INTO `ob_kalman` VALUES (12062, '1745048678', '1', 0, NULL, NULL, 1, 'NNR446L6');
INSERT INTO `ob_kalman` VALUES (12063, '1745048678', '1', 0, NULL, NULL, 1, 'W4DOLUCI');
INSERT INTO `ob_kalman` VALUES (12064, '1745048678', '1', 0, NULL, NULL, 1, '0HPS5047');
INSERT INTO `ob_kalman` VALUES (12065, '1745048678', '1', 0, NULL, NULL, 1, 'XCJCOR8U');
INSERT INTO `ob_kalman` VALUES (12066, '1745048678', '1', 0, NULL, NULL, 1, '29DORCM8');
INSERT INTO `ob_kalman` VALUES (12067, '1745048678', '1', 0, NULL, NULL, 1, 'V6FUEATL');
INSERT INTO `ob_kalman` VALUES (12068, '1745048678', '1', 0, NULL, NULL, 1, '5K1M7GCQ');
INSERT INTO `ob_kalman` VALUES (12069, '1745048678', '1', 0, NULL, NULL, 1, 'R7IEX2VA');
INSERT INTO `ob_kalman` VALUES (12070, '1745048678', '1', 0, NULL, NULL, 1, 'FF7TFP07');
INSERT INTO `ob_kalman` VALUES (12071, '1745048678', '1', 0, NULL, NULL, 1, '6CKMEAET');
INSERT INTO `ob_kalman` VALUES (12072, '1745048678', '1', 0, NULL, NULL, 1, 'WK616IAA');
INSERT INTO `ob_kalman` VALUES (12073, '1745048678', '1', 0, NULL, NULL, 1, '5LOFHOSM');
INSERT INTO `ob_kalman` VALUES (12074, '1745048678', '1', 0, NULL, NULL, 1, 'X75EB75R');
INSERT INTO `ob_kalman` VALUES (12075, '1745048678', '1', 0, NULL, NULL, 1, 'QAS1D8OY');
INSERT INTO `ob_kalman` VALUES (12076, '1745048678', '1', 0, NULL, NULL, 1, 'UVKCMFEH');
INSERT INTO `ob_kalman` VALUES (12077, '1745048678', '1', 0, NULL, NULL, 1, 'X34P1U2L');
INSERT INTO `ob_kalman` VALUES (12078, '1745048678', '1', 0, NULL, NULL, 1, 'UO2QPOKY');
INSERT INTO `ob_kalman` VALUES (12079, '1745048678', '1', 0, NULL, NULL, 1, 'RATJ4CWW');
INSERT INTO `ob_kalman` VALUES (12080, '1745048678', '1', 0, NULL, NULL, 1, 'RVN5RJOH');
INSERT INTO `ob_kalman` VALUES (12081, '1745048678', '1', 0, NULL, NULL, 1, 'HRI71S9L');
INSERT INTO `ob_kalman` VALUES (12082, '1745048678', '1', 0, NULL, NULL, 1, 'R874DG9N');
INSERT INTO `ob_kalman` VALUES (12083, '1745048678', '1', 0, NULL, NULL, 1, 'BJCBXWXU');
INSERT INTO `ob_kalman` VALUES (12084, '1745048678', '1', 0, NULL, NULL, 1, '037MWC8I');
INSERT INTO `ob_kalman` VALUES (12085, '1745048678', '1', 0, NULL, NULL, 1, 'LOAY7KCI');
INSERT INTO `ob_kalman` VALUES (12086, '1745048678', '1', 0, NULL, NULL, 1, '29XJ7HG9');
INSERT INTO `ob_kalman` VALUES (12087, '1745048678', '1', 0, NULL, NULL, 1, 'KVUXCBGK');
INSERT INTO `ob_kalman` VALUES (12088, '1745048678', '1', 0, NULL, NULL, 1, '28K9RJOA');
INSERT INTO `ob_kalman` VALUES (12089, '1745048678', '1', 0, NULL, NULL, 1, '6G6TJUTD');
INSERT INTO `ob_kalman` VALUES (12090, '1745048678', '1', 0, NULL, NULL, 1, 'N27XY9UF');
INSERT INTO `ob_kalman` VALUES (12091, '1745048678', '1', 0, NULL, NULL, 1, '4OB3QM2W');
INSERT INTO `ob_kalman` VALUES (12092, '1745048678', '1', 0, NULL, NULL, 1, 'ASUKSB22');
INSERT INTO `ob_kalman` VALUES (12093, '1745048678', '1', 0, NULL, NULL, 1, 'RC3G43M5');
INSERT INTO `ob_kalman` VALUES (12094, '1745048678', '1', 0, NULL, NULL, 1, 'LAJ80O5U');
INSERT INTO `ob_kalman` VALUES (12095, '1745048678', '1', 0, NULL, NULL, 1, 'S1GPXOR8');
INSERT INTO `ob_kalman` VALUES (12096, '1745048678', '1', 0, NULL, NULL, 1, 'EPJ1QKWW');
INSERT INTO `ob_kalman` VALUES (12097, '1745048678', '1', 0, NULL, NULL, 1, '9TAGLRGG');
INSERT INTO `ob_kalman` VALUES (12098, '1745048678', '1', 0, NULL, NULL, 1, 'KSH623L1');
INSERT INTO `ob_kalman` VALUES (12099, '1745048678', '1', 0, NULL, NULL, 1, 'PQKAOYKA');
INSERT INTO `ob_kalman` VALUES (12100, '1745048678', '1', 0, NULL, NULL, 1, 'ERI80AGX');
INSERT INTO `ob_kalman` VALUES (12101, '1745048678', '1', 0, NULL, NULL, 1, 'E2A3P3Y4');
INSERT INTO `ob_kalman` VALUES (12102, '1745048678', '1', 0, NULL, NULL, 1, 'AV34WEGE');
INSERT INTO `ob_kalman` VALUES (12103, '1745048678', '1', 0, NULL, NULL, 1, 'GY56JOLK');
INSERT INTO `ob_kalman` VALUES (12104, '1745048678', '1', 0, NULL, NULL, 1, '61SD4FAT');
INSERT INTO `ob_kalman` VALUES (12105, '1745048678', '1', 0, NULL, NULL, 1, 'E1VHMYO2');
INSERT INTO `ob_kalman` VALUES (12106, '1745048678', '1', 0, NULL, NULL, 1, 'P78VQWF9');
INSERT INTO `ob_kalman` VALUES (12107, '1745048678', '1', 0, NULL, NULL, 1, 'QOI0Q0UA');
INSERT INTO `ob_kalman` VALUES (12108, '1745048678', '1', 0, NULL, NULL, 1, 'ON2YWC4M');
INSERT INTO `ob_kalman` VALUES (12109, '1745048678', '1', 0, NULL, NULL, 1, 'ARYF4AMF');
INSERT INTO `ob_kalman` VALUES (12110, '1745048678', '1', 0, NULL, NULL, 1, 'PKLXTL9O');
INSERT INTO `ob_kalman` VALUES (12111, '1745048678', '1', 0, NULL, NULL, 1, '7QUQSW9W');
INSERT INTO `ob_kalman` VALUES (12112, '1745048678', '1', 0, NULL, NULL, 1, 'CKCGHAWA');
INSERT INTO `ob_kalman` VALUES (12113, '1745048678', '1', 0, NULL, NULL, 1, 'ETAKAX5V');
INSERT INTO `ob_kalman` VALUES (12114, '1745048678', '1', 0, NULL, NULL, 1, '8P4OO6V7');
INSERT INTO `ob_kalman` VALUES (12115, '1745048678', '1', 0, NULL, NULL, 1, 'LYEW4REK');
INSERT INTO `ob_kalman` VALUES (12116, '1745048678', '1', 0, NULL, NULL, 1, 'RMAMDO10');
INSERT INTO `ob_kalman` VALUES (12117, '1745048678', '1', 0, NULL, NULL, 1, 'TRVLBYQH');
INSERT INTO `ob_kalman` VALUES (12118, '1745048678', '1', 0, NULL, NULL, 1, 'KCB82OUV');
INSERT INTO `ob_kalman` VALUES (12119, '1745048678', '1', 0, NULL, NULL, 1, '8CJL12IL');
INSERT INTO `ob_kalman` VALUES (12120, '1745048678', '1', 0, NULL, NULL, 1, '7XTROABJ');
INSERT INTO `ob_kalman` VALUES (12121, '1745048678', '1', 0, NULL, NULL, 1, 'WETQSPDI');
INSERT INTO `ob_kalman` VALUES (12122, '1745048678', '1', 0, NULL, NULL, 1, 'G424L50C');
INSERT INTO `ob_kalman` VALUES (12123, '1745048678', '1', 0, NULL, NULL, 1, 'F1DLR9OV');
INSERT INTO `ob_kalman` VALUES (12124, '1745048678', '1', 0, NULL, NULL, 1, '6J7GF894');
INSERT INTO `ob_kalman` VALUES (12125, '1745048678', '1', 0, NULL, NULL, 1, '5FC8W9GP');
INSERT INTO `ob_kalman` VALUES (12126, '1745048678', '1', 0, NULL, NULL, 1, 'RV4ON3KJ');
INSERT INTO `ob_kalman` VALUES (12127, '1745048678', '1', 0, NULL, NULL, 1, 'XY736929');
INSERT INTO `ob_kalman` VALUES (12128, '1745048678', '1', 0, NULL, NULL, 1, 'XJ9GDD70');
INSERT INTO `ob_kalman` VALUES (12129, '1745048678', '1', 0, NULL, NULL, 1, 'KR8WOC8Q');
INSERT INTO `ob_kalman` VALUES (12130, '1745048678', '1', 0, NULL, NULL, 1, 'KVHMG91C');
INSERT INTO `ob_kalman` VALUES (12131, '1745048678', '1', 0, NULL, NULL, 1, '5OYYG0SB');
INSERT INTO `ob_kalman` VALUES (12132, '1745048678', '1', 0, NULL, NULL, 1, '7HE5YS9O');
INSERT INTO `ob_kalman` VALUES (12133, '1745048678', '1', 0, NULL, NULL, 1, '5NMJL06X');
INSERT INTO `ob_kalman` VALUES (12134, '1745048678', '1', 0, NULL, NULL, 1, 'T22K306E');
INSERT INTO `ob_kalman` VALUES (12135, '1745048678', '1', 0, NULL, NULL, 1, 'SCL5E5DX');
INSERT INTO `ob_kalman` VALUES (12136, '1745048678', '1', 0, NULL, NULL, 1, '7EV48JQE');
INSERT INTO `ob_kalman` VALUES (12137, '1745048678', '1', 0, NULL, NULL, 1, 'YQY1AMAG');
INSERT INTO `ob_kalman` VALUES (12138, '1745048678', '1', 0, NULL, NULL, 1, '88PFX0K3');
INSERT INTO `ob_kalman` VALUES (12139, '1745048678', '1', 0, NULL, NULL, 1, 'LYRU9T4O');
INSERT INTO `ob_kalman` VALUES (12140, '1745048678', '1', 0, NULL, NULL, 1, 'Y2AHOF9N');
INSERT INTO `ob_kalman` VALUES (12141, '1745048678', '1', 0, NULL, NULL, 1, 'NCRJC63N');
INSERT INTO `ob_kalman` VALUES (12142, '1745048678', '1', 0, NULL, NULL, 1, '2CDOEOI5');
INSERT INTO `ob_kalman` VALUES (12143, '1745048678', '1', 0, NULL, NULL, 1, '7MSMVGI4');
INSERT INTO `ob_kalman` VALUES (12144, '1745048678', '1', 0, NULL, NULL, 1, '04OLURMD');
INSERT INTO `ob_kalman` VALUES (12145, '1745048678', '1', 0, NULL, NULL, 1, 'FV0D3OMX');
INSERT INTO `ob_kalman` VALUES (12146, '1745048678', '1', 0, NULL, NULL, 1, 'OJ356FUF');
INSERT INTO `ob_kalman` VALUES (12147, '1745048678', '1', 0, NULL, NULL, 1, '3M3727K3');
INSERT INTO `ob_kalman` VALUES (12148, '1745048678', '1', 0, NULL, NULL, 1, 'XGOR72Q5');
INSERT INTO `ob_kalman` VALUES (12149, '1745048678', '1', 0, NULL, NULL, 1, 'SPCUFE29');
INSERT INTO `ob_kalman` VALUES (12150, '1745048678', '1', 0, NULL, NULL, 1, 'IPQDDSOE');
INSERT INTO `ob_kalman` VALUES (12151, '1745048678', '1', 0, NULL, NULL, 1, '1XJD51O9');
INSERT INTO `ob_kalman` VALUES (12152, '1745048678', '1', 0, NULL, NULL, 1, 'BDS020YH');
INSERT INTO `ob_kalman` VALUES (12153, '1745048678', '1', 0, NULL, NULL, 1, 'B4S27GD3');
INSERT INTO `ob_kalman` VALUES (12154, '1745048678', '1', 0, NULL, NULL, 1, 'WSBVQBOO');
INSERT INTO `ob_kalman` VALUES (12155, '1745048678', '1', 0, NULL, NULL, 1, 'XLJ97OWD');
INSERT INTO `ob_kalman` VALUES (12156, '1745048678', '1', 0, NULL, NULL, 1, 'W5VFPSJ3');
INSERT INTO `ob_kalman` VALUES (12157, '1745048678', '1', 0, NULL, NULL, 1, 'MCT0H7WF');
INSERT INTO `ob_kalman` VALUES (12158, '1745048678', '1', 0, NULL, NULL, 1, 'X5P6DXQK');
INSERT INTO `ob_kalman` VALUES (12159, '1745048678', '1', 0, NULL, NULL, 1, 'DG88YDSO');
INSERT INTO `ob_kalman` VALUES (12160, '1745048678', '1', 0, NULL, NULL, 1, 'OTIS1SNM');
INSERT INTO `ob_kalman` VALUES (12161, '1745048678', '1', 0, NULL, NULL, 1, 'LAU30MBQ');
INSERT INTO `ob_kalman` VALUES (12162, '1745048678', '1', 0, NULL, NULL, 1, 'RUMV9YAO');
INSERT INTO `ob_kalman` VALUES (12163, '1745048678', '1', 0, NULL, NULL, 1, 'A2QW8WVT');
INSERT INTO `ob_kalman` VALUES (12164, '1745048678', '1', 0, NULL, NULL, 1, 'T8XXW8V9');
INSERT INTO `ob_kalman` VALUES (12165, '1745048678', '1', 0, NULL, NULL, 1, 'OSUQY92J');
INSERT INTO `ob_kalman` VALUES (12166, '1745048678', '1', 0, NULL, NULL, 1, 'OSJWV29K');
INSERT INTO `ob_kalman` VALUES (12167, '1745048678', '1', 0, NULL, NULL, 1, '841JELLW');
INSERT INTO `ob_kalman` VALUES (12168, '1745048678', '1', 0, NULL, NULL, 1, 'UWOO1U8O');
INSERT INTO `ob_kalman` VALUES (12169, '1745048678', '1', 0, NULL, NULL, 1, 'XSG0599F');
INSERT INTO `ob_kalman` VALUES (12170, '1745048678', '1', 0, NULL, NULL, 1, 'DBUH8HOX');
INSERT INTO `ob_kalman` VALUES (12171, '1745048678', '1', 0, NULL, NULL, 1, 'LUXAWJKE');
INSERT INTO `ob_kalman` VALUES (12172, '1745048678', '1', 0, NULL, NULL, 1, '27AJQML3');
INSERT INTO `ob_kalman` VALUES (12173, '1745048678', '1', 0, NULL, NULL, 1, '6IOOV1EC');
INSERT INTO `ob_kalman` VALUES (12174, '1745048678', '1', 0, NULL, NULL, 1, '4NIHRP4Y');
INSERT INTO `ob_kalman` VALUES (12175, '1745048678', '1', 0, NULL, NULL, 1, 'TKB2JIO1');
INSERT INTO `ob_kalman` VALUES (12176, '1745048678', '1', 0, NULL, NULL, 1, 'NY5NFLXL');
INSERT INTO `ob_kalman` VALUES (12177, '1745048678', '1', 0, NULL, NULL, 1, 'CFKUIND1');
INSERT INTO `ob_kalman` VALUES (12178, '1745048678', '1', 0, NULL, NULL, 1, 'UVX3SYBC');
INSERT INTO `ob_kalman` VALUES (12179, '1745048678', '1', 0, NULL, NULL, 1, '7FJYW9BM');
INSERT INTO `ob_kalman` VALUES (12180, '1745048678', '1', 0, NULL, NULL, 1, 'D3SLDB5S');
INSERT INTO `ob_kalman` VALUES (12181, '1745048678', '1', 0, NULL, NULL, 1, '2JR4JARA');
INSERT INTO `ob_kalman` VALUES (12182, '1745048678', '1', 0, NULL, NULL, 1, 'R5TPRORC');
INSERT INTO `ob_kalman` VALUES (12183, '1745048678', '1', 0, NULL, NULL, 1, 'NT15MG4I');
INSERT INTO `ob_kalman` VALUES (12184, '1745048678', '1', 0, NULL, NULL, 1, 'FC486M7C');
INSERT INTO `ob_kalman` VALUES (12185, '1745048678', '1', 0, NULL, NULL, 1, 'FUCWXLRN');
INSERT INTO `ob_kalman` VALUES (12186, '1745048678', '1', 0, NULL, NULL, 1, 'KPIGN4KP');
INSERT INTO `ob_kalman` VALUES (12187, '1745048678', '1', 0, NULL, NULL, 1, 'NWGB7131');
INSERT INTO `ob_kalman` VALUES (12188, '1745048678', '1', 0, NULL, NULL, 1, 'O99L148W');
INSERT INTO `ob_kalman` VALUES (12189, '1745048678', '1', 0, NULL, NULL, 1, 'KYWAAP0S');
INSERT INTO `ob_kalman` VALUES (12190, '1745048678', '1', 0, NULL, NULL, 1, 'D20XMSCJ');
INSERT INTO `ob_kalman` VALUES (12191, '1745048678', '1', 0, NULL, NULL, 1, '6668MTGA');
INSERT INTO `ob_kalman` VALUES (12192, '1745048678', '1', 0, NULL, NULL, 1, 'VSN6M85T');
INSERT INTO `ob_kalman` VALUES (12193, '1745048678', '1', 0, NULL, NULL, 1, 'AJBFNTON');
INSERT INTO `ob_kalman` VALUES (12194, '1745048678', '1', 0, NULL, NULL, 1, 'V8846W84');
INSERT INTO `ob_kalman` VALUES (12195, '1745048678', '1', 0, NULL, NULL, 1, 'F7YUF7VK');
INSERT INTO `ob_kalman` VALUES (12196, '1745048678', '1', 0, NULL, NULL, 1, '9XAH9HKL');
INSERT INTO `ob_kalman` VALUES (12197, '1745048678', '1', 0, NULL, NULL, 1, 'YV98F3J2');
INSERT INTO `ob_kalman` VALUES (12198, '1745048678', '1', 0, NULL, NULL, 1, 'CR4JXY47');
INSERT INTO `ob_kalman` VALUES (12199, '1745048678', '1', 0, NULL, NULL, 1, 'K2UWKHV5');
INSERT INTO `ob_kalman` VALUES (12200, '1745048678', '1', 0, NULL, NULL, 1, 'MWXBMGL2');
INSERT INTO `ob_kalman` VALUES (12201, '1745048678', '1', 0, NULL, NULL, 1, 'D8KDUH4F');
INSERT INTO `ob_kalman` VALUES (12202, '1745048678', '1', 0, NULL, NULL, 1, '5G88HT4R');
INSERT INTO `ob_kalman` VALUES (12203, '1745048678', '1', 0, NULL, NULL, 1, 'G2O3U1MO');
INSERT INTO `ob_kalman` VALUES (12204, '1745048678', '1', 0, NULL, NULL, 1, 'CFFDMSX3');
INSERT INTO `ob_kalman` VALUES (12205, '1745048678', '1', 0, NULL, NULL, 1, 'PB6X8BNF');
INSERT INTO `ob_kalman` VALUES (12206, '1745048678', '1', 0, NULL, NULL, 1, 'UJ0H8B97');
INSERT INTO `ob_kalman` VALUES (12207, '1745048678', '1', 0, NULL, NULL, 1, 'BPRAEPOO');
INSERT INTO `ob_kalman` VALUES (12208, '1745048678', '1', 0, NULL, NULL, 1, '8DLSMFJE');
INSERT INTO `ob_kalman` VALUES (12209, '1745048678', '1', 0, NULL, NULL, 1, 'VNXDB8UU');
INSERT INTO `ob_kalman` VALUES (12210, '1745048678', '1', 0, NULL, NULL, 1, 'XBS60TK5');
INSERT INTO `ob_kalman` VALUES (12211, '1745048678', '1', 0, NULL, NULL, 1, 'Y827HSIU');
INSERT INTO `ob_kalman` VALUES (12212, '1745048678', '1', 0, NULL, NULL, 1, '0SV4MAUW');
INSERT INTO `ob_kalman` VALUES (12213, '1745048678', '1', 0, NULL, NULL, 1, 'CVOR0AOR');
INSERT INTO `ob_kalman` VALUES (12214, '1745048678', '1', 0, NULL, NULL, 1, 'T5MJRGIO');
INSERT INTO `ob_kalman` VALUES (12215, '1745048678', '1', 0, NULL, NULL, 1, 'R3D3LOO0');
INSERT INTO `ob_kalman` VALUES (12216, '1745048678', '1', 0, NULL, NULL, 1, '48K0ETPI');
INSERT INTO `ob_kalman` VALUES (12217, '1745048678', '1', 0, NULL, NULL, 1, '4JOFSNWU');
INSERT INTO `ob_kalman` VALUES (12218, '1745048678', '1', 0, NULL, NULL, 1, 'VRMI3526');
INSERT INTO `ob_kalman` VALUES (12219, '1745048678', '1', 1, 1780083867, '10219', 1, '1QVXOCFJ');
INSERT INTO `ob_kalman` VALUES (12220, '1745048678', '1', 0, NULL, NULL, 1, 'V1BIAJM6');
INSERT INTO `ob_kalman` VALUES (12222, '1745048678', '1', 1, 1745049103, '10213', 1, 'XS458FO6');
INSERT INTO `ob_kalman` VALUES (12223, '1745049199', '1', 1, 1745049215, '10213', 1000, 'LC5HQ8J7');
INSERT INTO `ob_kalman` VALUES (12224, '1745058375', '1', 1, 1745058536, '10214', 30000, '29SHOC8C');
INSERT INTO `ob_kalman` VALUES (12225, '1745077118', '1', 1, 1745077280, '10214', 3000, 'UCMJ42HU');
INSERT INTO `ob_kalman` VALUES (12226, '1779790118', '1', 1, 1779792360, '10218', 100, 'I76O1Y1V');

-- ----------------------------
-- Table structure for ob_luck
-- ----------------------------
DROP TABLE IF EXISTS `ob_luck`;
CREATE TABLE `ob_luck`  (
  `luck_id` int(11) NOT NULL AUTO_INCREMENT,
  `luck_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '玩法名称',
  `v` float NOT NULL DEFAULT 0 COMMENT '产生的概率',
  `luck_game` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发生所需抽中的选项',
  `number` int(11) NOT NULL,
  PRIMARY KEY (`luck_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_luck
-- ----------------------------
INSERT INTO `ob_luck` VALUES (1, '小三元', 3, '[[1,13],[7,19],[2,14]]', 2222);
INSERT INTO `ob_luck` VALUES (2, '大三元', 1, '[[16],[20],[8]]', 3333);
INSERT INTO `ob_luck` VALUES (3, '大四喜奖', 8, '[[5],[11],[17],[23]]', 4444);
INSERT INTO `ob_luck` VALUES (4, '仙女散花', 0.1, '', 0);
INSERT INTO `ob_luck` VALUES (5, '天龙八部', 0.1, '', 8888);
INSERT INTO `ob_luck` VALUES (6, '随机奖', 16, '', 3333);
INSERT INTO `ob_luck` VALUES (7, '开火车', 3, '', 0);
INSERT INTO `ob_luck` VALUES (8, '大满贯', 0, '', 999);
INSERT INTO `ob_luck` VALUES (9, '熄灯', 35, '', 99999);

-- ----------------------------
-- Table structure for ob_money
-- ----------------------------
DROP TABLE IF EXISTS `ob_money`;
CREATE TABLE `ob_money`  (
  `monery_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '发起提现用户id',
  `money` float NOT NULL DEFAULT 0 COMMENT '提现金额',
  `wx_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信号',
  `monery_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起时间',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0表示未提现，1已提现',
  `discount_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现时间',
  PRIMARY KEY (`monery_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_money
-- ----------------------------

-- ----------------------------
-- Table structure for ob_size
-- ----------------------------
DROP TABLE IF EXISTS `ob_size`;
CREATE TABLE `ob_size`  (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `v` int(11) NOT NULL COMMENT '中奖概率',
  PRIMARY KEY (`size_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ob_size
-- ----------------------------
INSERT INTO `ob_size` VALUES (1, 35);

-- ----------------------------
-- Table structure for ob_system
-- ----------------------------
DROP TABLE IF EXISTS `ob_system`;
CREATE TABLE `ob_system`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_system
-- ----------------------------
INSERT INTO `ob_system` VALUES ('administrator', 'admin');
INSERT INTO `ob_system` VALUES ('colse_explain', 'asdas');
INSERT INTO `ob_system` VALUES ('default_editor', 'ueditor');
INSERT INTO `ob_system` VALUES ('email_server', 'a:7:{s:4:\"host\";s:0:\"\";s:6:\"secure\";s:3:\"tls\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:8:\"fromname\";s:0:\"\";s:5:\"email\";s:0:\"\";}');
INSERT INTO `ob_system` VALUES ('page_number', '10');
INSERT INTO `ob_system` VALUES ('upload_image', 'a:15:{s:8:\"is_thumb\";s:1:\"0\";s:9:\"max_width\";s:4:\"1200\";s:10:\"max_height\";s:4:\"3600\";s:8:\"is_water\";s:1:\"0\";s:12:\"water_source\";s:0:\"\";s:12:\"water_locate\";s:1:\"1\";s:11:\"water_alpha\";s:0:\"\";s:7:\"is_text\";s:1:\"0\";s:4:\"text\";s:0:\"\";s:9:\"text_font\";s:0:\"\";s:11:\"text_locate\";s:1:\"1\";s:9:\"text_size\";s:0:\"\";s:10:\"text_color\";s:0:\"\";s:11:\"text_offset\";s:0:\"\";s:10:\"text_angle\";s:0:\"\";}');
INSERT INTO `ob_system` VALUES ('website_status', '1');

-- ----------------------------
-- Table structure for ob_user
-- ----------------------------
DROP TABLE IF EXISTS `ob_user`;
CREATE TABLE `ob_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `mobile` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0禁用/1启动',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  `last_login_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `register_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册ip',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `secret_security` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保问题',
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保答案',
  `balance` float NOT NULL DEFAULT 0 COMMENT '账号余额金币',
  `kami` float NOT NULL DEFAULT 0 COMMENT '账号充值卡密金额',
  `pid` int(10) NOT NULL COMMENT '分销上级ID',
  `is_thumb` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10220 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ob_user
-- ----------------------------
INSERT INTO `ob_user` VALUES (10219, 'w25979', 'PC浏览器', '$2y$10$Cr9Z2bTM7ZFIS6ANaJ1iIeDV3uXt75vibg3lb/PFqhMXLn5WocJyK', 1, 1780086860, '127.0.0.1', '127.0.0.1', 1780083688, 1780087032, '你的微信是多少?', '123123', 73, 1, 0, 0);

-- ----------------------------
-- Table structure for ob_user_log
-- ----------------------------
DROP TABLE IF EXISTS `ob_user_log`;
CREATE TABLE `ob_user_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求链接',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '资源类型',
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ob_user_log
-- ----------------------------
INSERT INTO `ob_user_log` VALUES (177, 0, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/register', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"Aa123123\",\"mobile\":\"_null\",\"secret_security\":\"1\",\"answer\":\"123123\",\"pid\":\"0\"}', '注册', 1780083688);
INSERT INTO `ob_user_log` VALUES (178, 0, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"Aa123123\"}', '登录成功', 1780083694);
INSERT INTO `ob_user_log` VALUES (179, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780083731);
INSERT INTO `ob_user_log` VALUES (180, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780083735);
INSERT INTO `ob_user_log` VALUES (181, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780083978);
INSERT INTO `ob_user_log` VALUES (182, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084020);
INSERT INTO `ob_user_log` VALUES (183, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084160);
INSERT INTO `ob_user_log` VALUES (184, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084231);
INSERT INTO `ob_user_log` VALUES (185, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084257);
INSERT INTO `ob_user_log` VALUES (186, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084275);
INSERT INTO `ob_user_log` VALUES (187, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084597);
INSERT INTO `ob_user_log` VALUES (188, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084619);
INSERT INTO `ob_user_log` VALUES (189, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084705);
INSERT INTO `ob_user_log` VALUES (190, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780084728);
INSERT INTO `ob_user_log` VALUES (191, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780085071);
INSERT INTO `ob_user_log` VALUES (192, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780085270);
INSERT INTO `ob_user_log` VALUES (193, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780085349);
INSERT INTO `ob_user_log` VALUES (194, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780085398);
INSERT INTO `ob_user_log` VALUES (195, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780086300);
INSERT INTO `ob_user_log` VALUES (196, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780086758);
INSERT INTO `ob_user_log` VALUES (197, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780086847);
INSERT INTO `ob_user_log` VALUES (198, 10219, 'w25979', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '127.0.0.1', 'http://game1.localhost/index/login/login', 'POST', 'html', '{\"username\":\"w25979\",\"password\":\"123123\"}', '登录成功', 1780086860);

-- ----------------------------
-- Table structure for ob_user_luck
-- ----------------------------
DROP TABLE IF EXISTS `ob_user_luck`;
CREATE TABLE `ob_user_luck`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `luck` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '玩家个人概率的设置',
  `luck_sel` int(10) NOT NULL DEFAULT 0 COMMENT '选中LUCK的概率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ob_user_luck
-- ----------------------------

-- ----------------------------
-- Table structure for ob_user_size
-- ----------------------------
DROP TABLE IF EXISTS `ob_user_size`;
CREATE TABLE `ob_user_size`  (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `v` int(11) NOT NULL,
  PRIMARY KEY (`size_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ob_user_size
-- ----------------------------

-- ----------------------------
-- Table structure for ob_user_whole
-- ----------------------------
DROP TABLE IF EXISTS `ob_user_whole`;
CREATE TABLE `ob_user_whole`  (
  `whole_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '所属用户ID',
  `v` int(11) NOT NULL COMMENT '中奖概率',
  PRIMARY KEY (`whole_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ob_user_whole
-- ----------------------------

-- ----------------------------
-- Table structure for ob_whole
-- ----------------------------
DROP TABLE IF EXISTS `ob_whole`;
CREATE TABLE `ob_whole`  (
  `whole_id` int(11) NOT NULL AUTO_INCREMENT,
  `v` int(11) NOT NULL,
  PRIMARY KEY (`whole_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of ob_whole
-- ----------------------------
INSERT INTO `ob_whole` VALUES (1, 30);

SET FOREIGN_KEY_CHECKS = 1;

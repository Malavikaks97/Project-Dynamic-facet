/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50130
 Source Host           : localhost:3306
 Source Schema         : dynamicdb

 Target Server Type    : MySQL
 Target Server Version : 50130
 File Encoding         : 65001

 Date: 03/09/2020 15:39:46
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content_type_id`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add item', 7, 'add_item');
INSERT INTO `auth_permission` VALUES (20, 'Can change item', 7, 'change_item');
INSERT INTO `auth_permission` VALUES (21, 'Can delete item', 7, 'delete_item');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_30a071c9_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `bid` int(20) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, 'DELL');
INSERT INTO `brand` VALUES (3, 'APPLE');
INSERT INTO `brand` VALUES (4, 'LENOVO');
INSERT INTO `brand` VALUES (5, 'MICROSOFT');
INSERT INTO `brand` VALUES (6, 'ACER');
INSERT INTO `brand` VALUES (7, 'INTEL');
INSERT INTO `brand` VALUES (8, 'ASUS');
INSERT INTO `brand` VALUES (9, 'SAMSUNG');
INSERT INTO `brand` VALUES (10, 'SONY');
INSERT INTO `brand` VALUES (11, 'PANASONIC');
INSERT INTO `brand` VALUES (12, 'CANON');
INSERT INTO `brand` VALUES (13, 'WESTERN DIGITAL');
INSERT INTO `brand` VALUES (14, 'TOSHIBA');
INSERT INTO `brand` VALUES (15, 'ADATA');
INSERT INTO `brand` VALUES (16, 'VIVO');
INSERT INTO `brand` VALUES (17, 'XIAOMI');
INSERT INTO `brand` VALUES (18, 'ONE PLUS');
INSERT INTO `brand` VALUES (19, 'REALME');
INSERT INTO `brand` VALUES (20, 'OPPO');
INSERT INTO `brand` VALUES (21, 'NOKIA');
INSERT INTO `brand` VALUES (22, 'HONOR');
INSERT INTO `brand` VALUES (23, 'LG');
INSERT INTO `brand` VALUES (24, 'HUAWEI');
INSERT INTO `brand` VALUES (25, 'LAVA');
INSERT INTO `brand` VALUES (26, 'MOTOROLA');
INSERT INTO `brand` VALUES (27, 'MICROMAX');
INSERT INTO `brand` VALUES (28, 'KEVIN');
INSERT INTO `brand` VALUES (29, 'PHILIPS');
INSERT INTO `brand` VALUES (30, 'TCL');
INSERT INTO `brand` VALUES (31, 'BOAT');
INSERT INTO `brand` VALUES (32, 'BOSE');
INSERT INTO `brand` VALUES (33, 'BEATS');
INSERT INTO `brand` VALUES (34, 'SANDISK');
INSERT INTO `brand` VALUES (35, 'STRONTIUM');
INSERT INTO `brand` VALUES (36, 'MIVI');
INSERT INTO `brand` VALUES (37, 'PORTRONICS');
INSERT INTO `brand` VALUES (38, 'JIO');
INSERT INTO `brand` VALUES (39, 'AIRTEL');
INSERT INTO `brand` VALUES (40, 'XEROX');
INSERT INTO `brand` VALUES (41, 'BROTHER');
INSERT INTO `brand` VALUES (42, 'WPRO');
INSERT INTO `brand` VALUES (43, 'D LINK');
INSERT INTO `brand` VALUES (44, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartid` int(20) NOT NULL AUTO_INCREMENT,
  `itemid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uid` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`cartid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '1', 10);
INSERT INTO `cart` VALUES (2, '1', 15);
INSERT INTO `cart` VALUES (3, '9', 15);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ccode` int(20) NOT NULL,
  `cname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ccode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, 'TVs');
INSERT INTO `category` VALUES (3, 'LAPTOP');
INSERT INTO `category` VALUES (4, 'CAMERA');
INSERT INTO `category` VALUES (5, 'HOME ENTERTAINMENT');
INSERT INTO `category` VALUES (6, 'HARD DRIVES');
INSERT INTO `category` VALUES (7, 'HEADPHONE');
INSERT INTO `category` VALUES (8, 'MEMORY CARDS');
INSERT INTO `category` VALUES (9, 'SPEAKERS');
INSERT INTO `category` VALUES (10, 'ROUTERS');
INSERT INTO `category` VALUES (11, 'MONITORS');
INSERT INTO `category` VALUES (12, 'PRINTERS');
INSERT INTO `category` VALUES (13, 'SMART WATCHES');
INSERT INTO `category` VALUES (14, 'TABLETS');
INSERT INTO `category` VALUES (15, 'PC GAMING');
INSERT INTO `category` VALUES (16, 'MOBILE ACCESSORIES');
INSERT INTO `category` VALUES (17, 'CAMERA ACCESSORIES');
INSERT INTO `category` VALUES (18, 'PC ACCESSORIES');
INSERT INTO `category` VALUES (19, 'ACTIVITY TRACKER');
INSERT INTO `category` VALUES (20, 'PENDRIVES');
INSERT INTO `category` VALUES (21, 'AIO DESKTOPS');
INSERT INTO `category` VALUES (22, 'SMART HOME DEVICES');
INSERT INTO `category` VALUES (23, 'TOWER DESKTOPS');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin__content_type_id_5151027a_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_1c5f563_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_3ec8c61c_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'dynamic', 'item');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-01-14 06:56:14');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-01-14 06:56:16');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-01-14 06:56:17');
INSERT INTO `django_migrations` VALUES (4, 'contenttypes', '0002_remove_content_type_name', '2020-01-14 06:56:17');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2020-01-14 06:56:18');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0003_alter_user_email_max_length', '2020-01-14 06:56:18');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0004_alter_user_username_opts', '2020-01-14 06:56:18');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0005_alter_user_last_login_null', '2020-01-14 06:56:18');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0006_require_contenttypes_0002', '2020-01-14 06:56:18');
INSERT INTO `django_migrations` VALUES (10, 'dynamic', '0001_initial', '2020-01-16 08:59:41');
INSERT INTO `django_migrations` VALUES (11, 'sessions', '0001_initial', '2020-01-16 08:59:42');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0ibff24otej1o3dytz9rlgioili8efod', 'ZWU1YzM5ZWMwNDU5ZjkxM2U4NzEyZWIyNTNhNmU5NDYxNjcyM2JiZTp7InVzZXJuYW1lIjoiYXNkQGdtYWlsLmNvbSIsInV0eXBlIjoidXNlciIsInVpZCI6M30=', '2020-01-30 16:13:01');
INSERT INTO `django_session` VALUES ('23jelwgbh1f47igarmhxormlm9ppsn64', 'YzJhODVkMWVkNjNiMzA2MDBkYjM3NWQxMzBmMWFhOTNkOTgxN2M1Mzp7InVzZXJuYW1lIjoibWlubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMX0=', '2020-03-09 09:36:04');
INSERT INTO `django_session` VALUES ('4tcqb5l1jdymov3a7op4hsf717r282g8', 'ZTcwNGU0YjU1ODFlZGVjYWIzYjZiZjY4MjZkZTAxM2Q5YWVkYjExZDp7InVzZXJuYW1lIjoia3Jpc2gxMjNAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxNX0=', '2020-08-10 10:16:26');
INSERT INTO `django_session` VALUES ('7266rdfr0xvftk9j44a81q7j3tbug1c5', 'YzJhODVkMWVkNjNiMzA2MDBkYjM3NWQxMzBmMWFhOTNkOTgxN2M1Mzp7InVzZXJuYW1lIjoibWlubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMX0=', '2020-02-14 04:31:20');
INSERT INTO `django_session` VALUES ('7ikhpkz0mb03rxaskpp54p81if90leqj', 'YzJhODVkMWVkNjNiMzA2MDBkYjM3NWQxMzBmMWFhOTNkOTgxN2M1Mzp7InVzZXJuYW1lIjoibWlubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMX0=', '2020-02-14 14:05:52');
INSERT INTO `django_session` VALUES ('b6aleq8e2r9wdt0dv2tp2vy1jyo4bo4o', 'ODVkM2M5ZGQzMmVjMzU2OTYwMDBhYWUwZTM4M2RjOTZjNDg2NzA0MTp7InVzZXJuYW1lIjoicG9ubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMH0=', '2020-02-14 08:55:55');
INSERT INTO `django_session` VALUES ('j0l2bg8rkvrkwpafwdd59ilifnvptxgv', 'ODVkM2M5ZGQzMmVjMzU2OTYwMDBhYWUwZTM4M2RjOTZjNDg2NzA0MTp7InVzZXJuYW1lIjoicG9ubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMH0=', '2020-03-11 09:46:37');
INSERT INTO `django_session` VALUES ('mls7csqxr64cvr4wsarbqdalbfgl5azc', 'YzJhODVkMWVkNjNiMzA2MDBkYjM3NWQxMzBmMWFhOTNkOTgxN2M1Mzp7InVzZXJuYW1lIjoibWlubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMX0=', '2020-02-14 15:41:41');
INSERT INTO `django_session` VALUES ('n2ocfmz33o6m8pczxuwnkbn1arlsxe5m', 'ODVkM2M5ZGQzMmVjMzU2OTYwMDBhYWUwZTM4M2RjOTZjNDg2NzA0MTp7InVzZXJuYW1lIjoicG9ubnVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIiwidWlkIjoxMH0=', '2020-03-18 04:14:25');
INSERT INTO `django_session` VALUES ('n87ilmaotm6pt1glqd3tflnc6pnp2b91', 'YWQwYWEzNDc3ODMwYjdlNTU0NTUzMTk0ZWE3NGJkZmM5ODk5YjA3YTp7InVzZXJuYW1lIjoicXdlQGdtYWlsLmNvbSJ9', '2020-02-15 05:56:17');
INSERT INTO `django_session` VALUES ('uagbdqv89zg0ed761dwsdn6x0ym4byc6', 'NjZjZTczODE5MTUxZWQ1OTZmOWY0NjQ3NmM5MDhmZTMzNzcwYTUxZDp7InVzZXJuYW1lIjoiY2hpa2t1QGdtYWlsLmNvbSJ9', '2020-07-07 13:13:31');

-- ----------------------------
-- Table structure for dynamic_item
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_item`;
CREATE TABLE `dynamic_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `itemname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ccode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` double NOT NULL,
  `des` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dynamic_item
-- ----------------------------
INSERT INTO `dynamic_item` VALUES (1, 0, 'camera', '13', 'samsung', 23, 'cuyhcjh', 22, 'pictures/DSC_0038_aYVA9NB.JPG');
INSERT INTO `dynamic_item` VALUES (2, 0, 'camera', '13', 'samsung', 56, 'vgfd', 2, 'pictures/DSC_0042_6xvN1m0.JPG');
INSERT INTO `dynamic_item` VALUES (3, 0, 'rty', '13', 'samsung', 789, 'hvvhk', 47, 'pictures/DSC_0038_6emLK6a.JPG');
INSERT INTO `dynamic_item` VALUES (4, 0, 'rty', '13', 'samsung', 789, 'hvvhk', 47, 'pictures/DSC_0038_oV09lmb.JPG');
INSERT INTO `dynamic_item` VALUES (5, 0, 'rty', '13', 'samsung', 789, 'hvvhk', 47, 'pictures/DSC_0038_VItVIE3.JPG');
INSERT INTO `dynamic_item` VALUES (6, 0, 'rty', '13', 'samsung', 789, 'hvvhk', 47, 'pictures/DSC_0038_IlNHBL9.JPG');

-- ----------------------------
-- Table structure for facet
-- ----------------------------
DROP TABLE IF EXISTS `facet`;
CREATE TABLE `facet`  (
  `uid` int(20) NULL DEFAULT NULL,
  `fname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fvalue` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `count` int(20) NULL DEFAULT NULL,
  `facetid` int(20) NOT NULL AUTO_INCREMENT,
  `disjiontpro` float(50, 8) NULL DEFAULT NULL,
  PRIMARY KEY (`facetid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of facet
-- ----------------------------
INSERT INTO `facet` VALUES (11, 'size', '6.53 inch', 2, 3, NULL);
INSERT INTO `facet` VALUES (10, 'size', '6.53 inch', 6, 6, 2.00000000);
INSERT INTO `facet` VALUES (10, 'camera', '20 MP', 6, 7, 2.00000000);
INSERT INTO `facet` VALUES (10, 'camera', '30 MP', 3, 12, 1.00000000);
INSERT INTO `facet` VALUES (11, 'camera', '16 MP', 3, 15, NULL);
INSERT INTO `facet` VALUES (11, 'size', '6.3 inches', 3, 16, NULL);
INSERT INTO `facet` VALUES (11, 'camera', '20 MP', 1, 18, NULL);
INSERT INTO `facet` VALUES (10, 'storage', '256 GB', 2, 23, 2.00000000);
INSERT INTO `facet` VALUES (11, 'color', 'carbon black', 1, 25, NULL);
INSERT INTO `facet` VALUES (11, 'color', 'black', 3, 26, NULL);
INSERT INTO `facet` VALUES (11, 'color', 'coral pink', 3, 27, NULL);
INSERT INTO `facet` VALUES (11, 'color', 'green', 1, 28, NULL);
INSERT INTO `facet` VALUES (11, 'color', 'gray', 1, 29, NULL);
INSERT INTO `facet` VALUES (10, 'size', '32 inches', 2, 30, 0.66666698);
INSERT INTO `facet` VALUES (10, 'color', 'blue', 1, 32, 1.00000000);
INSERT INTO `facet` VALUES (10, 'camera', '16 MP', 1, 33, 0.33333299);
INSERT INTO `facet` VALUES (10, 'size', '6.3 inches', 1, 34, 0.33333299);
INSERT INTO `facet` VALUES (12, 'color', 'black', 3, 35, 2.00000000);
INSERT INTO `facet` VALUES (12, 'size', '6.53 inch', 1, 36, NULL);
INSERT INTO `facet` VALUES (12, 'camera', '20 MP', 1, 37, NULL);
INSERT INTO `facet` VALUES (12, 'color', 'green', 1, 38, NULL);
INSERT INTO `facet` VALUES (15, 'color', 'blue', 4, 39, 2.00000000);
INSERT INTO `facet` VALUES (15, 'camera', '16 MP', 4, 40, 4.00000000);
INSERT INTO `facet` VALUES (15, 'size', '6.3 inches', 4, 41, 2.00000000);
INSERT INTO `facet` VALUES (15, 'color', 'black', 1, 42, 0.50000000);
INSERT INTO `facet` VALUES (15, 'size', '40 inches', 1, 43, 0.50000000);

-- ----------------------------
-- Table structure for featuretbl
-- ----------------------------
DROP TABLE IF EXISTS `featuretbl`;
CREATE TABLE `featuretbl`  (
  `itemid` int(20) NULL DEFAULT NULL,
  `fname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fvalue` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fid` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of featuretbl
-- ----------------------------
INSERT INTO `featuretbl` VALUES (1, 'color', 'blue', 1);
INSERT INTO `featuretbl` VALUES (1, 'camera', '16 MP', 2);
INSERT INTO `featuretbl` VALUES (1, 'size', '6.3 inches', 3);
INSERT INTO `featuretbl` VALUES (2, 'color', 'black', 4);
INSERT INTO `featuretbl` VALUES (2, 'size', '6.53 inch', 5);
INSERT INTO `featuretbl` VALUES (2, 'camera', '20 MP', 6);
INSERT INTO `featuretbl` VALUES (3, 'color', 'blue', 7);
INSERT INTO `featuretbl` VALUES (3, 'camera', '16 MP', 8);
INSERT INTO `featuretbl` VALUES (3, 'Battery', '4035mAh', 9);
INSERT INTO `featuretbl` VALUES (3, 'size', '6.3 inch', 10);
INSERT INTO `featuretbl` VALUES (4, 'color', 'purple', 11);
INSERT INTO `featuretbl` VALUES (5, 'color', 'ocean blue', 12);
INSERT INTO `featuretbl` VALUES (5, 'size', '6.4 inch', 13);
INSERT INTO `featuretbl` VALUES (5, 'camera', '16 MP', 14);
INSERT INTO `featuretbl` VALUES (5, 'Storage', '64 GB', 15);
INSERT INTO `featuretbl` VALUES (6, 'color', 'charcoal', 16);
INSERT INTO `featuretbl` VALUES (6, 'size', '6.3 inch', 17);
INSERT INTO `featuretbl` VALUES (6, 'Battery', '3500mAh', 18);
INSERT INTO `featuretbl` VALUES (7, 'color', 'black', 19);
INSERT INTO `featuretbl` VALUES (7, 'size', '32 inches', 20);
INSERT INTO `featuretbl` VALUES (8, 'color', 'black', 21);
INSERT INTO `featuretbl` VALUES (8, 'size', '32 inches', 22);
INSERT INTO `featuretbl` VALUES (9, 'color', 'black', 23);
INSERT INTO `featuretbl` VALUES (9, 'size', '40 inches', 24);
INSERT INTO `featuretbl` VALUES (10, 'color', 'gray', 25);
INSERT INTO `featuretbl` VALUES (10, 'size', '32 inches', 26);
INSERT INTO `featuretbl` VALUES (11, 'color', 'gray', 27);
INSERT INTO `featuretbl` VALUES (11, 'storage', '256 GB', 28);
INSERT INTO `featuretbl` VALUES (12, 'color', 'silver', 30);
INSERT INTO `featuretbl` VALUES (13, 'color', 'black', 31);
INSERT INTO `featuretbl` VALUES (14, 'color', 'silver', 32);
INSERT INTO `featuretbl` VALUES (15, 'color', 'black', 33);
INSERT INTO `featuretbl` VALUES (15, 'storage', '16 GB card', 34);
INSERT INTO `featuretbl` VALUES (16, 'color', 'black', 35);
INSERT INTO `featuretbl` VALUES (17, 'color', 'red', 36);
INSERT INTO `featuretbl` VALUES (18, 'color', 'black', 37);
INSERT INTO `featuretbl` VALUES (19, 'color', 'carbon black', 38);
INSERT INTO `featuretbl` VALUES (20, 'color', 'black', 39);
INSERT INTO `featuretbl` VALUES (21, 'color', 'black', 40);
INSERT INTO `featuretbl` VALUES (22, 'color', 'gray', 41);
INSERT INTO `featuretbl` VALUES (23, 'color', 'green', 42);
INSERT INTO `featuretbl` VALUES (24, 'color', 'coral pink', 43);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `itemname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ccode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` double NOT NULL,
  `des` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item
-- ----------------------------

-- ----------------------------
-- Table structure for item1
-- ----------------------------
DROP TABLE IF EXISTS `item1`;
CREATE TABLE `item1`  (
  `itemid` int(20) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ccode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bname` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price` float(20, 0) NULL DEFAULT NULL,
  `des` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qty` int(20) NULL DEFAULT NULL,
  `image` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item1
-- ----------------------------
INSERT INTO `item1` VALUES (1, 'vivoY93', 'MOBILES', 'VIVO', 2000, 'os is android\r\n128 GB,8 GB RAM', 19, 'pictures/IMG_20200130_211202.jpg');
INSERT INTO `item1` VALUES (2, 'Redmi note 8 pro', 'MOBILES', 'XIAOMI', 7799, '128 GB and 8GB RAM', 22, 'pictures/redmi-note-8-pro.jpg');
INSERT INTO `item1` VALUES (3, 'Realme 5 pro', '1', 'REALME', 7980, '128 GB and 8GB RAM', 15, 'pictures/realme-5.jpg');
INSERT INTO `item1` VALUES (4, 'Apple iphone11', 'MOBILES', 'APPLE', 64900, 'good and expensive with 64 GB storage ', 17, 'pictures/41k4sCS1fDL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (5, 'Samsung galaxy A30', '1', 'SAMSUNG', 3199, 'storage of 4GB RAM', 20, 'pictures/sam-m30.jpg');
INSERT INTO `item1` VALUES (6, 'Nokia 7.2', '1', 'NOKIA', 20299, 'storage of 64 GB', 15, 'pictures/G122700_View_2.jpg');
INSERT INTO `item1` VALUES (7, 'Sony HD', '2', 'SONY', 16499, 'LED TV,2018 MODEL', 11, 'pictures/51Ab38MlKBL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (8, 'Samsung smart', '2', 'SAMSUNG', 15500, 'LED TV ', 25, 'pictures/41HnB6ypQOL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (9, 'Panasonic TH', '2', 'PANASONIC', 18660, 'LED TV', 23, 'pictures/51B4IawbmTL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (10, 'LG hd', '2', 'LG', 13499, 'HD Ready LED TV', 10, 'pictures/51wzXkhsDZL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (11, 'Asus vivobook', 'laptop', 'asus', 59990, 'core i5 8th gen', 12, 'pictures/81StH0L8hxL._AC_SL1500_.jpg');
INSERT INTO `item1` VALUES (12, 'HP 15 ryzen r3', '3', 'HP', 26690, 'i5 and windows 10', 10, 'pictures/41-feMT2s3L._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (13, 'Lenovo v145', '3', 'LENOVO', 17750, 'i5 core', 13, 'pictures/41ccf3V-HjL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (14, 'Apple macbook pro', '3', 'APPLE', 31900, 'core i5', 10, 'pictures/500_500_productGfx_5216.jpg');
INSERT INTO `item1` VALUES (15, 'canon eos', '4', 'CANON', 24990, 'eos 1500D', 8, 'pictures/51UHoxzInpL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (16, 'Sony DSC', '4', 'SONY', 7250, 'DSC W830', 9, 'pictures/51EFnthLYPL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (17, 'canon IXUS', 'camera', 'CANON', 6390, 'IXUS 185 with 20MP', 14, 'pictures/41I39mJtjAL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (18, 'Boat bassheads', '7', 'DELL', 399, 'bassheads 100', 21, 'pictures/31IdiM9ZM8L._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (19, 'Boat rockerz', '7', 'BOAT', 1499, 'rockerz 900', 19, 'pictures/41nrYaqKXzL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (20, 'Jio reliance', '10', 'JIO', 1230, '4G router', 9, 'pictures/31AK7e0nBUL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (21, 'Dlink dir', '10', 'D LINK', 570, 'DIR695', 13, 'pictures/61G8eH0o25L._AC_SL1500_-800x800.jpg');
INSERT INTO `item1` VALUES (22, 'Apple watches ', '13', 'APPLE', 52900, 'apple watches series with gray aluminium case', 3, 'pictures/41dW85N4iXL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (23, 'Samsung galaxy watch', '13', 'SAMSUNG', 17990, 'galaxy watch series', 22, 'pictures/310iLEXSwbL._AC_SY700_FMwebp_.jpg');
INSERT INTO `item1` VALUES (24, 'Honor band', '13', 'HONOR', 2399, 'honor band 5 series', 18, 'pictures/31yIA31WYHL._AC_SY700_FMwebp_.jpg');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `uname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uid` int(20) NULL DEFAULT NULL,
  `utype` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('asd@gmail.com', '12345', 3, 'user');
INSERT INTO `login` VALUES ('zxc@gmail.com', '123456', 4, 'user');
INSERT INTO `login` VALUES ('qwe@gmail.com', '123', 5, 'admin');
INSERT INTO `login` VALUES ('', '', 6, 'admin');
INSERT INTO `login` VALUES ('bhadrasajeev@gmail.com', '1234', 7, 'admin');
INSERT INTO `login` VALUES ('malavikaks197@gmail.com', '6+56x5867', 8, 'user');
INSERT INTO `login` VALUES ('dev@gmail.com', '0987', 9, 'user');
INSERT INTO `login` VALUES ('ponnu@gmail.com', '1234', 10, 'user');
INSERT INTO `login` VALUES ('minnu@gmail.com', '123456', 11, 'user');
INSERT INTO `login` VALUES ('malavikaks1997@gmail.com', '1234', 12, 'admin');
INSERT INTO `login` VALUES ('malavika7@gmail.com', '1234', 13, 'user');
INSERT INTO `login` VALUES ('chikku@gmail.com', '1234', 14, 'user');
INSERT INTO `login` VALUES ('krish123@gmail.com', '1234', 15, 'user');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `oid` int(20) NOT NULL,
  `uid` int(20) NULL DEFAULT NULL,
  `itemid` int(20) NULL DEFAULT NULL,
  `qty1` int(20) NULL DEFAULT NULL,
  `amt1` int(50) NULL DEFAULT NULL,
  `mode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 11, 2, 1, 7799, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (1, 11, 7, 1, 16499, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (2, 11, 22, 7, 52900, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (3, 11, 2, 2, 7799, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (4, 11, 20, 1, 1230, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (4, 11, 23, 1, 17990, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (5, 10, 4, 1, 64900, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (5, 10, 19, 1, 1499, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (6, 10, 17, 1, 6390, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (7, 10, 11, 1, 59990, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (7, 10, 16, 1, 7250, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (7, 10, 24, 1, 2399, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (8, 11, 1, 1, 2000, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (8, 11, 18, 2, 399, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (8, 11, 24, 1, 2399, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (8, 11, 21, 1, 570, 'Net-Banking', NULL);
INSERT INTO `orderitem` VALUES (9, 12, 18, 2, 399, 'Cash-on-Delivery', NULL);
INSERT INTO `orderitem` VALUES (10, 12, 23, 2, 17990, 'Net-Banking', NULL);

-- ----------------------------
-- Table structure for propertytbl
-- ----------------------------
DROP TABLE IF EXISTS `propertytbl`;
CREATE TABLE `propertytbl`  (
  `uid` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `property` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pscore` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of propertytbl
-- ----------------------------
INSERT INTO `propertytbl` VALUES ('10', 'color', '1.0');
INSERT INTO `propertytbl` VALUES ('10', 'size', '2.99999997');
INSERT INTO `propertytbl` VALUES ('10', 'camera', '3.33333299');
INSERT INTO `propertytbl` VALUES ('10', 'storage', '2.0');
INSERT INTO `propertytbl` VALUES ('12', 'color', '2.0');
INSERT INTO `propertytbl` VALUES ('15', 'color', '2.5');
INSERT INTO `propertytbl` VALUES ('15', 'camera', '4.0');
INSERT INTO `propertytbl` VALUES ('15', 'size', '2.5');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `addr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `utype` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (1, 'devu', 'asd@gmail.com', 'wertyy', '9876544332', 'female', '1234', NULL);
INSERT INTO `register` VALUES (2, 'mobile', 'asd@gmail.com', 'vbng', '134567890', 'female', '123', NULL);
INSERT INTO `register` VALUES (3, 'devu', 'asd@gmail.com', 'dgfhghjkl', '9876544332', 'female', '12345', NULL);
INSERT INTO `register` VALUES (4, 'devu', 'asd@gmail.com', 'dgfhghjkl', '9876544332', 'female', '12345', 'customer');
INSERT INTO `register` VALUES (5, 'devika', 'qwe@gmail.com', 'qwerty', '11111111', 'female', '123', 'admin');
INSERT INTO `register` VALUES (7, 'bhadra', 'bhadrasajeev@gmail.com', 'vaxhag', '1234567890', '', '1234', 'Admin');
INSERT INTO `register` VALUES (8, 'Malavika', 'malavikaks197@gmail.com', 'jchnjn', '6545645456', 'female', '6+56x5867', 'User');
INSERT INTO `register` VALUES (9, 'dev', 'dev@gmail.com', 'dfghj', '0963578', 'male', '0987', 'User');
INSERT INTO `register` VALUES (10, 'ponnu', 'ponnu@gmail.com', 'asdfghjkl', '234516728', 'female', NULL, NULL);
INSERT INTO `register` VALUES (11, 'minnu', 'minnu@gmail.com', 'zxcvbnm', '9847984316', 'female', NULL, NULL);
INSERT INTO `register` VALUES (12, 'Malavika', 'malavikaks1997@gmail.com', 'abcd', '9400265282', 'Female', NULL, NULL);
INSERT INTO `register` VALUES (13, 'kichu', 'malavika7@gmail.com', 'adv', '5665235555', 'Female', NULL, NULL);
INSERT INTO `register` VALUES (14, 'chikku', 'chikku@gmail.com', 'jgk', '1234567891', 'others', NULL, NULL);
INSERT INTO `register` VALUES (15, 'krish', 'krish123@gmail.com', 'jdnv', '2455511111', 'Male', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

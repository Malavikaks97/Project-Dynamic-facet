/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : frequentdb

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2020-01-30 15:20:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add stocktbl', '7', 'add_stocktbl');
INSERT INTO `auth_permission` VALUES ('20', 'Can change stocktbl', '7', 'change_stocktbl');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete stocktbl', '7', 'delete_stocktbl');
INSERT INTO `auth_permission` VALUES ('22', 'Can add stocktbl1', '8', 'add_stocktbl1');
INSERT INTO `auth_permission` VALUES ('23', 'Can change stocktbl1', '8', 'change_stocktbl1');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete stocktbl1', '8', 'delete_stocktbl1');
INSERT INTO `auth_permission` VALUES ('25', 'Can add c purchasetbl', '9', 'add_cpurchasetbl');
INSERT INTO `auth_permission` VALUES ('26', 'Can change c purchasetbl', '9', 'change_cpurchasetbl');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete c purchasetbl', '9', 'delete_cpurchasetbl');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `branch`
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `bid` int(20) NOT NULL AUTO_INCREMENT,
  `loc` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `phno` int(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('24', 'vjgk', 'lkpoyyh', '1425437', 'sreearya2019@gmail.com', '6789', 'MainAdmin');
INSERT INTO `branch` VALUES ('26', 'tfytfh', 'htfhyf', '765486', 'aryamolca@gmail.com', 'rur76', 'BranchAdmin');
INSERT INTO `branch` VALUES ('27', 'rtth', 'thgn', '546456', 't@gmail.com', 'thcne', 'MainAdmin');
INSERT INTO `branch` VALUES ('29', 'bkgrmboi', 'vnboirbjol', '847984', 'l@gmail.com', '1234', 'BranchAdmin');
INSERT INTO `branch` VALUES ('30', 'fghdhn', 'ghrtnt', '5677', 'q@gmail.com', '12345', 'BranchAdmin');
INSERT INTO `branch` VALUES ('31', 'KEFJIWUGJ', 'KJNFGIWRNGI', '84782', 's@gmail.com', '12345', 'BranchAdmin');
INSERT INTO `branch` VALUES ('32', 'ewtwy', 'eryrth', '46457574', 'f@gmail.com', '3456', 'BranchAdmin');
INSERT INTO `branch` VALUES ('33', 'irjojtoi', '5igjknvjkr', '548968', 'abcd@gmail.com', 'qwerty', 'BranchAdmin');
INSERT INTO `branch` VALUES ('34', 'jfgnki', 'rjjgiurj', '87983', 'av@gmail.com', 'qwerty', 'BranchAdmin');
INSERT INTO `branch` VALUES ('35', 'pala', 'mkm', '4568', 'm@gmail.com', '900', 'MainAdmin');
INSERT INTO `branch` VALUES ('36', 'hjkl', 'mklll', '3666', 'sr@gmail.bom', '1234', 'MainAdmin');
INSERT INTO `branch` VALUES ('37', 'qwer', 'fvgrev', '4553', 'as@gmail.com', '1234', 'MainAdmin');
INSERT INTO `branch` VALUES ('38', 'pala', 'CHERUVIL HOUSE', '12345', 'admin@gmail.com', '100', 'MainAdmin');
INSERT INTO `branch` VALUES ('39', 'thodupuzha', 'thodupuzha', '52147896', 'mainadmin@gmail.com', '1234', 'MainAdmin');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brdid` int(50) NOT NULL AUTO_INCREMENT,
  `brdname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brdid`)
) ENGINE=InnoDB AUTO_INCREMENT=489801 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'sammsung');
INSERT INTO `brand` VALUES ('2', 'vivo');
INSERT INTO `brand` VALUES ('3', 'trurdd');
INSERT INTO `brand` VALUES ('4', 'trurdd');
INSERT INTO `brand` VALUES ('7576', 'hghgu');
INSERT INTO `brand` VALUES ('8795', 'hgutru');
INSERT INTO `brand` VALUES ('45636', 'vivi');
INSERT INTO `brand` VALUES ('65748', 'hguthgi');
INSERT INTO `brand` VALUES ('489798', 'indigo');
INSERT INTO `brand` VALUES ('489799', 'khzih');
INSERT INTO `brand` VALUES ('489800', 'khzih');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('8', 'food');
INSERT INTO `category` VALUES ('9', 'groceries');
INSERT INTO `category` VALUES ('687', 'hjutiug');
INSERT INTO `category` VALUES ('688', 'bueverage');
INSERT INTO `category` VALUES ('689', 'cloths');
INSERT INTO `category` VALUES ('690', 'food');
INSERT INTO `category` VALUES ('691', 'yuwetdugw');
INSERT INTO `category` VALUES ('692', 'felgkolt');
INSERT INTO `category` VALUES ('693', 'rytuerj');
INSERT INTO `category` VALUES ('694', 'hfihsg');
INSERT INTO `category` VALUES ('695', 'giuciew');
INSERT INTO `category` VALUES ('696', 'yti7tgi');
INSERT INTO `category` VALUES ('697', 'sdfs');
INSERT INTO `category` VALUES ('698', 'bvhfu');
INSERT INTO `category` VALUES ('699', 'rgioerjg');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'frequent', 'cpurchasetbl');
INSERT INTO `django_content_type` VALUES ('7', 'frequent', 'stocktbl');
INSERT INTO `django_content_type` VALUES ('8', 'frequent', 'stocktbl1');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-01-14 18:08:44');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-01-14 18:08:47');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-01-14 18:08:48');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2020-01-14 18:08:49');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2020-01-14 18:08:49');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2020-01-14 18:08:49');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2020-01-14 18:08:49');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2020-01-14 18:08:50');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2020-01-14 18:08:50');
INSERT INTO `django_migrations` VALUES ('10', 'frequent', '0001_initial', '2020-01-16 09:02:02');
INSERT INTO `django_migrations` VALUES ('11', 'sessions', '0001_initial', '2020-01-16 09:02:03');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('mjzzyji1sh76ubx675jtmpc5if28fywg', 'MDZkZDdlNWIwODk4YWJlOWJlMzY1ZjFlY2MwMTVlMTg4Yzk3NzJkZjp7InVuYW1lIjoibWFpbmFkbWluQGdtYWlsLmNvbSIsInVwYXNzIjoiMTIzNCIsInVzZXJpZCI6MzksInVzZXJ0eXBlIjoiTWFpbkFkbWluIn0=', '2020-02-10 07:56:06');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `userid` int(50) DEFAULT NULL,
  `uname` varchar(40) DEFAULT NULL,
  `upass` varchar(40) DEFAULT NULL,
  `usertype` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'dghde', 'dhb', null);
INSERT INTO `login` VALUES ('17', 'jkkj', 'hjiuyiu', 'Branch Admin');
INSERT INTO `login` VALUES ('18', 'kuttuvirat23@gmail.com', '123', 'branch');
INSERT INTO `login` VALUES ('19', 'a@gmail.com', 'sdfgbdgbg', 'branch');
INSERT INTO `login` VALUES ('20', 'w@mail.com', 'efrtg', 'Main Admin');
INSERT INTO `login` VALUES ('21', 'a@gmail.com', '1234', 'MainAdmin');
INSERT INTO `login` VALUES ('22', 'y@gmail.com', 'tu57i', 'MainAdmin');
INSERT INTO `login` VALUES ('23', 'gjfjck@gmail.com', 'fgdjd', 'MainAdmin');
INSERT INTO `login` VALUES ('24', 'sreearya2019@gmail.com', '6789', 'MainAdmin');
INSERT INTO `login` VALUES ('25', 'bismi@gmail.com', 'ghfytfry', 'BranchAdmin');
INSERT INTO `login` VALUES ('26', 'aryamolca@gmail.com', 'rur76', 'BranchAdmin');
INSERT INTO `login` VALUES ('27', 't@gmail.com', 'thcne', 'MainAdmin');
INSERT INTO `login` VALUES ('28', 'r@gmail.com', 'fett54y', 'BranchAdmin');
INSERT INTO `login` VALUES ('29', 'l@gmail.com', '1234', 'BranchAdmin');
INSERT INTO `login` VALUES ('30', 'q@gmail.com', '12345', 'BranchAdmin');
INSERT INTO `login` VALUES ('31', 's@gmail.com', '12345', 'BranchAdmin');
INSERT INTO `login` VALUES ('32', 'f@gmail.com', '3456', 'BranchAdmin');
INSERT INTO `login` VALUES ('33', 'abcd@gmail.com', 'qwerty', 'BranchAdmin');
INSERT INTO `login` VALUES ('34', 'av@gmail.com', 'qwerty', 'BranchAdmin');
INSERT INTO `login` VALUES ('1234', 'qwerty', 'asfgh', 'Main Admin');
INSERT INTO `login` VALUES ('35', 'm@gmail.com', '900', 'MainAdmin');
INSERT INTO `login` VALUES ('36', 'sr@gmail.bom', '1234', 'MainAdmin');
INSERT INTO `login` VALUES ('37', 'as@gmail.com', '1234', 'MainAdmin');
INSERT INTO `login` VALUES ('38', 'admin@gmail.com', '100', 'MainAdmin');
INSERT INTO `login` VALUES ('39', 'mainadmin@gmail.com', '1234', 'MainAdmin');

-- ----------------------------
-- Table structure for `pchild`
-- ----------------------------
DROP TABLE IF EXISTS `pchild`;
CREATE TABLE `pchild` (
  `pchildid` int(30) NOT NULL AUTO_INCREMENT,
  `pmasterid` int(30) DEFAULT NULL,
  `prodcode` varchar(40) DEFAULT NULL,
  `quantity` int(40) DEFAULT NULL,
  `price` int(40) DEFAULT NULL,
  PRIMARY KEY (`pchildid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pchild
-- ----------------------------
INSERT INTO `pchild` VALUES ('2', '121416', 'poo2', '25', '120');
INSERT INTO `pchild` VALUES ('3', '121416', 'f234', '123', '123');
INSERT INTO `pchild` VALUES ('4', '121415', 'f234', '100', '200');
INSERT INTO `pchild` VALUES ('5', '121418', 'f234', '100', '123');
INSERT INTO `pchild` VALUES ('6', '121418', 'f234', '100', '34');
INSERT INTO `pchild` VALUES ('7', '3346', 'f234', '100', '234');
INSERT INTO `pchild` VALUES ('8', '121420', '123', '56', '123');
INSERT INTO `pchild` VALUES ('9', '121422', '123', '10', '678');
INSERT INTO `pchild` VALUES ('10', '121422', 'f234', '2', '45');

-- ----------------------------
-- Table structure for `purchasemaster`
-- ----------------------------
DROP TABLE IF EXISTS `purchasemaster`;
CREATE TABLE `purchasemaster` (
  `pmasterid` int(60) NOT NULL AUTO_INCREMENT,
  `billno` int(60) DEFAULT NULL,
  `suplrid` varchar(60) DEFAULT NULL,
  `purchasedate` varchar(60) DEFAULT NULL,
  `bid` int(30) DEFAULT NULL,
  PRIMARY KEY (`pmasterid`)
) ENGINE=InnoDB AUTO_INCREMENT=121425 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchasemaster
-- ----------------------------
INSERT INTO `purchasemaster` VALUES ('10', '234', '5', '2020-01-16', null);
INSERT INTO `purchasemaster` VALUES ('100', '12537', '7', '2020-01-09', null);
INSERT INTO `purchasemaster` VALUES ('255', '258', '5', '2020-01-31', null);
INSERT INTO `purchasemaster` VALUES ('1245', '436', '4', '2020-01-14', null);
INSERT INTO `purchasemaster` VALUES ('1423', '35325', '8', '2020-01-14', null);
INSERT INTO `purchasemaster` VALUES ('2345', '5678', 'kol45', '2020-01-26', null);
INSERT INTO `purchasemaster` VALUES ('2680', '4789', 'wcfc', '2020-01-25', null);
INSERT INTO `purchasemaster` VALUES ('3346', '23435', '1', '2020-01-22', '29');
INSERT INTO `purchasemaster` VALUES ('3467', '3452', 'wcfc', '2020-01-25', null);
INSERT INTO `purchasemaster` VALUES ('3536', '45667', 'wcfc', '2020-01-23', null);
INSERT INTO `purchasemaster` VALUES ('3658', '5678', 'jhwquh', '2020-01-30', null);
INSERT INTO `purchasemaster` VALUES ('6789', '4561', '3', '2020-01-22', null);
INSERT INTO `purchasemaster` VALUES ('23456', '56533', 'wcfc', '2020-01-09', null);
INSERT INTO `purchasemaster` VALUES ('24325', '3532', '8', '2020-01-07', null);
INSERT INTO `purchasemaster` VALUES ('35626', '3627', '3456', '2020-01-22', null);
INSERT INTO `purchasemaster` VALUES ('54757', '788', 'wcfc', '2020-01-28', null);
INSERT INTO `purchasemaster` VALUES ('121414', '438', '4', '2020-01-06', null);
INSERT INTO `purchasemaster` VALUES ('121415', '234', '3456', '2020-01-21', '29');
INSERT INTO `purchasemaster` VALUES ('121416', '231', '1', '2020-01-15', '29');
INSERT INTO `purchasemaster` VALUES ('121418', '12345', '6', '2020-01-16', '29');
INSERT INTO `purchasemaster` VALUES ('121419', '34654', '1', '2020-01-16', '29');
INSERT INTO `purchasemaster` VALUES ('121420', '5678', '3', '2020-01-15', '29');
INSERT INTO `purchasemaster` VALUES ('121421', '0', '6', '2020-01-01', '29');
INSERT INTO `purchasemaster` VALUES ('121422', '9947', '7', '2020-01-01', '29');
INSERT INTO `purchasemaster` VALUES ('121423', '9999', '3', '2020-01-24', '29');
INSERT INTO `purchasemaster` VALUES ('121424', '34', '1', '2020-01-13', '29');

-- ----------------------------
-- Table structure for `sales`
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `saleid` int(70) NOT NULL AUTO_INCREMENT,
  `username` varchar(70) DEFAULT NULL,
  `prodcode` varchar(60) DEFAULT NULL,
  `quantity` int(60) DEFAULT NULL,
  `sdate` varchar(50) DEFAULT NULL,
  `bid` int(60) DEFAULT NULL,
  PRIMARY KEY (`saleid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('4', 'ye', 'f234', '4', '2020-01-16', '29');
INSERT INTO `sales` VALUES ('5', 'rkl', '123', '6', '2020-01-31', '29');
INSERT INTO `sales` VALUES ('6', 'bhh ', '123', '8', '2020-01-18', '29');
INSERT INTO `sales` VALUES ('7', 'doni', '123', '1', '2020-01-08', '29');
INSERT INTO `sales` VALUES ('8', 'dominic', '123', '8', '2020-01-24', '29');
INSERT INTO `sales` VALUES ('9', 'anu', '123', '1', '2020-01-24', '29');
INSERT INTO `sales` VALUES ('10', 'dominic', 'poo2', '2', '2020-01-23', '29');
INSERT INTO `sales` VALUES ('11', 'dominic', '123', '10', '2020-01-16', '29');
INSERT INTO `sales` VALUES ('12', 'dominic', '123', '28', '2020-01-17', '30');

-- ----------------------------
-- Table structure for `stocktbl1`
-- ----------------------------
DROP TABLE IF EXISTS `stocktbl1`;
CREATE TABLE `stocktbl1` (
  `prodcode` varchar(10) NOT NULL DEFAULT '0',
  `prodname` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` int(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `quantity` int(50) DEFAULT NULL,
  `bid` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stocktbl1
-- ----------------------------
INSERT INTO `stocktbl1` VALUES ('f234', '1234', 'cloths', 'swdce', 'sammsung', '20000', 'pictures/HGSIDGO_GJB0dtk_E776fBj.jpg', '27', '29');
INSERT INTO `stocktbl1` VALUES ('hdd', 'gdd', 'food', 'werewt', 'ASUS', '67', 'pictures/HGSIDGO_MwJyznT_FTCWwfM.jpg', '0', '30');
INSERT INTO `stocktbl1` VALUES ('poo2', 'watch_234', 'food', 'werewt', 'sammsung', '200', 'pictures/HGSIDGO_MwJyznT_CtSqApM_2L0Z66G.jpg', '27', '30');
INSERT INTO `stocktbl1` VALUES ('123', 'don', 'food', 'ghfg', 'trurdd', '345', 'pictures/HGSIDGO_2iP3cyi_A7uV2Em.jpg', '0', '29');
INSERT INTO `stocktbl1` VALUES ('hdd', 'gdd', 'food', 'werewt', 'sammsung', '67', 'pictures/HGSIDGO_MwJyznT_FTCWwfM.jpg', '0', '29');
INSERT INTO `stocktbl1` VALUES ('poo2', 'watch_234', 'food', 'werewt', 'ASUS', '200', 'pictures/HGSIDGO_MwJyznT_CtSqApM_2L0Z66G.jpg', '27', '29');

-- ----------------------------
-- Table structure for `subcat`
-- ----------------------------
DROP TABLE IF EXISTS `subcat`;
CREATE TABLE `subcat` (
  `catid` int(40) DEFAULT NULL,
  `subid` int(10) NOT NULL AUTO_INCREMENT,
  `subcategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=23483 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subcat
-- ----------------------------
INSERT INTO `subcat` VALUES (null, '23475', 'werewt');
INSERT INTO `subcat` VALUES ('9', '23476', 'ghfg');
INSERT INTO `subcat` VALUES ('9', '23477', 'egftec');
INSERT INTO `subcat` VALUES ('9', '23478', 'rthvyj');
INSERT INTO `subcat` VALUES ('9', '23479', 'swdce');
INSERT INTO `subcat` VALUES ('8', '23480', 'iuyiyi');
INSERT INTO `subcat` VALUES ('693', '23481', 'hguyg');
INSERT INTO `subcat` VALUES ('8', '23482', 'wetwet');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `suplrid` int(50) NOT NULL,
  `suplname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`suplrid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'wcfc');
INSERT INTO `supplier` VALUES ('2', '');
INSERT INTO `supplier` VALUES ('3', 'bjahdj');
INSERT INTO `supplier` VALUES ('4', 'drytus');
INSERT INTO `supplier` VALUES ('5', 'rhrths');
INSERT INTO `supplier` VALUES ('6', 'uyutg');
INSERT INTO `supplier` VALUES ('7', 'jhwquh');
INSERT INTO `supplier` VALUES ('8', 'qwerty');
INSERT INTO `supplier` VALUES ('9', 'hgjitr');
INSERT INTO `supplier` VALUES ('464', 'dgfg');
INSERT INTO `supplier` VALUES ('3456', 'dddd');




-- BOSS基础表结构
CREATE TABLE `boss_oper_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `user_id` int(11) DEFAULT NULL COMMENT ' 操作用户',
  `user_name` varchar(100) DEFAULT NULL COMMENT ' 操作人名称',
  `request_method` varchar(1000) DEFAULT NULL COMMENT '请求方法',
  `request_params` text COMMENT '请求参数',
  `return_result` varchar(100) DEFAULT NULL COMMENT '返回结果',
  `oper_code` varchar(255) DEFAULT NULL COMMENT '菜单代码',
  `method_desc` varchar(100) DEFAULT NULL COMMENT ' 方法描述',
  `oper_ip` varchar(50) DEFAULT NULL COMMENT '请求ip',
  `oper_status` int(11) DEFAULT NULL COMMENT '操作状态(1：成功0：失败)',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作日志';

CREATE TABLE `boss_right_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `right_id` int(11) NOT NULL COMMENT '权限ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `right_menu_index` (`right_id`,`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132618 DEFAULT CHARSET=utf8 COMMENT='角色对应权限关系表';

CREATE TABLE `boss_shiro_right` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `right_code` varchar(255) DEFAULT NULL COMMENT '权限编码',
  `right_name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `right_comment` varchar(255) DEFAULT NULL COMMENT '权限说明',
  `right_type` int(11) DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='BOSS角色';

CREATE TABLE `boss_shiro_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户唯一标识',
  `password` varchar(255) DEFAULT NULL COMMENT '用户编码',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `tel_no` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '用户状态，0-无效，1-有效',
  `theme` varchar(100) DEFAULT NULL COMMENT '用户样式主题',
  `create_operator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_pwd_time` datetime DEFAULT NULL COMMENT '修改密码时间',
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='BOSS用户表';

CREATE TABLE `boss_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `menu_code` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `rigth_code` varchar(255) DEFAULT NULL,
  `menu_level` int(11) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `order_no` varchar(11) DEFAULT NULL,
  `log_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_code` (`menu_code`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8 COMMENT='BOSS菜单表';

-- 目前没有使用到
CREATE TABLE `boss_user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_menu_index` (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BOSS用户菜单表';

CREATE TABLE `boss_user_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `right_id` int(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_right_index` (`user_id`,`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1091 DEFAULT CHARSET=utf8 COMMENT='用户和角色对应关系表';

CREATE TABLE `sequence` (
  `name` varchar(50) NOT NULL,
  `current_value` bigint(22) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列表';

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_key` varchar(255) DEFAULT NULL COMMENT '标识字典类型',
  `sys_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sys_value` varchar(255) DEFAULT NULL COMMENT '值',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '上级ID',
  `order_no` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_key_index` (`sys_key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='字典表';




-- 数据导入初始化
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132587', '147', '109');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132586', '147', '110');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132585', '147', '112');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132584', '147', '113');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132583', '147', '114');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132595', '147', '214');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132596', '147', '215');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132597', '147', '216');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132598', '147', '220');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132599', '147', '230');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132600', '147', '231');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132601', '147', '232');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132602', '147', '238');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132603', '147', '240');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132604', '147', '241');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132605', '147', '242');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132606', '147', '246');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132607', '147', '247');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132608', '147', '295');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132594', '147', '296');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132593', '147', '297');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132609', '147', '298');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132592', '147', '299');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132591', '147', '300');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132590', '147', '302');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132589', '147', '303');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132610', '147', '304');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132611', '147', '305');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132612', '147', '306');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132613', '147', '308');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132588', '147', '309');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132614', '147', '310');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132615', '147', '311');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132616', '147', '312');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132617', '147', '313');
INSERT INTO `boss_right_menu` (`id`, `right_id`, `menu_id`) VALUES ('132582', '147', '314');


INSERT INTO `boss_shiro_right` (`id`, `right_code`, `right_name`, `right_comment`, `right_type`) VALUES ('147', 'ADMIN', '超级管理员', NULL, NULL);


INSERT INTO `boss_shiro_user` (`id`, `user_name`, `password`, `real_name`, `tel_no`, `email`, `status`, `theme`, `create_operator`, `create_time`, `update_pwd_time`, `dept_id`) VALUES ('1', 'admin', 'b594510740d2ac4261c1b2fe87850d08', '超级管理员', NULL, NULL, '1', NULL, NULL, '2016-08-19 14:28:08', '2017-04-14 11:13:29', NULL);


INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('109', '0', 'user', '用户中心', '#/user', NULL, '0', 'menu', '11000000', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('110', '109', 'user.user', '用户管理', '#/user/user', NULL, '1', 'menu', '11001000', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('112', '109', 'user.right', '角色管理', '#/user/right', NULL, '1', 'menu', '11003000', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('113', '109', 'user.menu', '菜单管理', '#/user/menu', NULL, '1', 'menu', '11004000', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('114', '109', 'user.dictionary', '数据字典', '#/user/dictionary', NULL, '1', 'menu', '11005000', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('214', '110', 'user.insert', '新增', 'user/saveUser.do', NULL, '2', 'page', '11001002', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('215', '110', 'user.update', '修改', 'user/updateUser.do', NULL, '2', 'page', '11001003', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('216', '110', 'user.delete', '删除', 'user/deleteUser.do', NULL, '2', 'page', '11001004', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('220', '110', 'user.role', '角色', 'user/editUserRight.do', NULL, '2', 'page', '11001008', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('230', '112', 'right.insert', '新增', 'right/saveRight.do', NULL, '2', 'page', '11003002', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('231', '112', 'right.update', '修改', 'right/updateRight.do', NULL, '2', 'page', '11003003', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('232', '112', 'right.delete', '删除', 'right/deleteRight.do', NULL, '2', 'page', '11003004', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('238', '112', 'right.menu', '菜单', 'right/editRightMenu.do', NULL, '2', 'page', '11003010', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('240', '113', 'menu.insert', '新增', 'menu/saveMenu.do', NULL, '2', 'page', '11004002', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('241', '113', 'menu.update', '修改', 'menu/updateMenu.do', NULL, '2', 'page', '11004003', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('242', '113', 'menu.delete', '删除', 'menu/deleteMenu.do', NULL, '2', 'page', '11004004', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('246', '114', 'sysDict.insert', '新增', 'sysDict/saveSysDict.do', NULL, '2', 'page', '11005002', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('247', '114', 'sysDict.delete', '删除', 'sysDict/deleteSysDict.do', NULL, '2', 'page', '11005003', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('295', '114', 'sysDict.update', '修改', 'sysDict/saveSysDict.do', NULL, '2', 'page', '11005004', '0');
INSERT INTO `boss_sys_menu` (`id`, `parent_id`, `menu_code`, `menu_name`, `menu_url`, `rigth_code`, `menu_level`, `menu_type`, `order_no`, `log_flag`) VALUES ('314', '109', 'user.logs', '日志管理', '#user/logs', NULL, '1', 'menu', '11006000', '0');

INSERT INTO `boss_user_right` (`id`, `user_id`, `right_id`) VALUES ('1084', '1', '147');

INSERT INTO `sys_dict` (`id`, `sys_key`, `sys_name`, `sys_value`, `parent_id`, `order_no`, `status`, `remark`) VALUES ('1', 'VER_NUM', 'js的版本号', '1.1.001', 'VER_NUM', NULL, '1', 'js的版本号，防止js缓存');



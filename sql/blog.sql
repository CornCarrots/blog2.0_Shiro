-- 创建数据库 
DROP DATABASE
IF EXISTS blog;

CREATE DATABASE blog DEFAULT CHARACTER
SET utf8;

-- 创建表
USE blog;

DROP TABLE
IF EXISTS option_;

CREATE TABLE option_ (
	id INT (11) NOT NULL auto_increment,
	option_key VARCHAR (255) DEFAULT NULL,
	option_value VARCHAR (255) DEFAULT NULL,
	CONSTRAINT pk_option PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS user_;

CREATE TABLE user_ (
	id INT (11) NOT NULL auto_increment,
	user_name VARCHAR (255) DEFAULT NULL,
	user_password VARCHAR (255) DEFAULT NULL,
	user_salt VARCHAR(255) DEFAULT NULL,
	user_nick_name VARCHAR (255) DEFAULT '',
	user_photo VARCHAR (255) DEFAULT '',
	user_email VARCHAR (255) DEFAULT '',
	user_ip VARCHAR (255) DEFAULT NULL,
	user_register_date datetime DEFAULT NULL,
	user_login_time datetime DEFAULT NULL,
	user_status INT (2) DEFAULT 1,
	CONSTRAINT pk_user PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS role;

create table role (
  id INT (11) auto_increment,
  role_name varchar(100),
  role_desc varchar(100),
  constraint pk_role primary key(id)
) charset=utf8 ENGINE=InnoDB;

DROP TABLE
IF EXISTS user_role;

create table user_role (
  id INT (11) auto_increment,
  uid INT (11),
  rid INT (11),
  constraint pk_user_role primary key(id)
) charset=utf8 ENGINE=InnoDB;

DROP TABLE
IF EXISTS module;

create table module (
  id INT (11) auto_increment,
  module_name varchar(100) DEFAULT NULL,
  module_desc varchar(100) DEFAULT NULL,
	module_pid INT (11) DEFAULT NULL,
  module_url varchar(100) DEFAULT NULL, 
  constraint pk_module primary key(id)
) charset=utf8 ENGINE=InnoDB;


DROP TABLE
IF EXISTS operation;

create table operation (
  id INT (11) auto_increment,
  operation_name varchar(100),
  operation_desc varchar(100),
  constraint pk_operation primary key(id)
) charset=utf8 ENGINE=InnoDB;

DROP TABLE
IF EXISTS permission;

create table permission (
  id INT (11) auto_increment,
  mid INT (11),
  oid INT (11),
  constraint pk_permission primary key(id)
) charset=utf8 ENGINE=InnoDB;

DROP TABLE
IF EXISTS role_permission;

create table role_permission (
  id INT (11) auto_increment,
  rid INT (11),
  pid INT (11),
  constraint pk_role_permission primary key(id)
) charset=utf8 ENGINE=InnoDB;
   
DROP TABLE
IF EXISTS user_friend;

CREATE TABLE user_friend (
	id INT (11) NOT NULL auto_increment,
	uid INT (11) DEFAULT NULL,
	friend_uid INT (11) DEFAULT NULL,
	friend_status INT (2) DEFAULT 1,
	friend_note VARCHAR (255) DEFAULT NULL,
	CONSTRAINT pk_user_friend PRIMARY KEY (id),
	CONSTRAINT fk_user_friend1 FOREIGN KEY (uid) REFERENCES user_ (id),
	CONSTRAINT fk_user_friend2 FOREIGN KEY (friend_uid) REFERENCES user_ (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS category;

CREATE TABLE category (
	id INT (11) NOT NULL auto_increment,
	category_name VARCHAR (255) DEFAULT NULL,
	category_descripe VARCHAR (255) DEFAULT NULL,
	category_status INT (2) DEFAULT 1,
	pid INT (11) DEFAULT 0,
	CONSTRAINT pk_category PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT charset = utf8;

DROP TABLE
IF EXISTS article;

CREATE TABLE article (
	id INT (11) NOT NULL auto_increment,
	article_title VARCHAR (255),
	article_md_text MEDIUMTEXT,
	article_html_text MEDIUMTEXT,
	article_uid INT (11) DEFAULT NULL,
	article_cpid INT (11) DEFAULT NULL,
	article_ccid INT (11) DEFAULT NULL,
	article_create_date datetime DEFAULT NULL,
	article_update_date datetime DEFAULT NULL,
	article_status INT (2) DEFAULT 1,
	article_views BIGINT (20) DEFAULT 0,
	article_likes BIGINT (20) DEFAULT 0,
	article_comments BIGINT (20) DEFAULT 0,
	CONSTRAINT pk_article PRIMARY KEY (id),
	CONSTRAINT fk_article_user_ FOREIGN KEY (article_uid) REFERENCES user_ (id),
	CONSTRAINT fk_article_category_1 FOREIGN KEY (article_ccid) REFERENCES category (id),
	CONSTRAINT fk_article_category_2 FOREIGN KEY (article_cpid) REFERENCES category (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS tag;

CREATE TABLE tag (
	id INT (11) NOT NULL auto_increment,
	tag_name VARCHAR (255) DEFAULT NULL,
	tag_descripe VARCHAR (255) DEFAULT NULL,
	tag_status INT (2) DEFAULT 1,
	CONSTRAINT pk_tag PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS tag_article;

CREATE TABLE tag_article (
	tid INT (11) NOT NULL,
	aid INT (11) NOT NULL,
	CONSTRAINT pk_tag_arti PRIMARY KEY (tid, aid),
	CONSTRAINT fk_tag_arti1 FOREIGN KEY (tid) REFERENCES tag (id),
	CONSTRAINT fk_tag_arti2 FOREIGN KEY (aid) REFERENCES article (id)
) ENGINE = INNODB DEFAULT charset = utf8;

DROP TABLE
IF EXISTS comment_;

CREATE TABLE comment_ (
	id INT (11) NOT NULL auto_increment,
	comment_html_text MEDIUMTEXT,
	comment_md_text MEDIUMTEXT,
	comment_create_date datetime DEFAULT NULL,
	comment_ip VARCHAR (255) DEFAULT NULL,
	comment_STATUS INT (3) DEFAULT 1,
	pid INT (11) DEFAULT NULL,
	uid INT (11) DEFAULT NULL,
	aid INT (11) DEFAULT NULL,
	CONSTRAINT pk_comment PRIMARY KEY (id),
	CONSTRAINT fk_comment_user FOREIGN KEY (uid) REFERENCES user_ (id),
	CONSTRAINT fk_comment_article FOREIGN KEY (aid) REFERENCES article (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS notice;

CREATE TABLE notice (
	id INT (11) NOT NULL auto_increment,
	notice_title VARCHAR (255) DEFAULT NULL,
	notice_html_text MEDIUMTEXT DEFAULT NULL,
	notice_md_text MEDIUMTEXT DEFAULT NULL,
	notice_create_date datetime DEFAULT NULL,
	notice_update_date datetime DEFAULT NULL,
	STATUS INT (2) DEFAULT NULL,
	CONSTRAINT pk_notice PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS link;

CREATE TABLE link (
	id INT (11) NOT NULL auto_increment,
	link_url VARCHAR (255) DEFAULT NULL,
	link_name VARCHAR (255) DEFAULT NULL,
	link_describe VARCHAR (255) DEFAULT NULL,
	link_create_date datetime DEFAULT NULL,
	link_update_date datetime DEFAULT NULL,
	STATUS INT (2) DEFAULT NULL,
	CONSTRAINT pk_link PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS menu;

CREATE TABLE menu (
	id INT (11) NOT NULL auto_increment,
	menu_name VARCHAR (255) DEFAULT NULL,
	menu_link VARCHAR (255) DEFAULT NULL,
	menu_icon VARCHAR(255) DEFAULT NULL,
	menu_role INT (2) DEFAULT NULL,
	menu_status INT (2) DEFAULT NULL,
	CONSTRAINT pk_link PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

DROP TABLE
IF EXISTS advertisement;

CREATE TABLE advertisement (
	id INT (11) NOT NULL auto_increment,
	advertisement_role INT (11) DEFAULT NULL,
	advertisement_path VARCHAR (255) DEFAULT NULL,
	menu_status INT (2) DEFAULT NULL,
	CONSTRAINT pk_link PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

--  插入数据
INSERT INTO `category` VALUES (1, 'Java', 'Java语言', 1, 0);
INSERT INTO `category` VALUES (2, 'Java基础', '', 1, 1);
INSERT INTO `category` VALUES (3, 'Core Java', '', 1, 1);
INSERT INTO `category` VALUES (4, '多线程并发编程', '', 1, 1);
INSERT INTO `category` VALUES (5, 'Sockets和IO', '', 1, 1);
INSERT INTO `category` VALUES (6, '设计模式和反射', '', 1, 1);
INSERT INTO `category` VALUES (7, 'JVM', '', 1, 1);
INSERT INTO `category` VALUES (8, 'JavaWeb', '', 1, 1);
INSERT INTO `category` VALUES (9, 'Java框架', '', 1, 1);
INSERT INTO `category` VALUES (10, '计算机科学', '', 1, 0);
INSERT INTO `category` VALUES (11, '数据结构和算法', '', 1, 10);
INSERT INTO `category` VALUES (12, '操作系统', '', 1, 10);
INSERT INTO `category` VALUES (13, '数据库', '', 1, 10);
INSERT INTO `category` VALUES (14, '计算机网络', '', 1, 10);
INSERT INTO `category` VALUES (15, '其他技术', '', 1, 0);
INSERT INTO `category` VALUES (16, '消息服务', '', 1, 15);
INSERT INTO `category` VALUES (17, '缓存服务', '', 1, 15);

INSERT INTO `user_` VALUES (1, 'admin', 'b3432791463c1e94d9d6c7d064b5bbc7','l8p55F5BvsndSmzPoq3iMA==', 'Galler', 'img/upload/profile_photo/img_8.jpg', '953625619@qq.com', '127.0.0.1:8080', '2018-9-22 12:00:00', '2018-10-15 15:18:32', 1);
INSERT INTO `user_` VALUES (4, 'abcdef', 'b5d95e4d00ebc1f2e0a8bd4d5ab370af', 'DJ8z5Ke2giNnqM1/1ZpkNQ==','test1', 'img/upload/profile_photo/default.jpg', 'test@123.com','127.0.0.1:8080', '2018-10-4 12:18:48', '2018-10-15 15:17:04', 1);
INSERT INTO `user_` VALUES (5, '123456', 'b5d95e4d00ebc1f2e0a8bd4d5ab370af', 'DJ8z5Ke2giNnqM1/1ZpkNQ==','test2', 'img/upload/profile_photo/default.jpg', 'test@123.com','127.0.0.1:8080', '2018-10-4 12:18:48', '2018-10-15 15:17:04', 1);
INSERT INTO `user_` VALUES (6, 'abc123', 'b5d95e4d00ebc1f2e0a8bd4d5ab370af', 'DJ8z5Ke2giNnqM1/1ZpkNQ==','test3', 'img/upload/profile_photo/default.jpg', 'test@123.com', '127.0.0.1:8080' ,'2018-10-4 12:18:48', '2018-10-15 15:17:04', 1);
INSERT INTO `user_` VALUES (7, 'def456', 'b5d95e4d00ebc1f2e0a8bd4d5ab370af', 'DJ8z5Ke2giNnqM1/1ZpkNQ==','test4', 'img/upload/profile_photo/default.jpg', 'test@123.com', '127.0.0.1:8080' ,'2018-10-4 12:18:48', '2018-10-15 15:17:04', 1);

INSERT INTO `role` VALUES (1,'root','系统管理员');
INSERT INTO `role` VALUES (2,'admin','超级管理员');
INSERT INTO `role` VALUES (3,'blogMagager','博客管理员');
INSERT INTO `role` VALUES (4,'showMagager','前台管理员');
INSERT INTO `role` VALUES (5,'commentManager','评论管理员');
INSERT INTO `role` VALUES (6,'linkManager','链接管理员');
INSERT INTO `role` VALUES (7,'noticeManager','公告管理员');
INSERT INTO `role` VALUES (8,'userManager','用户管理员');
INSERT INTO `role` VALUES (9,'systemManager','系统管理员');
INSERT INTO `role` VALUES (10,'articleManager','文章管理员');
INSERT INTO `role` VALUES (11,'categoryManager','分类管理员');
INSERT INTO `role` VALUES (12,'tagManager','标签管理员');
INSERT INTO `role` VALUES (13,'vipUser','会员用户');
INSERT INTO `role` VALUES (14,'normalUser','普通用户');
INSERT INTO `role` VALUES (15,'guest','游客');

INSERT INTO `user_role` VALUES (NULL,1,1);
INSERT INTO `user_role` VALUES (NULL,4,2);
INSERT INTO `user_role` VALUES (NULL,5,3);
INSERT INTO `user_role` VALUES (NULL,5,4);
INSERT INTO `user_role` VALUES (NULL,5,5);
INSERT INTO `user_role` VALUES (NULL,6,10);
INSERT INTO `user_role` VALUES (NULL,6,11);
INSERT INTO `user_role` VALUES (NULL,7,14);

INSERT INTO `module` VALUES (1,'backModule','后台管理',0,'/admin');
INSERT INTO `module` VALUES (2,'foreModule','前台展示',0,'');
INSERT INTO `module` VALUES (3,'blogModule','博客管理',1,'/blog');
INSERT INTO `module` VALUES (4,'showModule','前台管理',1,'/show');
INSERT INTO `module` VALUES (5,'systemModule','系统管理',1,'/system');
INSERT INTO `module` VALUES (6,'linkModule','链接管理',1,'/links');
INSERT INTO `module` VALUES (7,'noticeModule','公告管理',1,'/notices');
INSERT INTO `module` VALUES (8,'commentModule','评论管理',1,'/comments');
INSERT INTO `module` VALUES (9,'userModule','用户管理',1,'/users');
INSERT INTO `module` VALUES (10,'articleModule','文章管理',3,'/articles');
INSERT INTO `module` VALUES (11,'categoryModule','分类管理',3,'/categories');
INSERT INTO `module` VALUES (12,'tagModule','标签管理',3,'/tags');
INSERT INTO `module` VALUES (13,'menuModule','菜单管理',4,'/menus');
INSERT INTO `module` VALUES (14,'advertisementModule','广告管理',4,'/advertisements');
INSERT INTO `module` VALUES (15,'optionModule','信息管理',4,'/option');
INSERT INTO `module` VALUES (16,'roleModule','角色管理',5,'/roles');
INSERT INTO `module` VALUES (17,'permissionModule','权限管理',5,'/permissions');
INSERT INTO `module` VALUES (18,'moduleModule','模块管理',5,'/modules');
INSERT INTO `module` VALUES (19,'vipModule','会员展示',2,'/vip');
INSERT INTO `module` VALUES (20,'normalModule','普通展示',2,'/normal');

INSERT INTO `operation` VALUES (1,'create','增加');
INSERT INTO `operation` VALUES (2,'delete','删除');
INSERT INTO `operation` VALUES (3,'update','修改');
INSERT INTO `operation` VALUES (4,'read','获取');
INSERT INTO `operation` VALUES (5,'read','查询');
INSERT INTO `operation` VALUES (6,'accessBack','访问后台管理');
INSERT INTO `operation` VALUES (7,'accessFore','访问前台展示');
INSERT INTO `operation` VALUES (8,'accessBlog','访问博客管理');
INSERT INTO `operation` VALUES (9,'accessShow','访问前台管理');
INSERT INTO `operation` VALUES (10,'accessSystem','访问系统管理');
INSERT INTO `operation` VALUES (11,'accessNotice','访问公告管理');
INSERT INTO `operation` VALUES (12,'accessComment','访问评论管理');
INSERT INTO `operation` VALUES (13,'accessLink','访问链接管理');
INSERT INTO `operation` VALUES (14,'accessUser','访问用户管理');
INSERT INTO `operation` VALUES (15,'accessArticle','访问文章管理');
INSERT INTO `operation` VALUES (16,'accessCategory','访问分类管理');
INSERT INTO `operation` VALUES (17,'accessTag','访问标签管理');
INSERT INTO `operation` VALUES (18,'accessMenu','访问菜单管理');
INSERT INTO `operation` VALUES (19,'accessAdvertisement','访问广告管理');
INSERT INTO `operation` VALUES (20,'accessOption','访问信息管理');
INSERT INTO `operation` VALUES (21,'accessRole','访问角色管理');
INSERT INTO `operation` VALUES (22,'accessPermission','访问权限管理');
INSERT INTO `operation` VALUES (23,'accessModule','访问模块管理');
INSERT INTO `operation` VALUES (24,'accessVip','访问会员展示');
INSERT INTO `operation` VALUES (25,'accessNormal','访问普通展示');

INSERT INTO `permission` VALUES (1,1,6);
INSERT INTO `permission` VALUES (2,2,7);
INSERT INTO `permission` VALUES (3,3,8);
INSERT INTO `permission` VALUES (4,4,9);
INSERT INTO `permission` VALUES (5,5,10);
INSERT INTO `permission` VALUES (6,6,13);
INSERT INTO `permission` VALUES (7,6,1);
INSERT INTO `permission` VALUES (8,6,2);
INSERT INTO `permission` VALUES (9,6,3);
INSERT INTO `permission` VALUES (10,6,4);
INSERT INTO `permission` VALUES (11,6,5);
INSERT INTO `permission` VALUES (12,7,11);
INSERT INTO `permission` VALUES (13,7,1);
INSERT INTO `permission` VALUES (14,7,2);
INSERT INTO `permission` VALUES (15,7,3);
INSERT INTO `permission` VALUES (16,7,4);
INSERT INTO `permission` VALUES (17,7,5);
INSERT INTO `permission` VALUES (18,8,12);
INSERT INTO `permission` VALUES (19,8,2);
INSERT INTO `permission` VALUES (20,8,3);
INSERT INTO `permission` VALUES (21,8,4);
INSERT INTO `permission` VALUES (22,8,5);
INSERT INTO `permission` VALUES (23,9,14);
INSERT INTO `permission` VALUES (24,9,2);
INSERT INTO `permission` VALUES (25,9,4);
INSERT INTO `permission` VALUES (26,9,5);
INSERT INTO `permission` VALUES (27,10,15);
INSERT INTO `permission` VALUES (28,10,1);
INSERT INTO `permission` VALUES (29,10,2);
INSERT INTO `permission` VALUES (30,10,3);
INSERT INTO `permission` VALUES (31,10,4);
INSERT INTO `permission` VALUES (32,10,5);
INSERT INTO `permission` VALUES (33,11,16);
INSERT INTO `permission` VALUES (34,11,1);
INSERT INTO `permission` VALUES (35,11,2);
INSERT INTO `permission` VALUES (36,11,3);
INSERT INTO `permission` VALUES (37,11,4);
INSERT INTO `permission` VALUES (38,11,5);
INSERT INTO `permission` VALUES (39,12,17);
INSERT INTO `permission` VALUES (40,12,1);
INSERT INTO `permission` VALUES (41,12,2);
INSERT INTO `permission` VALUES (42,12,3);
INSERT INTO `permission` VALUES (43,12,4);
INSERT INTO `permission` VALUES (44,12,5);
INSERT INTO `permission` VALUES (45,13,18);
INSERT INTO `permission` VALUES (46,13,1);
INSERT INTO `permission` VALUES (47,13,2);
INSERT INTO `permission` VALUES (48,13,3);
INSERT INTO `permission` VALUES (49,13,4);
INSERT INTO `permission` VALUES (50,13,5);
INSERT INTO `permission` VALUES (51,14,19);
INSERT INTO `permission` VALUES (52,14,1);
INSERT INTO `permission` VALUES (53,14,2);
INSERT INTO `permission` VALUES (54,14,3);
INSERT INTO `permission` VALUES (55,14,4);
INSERT INTO `permission` VALUES (56,14,5);
INSERT INTO `permission` VALUES (57,15,20);
INSERT INTO `permission` VALUES (58,15,3);
INSERT INTO `permission` VALUES (59,15,4);
INSERT INTO `permission` VALUES (60,15,5);
INSERT INTO `permission` VALUES (61,16,21);
INSERT INTO `permission` VALUES (62,16,1);
INSERT INTO `permission` VALUES (63,16,2);
INSERT INTO `permission` VALUES (64,16,3);
INSERT INTO `permission` VALUES (65,16,4);
INSERT INTO `permission` VALUES (66,16,5);
INSERT INTO `permission` VALUES (67,17,22);
INSERT INTO `permission` VALUES (68,17,1);
INSERT INTO `permission` VALUES (69,17,2);
INSERT INTO `permission` VALUES (70,17,3);
INSERT INTO `permission` VALUES (71,17,4);
INSERT INTO `permission` VALUES (72,17,5);
INSERT INTO `permission` VALUES (73,18,23);
INSERT INTO `permission` VALUES (74,18,1);
INSERT INTO `permission` VALUES (75,18,2);
INSERT INTO `permission` VALUES (76,18,3);
INSERT INTO `permission` VALUES (77,18,4);
INSERT INTO `permission` VALUES (78,18,5);
INSERT INTO `permission` VALUES (79,19,24);
INSERT INTO `permission` VALUES (80,20,25);
INSERT INTO `permission` VALUES (81,1,4);
INSERT INTO `permission` VALUES (82,1,5);
INSERT INTO `permission` VALUES (83,19,1);
INSERT INTO `permission` VALUES (84,19,2);
INSERT INTO `permission` VALUES (85,19,3);
INSERT INTO `permission` VALUES (86,19,4);
INSERT INTO `permission` VALUES (87,19,5);
INSERT INTO `permission` VALUES (88,19,4);
INSERT INTO `permission` VALUES (89,20,1);
INSERT INTO `permission` VALUES (90,20,2);
INSERT INTO `permission` VALUES (91,20,3);
INSERT INTO `permission` VALUES (92,20,4);
INSERT INTO `permission` VALUES (93,20,5);
INSERT INTO `permission` VALUES (94,20,4);
INSERT INTO `permission` VALUES (95,2,4);
INSERT INTO `permission` VALUES (96,2,5);

INSERT INTO `role_permission` VALUES (NULL,1,1);
INSERT INTO `role_permission` VALUES (NULL,1,2);
INSERT INTO `role_permission` VALUES (NULL,1,3);
INSERT INTO `role_permission` VALUES (NULL,1,4);
INSERT INTO `role_permission` VALUES (NULL,1,5);
INSERT INTO `role_permission` VALUES (NULL,1,6);
INSERT INTO `role_permission` VALUES (NULL,1,7);
INSERT INTO `role_permission` VALUES (NULL,1,8);
INSERT INTO `role_permission` VALUES (NULL,1,9);
INSERT INTO `role_permission` VALUES (NULL,1,10);
INSERT INTO `role_permission` VALUES (NULL,1,11);
INSERT INTO `role_permission` VALUES (NULL,1,12);
INSERT INTO `role_permission` VALUES (NULL,1,13);
INSERT INTO `role_permission` VALUES (NULL,1,14);
INSERT INTO `role_permission` VALUES (NULL,1,15);
INSERT INTO `role_permission` VALUES (NULL,1,16);
INSERT INTO `role_permission` VALUES (NULL,1,17);
INSERT INTO `role_permission` VALUES (NULL,1,18);
INSERT INTO `role_permission` VALUES (NULL,1,19);
INSERT INTO `role_permission` VALUES (NULL,1,20);
INSERT INTO `role_permission` VALUES (NULL,1,21);
INSERT INTO `role_permission` VALUES (NULL,1,22);
INSERT INTO `role_permission` VALUES (NULL,1,23);
INSERT INTO `role_permission` VALUES (NULL,1,24);
INSERT INTO `role_permission` VALUES (NULL,1,25);
INSERT INTO `role_permission` VALUES (NULL,1,26);
INSERT INTO `role_permission` VALUES (NULL,1,27);
INSERT INTO `role_permission` VALUES (NULL,1,28);
INSERT INTO `role_permission` VALUES (NULL,1,29);
INSERT INTO `role_permission` VALUES (NULL,1,30);
INSERT INTO `role_permission` VALUES (NULL,1,31);
INSERT INTO `role_permission` VALUES (NULL,1,32);
INSERT INTO `role_permission` VALUES (NULL,1,33);
INSERT INTO `role_permission` VALUES (NULL,1,34);
INSERT INTO `role_permission` VALUES (NULL,1,35);
INSERT INTO `role_permission` VALUES (NULL,1,36);
INSERT INTO `role_permission` VALUES (NULL,1,37);
INSERT INTO `role_permission` VALUES (NULL,1,38);
INSERT INTO `role_permission` VALUES (NULL,1,39);
INSERT INTO `role_permission` VALUES (NULL,1,40);
INSERT INTO `role_permission` VALUES (NULL,1,41);
INSERT INTO `role_permission` VALUES (NULL,1,42);
INSERT INTO `role_permission` VALUES (NULL,1,43);
INSERT INTO `role_permission` VALUES (NULL,1,44);
INSERT INTO `role_permission` VALUES (NULL,1,45);
INSERT INTO `role_permission` VALUES (NULL,1,46);
INSERT INTO `role_permission` VALUES (NULL,1,47);
INSERT INTO `role_permission` VALUES (NULL,1,48);
INSERT INTO `role_permission` VALUES (NULL,1,49);
INSERT INTO `role_permission` VALUES (NULL,1,50);
INSERT INTO `role_permission` VALUES (NULL,1,51);
INSERT INTO `role_permission` VALUES (NULL,1,52);
INSERT INTO `role_permission` VALUES (NULL,1,53);
INSERT INTO `role_permission` VALUES (NULL,1,54);
INSERT INTO `role_permission` VALUES (NULL,1,55);
INSERT INTO `role_permission` VALUES (NULL,1,56);
INSERT INTO `role_permission` VALUES (NULL,1,57);
INSERT INTO `role_permission` VALUES (NULL,1,58);
INSERT INTO `role_permission` VALUES (NULL,1,59);
INSERT INTO `role_permission` VALUES (NULL,1,60);
INSERT INTO `role_permission` VALUES (NULL,1,61);
INSERT INTO `role_permission` VALUES (NULL,1,62);
INSERT INTO `role_permission` VALUES (NULL,1,63);
INSERT INTO `role_permission` VALUES (NULL,1,64);
INSERT INTO `role_permission` VALUES (NULL,1,65);
INSERT INTO `role_permission` VALUES (NULL,1,66);
INSERT INTO `role_permission` VALUES (NULL,1,67);
INSERT INTO `role_permission` VALUES (NULL,1,68);
INSERT INTO `role_permission` VALUES (NULL,1,69);
INSERT INTO `role_permission` VALUES (NULL,1,70);
INSERT INTO `role_permission` VALUES (NULL,1,71);
INSERT INTO `role_permission` VALUES (NULL,1,72);
INSERT INTO `role_permission` VALUES (NULL,1,73);
INSERT INTO `role_permission` VALUES (NULL,1,74);
INSERT INTO `role_permission` VALUES (NULL,1,75);
INSERT INTO `role_permission` VALUES (NULL,1,76);
INSERT INTO `role_permission` VALUES (NULL,1,77);
INSERT INTO `role_permission` VALUES (NULL,1,78);
INSERT INTO `role_permission` VALUES (NULL,1,79);
INSERT INTO `role_permission` VALUES (NULL,1,80);
INSERT INTO `role_permission` VALUES (NULL,1,81);
INSERT INTO `role_permission` VALUES (NULL,1,82);
INSERT INTO `role_permission` VALUES (NULL,1,83);
INSERT INTO `role_permission` VALUES (NULL,1,84);
INSERT INTO `role_permission` VALUES (NULL,1,85);
INSERT INTO `role_permission` VALUES (NULL,1,86);
INSERT INTO `role_permission` VALUES (NULL,1,87);
INSERT INTO `role_permission` VALUES (NULL,1,88);
INSERT INTO `role_permission` VALUES (NULL,1,89);
INSERT INTO `role_permission` VALUES (NULL,1,90);
INSERT INTO `role_permission` VALUES (NULL,1,91);
INSERT INTO `role_permission` VALUES (NULL,1,92);
INSERT INTO `role_permission` VALUES (NULL,1,93);
INSERT INTO `role_permission` VALUES (NULL,1,94);
INSERT INTO `role_permission` VALUES (NULL,1,95);
INSERT INTO `role_permission` VALUES (NULL,1,96);
INSERT INTO `role_permission` VALUES (NULL,2,1);
INSERT INTO `role_permission` VALUES (NULL,2,2);
INSERT INTO `role_permission` VALUES (NULL,2,3);
INSERT INTO `role_permission` VALUES (NULL,2,4);
INSERT INTO `role_permission` VALUES (NULL,2,6);
INSERT INTO `role_permission` VALUES (NULL,2,7);
INSERT INTO `role_permission` VALUES (NULL,2,8);
INSERT INTO `role_permission` VALUES (NULL,2,9);
INSERT INTO `role_permission` VALUES (NULL,2,10);
INSERT INTO `role_permission` VALUES (NULL,2,11);
INSERT INTO `role_permission` VALUES (NULL,2,12);
INSERT INTO `role_permission` VALUES (NULL,2,13);
INSERT INTO `role_permission` VALUES (NULL,2,14);
INSERT INTO `role_permission` VALUES (NULL,2,15);
INSERT INTO `role_permission` VALUES (NULL,2,16);
INSERT INTO `role_permission` VALUES (NULL,2,17);
INSERT INTO `role_permission` VALUES (NULL,2,18);
INSERT INTO `role_permission` VALUES (NULL,2,19);
INSERT INTO `role_permission` VALUES (NULL,2,20);
INSERT INTO `role_permission` VALUES (NULL,2,21);
INSERT INTO `role_permission` VALUES (NULL,2,22);
INSERT INTO `role_permission` VALUES (NULL,2,23);
INSERT INTO `role_permission` VALUES (NULL,2,24);
INSERT INTO `role_permission` VALUES (NULL,2,25);
INSERT INTO `role_permission` VALUES (NULL,2,26);
INSERT INTO `role_permission` VALUES (NULL,2,27);
INSERT INTO `role_permission` VALUES (NULL,2,28);
INSERT INTO `role_permission` VALUES (NULL,2,29);
INSERT INTO `role_permission` VALUES (NULL,2,30);
INSERT INTO `role_permission` VALUES (NULL,2,31);
INSERT INTO `role_permission` VALUES (NULL,2,32);
INSERT INTO `role_permission` VALUES (NULL,2,33);
INSERT INTO `role_permission` VALUES (NULL,2,34);
INSERT INTO `role_permission` VALUES (NULL,2,35);
INSERT INTO `role_permission` VALUES (NULL,2,36);
INSERT INTO `role_permission` VALUES (NULL,2,37);
INSERT INTO `role_permission` VALUES (NULL,2,38);
INSERT INTO `role_permission` VALUES (NULL,2,39);
INSERT INTO `role_permission` VALUES (NULL,2,40);
INSERT INTO `role_permission` VALUES (NULL,2,41);
INSERT INTO `role_permission` VALUES (NULL,2,42);
INSERT INTO `role_permission` VALUES (NULL,2,43);
INSERT INTO `role_permission` VALUES (NULL,2,44);
INSERT INTO `role_permission` VALUES (NULL,2,45);
INSERT INTO `role_permission` VALUES (NULL,2,46);
INSERT INTO `role_permission` VALUES (NULL,2,47);
INSERT INTO `role_permission` VALUES (NULL,2,48);
INSERT INTO `role_permission` VALUES (NULL,2,49);
INSERT INTO `role_permission` VALUES (NULL,2,50);
INSERT INTO `role_permission` VALUES (NULL,2,51);
INSERT INTO `role_permission` VALUES (NULL,2,52);
INSERT INTO `role_permission` VALUES (NULL,2,53);
INSERT INTO `role_permission` VALUES (NULL,2,54);
INSERT INTO `role_permission` VALUES (NULL,2,55);
INSERT INTO `role_permission` VALUES (NULL,2,56);
INSERT INTO `role_permission` VALUES (NULL,2,57);
INSERT INTO `role_permission` VALUES (NULL,2,58);
INSERT INTO `role_permission` VALUES (NULL,2,59);
INSERT INTO `role_permission` VALUES (NULL,2,60);
INSERT INTO `role_permission` VALUES (NULL,2,79);
INSERT INTO `role_permission` VALUES (NULL,2,80);
INSERT INTO `role_permission` VALUES (NULL,2,81);
INSERT INTO `role_permission` VALUES (NULL,2,82);
INSERT INTO `role_permission` VALUES (NULL,2,83);
INSERT INTO `role_permission` VALUES (NULL,2,84);
INSERT INTO `role_permission` VALUES (NULL,2,85);
INSERT INTO `role_permission` VALUES (NULL,2,86);
INSERT INTO `role_permission` VALUES (NULL,2,87);
INSERT INTO `role_permission` VALUES (NULL,2,88);
INSERT INTO `role_permission` VALUES (NULL,2,89);
INSERT INTO `role_permission` VALUES (NULL,2,90);
INSERT INTO `role_permission` VALUES (NULL,2,91);
INSERT INTO `role_permission` VALUES (NULL,2,92);
INSERT INTO `role_permission` VALUES (NULL,2,93);
INSERT INTO `role_permission` VALUES (NULL,2,94);
INSERT INTO `role_permission` VALUES (NULL,2,95);
INSERT INTO `role_permission` VALUES (NULL,2,96);
INSERT INTO `role_permission` VALUES (NULL,3,1);
INSERT INTO `role_permission` VALUES (NULL,3,2);
INSERT INTO `role_permission` VALUES (NULL,3,3);
INSERT INTO `role_permission` VALUES (NULL,3,27);
INSERT INTO `role_permission` VALUES (NULL,3,28);
INSERT INTO `role_permission` VALUES (NULL,3,29);
INSERT INTO `role_permission` VALUES (NULL,3,30);
INSERT INTO `role_permission` VALUES (NULL,3,31);
INSERT INTO `role_permission` VALUES (NULL,3,32);
INSERT INTO `role_permission` VALUES (NULL,3,33);
INSERT INTO `role_permission` VALUES (NULL,3,34);
INSERT INTO `role_permission` VALUES (NULL,3,35);
INSERT INTO `role_permission` VALUES (NULL,3,36);
INSERT INTO `role_permission` VALUES (NULL,3,37);
INSERT INTO `role_permission` VALUES (NULL,3,38);
INSERT INTO `role_permission` VALUES (NULL,3,39);
INSERT INTO `role_permission` VALUES (NULL,3,40);
INSERT INTO `role_permission` VALUES (NULL,3,41);
INSERT INTO `role_permission` VALUES (NULL,3,42);
INSERT INTO `role_permission` VALUES (NULL,3,43);
INSERT INTO `role_permission` VALUES (NULL,3,44);
INSERT INTO `role_permission` VALUES (NULL,3,79);
INSERT INTO `role_permission` VALUES (NULL,3,80);
INSERT INTO `role_permission` VALUES (NULL,3,81);
INSERT INTO `role_permission` VALUES (NULL,3,82);
INSERT INTO `role_permission` VALUES (NULL,3,83);
INSERT INTO `role_permission` VALUES (NULL,3,84);
INSERT INTO `role_permission` VALUES (NULL,3,85);
INSERT INTO `role_permission` VALUES (NULL,3,86);
INSERT INTO `role_permission` VALUES (NULL,3,87);
INSERT INTO `role_permission` VALUES (NULL,3,88);
INSERT INTO `role_permission` VALUES (NULL,3,89);
INSERT INTO `role_permission` VALUES (NULL,3,90);
INSERT INTO `role_permission` VALUES (NULL,3,91);
INSERT INTO `role_permission` VALUES (NULL,3,92);
INSERT INTO `role_permission` VALUES (NULL,3,93);
INSERT INTO `role_permission` VALUES (NULL,3,94);
INSERT INTO `role_permission` VALUES (NULL,3,95);
INSERT INTO `role_permission` VALUES (NULL,3,96);
INSERT INTO `role_permission` VALUES (NULL,4,1);
INSERT INTO `role_permission` VALUES (NULL,4,2);
INSERT INTO `role_permission` VALUES (NULL,4,4);
INSERT INTO `role_permission` VALUES (NULL,4,45);
INSERT INTO `role_permission` VALUES (NULL,4,46);
INSERT INTO `role_permission` VALUES (NULL,4,47);
INSERT INTO `role_permission` VALUES (NULL,4,48);
INSERT INTO `role_permission` VALUES (NULL,4,49);
INSERT INTO `role_permission` VALUES (NULL,4,50);
INSERT INTO `role_permission` VALUES (NULL,4,51);
INSERT INTO `role_permission` VALUES (NULL,4,52);
INSERT INTO `role_permission` VALUES (NULL,4,53);
INSERT INTO `role_permission` VALUES (NULL,4,54);
INSERT INTO `role_permission` VALUES (NULL,4,55);
INSERT INTO `role_permission` VALUES (NULL,4,56);
INSERT INTO `role_permission` VALUES (NULL,4,57);
INSERT INTO `role_permission` VALUES (NULL,4,58);
INSERT INTO `role_permission` VALUES (NULL,4,59);
INSERT INTO `role_permission` VALUES (NULL,4,60);
INSERT INTO `role_permission` VALUES (NULL,4,79);
INSERT INTO `role_permission` VALUES (NULL,4,80);
INSERT INTO `role_permission` VALUES (NULL,4,81);
INSERT INTO `role_permission` VALUES (NULL,4,82);
INSERT INTO `role_permission` VALUES (NULL,4,83);
INSERT INTO `role_permission` VALUES (NULL,4,84);
INSERT INTO `role_permission` VALUES (NULL,4,85);
INSERT INTO `role_permission` VALUES (NULL,4,86);
INSERT INTO `role_permission` VALUES (NULL,4,87);
INSERT INTO `role_permission` VALUES (NULL,4,88);
INSERT INTO `role_permission` VALUES (NULL,4,89);
INSERT INTO `role_permission` VALUES (NULL,4,90);
INSERT INTO `role_permission` VALUES (NULL,4,91);
INSERT INTO `role_permission` VALUES (NULL,4,92);
INSERT INTO `role_permission` VALUES (NULL,4,93);
INSERT INTO `role_permission` VALUES (NULL,4,94);
INSERT INTO `role_permission` VALUES (NULL,4,95);
INSERT INTO `role_permission` VALUES (NULL,4,96);
INSERT INTO `role_permission` VALUES (NULL,5,1);
INSERT INTO `role_permission` VALUES (NULL,5,2);
INSERT INTO `role_permission` VALUES (NULL,5,18);
INSERT INTO `role_permission` VALUES (NULL,5,19);
INSERT INTO `role_permission` VALUES (NULL,5,20);
INSERT INTO `role_permission` VALUES (NULL,5,21);
INSERT INTO `role_permission` VALUES (NULL,5,22);
INSERT INTO `role_permission` VALUES (NULL,5,79);
INSERT INTO `role_permission` VALUES (NULL,5,80);
INSERT INTO `role_permission` VALUES (NULL,5,81);
INSERT INTO `role_permission` VALUES (NULL,5,82);
INSERT INTO `role_permission` VALUES (NULL,5,83);
INSERT INTO `role_permission` VALUES (NULL,5,84);
INSERT INTO `role_permission` VALUES (NULL,5,85);
INSERT INTO `role_permission` VALUES (NULL,5,86);
INSERT INTO `role_permission` VALUES (NULL,5,87);
INSERT INTO `role_permission` VALUES (NULL,5,88);
INSERT INTO `role_permission` VALUES (NULL,5,89);
INSERT INTO `role_permission` VALUES (NULL,5,90);
INSERT INTO `role_permission` VALUES (NULL,5,91);
INSERT INTO `role_permission` VALUES (NULL,5,92);
INSERT INTO `role_permission` VALUES (NULL,5,93);
INSERT INTO `role_permission` VALUES (NULL,5,94);
INSERT INTO `role_permission` VALUES (NULL,5,95);
INSERT INTO `role_permission` VALUES (NULL,5,96);
INSERT INTO `role_permission` VALUES (NULL,6,1);
INSERT INTO `role_permission` VALUES (NULL,6,2);
INSERT INTO `role_permission` VALUES (NULL,6,6);
INSERT INTO `role_permission` VALUES (NULL,6,7);
INSERT INTO `role_permission` VALUES (NULL,6,8);
INSERT INTO `role_permission` VALUES (NULL,6,9);
INSERT INTO `role_permission` VALUES (NULL,6,10);
INSERT INTO `role_permission` VALUES (NULL,6,11);
INSERT INTO `role_permission` VALUES (NULL,6,79);
INSERT INTO `role_permission` VALUES (NULL,6,80);
INSERT INTO `role_permission` VALUES (NULL,6,81);
INSERT INTO `role_permission` VALUES (NULL,6,82);
INSERT INTO `role_permission` VALUES (NULL,6,83);
INSERT INTO `role_permission` VALUES (NULL,6,84);
INSERT INTO `role_permission` VALUES (NULL,6,85);
INSERT INTO `role_permission` VALUES (NULL,6,86);
INSERT INTO `role_permission` VALUES (NULL,6,87);
INSERT INTO `role_permission` VALUES (NULL,6,88);
INSERT INTO `role_permission` VALUES (NULL,6,89);
INSERT INTO `role_permission` VALUES (NULL,6,90);
INSERT INTO `role_permission` VALUES (NULL,6,91);
INSERT INTO `role_permission` VALUES (NULL,6,92);
INSERT INTO `role_permission` VALUES (NULL,6,93);
INSERT INTO `role_permission` VALUES (NULL,6,94);
INSERT INTO `role_permission` VALUES (NULL,6,95);
INSERT INTO `role_permission` VALUES (NULL,6,96);
INSERT INTO `role_permission` VALUES (NULL,7,1);
INSERT INTO `role_permission` VALUES (NULL,7,2);
INSERT INTO `role_permission` VALUES (NULL,7,12);
INSERT INTO `role_permission` VALUES (NULL,7,13);
INSERT INTO `role_permission` VALUES (NULL,7,14);
INSERT INTO `role_permission` VALUES (NULL,7,15);
INSERT INTO `role_permission` VALUES (NULL,7,16);
INSERT INTO `role_permission` VALUES (NULL,7,17);
INSERT INTO `role_permission` VALUES (NULL,7,79);
INSERT INTO `role_permission` VALUES (NULL,7,80);
INSERT INTO `role_permission` VALUES (NULL,7,81);
INSERT INTO `role_permission` VALUES (NULL,7,82);
INSERT INTO `role_permission` VALUES (NULL,7,83);
INSERT INTO `role_permission` VALUES (NULL,7,84);
INSERT INTO `role_permission` VALUES (NULL,7,85);
INSERT INTO `role_permission` VALUES (NULL,7,86);
INSERT INTO `role_permission` VALUES (NULL,7,87);
INSERT INTO `role_permission` VALUES (NULL,7,88);
INSERT INTO `role_permission` VALUES (NULL,7,89);
INSERT INTO `role_permission` VALUES (NULL,7,90);
INSERT INTO `role_permission` VALUES (NULL,7,91);
INSERT INTO `role_permission` VALUES (NULL,7,92);
INSERT INTO `role_permission` VALUES (NULL,7,93);
INSERT INTO `role_permission` VALUES (NULL,7,94);
INSERT INTO `role_permission` VALUES (NULL,7,95);
INSERT INTO `role_permission` VALUES (NULL,7,96);
INSERT INTO `role_permission` VALUES (NULL,8,1);
INSERT INTO `role_permission` VALUES (NULL,8,2);
INSERT INTO `role_permission` VALUES (NULL,8,23);
INSERT INTO `role_permission` VALUES (NULL,8,24);
INSERT INTO `role_permission` VALUES (NULL,8,25);
INSERT INTO `role_permission` VALUES (NULL,8,26);
INSERT INTO `role_permission` VALUES (NULL,8,79);
INSERT INTO `role_permission` VALUES (NULL,8,80);
INSERT INTO `role_permission` VALUES (NULL,8,81);
INSERT INTO `role_permission` VALUES (NULL,8,82);
INSERT INTO `role_permission` VALUES (NULL,8,83);
INSERT INTO `role_permission` VALUES (NULL,8,84);
INSERT INTO `role_permission` VALUES (NULL,8,85);
INSERT INTO `role_permission` VALUES (NULL,8,86);
INSERT INTO `role_permission` VALUES (NULL,8,87);
INSERT INTO `role_permission` VALUES (NULL,8,88);
INSERT INTO `role_permission` VALUES (NULL,8,89);
INSERT INTO `role_permission` VALUES (NULL,8,90);
INSERT INTO `role_permission` VALUES (NULL,8,91);
INSERT INTO `role_permission` VALUES (NULL,8,92);
INSERT INTO `role_permission` VALUES (NULL,8,93);
INSERT INTO `role_permission` VALUES (NULL,8,94);
INSERT INTO `role_permission` VALUES (NULL,8,95);
INSERT INTO `role_permission` VALUES (NULL,8,96);
INSERT INTO `role_permission` VALUES (NULL,9,1);
INSERT INTO `role_permission` VALUES (NULL,9,2);
INSERT INTO `role_permission` VALUES (NULL,9,5);
INSERT INTO `role_permission` VALUES (NULL,9,61);
INSERT INTO `role_permission` VALUES (NULL,9,62);
INSERT INTO `role_permission` VALUES (NULL,9,63);
INSERT INTO `role_permission` VALUES (NULL,9,64);
INSERT INTO `role_permission` VALUES (NULL,9,65);
INSERT INTO `role_permission` VALUES (NULL,9,66);
INSERT INTO `role_permission` VALUES (NULL,9,67);
INSERT INTO `role_permission` VALUES (NULL,9,68);
INSERT INTO `role_permission` VALUES (NULL,9,69);
INSERT INTO `role_permission` VALUES (NULL,9,70);
INSERT INTO `role_permission` VALUES (NULL,9,71);
INSERT INTO `role_permission` VALUES (NULL,9,72);
INSERT INTO `role_permission` VALUES (NULL,9,73);
INSERT INTO `role_permission` VALUES (NULL,9,74);
INSERT INTO `role_permission` VALUES (NULL,9,75);
INSERT INTO `role_permission` VALUES (NULL,9,76);
INSERT INTO `role_permission` VALUES (NULL,9,77);
INSERT INTO `role_permission` VALUES (NULL,9,78);
INSERT INTO `role_permission` VALUES (NULL,9,79);
INSERT INTO `role_permission` VALUES (NULL,9,80);
INSERT INTO `role_permission` VALUES (NULL,9,81);
INSERT INTO `role_permission` VALUES (NULL,9,82);
INSERT INTO `role_permission` VALUES (NULL,9,83);
INSERT INTO `role_permission` VALUES (NULL,9,84);
INSERT INTO `role_permission` VALUES (NULL,9,85);
INSERT INTO `role_permission` VALUES (NULL,9,86);
INSERT INTO `role_permission` VALUES (NULL,9,87);
INSERT INTO `role_permission` VALUES (NULL,9,88);
INSERT INTO `role_permission` VALUES (NULL,9,89);
INSERT INTO `role_permission` VALUES (NULL,9,90);
INSERT INTO `role_permission` VALUES (NULL,9,91);
INSERT INTO `role_permission` VALUES (NULL,9,92);
INSERT INTO `role_permission` VALUES (NULL,9,93);
INSERT INTO `role_permission` VALUES (NULL,9,94);
INSERT INTO `role_permission` VALUES (NULL,9,95);
INSERT INTO `role_permission` VALUES (NULL,9,96);
INSERT INTO `role_permission` VALUES (NULL,10,1);
INSERT INTO `role_permission` VALUES (NULL,10,2);
INSERT INTO `role_permission` VALUES (NULL,10,3);
INSERT INTO `role_permission` VALUES (NULL,10,27);
INSERT INTO `role_permission` VALUES (NULL,10,28);
INSERT INTO `role_permission` VALUES (NULL,10,29);
INSERT INTO `role_permission` VALUES (NULL,10,30);
INSERT INTO `role_permission` VALUES (NULL,10,31);
INSERT INTO `role_permission` VALUES (NULL,10,32);
INSERT INTO `role_permission` VALUES (NULL,10,79);
INSERT INTO `role_permission` VALUES (NULL,10,80);
INSERT INTO `role_permission` VALUES (NULL,10,81);
INSERT INTO `role_permission` VALUES (NULL,10,82);
INSERT INTO `role_permission` VALUES (NULL,10,83);
INSERT INTO `role_permission` VALUES (NULL,10,84);
INSERT INTO `role_permission` VALUES (NULL,10,85);
INSERT INTO `role_permission` VALUES (NULL,10,86);
INSERT INTO `role_permission` VALUES (NULL,10,87);
INSERT INTO `role_permission` VALUES (NULL,10,88);
INSERT INTO `role_permission` VALUES (NULL,10,89);
INSERT INTO `role_permission` VALUES (NULL,10,90);
INSERT INTO `role_permission` VALUES (NULL,10,91);
INSERT INTO `role_permission` VALUES (NULL,10,92);
INSERT INTO `role_permission` VALUES (NULL,10,93);
INSERT INTO `role_permission` VALUES (NULL,10,94);
INSERT INTO `role_permission` VALUES (NULL,10,95);
INSERT INTO `role_permission` VALUES (NULL,10,96);
INSERT INTO `role_permission` VALUES (NULL,11,1);
INSERT INTO `role_permission` VALUES (NULL,11,2);
INSERT INTO `role_permission` VALUES (NULL,11,3);
INSERT INTO `role_permission` VALUES (NULL,11,33);
INSERT INTO `role_permission` VALUES (NULL,11,34);
INSERT INTO `role_permission` VALUES (NULL,11,35);
INSERT INTO `role_permission` VALUES (NULL,11,36);
INSERT INTO `role_permission` VALUES (NULL,11,37);
INSERT INTO `role_permission` VALUES (NULL,11,38);
INSERT INTO `role_permission` VALUES (NULL,11,79);
INSERT INTO `role_permission` VALUES (NULL,11,80);
INSERT INTO `role_permission` VALUES (NULL,11,81);
INSERT INTO `role_permission` VALUES (NULL,11,82);
INSERT INTO `role_permission` VALUES (NULL,11,83);
INSERT INTO `role_permission` VALUES (NULL,11,84);
INSERT INTO `role_permission` VALUES (NULL,11,85);
INSERT INTO `role_permission` VALUES (NULL,11,86);
INSERT INTO `role_permission` VALUES (NULL,11,87);
INSERT INTO `role_permission` VALUES (NULL,11,88);
INSERT INTO `role_permission` VALUES (NULL,11,89);
INSERT INTO `role_permission` VALUES (NULL,11,90);
INSERT INTO `role_permission` VALUES (NULL,11,91);
INSERT INTO `role_permission` VALUES (NULL,11,92);
INSERT INTO `role_permission` VALUES (NULL,11,93);
INSERT INTO `role_permission` VALUES (NULL,11,94);
INSERT INTO `role_permission` VALUES (NULL,11,95);
INSERT INTO `role_permission` VALUES (NULL,11,96);
INSERT INTO `role_permission` VALUES (NULL,12,1);
INSERT INTO `role_permission` VALUES (NULL,12,2);
INSERT INTO `role_permission` VALUES (NULL,12,3);
INSERT INTO `role_permission` VALUES (NULL,12,39);
INSERT INTO `role_permission` VALUES (NULL,12,40);
INSERT INTO `role_permission` VALUES (NULL,12,41);
INSERT INTO `role_permission` VALUES (NULL,12,42);
INSERT INTO `role_permission` VALUES (NULL,12,43);
INSERT INTO `role_permission` VALUES (NULL,12,44);
INSERT INTO `role_permission` VALUES (NULL,12,79);
INSERT INTO `role_permission` VALUES (NULL,12,80);
INSERT INTO `role_permission` VALUES (NULL,12,81);
INSERT INTO `role_permission` VALUES (NULL,12,82);
INSERT INTO `role_permission` VALUES (NULL,12,83);
INSERT INTO `role_permission` VALUES (NULL,12,84);
INSERT INTO `role_permission` VALUES (NULL,12,85);
INSERT INTO `role_permission` VALUES (NULL,12,86);
INSERT INTO `role_permission` VALUES (NULL,12,87);
INSERT INTO `role_permission` VALUES (NULL,12,88);
INSERT INTO `role_permission` VALUES (NULL,12,89);
INSERT INTO `role_permission` VALUES (NULL,12,90);
INSERT INTO `role_permission` VALUES (NULL,12,91);
INSERT INTO `role_permission` VALUES (NULL,12,92);
INSERT INTO `role_permission` VALUES (NULL,12,93);
INSERT INTO `role_permission` VALUES (NULL,12,94);
INSERT INTO `role_permission` VALUES (NULL,12,95);
INSERT INTO `role_permission` VALUES (NULL,12,96);
INSERT INTO `role_permission` VALUES (NULL,13,2);
INSERT INTO `role_permission` VALUES (NULL,13,79);
INSERT INTO `role_permission` VALUES (NULL,13,80);
INSERT INTO `role_permission` VALUES (NULL,13,83);
INSERT INTO `role_permission` VALUES (NULL,13,84);
INSERT INTO `role_permission` VALUES (NULL,13,85);
INSERT INTO `role_permission` VALUES (NULL,13,86);
INSERT INTO `role_permission` VALUES (NULL,13,87);
INSERT INTO `role_permission` VALUES (NULL,13,88);
INSERT INTO `role_permission` VALUES (NULL,13,89);
INSERT INTO `role_permission` VALUES (NULL,13,90);
INSERT INTO `role_permission` VALUES (NULL,13,91);
INSERT INTO `role_permission` VALUES (NULL,13,92);
INSERT INTO `role_permission` VALUES (NULL,13,93);
INSERT INTO `role_permission` VALUES (NULL,13,94);
INSERT INTO `role_permission` VALUES (NULL,13,95);
INSERT INTO `role_permission` VALUES (NULL,13,96);
INSERT INTO `role_permission` VALUES (NULL,14,2);
INSERT INTO `role_permission` VALUES (NULL,14,80);
INSERT INTO `role_permission` VALUES (NULL,14,89);
INSERT INTO `role_permission` VALUES (NULL,14,90);
INSERT INTO `role_permission` VALUES (NULL,14,91);
INSERT INTO `role_permission` VALUES (NULL,14,92);
INSERT INTO `role_permission` VALUES (NULL,14,93);
INSERT INTO `role_permission` VALUES (NULL,14,94);
INSERT INTO `role_permission` VALUES (NULL,14,95);
INSERT INTO `role_permission` VALUES (NULL,14,96);
INSERT INTO `role_permission` VALUES (NULL,15,2);
INSERT INTO `role_permission` VALUES (NULL,15,95);
INSERT INTO `role_permission` VALUES (NULL,15,96);

INSERT INTO `tag` VALUES (1, 'Java', '', 1);
INSERT INTO `tag` VALUES (2, '算法', '', 1);
INSERT INTO `tag` VALUES (3, '数据结构', '', 1);
INSERT INTO `tag` VALUES (4, 'C', '', 1);
INSERT INTO `tag` VALUES (5, '操作系统', '', 1);
INSERT INTO `tag` VALUES (6, '计算机网络', '', 1);
INSERT INTO `tag` VALUES (7, '面试题', '', 1);
INSERT INTO `tag` VALUES (8, '数据库', '', 1);
INSERT INTO `tag` VALUES (9, 'MySQL', '', 1);
INSERT INTO `tag` VALUES (10, 'Spring', '', 1);
INSERT INTO `tag` VALUES (11, 'SpringMVC', '', 1);
INSERT INTO `tag` VALUES (12, 'MyBatis', '', 1);
INSERT INTO `tag` VALUES (13, 'JVM', '', 1);
INSERT INTO `tag` VALUES (14, '网络编程', '', 1);
INSERT INTO `tag` VALUES (15, 'IO', '', 1);
INSERT INTO `tag` VALUES (16, 'JSP', '', 1);
INSERT INTO `tag` VALUES (17, 'Servlet', '', 1);
INSERT INTO `tag` VALUES (18, 'JavaWeb', '', 1);
INSERT INTO `tag` VALUES (19, 'Hibernate', '', 1);
INSERT INTO `tag` VALUES (20, 'SQL', '', 1);

INSERT INTO `notice` VALUES (1, '本站下载地址', '<p><span>本站后端基于 Spring+SpringMVC+Mybatis+JSP实现，对于初学SSM的小伙伴可以参考。</span></p>', '本站后端基于 Spring+SpringMVC+Mybatis+JSP实现，对于初学SSM的小伙伴可以参考。', '2018-9-22 13:44:35', '2017-9-22 21:23:28', 1);


INSERT INTO `link` VALUES (1, 'localhost/blog', '博客', '一个码农的成长之路', '2018-10-7 16:51:03', '2018-10-7 16:29:35', 1);
INSERT INTO `link` VALUES (2, 'http://baidu.com', '测试', '测试', '2018-10-7 16:51:49', '2018-10-7 16:51:49', 2);
INSERT INTO `link` VALUES (20, 'www.baidu.com', '试试哈', '10086', '2018-10-4 17:01:43', NULL, 1);


INSERT INTO `menu` VALUES (1, '关于本站', '/aboutSite', 'glyphicon glyphicon-info-sign', 1, 1);
INSERT INTO `menu` VALUES (2, '文章归档', '/articleFile', 'glyphicon glyphicon-file', 1, 1);
INSERT INTO `menu` VALUES (3, '申请友链', '/applyLink', 'glyphicon glyphicon-link', 1, 1);

INSERT INTO `option_` VALUES (1, 'name', '博客网');
INSERT INTO `option_` VALUES (2, 'describe', '学习的新起点，大学最后两年的成长记录。珍惜时间，保持努力的惯性');
INSERT INTO `option_` VALUES (3, 'photo', 'img/upload/option/option.jpg');
INSERT INTO `option_` VALUES (4, 'key', '博客,Java博客');
INSERT INTO `option_` VALUES (5, 'number', '231');

INSERT INTO `article` VALUES (1, '[转载]SpringMVC中使用Interceptor拦截器', NULL, '<p>SpringMVC 中的Interceptor 拦截器也是相当重要和相当有用的，它的主要作用是拦截用户的请求并进行相应的处理。比如通过它来进行权限验证，或者是来判断用户是否登陆，或者是像12306 那样子判断当前时间是否是购票时间。</p><p><br></p><p>一、定义Interceptor实现类</p><p>SpringMVC 中的Interceptor 拦截请求是通过HandlerInterceptor 来实现的。在SpringMVC 中定义一个Interceptor 非常简单，主要有两种方式，第一种方式是要定义的Interceptor类要实现了Spring 的HandlerInterceptor 接口，或者是这个类继承实现了HandlerInterceptor 接口的类，比如Spring 已经提供的实现了HandlerInterceptor 接口的抽象类HandlerInterceptorAdaptor 接口的类，比如Spring 已经提供的实现了HandlerInterceptor 接口的抽象类HandlerInterceptorAdapter ；第二种方式是实现Spring的WebRequestInterceptor接口，或or 接口的类，比如Spring 已经提供的实现了HandlerInterceptor 接口的抽象类HandlerInterceptorAdapter ；第二种方式是实现Spring的WebRequestInterceptor接口，或者是继承实现了WebRequestInterceptor的类。</p><p><br></p><p>（一）实现HandlerInterceptor接口</p><p>HandlerInterceptor 接口中定义了三个方法，我们就是通过这三个方法来对用户的请求进行拦截处理的。</p><p><br></p><p>（1 ）preHandle (HttpServletRequest request, HttpServletResponse response, Object handle) 方法，顾名思义，该方法将在请求处理之前进行调用。SpringMVC 中的Interceptor 是链式的调用的，在一个应用中或者说是在一个请求中可以同时存在多个Interceptor 。每个Interceptor 的调用会依据它的声明顺序依次执行，而且最先执行的都是Interceptor 中的preHandle 方法，所以可以在这个方法中进行一些前置初始化操作或者是对当前请求的一个预处理，也可以在这个方法中进行一些判断来决定请求是否要继续进行下去。该方法的返回值是布尔值Boolean 类型的，当它返回为false 时，表示请求结束，后续的Interceptor 和Controller 都不会再执行；当返回值为true 时就会继续调用下一个Interceptor 的preHandle 方法，如果已经是最后一个Interceptor 的时候就会是调用当前请求的Controller 方法。</p><p><br></p><p>（2 ）postHandle (HttpServletRequest request, HttpServletResponse response, Object handle, ModelAndView modelAndView) 方法，由preHandle 方法的解释我们知道这个方法包括后面要说到的afterCompletion 方法都只能是在当前所属的Interceptor 的preHandle 方法的返回值为true 时才能被调用。postHandle 方法，顾名思义就是在当前请求进行处理之后，也就是Controller 方法调用之后执行，但是它会在DispatcherServlet 进行视图返回渲染之前被调用，所以我们可以在这个方法中对Controller 处理之后的ModelAndView 对象进行操作。postHandle 方法被调用的方向跟preHandle 是相反的，也就是说先声明的Interceptor 的postHandle 方法反而会后执行，这和Struts2里面的Interceptor 的执行过程有点类型。Struts2 里面的Interceptor 的执行过程也是链式的，只是在Struts2 里面需要手动调用ActionInvocation 的invoke 方法来触发对下一个Interceptor 或者是Action 的调用，然后每一个Interceptor 中在invoke 方法调用之前的内容都是按照声明顺序执行的，而invoke 方法之后的内容就是反向的。</p><p><br></p>', 1, 1, 9, '2018-10-7 16:51:03', '2018-10-7 16:29:35', 1, 23, 4, 5);
INSERT INTO `article` VALUES (2, '数据结构和算法面试题系列—递归算法总结', '这个系列是我多年前找工作时对数据结构和算法总结，其中有基础部分，也有各大公司的经典的面试题，最早发布在CSDN。现整理为一个系列给需要的朋友参考，如有错误，欢迎指正。本系列完整代码地址在 这里。\n注：此刻，我正在从广州回家的绿皮火车上整理的这篇文章，火车摇摇晃晃，颠簸的尽是乡愁，忍不住又想翻翻周云蓬的《绿皮火车》了。———记于2018年9月30日夜22:00分。\n\n------------\n\n0 概述\n前面总结了随机算法，这次再把以前写的递归算法的文章梳理一下，这篇文章主要是受到宋劲松老师写的《Linux C编程》的递归章节启发写的。最能体现算法精髓的非递归莫属了，希望这篇文章对初学递归或者对递归有困惑的朋友们能有所帮助，如有错误，也恳请各路大牛指正。二叉树的递归示例代码请参见仓库的 binary_tree 目录，本文其他代码在 这里。\n1 递归算法初探\n本段内容主要摘自《linux C一站式编程》，作者是宋劲松老师，这是我觉得目前看到的国内关于Linux C编程的最好的技术书籍之一，强烈推荐下！\n关于递归的一个简单例子是求整数阶乘，n!=n*(n-1)!，0!=1 。则可以写出如下的递归程序：\n`int factorial(int n)\n{\n	if (n == 0)\n		return 1;\n	else {\n		int recurse = factorial(n-1);\n		int result = n * recurse;\n		return result;\n	}\n}\nfactorial这个函数就是一个递归函数，它调用了它自己。自己直接或间接调用自己的函数称为递归函数。如果觉得迷惑，可以把 factorial(n-1) 这一步看成是在调用另一个函数－－另一个有着相同函数名和相同代码的函数，调用它就是跳到它的代码里执行，然后再返回 factorial(n-1) 这个调用的下一步继续执行。\n为了证明递归算法的正确性，我们可以一步步跟进去看执行结果。记得刚学递归算法的时候，老是有丈二和尚摸不着头脑的感觉，那时候总是想着把递归一步步跟进去看执行结果。递归层次少还算好办，但是层次一多，头就大了，完全不知道自己跟到了递归的哪一层。比如求阶乘，如果只是factorial(3)跟进去问题还不大，但是若是factorial(100)要跟进去那真的会烦死人。\n事实上，我们并不是每个函数都需要跟进去看执行结果的，比如我们在自己的函数中调用printf函数时，并没有钻进去看它是怎么打印的，因为我们相信它能完成打印工作。 我们在写factorial函数时有如下代码：\n`int recurse = factorial(n-1);\nint result = n * recurse;`\n这时，如果我们相信factorial是正确的，那么传递参数为n-1它就会返回(n-1)!，那么result=n*(n-1)!=n!，从而这就是factorial(n)的结果。\n当然这有点奇怪：我们还没写完factorial这个函数，凭什么要相信factorial(n-1)是正确的？如果你相信你正在写的递归函数是正确的，并调用它，然后在此基础上写完这个递归函数，那么它就会是正确的，从而值得你相信它正确。\n这么说还是有点玄乎，我们从数学上严格证明一下 factorial 函数的正确性。刚才说了，factorial(n) 的正确性依赖于 factorial(n-1) 的正确性，只要后者正确，在后者的结果上乘个 n 返回这一步显然也没有疑问，那么我们的函数实现就是正确的。因此要证明factorial(n) 的正确性就是要证明 factorial(n-1) 的正确性，同理，要证明factorial(n-1) 的正确性就是要证明 factorial(n-2) 的正确性，依此类推下去，最后是：要证明 factorial(1) 的正确性就是要证明 factorial(0) 的正确性。而factorial(0) 的正确性不依赖于别的函数调用，它就是程序中的一个小的分支return 1; 这个 1 是我们根据阶乘的定义写的，肯定是正确的，因此 factorial(1) 的实现是正确的，因此 factorial(2) 也正确，依此类推，最后 factorial(n) 也是正确的。\n其实这就是在中学时学的数学归纳法，用数学归纳法来证明只需要证明两点：Base Case正确，递推关系正确。写递归函数时一定要记得写Base Case，否则即使递推关系正确，整个函数也不正确。如果 factorial 函数漏掉了Base Case，那么会导致无限循环。\n2 递归经典问题\n从上一节的一个关于求阶乘的简单例子的论述，我们可以了解到递归算法的精髓：要从功能上理解函数，同时你要相信你正在写的函数是正确的，在此基础上调用它，那么它就是正确的。 下面就从几个常见的算法题来看看如何理解递归，这是我的一些理解，欢迎大家提出更好的方法。\n2.1）汉诺塔问题\n题： 汉诺塔问题是个常见问题，就是说有n个大小不等的盘子放在一个塔A上面，自底向上按照从小到大的顺序排列。要求将所有n个盘子搬到另一个塔C上面，可以借助一个塔B中转，但是要满足任何时刻大盘子不能放在小盘子上面。\n解： 基本思想分三步，先把上面的 N-1 个盘子经 C 移到 B，然后将最底下的盘子移到 C，再将 B 上面的N-1个盘子经 A 移动到 C。总的时间复杂度 f(n)=2f(n-1)+1，所以 f(n)=2^n-1。\n`/**\n * 汉诺塔\n */\nvoid hano(char a, char b, char c, int n) {\n    if (n <= 0) return;\n\n    hano(a, c, b, n-1);\n    move(a, c);\n    hano(b, a, c, n-1);\n}\n\nvoid move(char a, char b)\n{\n    printf(\"%c->%c\\n\", a, b);\n}\n2.2）求二叉树的深度\n这里的深度指的是二叉树从根结点到叶结点最大的高度，比如只有一个结点，则深度为1，如果有N层，则高度为N。\n`int depth(BTNode* root)  \n{  \n    if (root == NULL)  \n        return 0;  \n    else {  \n        int lDepth = depth(root->left);  //获取左子树深度  \n        int rDepth = depth(root->right); //获取右子树深度  \n        return lDepth>rDepth? lDepth+1: rDepth+1; //取较大值+1即为二叉树深度  \n    }  \n}  \n那么如何从功能上理解 depth 函数呢？我们可以知道定义该函数的目的就是求二叉树深度，也就是说我们要是完成了函数 depth，那么 depth(root) 就能正确返回以 root 为根结点的二叉树的深度。因此我们的代码中 depth(root->left) 返回左子树的深度，而depth(root->right) 返回右子树的深度。尽管这个时候我们还没有写完 depth 函数，但是我们相信 depth 函数能够正确完成功能。因此我们得到了 lDepth 和rDepth，而后通过比较返回较大值加1为二叉树的深度。\n如果不好理解，可以想象在 depth 中调用的函数 depth(root->left) 为另外一个同样名字完成相同功能的函数，这样就好理解了。注意 Base Case，这里就是当 root==NULL 时，则深度为0，函数返回0。\n2.3）判断二叉树是否平衡\n一颗平衡的二叉树是指其任意结点的左右子树深度之差不大于1。判断一棵二叉树是否是平衡的，可以使用递归算法来实现。', '<p>这个系列是我多年前找工作时对数据结构和算法总结，其中有基础部分，也有各大公司的经典的面试题，最早发布在CSDN。现整理为一个系列给需要的朋友参考，如有错误，欢迎指正。本系列完整代码地址在 这里。<br>注：此刻，我正在从广州回家的绿皮火车上整理的这篇文章，火车摇摇晃晃，颠簸的尽是乡愁，忍不住又想翻翻周云蓬的《绿皮火车》了。———记于2018年9月30日夜22:00分。</p>\n<hr>\n<p>0 概述<br>前面总结了随机算法，这次再把以前写的递归算法的文章梳理一下，这篇文章主要是受到宋劲松老师写的《Linux C编程》的递归章节启发写的。最能体现算法精髓的非递归莫属了，希望这篇文章对初学递归或者对递归有困惑的朋友们能有所帮助，如有错误，也恳请各路大牛指正。二叉树的递归示例代码请参见仓库的 binary_tree 目录，本文其他代码在 这里。<br>1 递归算法初探<br>本段内容主要摘自《linux C一站式编程》，作者是宋劲松老师，这是我觉得目前看到的国内关于Linux C编程的最好的技术书籍之一，强烈推荐下！<br>关于递归的一个简单例子是求整数阶乘，n!=n<em>(n-1)!，0!=1 。则可以写出如下的递归程序：<br>`int factorial(int n)<br>{<br>    if (n == 0)<br>        return 1;<br>    else {<br>        int recurse = factorial(n-1);<br>        int result = n </em> recurse;<br>        return result;<br>    }<br>}<br>factorial这个函数就是一个递归函数，它调用了它自己。自己直接或间接调用自己的函数称为递归函数。如果觉得迷惑，可以把 factorial(n-1) 这一步看成是在调用另一个函数－－另一个有着相同函数名和相同代码的函数，调用它就是跳到它的代码里执行，然后再返回 factorial(n-1) 这个调用的下一步继续执行。<br>为了证明递归算法的正确性，我们可以一步步跟进去看执行结果。记得刚学递归算法的时候，老是有丈二和尚摸不着头脑的感觉，那时候总是想着把递归一步步跟进去看执行结果。递归层次少还算好办，但是层次一多，头就大了，完全不知道自己跟到了递归的哪一层。比如求阶乘，如果只是factorial(3)跟进去问题还不大，但是若是factorial(100)要跟进去那真的会烦死人。<br>事实上，我们并不是每个函数都需要跟进去看执行结果的，比如我们在自己的函数中调用printf函数时，并没有钻进去看它是怎么打印的，因为我们相信它能完成打印工作。 我们在写factorial函数时有如下代码：<br><code>int recurse = factorial(n-1);\nint result = n * recurse;</code><br>这时，如果我们相信factorial是正确的，那么传递参数为n-1它就会返回(n-1)!，那么result=n<em>(n-1)!=n!，从而这就是factorial(n)的结果。<br>当然这有点奇怪：我们还没写完factorial这个函数，凭什么要相信factorial(n-1)是正确的？如果你相信你正在写的递归函数是正确的，并调用它，然后在此基础上写完这个递归函数，那么它就会是正确的，从而值得你相信它正确。<br>这么说还是有点玄乎，我们从数学上严格证明一下 factorial 函数的正确性。刚才说了，factorial(n) 的正确性依赖于 factorial(n-1) 的正确性，只要后者正确，在后者的结果上乘个 n 返回这一步显然也没有疑问，那么我们的函数实现就是正确的。因此要证明factorial(n) 的正确性就是要证明 factorial(n-1) 的正确性，同理，要证明factorial(n-1) 的正确性就是要证明 factorial(n-2) 的正确性，依此类推下去，最后是：要证明 factorial(1) 的正确性就是要证明 factorial(0) 的正确性。而factorial(0) 的正确性不依赖于别的函数调用，它就是程序中的一个小的分支return 1; 这个 1 是我们根据阶乘的定义写的，肯定是正确的，因此 factorial(1) 的实现是正确的，因此 factorial(2) 也正确，依此类推，最后 factorial(n) 也是正确的。<br>其实这就是在中学时学的数学归纳法，用数学归纳法来证明只需要证明两点：Base Case正确，递推关系正确。写递归函数时一定要记得写Base Case，否则即使递推关系正确，整个函数也不正确。如果 factorial 函数漏掉了Base Case，那么会导致无限循环。<br>2 递归经典问题<br>从上一节的一个关于求阶乘的简单例子的论述，我们可以了解到递归算法的精髓：要从功能上理解函数，同时你要相信你正在写的函数是正确的，在此基础上调用它，那么它就是正确的。 下面就从几个常见的算法题来看看如何理解递归，这是我的一些理解，欢迎大家提出更好的方法。<br>2.1）汉诺塔问题<br>题： 汉诺塔问题是个常见问题，就是说有n个大小不等的盘子放在一个塔A上面，自底向上按照从小到大的顺序排列。要求将所有n个盘子搬到另一个塔C上面，可以借助一个塔B中转，但是要满足任何时刻大盘子不能放在小盘子上面。<br>解： 基本思想分三步，先把上面的 N-1 个盘子经 C 移到 B，然后将最底下的盘子移到 C，再将 B 上面的N-1个盘子经 A 移动到 C。总的时间复杂度 f(n)=2f(n-1)+1，所以 f(n)=2^n-1。<br>`/*</em></p>\n<ul>\n<li><p>汉诺塔<br>*/<br>void hano(char a, char b, char c, int n) {<br> if (n &lt;= 0) return;</p>\n<p> hano(a, c, b, n-1);<br> move(a, c);<br> hano(b, a, c, n-1);<br>}</p>\n</li></ul>\n<p>void move(char a, char b)<br>{<br>    printf(“%c-&gt;%c\\n”, a, b);<br>}<br>2.2）求二叉树的深度<br>这里的深度指的是二叉树从根结点到叶结点最大的高度，比如只有一个结点，则深度为1，如果有N层，则高度为N。<br>`int depth(BTNode* root)<br>{<br>    if (root == NULL)<br>        return 0;<br>    else {<br>        int lDepth = depth(root-&gt;left);  //获取左子树深度<br>        int rDepth = depth(root-&gt;right); //获取右子树深度<br>        return lDepth&gt;rDepth? lDepth+1: rDepth+1; //取较大值+1即为二叉树深度<br>    }<br>}<br>那么如何从功能上理解 depth 函数呢？我们可以知道定义该函数的目的就是求二叉树深度，也就是说我们要是完成了函数 depth，那么 depth(root) 就能正确返回以 root 为根结点的二叉树的深度。因此我们的代码中 depth(root-&gt;left) 返回左子树的深度，而depth(root-&gt;right) 返回右子树的深度。尽管这个时候我们还没有写完 depth 函数，但是我们相信 depth 函数能够正确完成功能。因此我们得到了 lDepth 和rDepth，而后通过比较返回较大值加1为二叉树的深度。<br>如果不好理解，可以想象在 depth 中调用的函数 depth(root-&gt;left) 为另外一个同样名字完成相同功能的函数，这样就好理解了。注意 Base Case，这里就是当 root==NULL 时，则深度为0，函数返回0。<br>2.3）判断二叉树是否平衡<br>一颗平衡的二叉树是指其任意结点的左右子树深度之差不大于1。判断一棵二叉树是否是平衡的，可以使用递归算法来实现。</p>', 1, 1, 11, '2018-10-2 22:26:42', '2018-10-2 22:26:42', 1, 55, 1, 0);
INSERT INTO `article` VALUES (3, 'WebSocket的故事（一）——— Springboot中，实现更灵活的WebSocket', '**概述**\nWebSocket的故事系列计划分五大篇六章，旨在由浅入深的介绍WebSocket以及在Springboot中如何快速构建和使用WebSocket提供的能力。本系列计划包含如下几篇**文章：**\n**第一篇，什么是WebSocket以及它的用途\n第二篇，Spring中如何利用STOMP快速构建WebSocket广播式消息模式\n第三篇，Springboot中，如何利用WebSocket和STOMP快速构建点对点的消息模式(1)\n第四篇，Springboot中，如何利用WebSocket和STOMP快速构建点对点的消息模式(2)\n第五篇，Springboot中，实现网页聊天室之自定义WebSocket消息代理\n第六篇，Springboot中，实现更灵活的WebSocket**\n**本篇的主线**\n本篇是这个系列的最后一篇，将介绍另一种实现WebSocket的方式。仍然会以一个简单聊天室为例子进行讲述。至此我们也可以根据具体情况，选择不同的实现方式。\n本篇适合的读者\n想了解如何在Springboot上自定义实现更为复杂的WebSocket产品逻辑的各路有志青年。\n使用Tomcat提供的WebSocket支持\n早在Java EE 7时，就发布了JSR356规范。Tomcat7.0.47开始，也支持了统一的WebSocket接口。在使用Springboot时，也可以轻松的使用Tomcat提供的这些API。今天我们就来体验一把Tomcat实现的WebSocket。\n1. 引入依赖\n<dependency>\n     <groupId>org.springframework.boot</groupId>\n     <artifactId>spring-boot-starter-websocket</artifactId>\n</dependency>\n复制代码Springboot内置了tomcat，我们直接引入spring的这个高级组件即可。顺便多说一句，Springboot的高级组件会自动引用基础的组件，像spring-boot-starter-websocket就引入了spring-boot-starter-web和spring-boot-starter，所以不要重复引入。\n2. 使用@ServerEndpoint创建WebSocket Endpoint\n首先要注入ServerEndpointExporter，这个Bean会自动注册使用了@ServerEndpoint注解声明的WebSocket Endpoint。\npackage com.draw.wsdraw.websocket;\n\nimport org.springframework.context.annotation.Bean;\nimport org.springframework.context.annotation.Configuration;\nimport org.springframework.web.socket.server.standard.ServerEndpointExporter;\n\n@Configuration\npublic class WebSocketConfig {\n    @Bean\n    public ServerEndpointExporter serverEndpointExporter() {\n        return new ServerEndpointExporter();\n    }\n}\n复制代码然后，我们动手实现WebSocket服务的实现类，这里是WebSocketServer，注意别忘了用@ServerEndpint和@Component声明下。虽然@Component默认是单例模式的，但Springboot还是会为每个WebSocket连接初始化一个Bean，所以可以用一个静态Map保存起来。换句话说，每当有一个用户向服务器发起连接时，都会创建一个WebSocketServer对象，将此对象按roomId保存在HashMap中，方便后续使用。\n创建ServerEndpoint时，需要对应实现其所需的几个功能性方法：OnOpen、OnMessage、OnClose、OnError。\n\n@OnOpen：客户端向服务端发起建立连接时，服务端调用,可传入的参数为Session(WebSocket的Session)和EndpointConfig。另外，还可以加入带@PathParam注解的参数。这里我们注解的参数是roomId，即在建立连接时，携带的请求地址上的参数，与我们上一篇中介绍的{INFO}是一样的作用。\n@OnMessage：客户端消息到来时调用，包含会话Session，根据消息的形式，如果是文本消息，传入String类型参数或者Reader，如果是二进制消息，传入byte[]类型参数或者InputStream。\n@OnClose：当断开连接，关闭WebSocket时调用。\n@OnError：当发生错误时调用，传入异常Session和错误信息。\n\n重写上述方法，即可实现WebSocket的服务端业务逻辑。\n@ServerEndpoint(\"/webSocket/{roomId}\")\n@Component\npublic class WebSocketServer {\n    private static ConcurrentHashMap<String, List<WebSocketServer>> webSocketMap =\n            new ConcurrentHashMap<>(3);\n\n    //与某个客户端的连接会话，需要通过它来给客户端发送数据\n    private Session session;\n\n    //接收roomId\n    private String roomId = \"\";\n\n    /**\n     * 连接建立成功调用的方法\n     */\n    @OnOpen\n    public void onOpen(Session session, EndpointConfig config, @PathParam(\"roomId\") String roomId) {\n        if (roomId == null || roomId.isEmpty()) return;\n        this.session = session;\n        this.roomId = roomId;\n        addSocketServer2Map(this);\n        try {\n            sendMessage(\"连接成功\", true);\n        } catch (IOException e) {\n        }\n    }\n\n    /**\n     * 连接关闭调用的方法\n     */\n    @OnClose\n    public void onClose() {\n        List<WebSocketServer> wssList = webSocketMap.get(roomId);\n        if (wssList != null) {\n            for (WebSocketServer item : wssList) {\n                if (item.session.getId().equals(session.getId())) {\n                    wssList.remove(item);\n                    if (wssList.isEmpty()) {\n                        webSocketMap.remove(roomId);\n                    }\n                    break;\n                }\n            }\n        }\n    }\n    \n    /**\n     * 收到客户端消息后调用的方法\n     */\n    @OnMessage\n    public void onMessage(String message, Session session) {\n        //群发消息\n        String msg = filterMessage(message);\n        if (msg != null) {\n            sendInfo(msg, roomId, session);\n        }\n    }\n\n    /**\n     * 发生错误时，调用的方法\n     */\n    @OnError\n    public void onError(Session session, Throwable error) {\n    }\n\n复制代码这样，服务端的代码就实现完了，这里仅贴出来部分源码，文后会给出项目源码地址。\n3. 实现客户端页面\n<script type=\"text/javascript\">\n    var ws;\n    \n    function setConnected(connected){\n        document.getElementById(\'connect\').disabled = connected;\n        document.getElementById(\'disconnect\').disabled = !connected;\n        document.getElementById(\'conversationDiv\').style.visibility = connected ? \'visible\' : \'hidden\';\n        $(\"#response\").html();\n    }\n\n    function connect(){\n        var roomId = $(\'#roomId\').val();\n        ws = new WebSocket(\'ws://localhost:8080/webSocket/\' + roomId);\n        ws.onopen = WSonOpen;\n        ws.onmessage = WSonMessage;\n        ws.onclose = WSonClose;\n        ws.onerror = WSonError;\n    }\n\n    function WSonOpen() {\n        var message = {\n            name:\'Server\',\n            chatContent:\'成功连接\'\n        }\n        setConnected(true);\n        showResponse(message)\n    };\n\n    function WSonMessage(event) {\n        var message = {\n            name:\'Server\',\n            chatContent:event.data\n        }\n        showResponse(message)\n    };\n\n    function WSonClose() {\n        var message = {\n            name:\'Server\',\n            chatContent:\'已断开\'\n        }\n        showResponse(message)\n    };\n\n    function WSonError() {\n        var message = {\n            name:\'Server\',\n            chatContent:\'连接错误！\'\n        }\n        showResponse(message)\n    };\n\n    function disconnect(){\n        ws.close()\n        setConnected(false);\n        console.log(\"Disconnected\");\n    }\n\n    function sendMessage(){\n        var chatContent = $(\"#chatContent\").val();\n        var roomId = $(\'#roomId\').val();\n        ws.send(JSON.stringify({\'roomId\':roomId,\'chatContent\':chatContent}))\n    }\n\n    function showResponse(message){\n         var response = $(\"#response\").val();\n         $(\"#response\").val(response+message.name+\': \'+message.chatContent+\'\\n\');\n    }\n</script>\n复制代码客户端页面实现了简单的连接、断开和消息发送功能。这部分就不详细介绍了。\n\n作者：xNPE\n链接：https://juejin.im/post/5baf20525188255c425837ad\n来源：掘金\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '<p><strong>概述</strong><br>WebSocket的故事系列计划分五大篇六章，旨在由浅入深的介绍WebSocket以及在Springboot中如何快速构建和使用WebSocket提供的能力。本系列计划包含如下几篇<strong>文章：</strong><br><strong>第一篇，什么是WebSocket以及它的用途<br>第二篇，Spring中如何利用STOMP快速构建WebSocket广播式消息模式<br>第三篇，Springboot中，如何利用WebSocket和STOMP快速构建点对点的消息模式(1)<br>第四篇，Springboot中，如何利用WebSocket和STOMP快速构建点对点的消息模式(2)<br>第五篇，Springboot中，实现网页聊天室之自定义WebSocket消息代理<br>第六篇，Springboot中，实现更灵活的WebSocket</strong><br><strong>本篇的主线</strong><br>本篇是这个系列的最后一篇，将介绍另一种实现WebSocket的方式。仍然会以一个简单聊天室为例子进行讲述。至此我们也可以根据具体情况，选择不同的实现方式。<br>本篇适合的读者<br>想了解如何在Springboot上自定义实现更为复杂的WebSocket产品逻辑的各路有志青年。<br>使用Tomcat提供的WebSocket支持<br>早在Java EE 7时，就发布了JSR356规范。Tomcat7.0.47开始，也支持了统一的WebSocket接口。在使用Springboot时，也可以轻松的使用Tomcat提供的这些API。今天我们就来体验一把Tomcat实现的WebSocket。</p>\n<ol>\n<li>引入依赖<br>&lt;dependency&gt;<br>  &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;<br>  &lt;artifactId&gt;spring-boot-starter-websocket&lt;/artifactId&gt;<br>&lt;/dependency&gt;<br>复制代码Springboot内置了tomcat，我们直接引入spring的这个高级组件即可。顺便多说一句，Springboot的高级组件会自动引用基础的组件，像spring-boot-starter-websocket就引入了spring-boot-starter-web和spring-boot-starter，所以不要重复引入。</li><li>使用<a href=\"https://github.com/ServerEndpoint\" title=\"&#64;ServerEndpoint\" class=\"at-link\">@ServerEndpoint</a>创建WebSocket Endpoint<br>首先要注入ServerEndpointExporter，这个Bean会自动注册使用了<a href=\"https://github.com/ServerEndpoint\" title=\"&#64;ServerEndpoint\" class=\"at-link\">@ServerEndpoint</a>注解声明的WebSocket Endpoint。<br>package com.draw.wsdraw.websocket;</li></ol>\n<p>import org.springframework.context.annotation.Bean;<br>import org.springframework.context.annotation.Configuration;<br>import org.springframework.web.socket.server.standard.ServerEndpointExporter;</p>\n<p><a href=\"https://github.com/Configuration\" title=\"&#64;Configuration\" class=\"at-link\">@Configuration</a><br>public class WebSocketConfig {<br>    <a href=\"https://github.com/Bean\" title=\"&#64;Bean\" class=\"at-link\">@Bean</a><br>    public ServerEndpointExporter serverEndpointExporter() {<br>        return new ServerEndpointExporter();<br>    }<br>}<br>复制代码然后，我们动手实现WebSocket服务的实现类，这里是WebSocketServer，注意别忘了用<a href=\"https://github.com/ServerEndpint\" title=\"&#64;ServerEndpint\" class=\"at-link\">@ServerEndpint</a>和<a href=\"https://github.com/Component\" title=\"&#64;Component\" class=\"at-link\">@Component</a>声明下。虽然<a href=\"https://github.com/Component\" title=\"&#64;Component\" class=\"at-link\">@Component</a>默认是单例模式的，但Springboot还是会为每个WebSocket连接初始化一个Bean，所以可以用一个静态Map保存起来。换句话说，每当有一个用户向服务器发起连接时，都会创建一个WebSocketServer对象，将此对象按roomId保存在HashMap中，方便后续使用。<br>创建ServerEndpoint时，需要对应实现其所需的几个功能性方法：OnOpen、OnMessage、OnClose、OnError。</p>\n<p><a href=\"https://github.com/OnOpen\" title=\"&#64;OnOpen\" class=\"at-link\">@OnOpen</a>：客户端向服务端发起建立连接时，服务端调用,可传入的参数为Session(WebSocket的Session)和EndpointConfig。另外，还可以加入带<a href=\"https://github.com/PathParam\" title=\"&#64;PathParam\" class=\"at-link\">@PathParam</a>注解的参数。这里我们注解的参数是roomId，即在建立连接时，携带的请求地址上的参数，与我们上一篇中介绍的{INFO}是一样的作用。<br><a href=\"https://github.com/OnMessage\" title=\"&#64;OnMessage\" class=\"at-link\">@OnMessage</a>：客户端消息到来时调用，包含会话Session，根据消息的形式，如果是文本消息，传入String类型参数或者Reader，如果是二进制消息，传入byte[]类型参数或者InputStream。<br><a href=\"https://github.com/OnClose\" title=\"&#64;OnClose\" class=\"at-link\">@OnClose</a>：当断开连接，关闭WebSocket时调用。<br><a href=\"https://github.com/OnError\" title=\"&#64;OnError\" class=\"at-link\">@OnError</a>：当发生错误时调用，传入异常Session和错误信息。</p>\n<p>重写上述方法，即可实现WebSocket的服务端业务逻辑。<br><a href=\"https://github.com/ServerEndpoint\" title=\"&#64;ServerEndpoint\" class=\"at-link\">@ServerEndpoint</a>(“/webSocket/{roomId}”)<br><a href=\"https://github.com/Component\" title=\"&#64;Component\" class=\"at-link\">@Component</a><br>public class WebSocketServer {<br>    private static ConcurrentHashMap&lt;String, List&lt;WebSocketServer&gt;&gt; webSocketMap =<br>            new ConcurrentHashMap&lt;&gt;(3);</p>\n<pre><code>//与某个客户端的连接会话，需要通过它来给客户端发送数据\nprivate Session session;\n\n//接收roomId\nprivate String roomId = &quot;&quot;;\n\n/**\n * 连接建立成功调用的方法\n */\n@OnOpen\npublic void onOpen(Session session, EndpointConfig config, @PathParam(&quot;roomId&quot;) String roomId) {\n    if (roomId == null || roomId.isEmpty()) return;\n    this.session = session;\n    this.roomId = roomId;\n    addSocketServer2Map(this);\n    try {\n        sendMessage(&quot;连接成功&quot;, true);\n    } catch (IOException e) {\n    }\n}\n\n/**\n * 连接关闭调用的方法\n */\n@OnClose\npublic void onClose() {\n    List&lt;WebSocketServer&gt; wssList = webSocketMap.get(roomId);\n    if (wssList != null) {\n        for (WebSocketServer item : wssList) {\n            if (item.session.getId().equals(session.getId())) {\n                wssList.remove(item);\n                if (wssList.isEmpty()) {\n                    webSocketMap.remove(roomId);\n                }\n                break;\n            }\n        }\n    }\n}\n\n/**\n * 收到客户端消息后调用的方法\n */\n@OnMessage\npublic void onMessage(String message, Session session) {\n    //群发消息\n    String msg = filterMessage(message);\n    if (msg != null) {\n        sendInfo(msg, roomId, session);\n    }\n}\n\n/**\n * 发生错误时，调用的方法\n */\n@OnError\npublic void onError(Session session, Throwable error) {\n}\n</code></pre><p>复制代码这样，服务端的代码就实现完了，这里仅贴出来部分源码，文后会给出项目源码地址。</p>\n<ol>\n<li><p>实现客户端页面<br>&lt;script type=&quot;text/javascript&quot;&gt;<br> var ws;</p>\n<p> function setConnected(connected){</p>\n<pre><code> document.getElementById(&#39;connect&#39;).disabled = connected;\n document.getElementById(&#39;disconnect&#39;).disabled = !connected;\n document.getElementById(&#39;conversationDiv&#39;).style.visibility = connected ? &#39;visible&#39; : &#39;hidden&#39;;\n $(&quot;#response&quot;).html();\n</code></pre><p> }</p>\n<p> function connect(){</p>\n<pre><code> var roomId = $(&#39;#roomId&#39;).val();\n ws = new WebSocket(&#39;ws://localhost:8080/webSocket/&#39; + roomId);\n ws.onopen = WSonOpen;\n ws.onmessage = WSonMessage;\n ws.onclose = WSonClose;\n ws.onerror = WSonError;\n</code></pre><p> }</p>\n<p> function WSonOpen() {</p>\n<pre><code> var message = {\n     name:&#39;Server&#39;,\n     chatContent:&#39;成功连接&#39;\n }\n setConnected(true);\n showResponse(message)\n</code></pre><p> };</p>\n<p> function WSonMessage(event) {</p>\n<pre><code> var message = {\n     name:&#39;Server&#39;,\n     chatContent:event.data\n }\n showResponse(message)\n</code></pre><p> };</p>\n<p> function WSonClose() {</p>\n<pre><code> var message = {\n     name:&#39;Server&#39;,\n     chatContent:&#39;已断开&#39;\n }\n showResponse(message)\n</code></pre><p> };</p>\n<p> function WSonError() {</p>\n<pre><code> var message = {\n     name:&#39;Server&#39;,\n     chatContent:&#39;连接错误！&#39;\n }\n showResponse(message)\n</code></pre><p> };</p>\n<p> function disconnect(){</p>\n<pre><code> ws.close()\n setConnected(false);\n console.log(&quot;Disconnected&quot;);\n</code></pre><p> }</p>\n<p> function sendMessage(){</p>\n<pre><code> var chatContent = $(&quot;#chatContent&quot;).val();\n var roomId = $(&#39;#roomId&#39;).val();\n ws.send(JSON.stringify({&#39;roomId&#39;:roomId,&#39;chatContent&#39;:chatContent}))\n</code></pre><p> }</p>\n<p> function showResponse(message){</p>\n<pre><code>  var response = $(&quot;#response&quot;).val();\n  $(&quot;#response&quot;).val(response+message.name+&#39;: &#39;+message.chatContent+&#39;\\n&#39;);\n</code></pre><p> }<br>&lt;/script&gt;<br>复制代码客户端页面实现了简单的连接、断开和消息发送功能。这部分就不详细介绍了。</p>\n</li></ol>\n<p>作者：xNPE<br>链接：<a href=\"https://juejin.im/post/5baf20525188255c425837ad\">https://juejin.im/post/5baf20525188255c425837ad</a><br>来源：掘金<br>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>', 4, 1, 8, '2018-10-7 21:35:20', '2018-10-7 23:18:31', 1, 135, 1, 0);
INSERT INTO `article` VALUES (5, '分布式事务中间件 TCC-Transaction 源码分析 —— 事务存储器', '本文主要基于 TCC-Transaction 1.2.3.3 正式版\n\n**1. 概述**\n本文分享 事务存储器。主要涉及如下 Maven 项目：\n\ntcc-transaction-core ：tcc-transaction 底层实现。\n在 TCC 的过程中，根据应用内存中的事务信息完成整个事务流程。But 实际业务场景中，将事务信息只放在应用内存中是远远不够可靠的。例如：\n\n应用进程异常崩溃，未完成的事务信息将丢失。\n应用进程集群，当提供远程服务调用时，事务信息需要集群内共享。\n发起事务的应用需要重启部署新版本，因为各种原因，有未完成的事务。\n因此，TCC-Transaction 将事务信息添加到内存中的同时，会使用外部存储进行持久化。目前提供四种外部存储：\n\nJdbcTransactionRepository，JDBC 事务存储器\nRedisTransactionRepository，Redis 事务存储器\nZooKeeperTransactionRepository，Zookeeper 事务存储器\nFileSystemTransactionRepository，File 事务存储器\n本文涉及到的类关系如下图( 打开大图 )：\n\n\n\n你行好事会因为得到赞赏而愉悦\n同理，开源项目贡献者会因为 Star 而更加有动力\n为 TCC-Transaction 点赞！传送门\n\nps：笔者假设你已经阅读过《tcc-transaction 官方文档 —— 使用指南1.2.x》。\n\n**2. 序列化**\n在《TCC-Transaction 源码分析 —— TCC 实现》「4. 事务与参与者」，可以看到 Transaction 是一个比较复杂的对象，内嵌 Participant 数组，而 Participant 本身也是复杂的对象，内嵌了更多的其他对象，因此，存储器在持久化 Transaction 时，需要序列化后才能存储。\n\norg.mengyun.tcctransaction.serializer.ObjectSerializer，对象序列化接口。实现代码如下：\n\npublic interface ObjectSerializer<T> {\n\n    byte[] serialize(T t);\n    \n    T deserialize(byte[] bytes);\n\n}\n目前提供 JDK自带序列化 和 Kyro序列化 两种实现。\n\n2.1 JDK 序列化实现\norg.mengyun.tcctransaction.serializer.JdkSerializationSerializer，JDK 序列化实现。比较易懂，点击链接直接查看。\n\nTCC-Transaction 使用的默认的序列化。\n\n2.2 Kyro 序列化实现\norg.mengyun.tcctransaction.serializer.KryoTransactionSerializer，Kyro 序列化实现。比较易懂，点击链接直接查看。\n\n2.3 JSON 序列化实现\nJDK 和 Kyro 的序列化实现，肉眼无法直观具体存储事务的信息，你可以通过实现 ObjectSerializer 接口，实现自定义的 JSON 序列化。\n\n3. 存储器\norg.mengyun.tcctransaction.TransactionRepository，事务存储器接口。实现代码如下：\n\npublic interface TransactionRepository {\n\n    /**\n     * 新增事务\n     *\n     * @param transaction 事务\n     * @return 新增数量\n     */\n    int create(Transaction transaction);\n\n    /**\n     * 更新事务\n     *\n     * @param transaction 事务\n     * @return 更新数量\n     */\n    int update(Transaction transaction);\n\n    /**\n     * 删除事务\n     *\n     * @param transaction 事务\n     * @return 删除数量\n     */\n    int delete(Transaction transaction);\n\n    /**\n     * 获取事务\n     *\n     * @param xid 事务编号\n     * @return 事务\n     */\n    Transaction findByXid(TransactionXid xid);\n\n    /**\n     * 获取超过指定时间的事务集合\n     *\n     * @param date 指定时间\n     * @return 事务集合\n     */\n    List<Transaction> findAllUnmodifiedSince(Date date);\n}\n不同的存储器通过实现该接口，提供事务的增删改查功能。\n\n**3.1 可缓存的事务存储器抽象类**\norg.mengyun.tcctransaction.repository.CachableTransactionRepository，可缓存的事务存储器抽象类，实现增删改查事务时，同时缓存事务信息。在上面类图，我们也可以看到 TCC-Transaction 自带的多种存储器都继承该抽象类。\n\nCachableTransactionRepository 构造方法实现代码如下：\n\npublic abstract class CachableTransactionRepository implements TransactionRepository {\n\n    /**\n     * 缓存过期时间\n     */\n    private int expireDuration = 120;\n    /**\n     * 缓存\n     */\n    private Cache<Xid, Transaction> transactionXidCompensableTransactionCache;\n\n    public CachableTransactionRepository() {\n        transactionXidCompensableTransactionCache = CacheBuilder.newBuilder().expireAfterAccess(expireDuration, TimeUnit.SECONDS).maximumSize(1000).build();\n    }\n}\n使用 Guava Cache 内存缓存事务信息，设置最大缓存个数为 1000 个，缓存过期时间为最后访问时间 120 秒。\n#create(...) 实现代码如下：\n\n@Override\npublic int create(Transaction transaction) {\n   int result = doCreate(transaction);\n   if (result > 0) {\n       putToCache(transaction);\n   }\n   return result;\n}\n\n/**\n* 添加到缓存\n*\n* @param transaction 事务\n*/\nprotected void putToCache(Transaction transaction) {\n   transactionXidCompensableTransactionCache.put(transaction.getXid(), transaction);\n}\n\n/**\n* 新增事务\n*\n* @param transaction 事务\n* @return 新增数量\n*/\nprotected abstract int doCreate(Transaction transaction);\n调用 #doCreate(...) 方法，新增事务。新增成功后，调用 #putToCache(...) 方法，添加事务到缓存。\n#doCreate(...) 为抽象方法，子类实现该方法，提供新增事务功能。\n#update(...) 实现代码如下：\n\n@Override\npublic int update(Transaction transaction) {\n   int result = 0;\n   try {\n       result = doUpdate(transaction);\n       if (result > 0) {\n           putToCache(transaction);\n       } else {\n           throw new OptimisticLockException();\n       }\n   } finally {\n       if (result <= 0) { // 更新失败，移除缓存。下次访问，从存储器读取\n           removeFromCache(transaction);\n       }\n   }\n   return result;\n}\n\n/**\n* 移除事务从缓存\n*\n* @param transaction 事务\n*/\nprotected void removeFromCache(Transaction transaction) {\n   transactionXidCompensableTransactionCache.invalidate(transaction.getXid());\n}\n\n/**\n* 更新事务\n*\n* @param transaction 事务\n* @return 更新数量\n*/\nprotected abstract int doUpdate(Transaction transaction);\n调用 #doUpdate(...) 方法，更新事务。\n若更新成功后，调用 #putToCache(...) 方法，添加事务到缓存。\n若更新失败后，抛出 OptimisticLockException 异常。有两种情况会导致更新失败：(1) 该事务已经被提交，被删除；(2) 乐观锁更新时，缓存的事务的版本号( Transaction.version )和存储器里的事务的版本号不同，更新失败。为什么？在《TCC-Transaction 源码分析 —— 事务恢复》详细解析。更新失败，意味着缓存已经不不一致，调用 #removeFromCache(...) 方法，移除事务从缓存中。\n#doUpdate(...) 为抽象方法，子类实现该方法，提供更新事务功能。\n#delete(...) 实现代码如下：\n\n@Override\npublic int delete(Transaction transaction) {\n   int result;\n   try {\n       result = doDelete(transaction);\n   } finally {\n       removeFromCache(transaction);\n   }\n   return result;\n}\n\n/**\n* 删除事务\n*\n* @param transaction 事务\n* @return 删除数量\n*/\nprotected abstract int doDelete(Transaction transaction);\n调用 #doDelete(...) 方法，删除事务。\n调用 #removeFromCache(...) 方法，移除事务从缓存中。\n#doDelete(...) 为抽象方法，子类实现该方法，提供删除事务功能。\n#findByXid(...) 实现代码如下：\n\n@Override\npublic Transaction findByXid(TransactionXid transactionXid) {\n   Transaction transaction = findFromCache(transactionXid);\n   if (transaction == null) {\n       transaction = doFindOne(transactionXid);\n       if (transaction != null) {\n           putToCache(transaction);\n       }\n   }\n   return transaction;\n}\n\n/**\n* 获得事务从缓存中\n*\n* @param transactionXid 事务编号\n* @return 事务\n*/\nprotected Transaction findFromCache(TransactionXid transactionXid) {\n   return transactionXidCompensableTransactionCache.getIfPresent(transactionXid);\n}\n\n/**\n* 查询事务\n*\n* @param xid 事务编号\n* @return 事务\n*/\nprotected abstract Transaction doFindOne(Xid xid);\n调用 #findFromCache() 方法，优先从缓存中获取事务。\n调用 #doFindOne() 方法，缓存中事务不存在，从存储器中获取。获取到后，调用 #putToCache() 方法，添加事务到缓存中。\n#doFindOne(...) 为抽象方法，子类实现该方法，提供查询事务功能。\n#findAllUnmodifiedSince(...) 实现代码如下：\n\n@Override\npublic List<Transaction> findAllUnmodifiedSince(Date date) {\n   List<Transaction> transactions = doFindAllUnmodifiedSince(date);\n   // 添加到缓存\n   for (Transaction transaction : transactions) {\n       putToCache(transaction);\n   }\n   return transactions;\n}\n\n/**\n* 获取超过指定时间的事务集合\n*\n* @param date 指定时间\n* @return 事务集合\n*/\nprotected abstract List<Transaction> doFindAllUnmodifiedSince(Date date);\n调用 #findAllUnmodifiedSince(...) 方法，从存储器获取超过指定时间的事务集合。调用 #putToCache(...) 方法，循环事务集合添加到缓存。\n#doFindAllUnmodifiedSince(...) 为抽象方法，子类实现该方法，提供获取超过指定时间的事务集合功能。\n3.2 JDBC 事务存储器\norg.mengyun.tcctransaction.repository.JdbcTransactionRepository，JDBC 事务存储器，通过 JDBC 驱动，将 Transaction 存储到 MySQL / Oracle / PostgreSQL / SQLServer 等关系数据库。实现代码如下：\n\npublic class JdbcTransactionRepository extends CachableTransactionRepository {\n\n    /**\n     * 领域\n     */\n    private String domain;\n    /**\n     * 表后缀\n     */\n    private String tbSuffix;\n    /**\n     * 数据源\n     */\n    private DataSource dataSource;\n    /**\n     * 序列化\n     */\n    private ObjectSerializer serializer = new JdkSerializationSerializer();\n}\ndomain，领域，或者也可以称为模块名，应用名，用于唯一标识一个资源。例如，Maven 模块 xxx-order，我们可以配置该属性为 ORDER。\ntbSuffix，表后缀。默认存储表名为 TCC_TRANSACTION，配置表名后，为 TCC_TRANSACTION${tbSuffix}。\ndataSource，存储数据的数据源。\nserializer，序列化。当数据库里已经有数据的情况下，不要更换别的序列化，否则会导致反序列化报错。建议：TCC-Transaction 存储时，新增字段，记录序列化的方式。\n表结构如下：\n\nCREATE TABLE `TCC_TRANSACTION` (\n  `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT,\n  `DOMAIN` varchar(100) DEFAULT NULL,\n  `GLOBAL_TX_ID` varbinary(32) NOT NULL,\n  `BRANCH_QUALIFIER` varbinary(32) NOT NULL,\n  `CONTENT` varbinary(8000) DEFAULT NULL,\n  `STATUS` int(11) DEFAULT NULL,\n  `TRANSACTION_TYPE` int(11) DEFAULT NULL,\n  `RETRIED_COUNT` int(11) DEFAULT NULL,\n  `CREATE_TIME` datetime DEFAULT NULL,\n  `LAST_UPDATE_TIME` datetime DEFAULT NULL,\n  `VERSION` int(11) DEFAULT NULL,\n  PRIMARY KEY (`TRANSACTION_ID`),\n  UNIQUE KEY `UX_TX_BQ` (`GLOBAL_TX_ID`,`BRANCH_QUALIFIER`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8\nTRANSACTION_ID，仅仅数据库自增，无实际用途。\nCONTENT，Transaction 序列化。\nps：点击链接查看 JdbcTransactionRepository 代码实现，已经添加完整中文注释。\n\n**3.3 Redis 事务存储器**\norg.mengyun.tcctransaction.repository.RedisTransactionRepository，Redis 事务存储器，将 Transaction 存储到 Redis。实现代码如下：\n\npublic class RedisTransactionRepository extends CachableTransactionRepository {\n\n    /**\n     * Jedis Pool\n     */\n    private JedisPool jedisPool;\n    /**\n     * key 前缀\n     */\n    private String keyPrefix = \"TCC:\";\n    /**\n     * 序列化\n     */\n    private ObjectSerializer serializer = new JdkSerializationSerializer();\n    \n}\nkeyPrefix，key 前缀。类似 JdbcTransactionRepository 的 domain 属性。\n一个事务存储到 Reids，使用 Redis 的数据结构为 HASHES。\n\nkey : 使用 keyPrefix + xid，实现代码如下：\n\n/**\n* 创建事务的 Redis Key\n*\n* @param keyPrefix key 前缀\n* @param xid 事务\n* @return Redis Key\n*/\npublic static byte[] getRedisKey(String keyPrefix, Xid xid) {\n   byte[] prefix = keyPrefix.getBytes();\n   byte[] globalTransactionId = xid.getGlobalTransactionId();\n   byte[] branchQualifier = xid.getBranchQualifier();\n   // 拼接 key\n   byte[] key = new byte[prefix.length + globalTransactionId.length + branchQualifier.length];\n   System.arraycopy(prefix, 0, key, 0, prefix.length);\n   System.arraycopy(globalTransactionId, 0, key, prefix.length, globalTransactionId.length);\n   System.arraycopy(branchQualifier, 0, key, prefix.length + globalTransactionId.length, branchQualifier.length);\n   return key;\n}\nHASHES 的 key ：使用 version。\n\n添加和更新 Transaction 时，使用 Redis HSETNX，不存在当前版本的值时，进行设置，重而实现类似乐观锁的更新。\n读取 Transaction 时，使用 Redis HGETALL，将 Transaction 所有 version 对应的值读取到内存后，取 version 值最大的对应的值。\nHASHES 的 value ：调用 TransactionSerializer#serialize(...) 方法，序列化 Transaction。实现代码如下：\n\npublic static byte[] serialize(ObjectSerializer serializer, Transaction transaction) {\n   Map<String, Object> map = new HashMap<String, Object>();\n   map.put(\"GLOBAL_TX_ID\", transaction.getXid().getGlobalTransactionId());\n   map.put(\"BRANCH_QUALIFIER\", transaction.getXid().getBranchQualifier());\n   map.put(\"STATUS\", transaction.getStatus().getId());\n   map.put(\"TRANSACTION_TYPE\", transaction.getTransactionType().getId());\n   map.put(\"RETRIED_COUNT\", transaction.getRetriedCount());\n   map.put(\"CREATE_TIME\", transaction.getCreateTime());\n   map.put(\"LAST_UPDATE_TIME\", transaction.getLastUpdateTime());\n   map.put(\"VERSION\", transaction.getVersion());\n   // 序列化\n   map.put(\"CONTENT\", serializer.serialize(transaction));\n   return serializer.serialize(map);\n}\nTODO 为什么序列化两次\n在实现 #doFindAllUnmodifiedSince(date) 方法，无法像数据库使用时间条件进行过滤，因此，加载所有事务后在内存中过滤。实现代码如下：\n\n@Override\nprotected List<Transaction> doFindAllUnmodifiedSince(Date date) {\n   // 获得所有事务\n   List<Transaction> allTransactions = doFindAll();\n   // 过滤时间\n   List<Transaction> allUnmodifiedSince = new ArrayList<Transaction>();\n   for (Transaction transaction : allTransactions) {\n       if (transaction.getLastUpdateTime().compareTo(date) < 0) {\n           allUnmodifiedSince.add(transaction);\n       }\n   }\n   return allUnmodifiedSince;\n}\nps：点击链接查看 RedisTransactionRepository 代码实现，已经添加完整中文注释。\n\nFROM 《TCC-Transaction 官方文档 —— 使用指南1.2.x》\n使用 RedisTransactionRepository 需要配置 Redis 服务器如下：\nappendonly yes\nappendfsync always\n\n3.4 Zookeeper 事务存储器\norg.mengyun.tcctransaction.repository.ZooKeeperTransactionRepository，Zookeeper 事务存储器，将 Transaction 存储到 Zookeeper。实现代码如下：\n\npublic class ZooKeeperTransactionRepository extends CachableTransactionRepository {\n\n    /**\n     * Zookeeper 服务器地址数组\n     */\n    private String zkServers;\n    /**\n     * Zookeeper 超时时间\n     */\n    private int zkTimeout;\n    /**\n     * TCC 存储 Zookeeper 根目录\n     */\n    private String zkRootPath = \"/tcc\";\n    /**\n     * Zookeeper 连接\n     */\n    private volatile ZooKeeper zk;\n    /**\n     * 序列化\n     */\n    private ObjectSerializer serializer = new JdkSerializationSerializer();\n}\nzkRootPath，存储 Zookeeper 根目录，类似 JdbcTransactionRepository 的 domain 属性。\n一个事务存储到 Zookeeper，使用 Zookeeper 的持久数据节点。\n\npath：${zkRootPath} + / + ${xid}。实现代码如下：\n\n// ZooKeeperTransactionRepository.java\nprivate String getTxidPath(Xid xid) {\n   return String.format(\"%s/%s\", zkRootPath, xid);\n}\n\n// TransactionXid.java\n@Override\npublic String toString() {\n   StringBuilder stringBuilder = new StringBuilder();\n   stringBuilder.append(\"globalTransactionId:\").append(UUID.nameUUIDFromBytes(globalTransactionId).toString());\n   stringBuilder.append(\",\").append(\"branchQualifier:\").append(UUID.nameUUIDFromBytes(branchQualifier).toString());\n   return stringBuilder.toString();\n}\ndata：调用 TransactionSerializer#serialize(...) 方法，序列化 Transaction。\n\nversion：使用 Zookeeper 数据节点自带版本功能。这里要注意下，Transaction 的版本从 1 开始，而 Zookeeper 数据节点版本从 0 开始。\nps：点击链接查看 ZooKeeperTransactionRepository 代码实现，已经添加完整中文注释。\n\n另外，在生产上暂时不建议使用 ZooKeeperTransactionRepository，原因有两点：\n\n不支持 Zookeeper 安全认证。\n使用 Zookeeper 时，未考虑断网重连等情况。\n如果你要使用 Zookeeper 进行事务的存储，可以考虑使用 Apache Curator 操作 Zookeeper，重写 ZooKeeperTransactionRepository 部分代码。\n\n3.5 File 事务存储器\norg.mengyun.tcctransaction.repository.FileSystemTransactionRepository，File 事务存储器，将 Transaction 存储到文件系统。\n\n实现上和 ZooKeeperTransactionRepository，区别主要在于不支持乐观锁更新。有兴趣的同学点击链接查看，这里就不拓展开来。\n\n另外，在生产上不建议使用 FileSystemTransactionRepository，因为不支持多节点共享。用分布式存储挂载文件另说，当然还是不建议，因为不支持乐观锁并发更新。', '<p>本文主要基于 TCC-Transaction 1.2.3.3 正式版</p>\n<p><strong>1. 概述</strong><br>本文分享 事务存储器。主要涉及如下 Maven 项目：</p>\n<p>tcc-transaction-core ：tcc-transaction 底层实现。<br>在 TCC 的过程中，根据应用内存中的事务信息完成整个事务流程。But 实际业务场景中，将事务信息只放在应用内存中是远远不够可靠的。例如：</p>\n<p>应用进程异常崩溃，未完成的事务信息将丢失。<br>应用进程集群，当提供远程服务调用时，事务信息需要集群内共享。<br>发起事务的应用需要重启部署新版本，因为各种原因，有未完成的事务。<br>因此，TCC-Transaction 将事务信息添加到内存中的同时，会使用外部存储进行持久化。目前提供四种外部存储：</p>\n<p>JdbcTransactionRepository，JDBC 事务存储器<br>RedisTransactionRepository，Redis 事务存储器<br>ZooKeeperTransactionRepository，Zookeeper 事务存储器<br>FileSystemTransactionRepository，File 事务存储器<br>本文涉及到的类关系如下图( 打开大图 )：</p>\n<p>你行好事会因为得到赞赏而愉悦<br>同理，开源项目贡献者会因为 Star 而更加有动力<br>为 TCC-Transaction 点赞！传送门</p>\n<p>ps：笔者假设你已经阅读过《tcc-transaction 官方文档 —— 使用指南1.2.x》。</p>\n<p><strong>2. 序列化</strong><br>在《TCC-Transaction 源码分析 —— TCC 实现》「4. 事务与参与者」，可以看到 Transaction 是一个比较复杂的对象，内嵌 Participant 数组，而 Participant 本身也是复杂的对象，内嵌了更多的其他对象，因此，存储器在持久化 Transaction 时，需要序列化后才能存储。</p>\n<p>org.mengyun.tcctransaction.serializer.ObjectSerializer，对象序列化接口。实现代码如下：</p>\n<p>public interface ObjectSerializer&lt;T&gt; {</p>\n<pre><code>byte[] serialize(T t);\n\nT deserialize(byte[] bytes);\n</code></pre><p>}<br>目前提供 JDK自带序列化 和 Kyro序列化 两种实现。</p>\n<p>2.1 JDK 序列化实现<br>org.mengyun.tcctransaction.serializer.JdkSerializationSerializer，JDK 序列化实现。比较易懂，点击链接直接查看。</p>\n<p>TCC-Transaction 使用的默认的序列化。</p>\n<p>2.2 Kyro 序列化实现<br>org.mengyun.tcctransaction.serializer.KryoTransactionSerializer，Kyro 序列化实现。比较易懂，点击链接直接查看。</p>\n<p>2.3 JSON 序列化实现<br>JDK 和 Kyro 的序列化实现，肉眼无法直观具体存储事务的信息，你可以通过实现 ObjectSerializer 接口，实现自定义的 JSON 序列化。</p>\n<ol>\n<li>存储器<br>org.mengyun.tcctransaction.TransactionRepository，事务存储器接口。实现代码如下：</li></ol>\n<p>public interface TransactionRepository {</p>\n<pre><code>/**\n * 新增事务\n *\n * @param transaction 事务\n * @return 新增数量\n */\nint create(Transaction transaction);\n\n/**\n * 更新事务\n *\n * @param transaction 事务\n * @return 更新数量\n */\nint update(Transaction transaction);\n\n/**\n * 删除事务\n *\n * @param transaction 事务\n * @return 删除数量\n */\nint delete(Transaction transaction);\n\n/**\n * 获取事务\n *\n * @param xid 事务编号\n * @return 事务\n */\nTransaction findByXid(TransactionXid xid);\n\n/**\n * 获取超过指定时间的事务集合\n *\n * @param date 指定时间\n * @return 事务集合\n */\nList&lt;Transaction&gt; findAllUnmodifiedSince(Date date);\n</code></pre><p>}<br>不同的存储器通过实现该接口，提供事务的增删改查功能。</p>\n<p><strong>3.1 可缓存的事务存储器抽象类</strong><br>org.mengyun.tcctransaction.repository.CachableTransactionRepository，可缓存的事务存储器抽象类，实现增删改查事务时，同时缓存事务信息。在上面类图，我们也可以看到 TCC-Transaction 自带的多种存储器都继承该抽象类。</p>\n<p>CachableTransactionRepository 构造方法实现代码如下：</p>\n<p>public abstract class CachableTransactionRepository implements TransactionRepository {</p>\n<pre><code>/**\n * 缓存过期时间\n */\nprivate int expireDuration = 120;\n/**\n * 缓存\n */\nprivate Cache&lt;Xid, Transaction&gt; transactionXidCompensableTransactionCache;\n\npublic CachableTransactionRepository() {\n    transactionXidCompensableTransactionCache = CacheBuilder.newBuilder().expireAfterAccess(expireDuration, TimeUnit.SECONDS).maximumSize(1000).build();\n}\n</code></pre><p>}<br>使用 Guava Cache 内存缓存事务信息，设置最大缓存个数为 1000 个，缓存过期时间为最后访问时间 120 秒。</p>\n<h1 id=\"h1-create-\"><a name=\"create(…) 实现代码如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>create(…) 实现代码如下：</h1><p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public int create(Transaction transaction) {<br>   int result = doCreate(transaction);<br>   if (result &gt; 0) {<br>       putToCache(transaction);<br>   }<br>   return result;<br>}</p>\n<p>/**</p>\n<ul>\n<li>添加到缓存<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transaction 事务<br>*/<br>protected void putToCache(Transaction transaction) {<br> transactionXidCompensableTransactionCache.put(transaction.getXid(), transaction);<br>}</li></ul>\n<p>/**</p>\n<ul>\n<li>新增事务<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transaction 事务</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 新增数量<br>*/<br>protected abstract int doCreate(Transaction transaction);<br>调用 #doCreate(…) 方法，新增事务。新增成功后，调用 #putToCache(…) 方法，添加事务到缓存。<h1 id=\"h1-docreate-\"><a name=\"doCreate(…) 为抽象方法，子类实现该方法，提供新增事务功能。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>doCreate(…) 为抽象方法，子类实现该方法，提供新增事务功能。</h1><h1 id=\"h1-update-\"><a name=\"update(…) 实现代码如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>update(…) 实现代码如下：</h1></li></ul>\n<p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public int update(Transaction transaction) {<br>   int result = 0;<br>   try {<br>       result = doUpdate(transaction);<br>       if (result &gt; 0) {<br>           putToCache(transaction);<br>       } else {<br>           throw new OptimisticLockException();<br>       }<br>   } finally {<br>       if (result &lt;= 0) { // 更新失败，移除缓存。下次访问，从存储器读取<br>           removeFromCache(transaction);<br>       }<br>   }<br>   return result;<br>}</p>\n<p>/**</p>\n<ul>\n<li>移除事务从缓存<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transaction 事务<br>*/<br>protected void removeFromCache(Transaction transaction) {<br> transactionXidCompensableTransactionCache.invalidate(transaction.getXid());<br>}</li></ul>\n<p>/**</p>\n<ul>\n<li>更新事务<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transaction 事务</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 更新数量<br>*/<br>protected abstract int doUpdate(Transaction transaction);<br>调用 #doUpdate(…) 方法，更新事务。<br>若更新成功后，调用 #putToCache(…) 方法，添加事务到缓存。<br>若更新失败后，抛出 OptimisticLockException 异常。有两种情况会导致更新失败：(1) 该事务已经被提交，被删除；(2) 乐观锁更新时，缓存的事务的版本号( Transaction.version )和存储器里的事务的版本号不同，更新失败。为什么？在《TCC-Transaction 源码分析 —— 事务恢复》详细解析。更新失败，意味着缓存已经不不一致，调用 #removeFromCache(…) 方法，移除事务从缓存中。<h1 id=\"h1-doupdate-\"><a name=\"doUpdate(…) 为抽象方法，子类实现该方法，提供更新事务功能。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>doUpdate(…) 为抽象方法，子类实现该方法，提供更新事务功能。</h1><h1 id=\"h1-delete-\"><a name=\"delete(…) 实现代码如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>delete(…) 实现代码如下：</h1></li></ul>\n<p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public int delete(Transaction transaction) {<br>   int result;<br>   try {<br>       result = doDelete(transaction);<br>   } finally {<br>       removeFromCache(transaction);<br>   }<br>   return result;<br>}</p>\n<p>/**</p>\n<ul>\n<li>删除事务<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transaction 事务</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 删除数量<br>*/<br>protected abstract int doDelete(Transaction transaction);<br>调用 #doDelete(…) 方法，删除事务。<br>调用 #removeFromCache(…) 方法，移除事务从缓存中。<h1 id=\"h1-dodelete-\"><a name=\"doDelete(…) 为抽象方法，子类实现该方法，提供删除事务功能。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>doDelete(…) 为抽象方法，子类实现该方法，提供删除事务功能。</h1><h1 id=\"h1-findbyxid-\"><a name=\"findByXid(…) 实现代码如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>findByXid(…) 实现代码如下：</h1></li></ul>\n<p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public Transaction findByXid(TransactionXid transactionXid) {<br>   Transaction transaction = findFromCache(transactionXid);<br>   if (transaction == null) {<br>       transaction = doFindOne(transactionXid);<br>       if (transaction != null) {<br>           putToCache(transaction);<br>       }<br>   }<br>   return transaction;<br>}</p>\n<p>/**</p>\n<ul>\n<li>获得事务从缓存中<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> transactionXid 事务编号</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 事务<br>*/<br>protected Transaction findFromCache(TransactionXid transactionXid) {<br> return transactionXidCompensableTransactionCache.getIfPresent(transactionXid);<br>}</li></ul>\n<p>/**</p>\n<ul>\n<li>查询事务<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> xid 事务编号</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 事务<br>*/<br>protected abstract Transaction doFindOne(Xid xid);<br>调用 #findFromCache() 方法，优先从缓存中获取事务。<br>调用 #doFindOne() 方法，缓存中事务不存在，从存储器中获取。获取到后，调用 #putToCache() 方法，添加事务到缓存中。<h1 id=\"h1-dofindone-\"><a name=\"doFindOne(…) 为抽象方法，子类实现该方法，提供查询事务功能。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>doFindOne(…) 为抽象方法，子类实现该方法，提供查询事务功能。</h1><h1 id=\"h1-findallunmodifiedsince-\"><a name=\"findAllUnmodifiedSince(…) 实现代码如下：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>findAllUnmodifiedSince(…) 实现代码如下：</h1></li></ul>\n<p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public List&lt;Transaction&gt; findAllUnmodifiedSince(Date date) {<br>   List&lt;Transaction&gt; transactions = doFindAllUnmodifiedSince(date);<br>   // 添加到缓存<br>   for (Transaction transaction : transactions) {<br>       putToCache(transaction);<br>   }<br>   return transactions;<br>}</p>\n<p>/**</p>\n<ul>\n<li>获取超过指定时间的事务集合<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> date 指定时间</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> 事务集合<br>*/<br>protected abstract List&lt;Transaction&gt; doFindAllUnmodifiedSince(Date date);<br>调用 #findAllUnmodifiedSince(…) 方法，从存储器获取超过指定时间的事务集合。调用 #putToCache(…) 方法，循环事务集合添加到缓存。<h1 id=\"h1-dofindallunmodifiedsince-\"><a name=\"doFindAllUnmodifiedSince(…) 为抽象方法，子类实现该方法，提供获取超过指定时间的事务集合功能。\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>doFindAllUnmodifiedSince(…) 为抽象方法，子类实现该方法，提供获取超过指定时间的事务集合功能。</h1>3.2 JDBC 事务存储器<br>org.mengyun.tcctransaction.repository.JdbcTransactionRepository，JDBC 事务存储器，通过 JDBC 驱动，将 Transaction 存储到 MySQL / Oracle / PostgreSQL / SQLServer 等关系数据库。实现代码如下：</li></ul>\n<p>public class JdbcTransactionRepository extends CachableTransactionRepository {</p>\n<pre><code>/**\n * 领域\n */\nprivate String domain;\n/**\n * 表后缀\n */\nprivate String tbSuffix;\n/**\n * 数据源\n */\nprivate DataSource dataSource;\n/**\n * 序列化\n */\nprivate ObjectSerializer serializer = new JdkSerializationSerializer();\n</code></pre><p>}<br>domain，领域，或者也可以称为模块名，应用名，用于唯一标识一个资源。例如，Maven 模块 xxx-order，我们可以配置该属性为 ORDER。<br>tbSuffix，表后缀。默认存储表名为 TCC_TRANSACTION，配置表名后，为 TCC_TRANSACTION${tbSuffix}。<br>dataSource，存储数据的数据源。<br>serializer，序列化。当数据库里已经有数据的情况下，不要更换别的序列化，否则会导致反序列化报错。建议：TCC-Transaction 存储时，新增字段，记录序列化的方式。<br>表结构如下：</p>\n<p>CREATE TABLE <code>TCC_TRANSACTION</code> (<br>  <code>TRANSACTION_ID</code> int(11) NOT NULL AUTO_INCREMENT,<br>  <code>DOMAIN</code> varchar(100) DEFAULT NULL,<br>  <code>GLOBAL_TX_ID</code> varbinary(32) NOT NULL,<br>  <code>BRANCH_QUALIFIER</code> varbinary(32) NOT NULL,<br>  <code>CONTENT</code> varbinary(8000) DEFAULT NULL,<br>  <code>STATUS</code> int(11) DEFAULT NULL,<br>  <code>TRANSACTION_TYPE</code> int(11) DEFAULT NULL,<br>  <code>RETRIED_COUNT</code> int(11) DEFAULT NULL,<br>  <code>CREATE_TIME</code> datetime DEFAULT NULL,<br>  <code>LAST_UPDATE_TIME</code> datetime DEFAULT NULL,<br>  <code>VERSION</code> int(11) DEFAULT NULL,<br>  PRIMARY KEY (<code>TRANSACTION_ID</code>),<br>  UNIQUE KEY <code>UX_TX_BQ</code> (<code>GLOBAL_TX_ID</code>,<code>BRANCH_QUALIFIER</code>)<br>) ENGINE=InnoDB DEFAULT CHARSET=utf8<br>TRANSACTION_ID，仅仅数据库自增，无实际用途。<br>CONTENT，Transaction 序列化。<br>ps：点击链接查看 JdbcTransactionRepository 代码实现，已经添加完整中文注释。</p>\n<p><strong>3.3 Redis 事务存储器</strong><br>org.mengyun.tcctransaction.repository.RedisTransactionRepository，Redis 事务存储器，将 Transaction 存储到 Redis。实现代码如下：</p>\n<p>public class RedisTransactionRepository extends CachableTransactionRepository {</p>\n<pre><code>/**\n * Jedis Pool\n */\nprivate JedisPool jedisPool;\n/**\n * key 前缀\n */\nprivate String keyPrefix = &quot;TCC:&quot;;\n/**\n * 序列化\n */\nprivate ObjectSerializer serializer = new JdkSerializationSerializer();\n</code></pre><p>}<br>keyPrefix，key 前缀。类似 JdbcTransactionRepository 的 domain 属性。<br>一个事务存储到 Reids，使用 Redis 的数据结构为 HASHES。</p>\n<p>key : 使用 keyPrefix + xid，实现代码如下：</p>\n<p>/**</p>\n<ul>\n<li>创建事务的 Redis Key<br>*</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> keyPrefix key 前缀</li><li><a href=\"https://github.com/param\" title=\"&#64;param\" class=\"at-link\">@param</a> xid 事务</li><li><a href=\"https://github.com/return\" title=\"&#64;return\" class=\"at-link\">@return</a> Redis Key<br>*/<br>public static byte[] getRedisKey(String keyPrefix, Xid xid) {<br> byte[] prefix = keyPrefix.getBytes();<br> byte[] globalTransactionId = xid.getGlobalTransactionId();<br> byte[] branchQualifier = xid.getBranchQualifier();<br> // 拼接 key<br> byte[] key = new byte[prefix.length + globalTransactionId.length + branchQualifier.length];<br> System.arraycopy(prefix, 0, key, 0, prefix.length);<br> System.arraycopy(globalTransactionId, 0, key, prefix.length, globalTransactionId.length);<br> System.arraycopy(branchQualifier, 0, key, prefix.length + globalTransactionId.length, branchQualifier.length);<br> return key;<br>}<br>HASHES 的 key ：使用 version。</li></ul>\n<p>添加和更新 Transaction 时，使用 Redis HSETNX，不存在当前版本的值时，进行设置，重而实现类似乐观锁的更新。<br>读取 Transaction 时，使用 Redis HGETALL，将 Transaction 所有 version 对应的值读取到内存后，取 version 值最大的对应的值。<br>HASHES 的 value ：调用 TransactionSerializer#serialize(…) 方法，序列化 Transaction。实现代码如下：</p>\n<p>public static byte[] serialize(ObjectSerializer serializer, Transaction transaction) {<br>   Map&lt;String, Object&gt; map = new HashMap&lt;String, Object&gt;();<br>   map.put(“GLOBAL_TX_ID”, transaction.getXid().getGlobalTransactionId());<br>   map.put(“BRANCH_QUALIFIER”, transaction.getXid().getBranchQualifier());<br>   map.put(“STATUS”, transaction.getStatus().getId());<br>   map.put(“TRANSACTION_TYPE”, transaction.getTransactionType().getId());<br>   map.put(“RETRIED_COUNT”, transaction.getRetriedCount());<br>   map.put(“CREATE_TIME”, transaction.getCreateTime());<br>   map.put(“LAST_UPDATE_TIME”, transaction.getLastUpdateTime());<br>   map.put(“VERSION”, transaction.getVersion());<br>   // 序列化<br>   map.put(“CONTENT”, serializer.serialize(transaction));<br>   return serializer.serialize(map);<br>}<br>TODO 为什么序列化两次<br>在实现 #doFindAllUnmodifiedSince(date) 方法，无法像数据库使用时间条件进行过滤，因此，加载所有事务后在内存中过滤。实现代码如下：</p>\n<p><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>protected List&lt;Transaction&gt; doFindAllUnmodifiedSince(Date date) {<br>   // 获得所有事务<br>   List&lt;Transaction&gt; allTransactions = doFindAll();<br>   // 过滤时间<br>   List&lt;Transaction&gt; allUnmodifiedSince = new ArrayList&lt;Transaction&gt;();<br>   for (Transaction transaction : allTransactions) {<br>       if (transaction.getLastUpdateTime().compareTo(date) &lt; 0) {<br>           allUnmodifiedSince.add(transaction);<br>       }<br>   }<br>   return allUnmodifiedSince;<br>}<br>ps：点击链接查看 RedisTransactionRepository 代码实现，已经添加完整中文注释。</p>\n<p>FROM 《TCC-Transaction 官方文档 —— 使用指南1.2.x》<br>使用 RedisTransactionRepository 需要配置 Redis 服务器如下：<br>appendonly yes<br>appendfsync always</p>\n<p>3.4 Zookeeper 事务存储器<br>org.mengyun.tcctransaction.repository.ZooKeeperTransactionRepository，Zookeeper 事务存储器，将 Transaction 存储到 Zookeeper。实现代码如下：</p>\n<p>public class ZooKeeperTransactionRepository extends CachableTransactionRepository {</p>\n<pre><code>/**\n * Zookeeper 服务器地址数组\n */\nprivate String zkServers;\n/**\n * Zookeeper 超时时间\n */\nprivate int zkTimeout;\n/**\n * TCC 存储 Zookeeper 根目录\n */\nprivate String zkRootPath = &quot;/tcc&quot;;\n/**\n * Zookeeper 连接\n */\nprivate volatile ZooKeeper zk;\n/**\n * 序列化\n */\nprivate ObjectSerializer serializer = new JdkSerializationSerializer();\n</code></pre><p>}<br>zkRootPath，存储 Zookeeper 根目录，类似 JdbcTransactionRepository 的 domain 属性。<br>一个事务存储到 Zookeeper，使用 Zookeeper 的持久数据节点。</p>\n<p>path：${zkRootPath} + / + ${xid}。实现代码如下：</p>\n<p>// ZooKeeperTransactionRepository.java<br>private String getTxidPath(Xid xid) {<br>   return String.format(“%s/%s”, zkRootPath, xid);<br>}</p>\n<p>// TransactionXid.java<br><a href=\"https://github.com/Override\" title=\"&#64;Override\" class=\"at-link\">@Override</a><br>public String toString() {<br>   StringBuilder stringBuilder = new StringBuilder();<br>   stringBuilder.append(“globalTransactionId:”).append(UUID.nameUUIDFromBytes(globalTransactionId).toString());<br>   stringBuilder.append(“,”).append(“branchQualifier:”).append(UUID.nameUUIDFromBytes(branchQualifier).toString());<br>   return stringBuilder.toString();<br>}<br>data：调用 TransactionSerializer#serialize(…) 方法，序列化 Transaction。</p>\n<p>version：使用 Zookeeper 数据节点自带版本功能。这里要注意下，Transaction 的版本从 1 开始，而 Zookeeper 数据节点版本从 0 开始。<br>ps：点击链接查看 ZooKeeperTransactionRepository 代码实现，已经添加完整中文注释。</p>\n<p>另外，在生产上暂时不建议使用 ZooKeeperTransactionRepository，原因有两点：</p>\n<p>不支持 Zookeeper 安全认证。<br>使用 Zookeeper 时，未考虑断网重连等情况。<br>如果你要使用 Zookeeper 进行事务的存储，可以考虑使用 Apache Curator 操作 Zookeeper，重写 ZooKeeperTransactionRepository 部分代码。</p>\n<p>3.5 File 事务存储器<br>org.mengyun.tcctransaction.repository.FileSystemTransactionRepository，File 事务存储器，将 Transaction 存储到文件系统。</p>\n<p>实现上和 ZooKeeperTransactionRepository，区别主要在于不支持乐观锁更新。有兴趣的同学点击链接查看，这里就不拓展开来。</p>\n<p>另外，在生产上不建议使用 FileSystemTransactionRepository，因为不支持多节点共享。用分布式存储挂载文件另说，当然还是不建议，因为不支持乐观锁并发更新。</p>', 4, 1, 13, '2018-10-7 23:21:13', '2018-10-7 23:21:13', 1, 66, 1, 0);

INSERT INTO `tag_article` VALUES (13, 1);
INSERT INTO `tag_article` VALUES (1, 2);
INSERT INTO `tag_article` VALUES (2, 2);
INSERT INTO `tag_article` VALUES (3, 2);
INSERT INTO `tag_article` VALUES (11, 3);
INSERT INTO `tag_article` VALUES (18, 3);
INSERT INTO `tag_article` VALUES (8, 5);

INSERT INTO `advertisement` VALUES(1,1,'img/lunbo/1.jpg',1);
INSERT INTO `advertisement` VALUES(2,2,'img/lunbo/2.jpg',1);
INSERT INTO `advertisement` VALUES(3,3,'img/lunbo/3.jpg',1);
INSERT INTO `advertisement` VALUES(4,4,'img/lunbo/4.jpg',1);
INSERT INTO `advertisement` VALUES(5,5,'img/lunbo/5.jpg',1);

INSERT INTO `comment_` VALUES (1, '<p>评论测试</p>', '评论测试', '2017-10-7 16:06:34', '127.0.0.1', 2, 0, 1, 1);
INSERT INTO `comment_` VALUES (2, '<p>评论测试</p>', '评论测试', '2017-10-7 16:06:34', '127.0.0.1', 2, 0, 1, 2);
INSERT INTO `comment_` VALUES (3, '<p>评论测试</p>', '评论测试', '2017-10-7 16:06:34', '127.0.0.1', 2, 0, 1, 2);
INSERT INTO `comment_` VALUES (4, '<p>评论测试</p>', '评论测试', '2017-10-7 16:06:34', '127.0.0.1', 2, 2, 1, 2);
INSERT INTO `comment_` VALUES (5, '<p>评论测试</p>', '评论测试', '2017-10-7 16:06:34', '127.0.0.1', 2, 2, 1, 2);
INSERT INTO `comment_` VALUES (6, NULL, '是是是', '2018-10-6 10:38:00', NULL, 3, 3, 4, 2);
INSERT INTO `comment_` VALUES (7, NULL, '看啊', '2018-10-6 10:43:26', NULL, 3, 0, 4, 2);
INSERT INTO `comment_` VALUES (8, NULL, '', '2018-10-6 10:53:50', NULL, 2, 0, 1, 1);
INSERT INTO `comment_` VALUES (9, NULL, '我试试看行不行', '2018-10-6 11:02:08', '本地', 2, 0, 1, 2);
INSERT INTO `comment_` VALUES (10, NULL, '再试试看', '2018-10-6 11:02:49', '本地', 2, 9, 1, 2);
INSERT INTO `comment_` VALUES (11, NULL, '写的真不错', '2018-10-8 21:28:04', '本地', 2, 0, 1, 3);
INSERT INTO `comment_` VALUES (12, NULL, '太棒了！', '2018-10-8 22:12:10', '本地', 2, 0, 1, 5);


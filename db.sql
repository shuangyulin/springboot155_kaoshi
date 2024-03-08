/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - zaixiankaoshixuexijiaoliu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zaixiankaoshixuexijiaoliu` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'xuexishipin_types','学习类型',1,'学习类型1',NULL,NULL,'2022-02-24 11:02:43'),(2,'xuexishipin_types','学习类型',2,'学习类型2',NULL,NULL,'2022-02-24 11:02:43'),(3,'xuexishipin_types','学习类型',3,'学习类型3',NULL,NULL,'2022-02-24 11:02:43'),(4,'examquestion_types','试题类型',1,'单选题',NULL,NULL,'2022-02-24 11:02:43'),(5,'examquestion_types','试题类型',2,'多选题',NULL,NULL,'2022-02-24 11:02:43'),(6,'examquestion_types','试题类型',3,'判断题',NULL,NULL,'2022-02-24 11:02:43'),(7,'examquestion_types','试题类型',4,'填空题',NULL,NULL,'2022-02-24 11:02:43'),(8,'exampaper_types','试卷状态',1,'启用',NULL,NULL,'2022-02-24 11:02:43'),(9,'exampaper_types','试卷状态',2,'禁用',NULL,NULL,'2022-02-24 11:02:43'),(10,'sex_types','性别',1,'男',NULL,NULL,'2022-02-24 11:02:43'),(11,'sex_types','性别',2,'女',NULL,NULL,'2022-02-24 11:02:43'),(12,'news_types','公告信息类型',1,'公告信息类型1',NULL,NULL,'2022-02-24 11:02:44'),(13,'news_types','公告信息类型',2,'公告信息类型2',NULL,NULL,'2022-02-24 11:02:44'),(14,'news_types','公告信息类型',3,'公告信息类型3',NULL,NULL,'2022-02-24 11:02:44'),(15,'forum_types','帖子类型',1,'帖子类型1',NULL,NULL,'2022-02-24 11:02:44'),(16,'forum_types','帖子类型',2,'帖子类型2',NULL,NULL,'2022-02-24 11:02:44'),(17,'forum_types','帖子类型',3,'帖子类型3',NULL,NULL,'2022-02-24 11:02:44'),(18,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-02-24 11:02:44'),(19,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-02-24 11:02:44');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `exampaper_types` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `exampaper_delete` int(255) DEFAULT '0' COMMENT '逻辑删除（0代表未删除 1代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`exampaper_name`,`exampaper_date`,`exampaper_myscore`,`exampaper_types`,`exampaper_delete`,`create_time`) values (1,'简单数学题',60,100,1,1,'2022-02-24 11:12:25'),(2,'测试试卷',12,0,1,2,'2022-02-24 11:20:37');

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_score` int(20) DEFAULT '0' COMMENT '分值 Search111',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int(20) DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`exampaper_id`,`examquestion_name`,`examquestion_options`,`examquestion_score`,`examquestion_answer`,`examquestion_analysis`,`examquestion_types`,`examquestion_sequence`,`create_time`) values (1,1,'1+1','[{\"text\":\"1\",\"code\":\"A\"},{\"text\":\"2\",\"code\":\"B\"},{\"text\":\"3\",\"code\":\"C\"},{\"text\":\"4\",\"code\":\"D\"}]',30,'B','1+1=2',1,1,'2022-02-24 11:13:10'),(2,1,'2+2','[{\"text\":\"2\",\"code\":\"A\"},{\"text\":\"4\",\"code\":\"B\"},{\"text\":\"6\",\"code\":\"C\"},{\"text\":\"2+2-2+2\",\"code\":\"D\"}]',30,'B,D','2+2=4',2,2,'2022-02-24 11:14:01'),(3,1,'3+3=6','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',30,'A','无解析',3,3,'2022-02-24 11:14:30'),(4,1,'4+4','[]',10,'8','4+4=8',4,4,'2022-02-24 11:15:00');

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int(20) NOT NULL COMMENT '考试用户',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int(200) DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`examrecord_uuid_number`,`yonghu_id`,`exampaper_id`,`total_score`,`insert_time`,`create_time`) values (1,'1645672620621',1,1,40,'2022-02-24 11:17:01','2022-02-24 11:17:01'),(2,'1645672656162',1,1,0,'2022-02-24 11:17:36','2022-02-24 11:17:36');

/*Table structure for table `examredetails` */

DROP TABLE IF EXISTS `examredetails`;

CREATE TABLE `examredetails` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='答题详情表';

/*Data for the table `examredetails` */

insert  into `examredetails`(`id`,`examredetails_uuid_number`,`yonghu_id`,`examquestion_id`,`examredetails_myanswer`,`examredetails_myscore`,`create_time`) values (1,'1645672620621',1,4,'8',10,'2022-02-24 11:17:03'),(2,'1645672620621',1,3,'B',0,'2022-02-24 11:17:07'),(3,'1645672620621',1,2,'B,D',30,'2022-02-24 11:17:10'),(4,'1645672620621',1,1,'A',0,'2022-02-24 11:17:14'),(5,'1645672656162',1,1,'未作答',0,'2022-02-24 11:17:38'),(6,'1645672656162',1,2,'未作答',0,'2022-02-24 11:17:38'),(7,'1645672656162',1,3,'未作答',0,'2022-02-24 11:17:38'),(8,'1645672656162',1,4,'未作答',0,'2022-02-24 11:17:38');

/*Table structure for table `examrewrongquestion` */

DROP TABLE IF EXISTS `examrewrongquestion`;

CREATE TABLE `examrewrongquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='错题表';

/*Data for the table `examrewrongquestion` */

insert  into `examrewrongquestion`(`id`,`yonghu_id`,`exampaper_id`,`examquestion_id`,`examredetails_myanswer`,`insert_time`,`create_time`) values (1,1,1,3,'B','2022-02-24 11:17:07','2022-02-24 11:17:07'),(2,1,1,1,'A','2022-02-24 11:17:14','2022-02-24 11:17:14'),(3,1,1,1,'未作答','2022-02-24 11:17:38','2022-02-24 11:17:38'),(4,1,1,2,'未作答','2022-02-24 11:17:38','2022-02-24 11:17:38'),(5,1,1,3,'未作答','2022-02-24 11:17:38','2022-02-24 11:17:38'),(6,1,1,4,'未作答','2022-02-24 11:17:38','2022-02-24 11:17:38');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `jiaoshi_id` int(11) DEFAULT NULL COMMENT '教师',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_types` int(11) DEFAULT NULL COMMENT '帖子类型',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`jiaoshi_id`,`users_id`,`forum_content`,`super_ids`,`forum_types`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',2,1,NULL,'发布内容1',NULL,2,1,'2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(2,'帖子标题2',1,2,NULL,'发布内容2',NULL,2,1,'2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(3,'帖子标题3',1,3,NULL,'发布内容3',NULL,2,1,'2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(4,'帖子标题4',1,4,NULL,'发布内容4',NULL,2,1,'2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(5,'帖子标题5',3,5,NULL,'发布内容5',NULL,1,1,'2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(6,NULL,1,NULL,NULL,'用户评论',5,NULL,2,'2022-02-24 11:16:55',NULL,'2022-02-24 11:16:55'),(7,NULL,NULL,NULL,1,'管理回复',5,NULL,2,'2022-02-24 11:18:41',NULL,'2022-02-24 11:18:41');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告信息标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告信息类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告信息图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告信息时间',
  `news_content` text COMMENT '公告信息详情',
  `news_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`news_delete`,`create_time`) values (1,'公告信息标题1',2,'http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/news1.jpg','2022-02-24 11:02:56','公告信息详情1',1,'2022-02-24 11:02:56'),(2,'公告信息标题2',3,'http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/news2.jpg','2022-02-24 11:02:56','公告信息详情2',1,'2022-02-24 11:02:56'),(3,'公告信息标题3',2,'http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/news3.jpg','2022-02-24 11:02:56','公告信息详情3',1,'2022-02-24 11:02:56'),(4,'公告信息标题4',2,'http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/news4.jpg','2022-02-24 11:02:56','公告信息详情4',1,'2022-02-24 11:02:56'),(5,'公告信息标题5',3,'http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/news5.jpg','2022-02-24 11:02:56','公告信息详情5',1,'2022-02-24 11:02:56');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','154g9u3vsofd05rxtfdrjqrhuqrvqv60','2022-02-24 11:07:04','2022-02-24 14:19:13'),(2,1,'admin','users','管理员','s0t2kkiqrht6ujngdn9x5tq4qrg1jb6i','2022-02-24 11:07:55','2022-02-24 14:12:24'),(3,2,'a2','yonghu','用户','36x9d7qlr4nitqjhkybsmlrgvhx2faui','2022-02-24 11:26:19','2022-02-24 12:26:19');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `xuexishipin` */

DROP TABLE IF EXISTS `xuexishipin`;

CREATE TABLE `xuexishipin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xuexishipin_name` varchar(200) DEFAULT NULL COMMENT '课程标题 Search111',
  `xuexishipin_photo` varchar(200) DEFAULT NULL COMMENT '封面',
  `xuexishipin_video` varchar(200) DEFAULT NULL COMMENT '视频',
  `xuexishipin_jiangshi` varchar(200) DEFAULT NULL COMMENT '讲师',
  `xuexishipin_types` int(11) DEFAULT NULL COMMENT '学习类型 Search111',
  `xuexishipin_content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='课程';

/*Data for the table `xuexishipin` */

insert  into `xuexishipin`(`id`,`xuexishipin_name`,`xuexishipin_photo`,`xuexishipin_video`,`xuexishipin_jiangshi`,`xuexishipin_types`,`xuexishipin_content`,`create_time`) values (1,'学习视频1','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/1645672227440.jpg','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/video.mp4','讲师1',1,'<p>详情1</p>','2022-02-24 11:02:56'),(2,'学习视频2','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/1645672218948.jpg','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/video.mp4','讲师2',2,'<p>详情2</p>','2022-02-24 11:02:56'),(3,'学习视频3','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/1645672208687.jpg','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/video.mp4','讲师3',2,'<p>详情3</p>','2022-02-24 11:02:56'),(4,'学习视频4','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/1645672184661.jpg','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/video.mp4','讲师4',2,'<p>详情4</p>','2022-02-24 11:02:56'),(5,'学习视频5','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/1645672174923.jpg','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/video.mp4','讲师5',2,'<p>详情5</p>','2022-02-24 11:02:56');

/*Table structure for table `xuexishipin_liuyan` */

DROP TABLE IF EXISTS `xuexishipin_liuyan`;

CREATE TABLE `xuexishipin_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xuexishipin_id` int(11) DEFAULT NULL COMMENT '学习视频',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `xuexishipin_liuyan_text` text COMMENT '留言内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学习视频留言';

/*Data for the table `xuexishipin_liuyan` */

insert  into `xuexishipin_liuyan`(`id`,`xuexishipin_id`,`yonghu_id`,`xuexishipin_liuyan_text`,`reply_text`,`insert_time`,`update_time`,`create_time`) values (1,1,1,'留言内容1','回复信息1','2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(2,2,3,'留言内容2','回复信息2','2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(3,3,2,'留言内容3','回复信息3','2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(4,4,3,'留言内容4','回复信息4','2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(5,5,2,'留言内容5','回复信息5','2022-02-24 11:02:56','2022-02-24 11:02:56','2022-02-24 11:02:56'),(6,4,1,'用户留言','管理回复','2022-02-24 11:16:29','2022-02-24 11:19:09','2022-02-24 11:16:29');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`sex_types`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/yonghu1.jpg','17703786901','410224199610232001','1@qq.com',2,1,'2022-02-24 11:02:56'),(2,'a2','123456','用户姓名2','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/yonghu2.jpg','17703786902','410224199610232002','2@qq.com',2,1,'2022-02-24 11:02:56'),(3,'a3','123456','用户姓名3','http://localhost:8080/zaixiankaoshixuexijiaoliu/upload/yonghu3.jpg','17703786903','410224199610232003','3@qq.com',1,1,'2022-02-24 11:02:56');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

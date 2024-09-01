/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.5.40 : Database - examination_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`examination_system` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `examination_system`;

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `collegeID` int(11) NOT NULL,
  `collegeName` varchar(200) NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `college` */

insert  into `college`(`collegeID`,`collegeName`) values 
(1,'计算机系'),
(2,'设计系'),
(3,'财经系');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `teacherID` int(11) NOT NULL,
  `courseTime` varchar(200) DEFAULT NULL COMMENT '开课时间',
  `classRoom` varchar(200) DEFAULT NULL COMMENT '开课地点',
  `courseWeek` int(200) DEFAULT NULL COMMENT '学时',
  `courseType` varchar(20) DEFAULT NULL COMMENT '课程类型',
  `collegeID` int(11) NOT NULL COMMENT '所属院系',
  `score` int(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `collegeID` (`collegeID`),
  KEY `teacherID` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`courseID`,`courseName`,`teacherID`,`courseTime`,`classRoom`,`courseWeek`,`courseType`,`collegeID`,`score`) values 
(1,'C语言程序设计',1001,'周二','科401',18,'必修课',1,3),
(2,'Python爬虫技巧',1001,'周四','X402',18,'必修课',1,3),
(3,'数据结构',1001,'周四','科401',18,'必修课',1,2),
(4,'Java程序设计',1002,'周五','科401',18,'必修课',1,2),
(5,'英语',1002,'周四','X302',18,'必修课',2,2),
(6,'服装设计',1003,'周一','科401',18,'选修课',2,2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `permissions` varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleID`,`roleName`,`permissions`) values 
(0,'admin',NULL),
(1,'teacher',NULL),
(2,'student',NULL);

/*Table structure for table `selectedcourse` */

DROP TABLE IF EXISTS `selectedcourse`;

CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `selectedcourse` */

insert  into `selectedcourse`(`courseID`,`studentID`,`mark`) values 
(2,10001,12),
(1,10001,95),
(1,10002,66),
(2,10003,99),
(5,10001,NULL),
(3,10001,NULL),
(1,10003,NULL),
(4,10003,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date DEFAULT NULL COMMENT '出生日期',
  `grade` date DEFAULT NULL COMMENT '入学时间',
  `collegeID` int(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`userID`,`userName`,`sex`,`birthYear`,`grade`,`collegeID`) values 
(9999,'mike1','男','1996-09-03','2019-11-13',3),
(10001,'小红','男','2020-03-02','2020-03-02',1),
(10002,'小绿','男','2020-03-10','2020-03-10',1),
(10003,'小陈','女','1996-09-02','2015-09-02',2),
(10005,'小左','女','1996-09-02','2015-09-02',2),
(10007,'MIke','男','1996-09-02','2015-09-02',2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date NOT NULL,
  `degree` varchar(20) DEFAULT NULL COMMENT '学历',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `grade` date DEFAULT NULL COMMENT '入职时间',
  `collegeID` int(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`userID`,`userName`,`sex`,`birthYear`,`degree`,`title`,`grade`,`collegeID`) values 
(1001,'刘老师','女','1990-03-08','硕士','副教授','2015-09-02',2),
(1002,'张老师','女','1996-09-02','博士','讲师','2015-09-02',1),
(1003,'软老师','女','1996-09-02','硕士','助教','2017-07-07',1);

/*Table structure for table `userlogin` */

DROP TABLE IF EXISTS `userlogin`;

CREATE TABLE `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `userlogin` */

insert  into `userlogin`(`userID`,`userName`,`password`,`role`) values 
(1,'admin','123',0),
(10,'10003','123',2),
(11,'10005','123',2),
(14,'1001','123',1),
(15,'1002','123',1),
(16,'1003','123',1),
(20,'9999','123',2),
(21,'10001','123',2),
(22,'10002','123',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-03-27 14:56:15
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BBS`
--
CREATE DATABASE IF NOT EXISTS `BBS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BBS`;

-- --------------------------------------------------------

--
-- 表的结构 `Area`
--

DROP TABLE IF EXISTS `Area`;
CREATE TABLE IF NOT EXISTS `Area` (
  `AClass` varchar(10) NOT NULL,
  `AID` int(2) NOT NULL AUTO_INCREMENT,
  `ATitle` varchar(20) NOT NULL,
  `AManager` varchar(20) NOT NULL,
  `ATodayNew` int(4) NOT NULL,
  `AInfo` varchar(100) NOT NULL,
  `ASize` int(8) NOT NULL,
  `AFollowsNumber` int(12) NOT NULL,
  `ALastPost` int(8) NOT NULL,
  `ALastPostTitle` varchar(20) NOT NULL,
  `ALastUser` varchar(20) NOT NULL,
  `ALastUserImg` varchar(50) NOT NULL,
  `ALastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Statement` varchar(200) NOT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Area`
--

INSERT INTO `Area` (`AClass`, `AID`, `ATitle`, `AManager`, `ATodayNew`, `AInfo`, `ASize`, `AFollowsNumber`, `ALastPost`, `ALastPostTitle`, `ALastUser`, `ALastUserImg`, `ALastTime`, `Statement`) VALUES
('太理校园', 1, '校园信息交流', 'Turbo', 51, '本版块用于同学们交流闲聊，分享校园内外新鲜有趣的事物！', 66, 126, 45, 'dpvmpdos', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-23 07:45:30', '1、本版为Apple (中国)活动专区，为讨论 Apple 零售店里最新的精彩活动和消息的专区，但不包括维修及换机事宜，无关帖子请发布在论坛对应版块。<br>2、为保持干净整洁的版面，请大家根据帖子内容添加正确的分类标签。<br>3、禁止谈论话题涉及政治，人身攻击，互骂，互扣等。<br>4、禁止一切交易，隐藏性交易的内容出现。如广告，求购，代购等。<br>5、禁止主题出现以QQ，QQ群，微信，微信'),
('学在太理', 2, '学术文化交流', 'Ben', 6, '在此版块里，愿大家畅游在知识的海洋中！', 24, 28, 4, 'nhaisdf', 'qqqqq', 'img/屏幕快照 2017-01-13 下午2.58.03.png', '2017-01-13 07:33:00', '1、本版为Apple (中国)活动专区，为讨论 Apple 零售店里最新的精彩活动和消息的专区，但不包括维修及换机事宜，无关帖子请发布在论坛对应版块。<br>2、为保持干净整洁的版面，请大家根据帖子内容添加正确的分类标签。<br>3、禁止谈论话题涉及政治，人身攻击，互骂，互扣等。<br>4、禁止一切交易，隐藏性交易的内容出现。如广告，求购，代购等。<br>5、禁止主题出现以QQ，QQ群，微信，微信'),
('太理生活', 3, '二手交易区', '小正太', 3, '二手是一种生活方式。。。', 15, 21, 1, '老师你好～', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-13 07:10:39', '1、本版为Apple (中国)活动专区，为讨论 Apple 零售店里最新的精彩活动和消息的专区，但不包括维修及换机事宜，无关帖子请发布在论坛对应版块。<br>2、为保持干净整洁的版面，请大家根据帖子内容添加正确的分类标签。<br>3、禁止谈论话题涉及政治，人身攻击，互骂，互扣等。<br>4、禁止一切交易，隐藏性交易的内容出现。如广告，求购，代购等。<br>5、禁止主题出现以QQ，QQ群，微信，微信');

-- --------------------------------------------------------

--
-- 表的结构 `Follow1`
--

DROP TABLE IF EXISTS `Follow1`;
CREATE TABLE IF NOT EXISTS `Follow1` (
  `FID` int(8) NOT NULL AUTO_INCREMENT,
  `FContent` varchar(300) NOT NULL,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FollowTo` int(8) NOT NULL,
  `FMaker` varchar(20) NOT NULL,
  PRIMARY KEY (`FID`),
  KEY `fk1` (`FMaker`),
  KEY `fk2` (`FollowTo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Follow1`
--

INSERT INTO `Follow1` (`FID`, `FContent`, `FCreateTime`, `FollowTo`, `FMaker`) VALUES
(1, '哈哈哈', '2017-01-11 09:30:26', 1, 'nobrowning'),
(2, '测试1', '2017-01-12 08:08:53', 1, '戈多'),
(3, '测试2', '2017-01-12 08:11:16', 1, '戈多'),
(4, '测试3', '2017-01-12 08:11:16', 1, '戈多'),
(5, '东方 v 发的 v 的', '2017-01-12 08:11:16', 1, '戈多'),
(6, '看你看看', '2017-01-12 08:11:16', 1, '戈多'),
(7, '哦 i 出版社', '2017-01-12 08:11:16', 1, '戈多'),
(8, '无法南昌万科城忘记', '2017-01-12 08:11:16', 1, '戈多'),
(9, '呃女厕让你送池', '2017-01-12 08:11:16', 1, '戈多'),
(10, '哦失败的堵车', '2017-01-12 08:11:16', 1, '戈多'),
(11, '极为吃不吃', '2017-01-12 08:11:16', 1, '戈多'),
(12, '不是吧', '2017-01-12 08:11:16', 1, '戈多'),
(13, 'u 让你从容 v', '2017-01-12 08:11:16', 1, '戈多'),
(14, '以防不测如厕', '2017-01-12 08:11:16', 1, '戈多'),
(15, '测试3', '2017-01-12 08:11:16', 1, '戈多'),
(16, '测试4', '2017-01-12 08:11:16', 1, '戈多'),
(17, '测试5', '2017-01-12 08:11:16', 1, '戈多'),
(18, '你不够特别呢', '2017-01-12 08:11:16', 1, '戈多'),
(19, 'sdcdscds', '2017-01-12 15:40:05', 1, 'nobrowning'),
(20, 'dfvfdvfdvfd<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', '2017-01-12 15:57:21', 1, 'nobrowning'),
(21, 'rtgvrtvtrvt<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', '2017-01-12 16:18:03', 1, 'nobrowning'),
(22, 'dfvdfvfdvdfvfd<br><img src=''img/屏幕快照 2017-01-11 上午12.27.53.png''>', '2017-01-12 16:22:11', 1, 'nobrowning'),
(23, 'hahahah', '2017-01-12 16:26:03', 35, 'nobrowning'),
(24, 'sdgdsgdsg', '2017-01-13 02:03:03', 1, 'nobrowing'),
(25, '我有，联系我我给你发。', '2017-01-13 02:07:48', 1, 'nobrowning'),
(26, '', '2017-01-13 02:08:52', 1, 'nobrowning');

--
-- 触发器 `Follow1`
--
DROP TRIGGER IF EXISTS `Follow1_T`;
DELIMITER $$
CREATE TRIGGER `Follow1_T` AFTER INSERT ON `Follow1` FOR EACH ROW BEGIN
UPDATE Area SET Area.AFollowsNumber = Area.AFollowsNumber+1 WHERE Area.AID=1;
UPDATE Post1 SET Post1.PReplyNumber=Post1.PReplyNumber+1,Post1.PLastUser=NEW.FMaker WHERE Post1.PID=NEW.FollowTo;
UPDATE User SET User.ULookNumber = User.ULookNumber+1 WHERE NEW.FMaker=User.UID;
UPDATE User SET User.UFollowNumber = User.UFollowNumber WHERE User.UID=(
    SELECT PMaker FROM Post1 WHERE Post1.PID=NEW.FollowTo
);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Follow2`
--

DROP TABLE IF EXISTS `Follow2`;
CREATE TABLE IF NOT EXISTS `Follow2` (
  `FID` int(8) NOT NULL AUTO_INCREMENT,
  `FContent` varchar(300) NOT NULL,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FollowTo` int(8) NOT NULL,
  `FMaker` varchar(20) NOT NULL,
  PRIMARY KEY (`FID`),
  KEY `FollowTo` (`FollowTo`),
  KEY `FMaker` (`FMaker`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Follow2`
--

INSERT INTO `Follow2` (`FID`, `FContent`, `FCreateTime`, `FollowTo`, `FMaker`) VALUES
(1, 'wefewfewfewfw<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', '2017-01-13 00:46:17', 1, 'nobrowning'),
(3, '你好～～～', '2017-01-13 07:04:05', 3, 'Break');

--
-- 触发器 `Follow2`
--
DROP TRIGGER IF EXISTS `Follow2_T`;
DELIMITER $$
CREATE TRIGGER `Follow2_T` AFTER INSERT ON `Follow2` FOR EACH ROW BEGIN
UPDATE Area SET Area.AFollowsNumber = Area.AFollowsNumber+1 WHERE Area.AID=2;
UPDATE Post2 SET Post2.PReplyNumber=Post2.PReplyNumber+1,Post2.PLastUser=NEW.FMaker WHERE Post2.PID=NEW.FollowTo;
UPDATE User SET User.ULookNumber = User.ULookNumber+1 WHERE NEW.FMaker=User.UID;
UPDATE User SET User.UFollowNumber = User.UFollowNumber WHERE User.UID=(
    SELECT PMaker FROM Post2 WHERE Post2.PID=NEW.FollowTo
);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Follow3`
--

DROP TABLE IF EXISTS `Follow3`;
CREATE TABLE IF NOT EXISTS `Follow3` (
  `FID` int(8) NOT NULL AUTO_INCREMENT,
  `FContent` varchar(300) NOT NULL,
  `FCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FollowTo` int(8) NOT NULL,
  `FMaker` varchar(20) NOT NULL,
  PRIMARY KEY (`FID`),
  KEY `FollowTo` (`FollowTo`),
  KEY `FMaker` (`FMaker`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Follow3`
--

INSERT INTO `Follow3` (`FID`, `FContent`, `FCreateTime`, `FollowTo`, `FMaker`) VALUES
(1, '<br><img src=''img/屏幕快照 2017-01-13 下午2.58.03.png''>', '2017-01-13 07:10:39', 1, 'nobrowning');

--
-- 触发器 `Follow3`
--
DROP TRIGGER IF EXISTS `Follow3_T`;
DELIMITER $$
CREATE TRIGGER `Follow3_T` AFTER INSERT ON `Follow3` FOR EACH ROW BEGIN
UPDATE Area SET Area.AFollowsNumber = Area.AFollowsNumber+1 WHERE Area.AID=3;
UPDATE Post3 SET Post3.PReplyNumber=Post3.PReplyNumber+1,Post3.PLastUser=NEW.FMaker WHERE Post3.PID=NEW.FollowTo;
UPDATE User SET User.ULookNumber = User.ULookNumber+1 WHERE NEW.FMaker=User.UID;
UPDATE User SET User.UFollowNumber = User.UFollowNumber WHERE User.UID=(
    SELECT PMaker FROM Post3 WHERE Post3.PID=NEW.FollowTo
);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Post1`
--

DROP TABLE IF EXISTS `Post1`;
CREATE TABLE IF NOT EXISTS `Post1` (
  `PID` int(8) NOT NULL AUTO_INCREMENT,
  `PTitle` varchar(50) NOT NULL,
  `PContent` varchar(300) NOT NULL,
  `PMaker` varchar(20) NOT NULL,
  `PMakerImg` varchar(50) NOT NULL,
  `PCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PLookNumber` int(8) NOT NULL DEFAULT '1',
  `PReplyNumber` int(8) NOT NULL DEFAULT '0',
  `PLastUser` varchar(20) DEFAULT NULL,
  `PLastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PID`),
  KEY `PMaker` (`PMaker`),
  KEY `PLastUser` (`PLastUser`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Post1`
--

INSERT INTO `Post1` (`PID`, `PTitle`, `PContent`, `PMaker`, `PMakerImg`, `PCreateTime`, `PLookNumber`, `PReplyNumber`, `PLastUser`, `PLastTime`) VALUES
(1, '求照片', '求计算机学院2014级显示各学期退学学分线和试读学分线那个表的照片！', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-11 04:07:06', 146, 25, 'nobrowning', '2017-01-13 02:09:13'),
(8, 'Test1', 'Test1', '小白', 'img/head.jpg', '2017-01-11 13:51:15', 2, 0, NULL, '2017-01-13 00:41:19'),
(9, 'Test2', 'Test2', '小白', 'img/head.jpg', '2017-01-11 13:51:15', 1, 0, NULL, '2017-01-11 13:51:15'),
(10, 'Test3', 'Test3', '小白', 'img/head.jpg', '2017-01-11 13:53:02', 1, 0, NULL, '2017-01-11 13:53:02'),
(11, 'Test4', 'Test4', '小白', 'img/head.jpg', '2017-01-11 13:53:02', 1, 0, NULL, '2017-01-11 13:53:02'),
(12, 'Test5', 'Test5', '小白', 'img/head.jpg', '2017-01-11 13:53:25', 1, 0, NULL, '2017-01-11 13:53:25'),
(13, 'Test6', 'Test6', '小白', 'img/head.jpg', '2017-01-11 13:53:25', 1, 0, NULL, '2017-01-11 13:53:25'),
(14, 'Test7', 'Test7', '小白', 'img/head.jpg', '2017-01-11 13:53:44', 1, 0, NULL, '2017-01-11 13:53:44'),
(15, 'Test8', 'Test8', '小白', 'img/head.jpg', '2017-01-11 13:53:44', 1, 0, NULL, '2017-01-11 13:53:44'),
(16, 'Test9', 'Test9', '小白', 'img/head.jpg', '2017-01-11 13:54:00', 1, 0, NULL, '2017-01-11 13:54:00'),
(17, 'Test10', 'Test10', '小白', 'img/head.jpg', '2017-01-11 13:54:00', 1, 0, NULL, '2017-01-11 13:54:00'),
(18, 'Test11', 'Test11', '小白', 'img/head.jpg', '2017-01-11 13:54:17', 1, 0, NULL, '2017-01-11 13:54:17'),
(19, 'Test12', 'Test12', '小白', 'img/head.jpg', '2017-01-11 13:54:17', 1, 0, NULL, '2017-01-11 13:54:17'),
(22, '1234567', 'sdvdsvfds<br><img src="images/屏幕快照 2017-01-11 上午12.26.35.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 12:49:45', 2, 0, NULL, '2017-01-12 12:49:59'),
(23, '6666666', 'regergerg<br><img src="images/屏幕快照 2016-12-09 上午9.21.40.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 12:52:51', 2, 0, NULL, '2017-01-12 12:53:00'),
(24, '444444', 'fsfdsfdsfwesf<br><img src="images/屏幕快照 2017-01-12 上午9.41.58.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 12:56:59', 3, 0, NULL, '2017-01-12 12:59:24'),
(25, 'wwwwww', 'sdcdscdscds<br><img src="images/屏幕快照 2017-01-11 上午12.27.53.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:00:05', 6, 0, NULL, '2017-01-12 13:07:45'),
(26, 'fdvfdvfdsvfdsv', '<br><img src="images/屏幕快照 2017-01-11 上午12.27.12.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:08:28', 2, 0, NULL, '2017-01-12 13:08:36'),
(27, 'sweet', '<br><img src="img/屏幕快照 2016-11-25 上午8.15.21.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:10:21', 2, 0, NULL, '2017-01-12 13:10:29'),
(28, 'dfvfdvfdv', '<br><img src="http://localhost:8080/img/屏幕快照 2017-01-12 上午9.41.58.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:13:51', 2, 0, NULL, '2017-01-12 13:13:56'),
(29, '呃发放', '<br><img src="http://localhost:8080/img/屏幕快照 2016-11-25 上午8.15.21.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:24:33', 1, 0, NULL, '2017-01-12 13:24:33'),
(30, '反对 v 地方 v地方', '<br><img src="http://localhost:8080/img/屏幕快照 2017-01-11 上午1.10.27.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:26:09', 1, 0, NULL, '2017-01-12 13:26:09'),
(31, 'dfvdfvfd', '<br><img src="http://localhost:8080/img/屏幕快照 2016-12-09 上午9.21.38.png">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:28:06', 2, 0, NULL, '2017-01-12 13:28:24'),
(32, 'ergvwergrewg', 'ergerwgrewgre<br><img src=\\"http://localhost:8080/img/屏幕快照 2016-12-09 上午9.21.38.png\\">', 'nobrowning', 'img/head.jpg', '2017-01-12 13:30:18', 4, 0, NULL, '2017-01-12 13:33:29'),
(34, 'sdfdsfds', '<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', 'nobrowning', 'img/head.jpg', '2017-01-12 13:39:21', 3, 0, NULL, '2017-01-12 15:59:43'),
(35, 'rvgrrvr', 'rvrtvtrv<br><img src=''img/屏幕快照 2017-01-11 上午1.10.27.png''>', 'nobrowning', 'img/head.jpg', '2017-01-12 16:25:16', 4, 1, 'nobrowning', '2017-01-12 16:28:55'),
(37, '终于做完了', '哈哈哈！<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-12 19:38:03', 1, 0, NULL, '2017-01-12 19:38:03'),
(38, '', '', 'nobrowing', 'img/head.jpg', '2017-01-13 01:50:18', 1, 0, NULL, '2017-01-13 01:50:18'),
(39, 'hjojojooj', '', 'nobrowing', 'img/head.jpg', '2017-01-13 01:51:08', 1, 0, NULL, '2017-01-13 01:51:08'),
(40, '', 'shajajajajaja', 'nobrowing', 'img/head.jpg', '2017-01-13 01:51:44', 1, 0, NULL, '2017-01-13 01:51:44'),
(41, 'jshjshsjshsasiio', '', 'nobrowing', 'img/head.jpg', '2017-01-13 01:52:30', 1, 0, NULL, '2017-01-13 01:52:30'),
(42, '', 'shajkiosuodhqo', 'nobrowing', 'img/head.jpg', '2017-01-13 01:53:17', 1, 0, NULL, '2017-01-13 01:53:17'),
(43, 'dfvdfgvfd', 'sdffdsfds', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-13 01:58:28', 1, 0, NULL, '2017-01-13 01:58:28'),
(44, 'dfbfdbfd', 'dfbfdbfdbdf', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-13 02:04:33', 3, 0, NULL, '2017-01-13 11:58:49'),
(45, 'dpvmpdos', 'xvxvdx<br><img src=''img/屏幕快照 2016-12-09 上午9.21.40.png''>', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-23 07:45:30', 2, 0, NULL, '2017-01-23 07:45:37');

--
-- 触发器 `Post1`
--
DROP TRIGGER IF EXISTS `Post1_T`;
DELIMITER $$
CREATE TRIGGER `Post1_T` AFTER INSERT ON `Post1` FOR EACH ROW BEGIN
     UPDATE Area SET Area.ASize = Area.ASize+1,Area.ATodayNew=Area.ATodayNew+1,Area.ALastPost = NEW.PID,Area.ALastPostTitle = NEW.PTitle,Area.ALastUser=NEW.PMaker,Area.ALastUserImg=NEW.PMakerImg  WHERE Area.AID=1;
     UPDATE User SET User.UPostNumber = User.UPostNumber+1 WHERE NEW.PMaker=User.UID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Post2`
--

DROP TABLE IF EXISTS `Post2`;
CREATE TABLE IF NOT EXISTS `Post2` (
  `PID` int(8) NOT NULL AUTO_INCREMENT,
  `PTitle` varchar(50) NOT NULL,
  `PContent` varchar(300) NOT NULL,
  `PMaker` varchar(20) NOT NULL,
  `PMakerImg` varchar(50) NOT NULL,
  `PCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PLookNumber` int(8) NOT NULL DEFAULT '1',
  `PReplyNumber` int(8) NOT NULL DEFAULT '0',
  `PLastUser` varchar(20) DEFAULT NULL,
  `PLastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PID`),
  KEY `PLastUser` (`PLastUser`),
  KEY `PMaker` (`PMaker`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Post2`
--

INSERT INTO `Post2` (`PID`, `PTitle`, `PContent`, `PMaker`, `PMakerImg`, `PCreateTime`, `PLookNumber`, `PReplyNumber`, `PLastUser`, `PLastTime`) VALUES
(1, 'sdfsdfd', '<br><img src=''img/屏幕快照 2017-01-12 上午9.41.58.png''>', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-13 00:39:40', 5, 1, 'nobrowning', '2017-01-13 00:46:44'),
(3, 'hahahah', '<br><img src=''img/屏幕快照 2017-01-13 下午2.58.17.png''>', 'Break', 'img/屏幕快照 2017-01-13 下午2.57.51.png', '2017-01-13 07:03:46', 3, 1, 'Break', '2017-01-13 07:04:09'),
(4, 'nhaisdf', 'sdvdsvdsvcdscdsc', 'qqqqq', 'img/屏幕快照 2017-01-13 下午2.58.03.png', '2017-01-13 07:33:00', 1, 0, NULL, '2017-01-13 07:33:00');

--
-- 触发器 `Post2`
--
DROP TRIGGER IF EXISTS `Post2_T`;
DELIMITER $$
CREATE TRIGGER `Post2_T` AFTER INSERT ON `Post2` FOR EACH ROW BEGIN
     UPDATE Area SET Area.ASize = Area.ASize+1,Area.ATodayNew=Area.ATodayNew+1,Area.ALastPost = NEW.PID,Area.ALastPostTitle = NEW.PTitle,Area.ALastUser=NEW.PMaker,Area.ALastUserImg=NEW.PMakerImg  WHERE Area.AID=2;
     UPDATE User SET User.UPostNumber = User.UPostNumber+1 WHERE NEW.PMaker=User.UID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `Post3`
--

DROP TABLE IF EXISTS `Post3`;
CREATE TABLE IF NOT EXISTS `Post3` (
  `PID` int(8) NOT NULL AUTO_INCREMENT,
  `PTitle` varchar(50) NOT NULL,
  `PContent` varchar(300) NOT NULL,
  `PMaker` varchar(20) NOT NULL,
  `PMakerImg` varchar(50) NOT NULL,
  `PCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PLookNumber` int(8) NOT NULL DEFAULT '1',
  `PReplyNumber` int(8) NOT NULL DEFAULT '0',
  `PLastUser` varchar(20) DEFAULT NULL,
  `PLastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PID`),
  KEY `PLastUser` (`PLastUser`),
  KEY `PMaker` (`PMaker`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Post3`
--

INSERT INTO `Post3` (`PID`, `PTitle`, `PContent`, `PMaker`, `PMakerImg`, `PCreateTime`, `PLookNumber`, `PReplyNumber`, `PLastUser`, `PLastTime`) VALUES
(1, '老师你好～', '哈哈哈哈～～～<br><img src=''img/屏幕快照 2016-12-09 上午9.21.40.png''>', 'nobrowning', 'img/屏幕快照 2017-01-12 上午9.41.58.png', '2017-01-13 07:08:43', 5, 1, 'nobrowning', '2017-01-13 07:10:42');

--
-- 触发器 `Post3`
--
DROP TRIGGER IF EXISTS `Post3_T`;
DELIMITER $$
CREATE TRIGGER `Post3_T` AFTER INSERT ON `Post3` FOR EACH ROW BEGIN
     UPDATE Area SET Area.ASize = Area.ASize+1,Area.ATodayNew=Area.ATodayNew+1,Area.ALastPost = NEW.PID,Area.ALastPostTitle = NEW.PTitle,Area.ALastUser=NEW.PMaker,Area.ALastUserImg=NEW.PMakerImg  WHERE Area.AID=3;
     UPDATE User SET User.UPostNumber = User.UPostNumber+1 WHERE NEW.PMaker=User.UID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `UID` varchar(20) NOT NULL,
  `UPassword` varchar(20) NOT NULL,
  `UEmail` varchar(30) NOT NULL,
  `UBirthday` date NOT NULL,
  `UImg` varchar(50) NOT NULL DEFAULT 'img/head.jpg',
  `UPostNumber` int(8) NOT NULL DEFAULT '0',
  `UFollowNumber` int(8) NOT NULL DEFAULT '0',
  `ULookNumber` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `User`
--

INSERT INTO `User` (`UID`, `UPassword`, `UEmail`, `UBirthday`, `UImg`, `UPostNumber`, `UFollowNumber`, `ULookNumber`) VALUES
('Break', '123456', '457922412@qq.com', '1995-07-11', 'img/屏幕快照 2017-01-13 下午2.57.51.png', 2, 0, 2),
('ç¦å°é', '123456', '457922412@qq.com', '1995-11-01', 'img/head.jpg', 0, 0, 0),
('nobrowing', '123', '457922412@qq.com', '2016-08-10', 'img/head.jpg', 5, 0, 1),
('nobrownig', '123456', '457922412@qq.com', '2017-01-04', 'img/head.jpg', 0, 0, 0),
('nobrowning', '123456', '457922412@qq.com', '1995-09-11', 'img/屏幕快照 2017-01-23 下午3.46.20.png', 8, 0, 7),
('qqqqq', '123456', '457922412@qq.com', '2017-02-13', 'img/屏幕快照 2017-01-13 下午2.58.03.png', 2, 0, 0),
('哈哈哈', '123456', '457922412@qq.com', '2014-09-01', 'img/head.jpg', 0, 0, 0),
('小白', '12345', '1234567@gmail.com', '2000-01-11', 'img/head.jpg', 0, 0, 0),
('戈多', '123455', 'geduo@qq.com', '1996-04-01', 'img/head.jpg', 0, 0, 0),
('焦少青', '123456', '457922412@qq.com', '2017-01-04', 'img/head.jpg', 0, 0, 0);

--
-- 限制导出的表
--

--
-- 限制表 `Follow1`
--
ALTER TABLE `Follow1`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`FMaker`) REFERENCES `User` (`UID`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`FollowTo`) REFERENCES `Post1` (`PID`);

--
-- 限制表 `Follow2`
--
ALTER TABLE `Follow2`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`FollowTo`) REFERENCES `Post2` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk4` FOREIGN KEY (`FMaker`) REFERENCES `User` (`UID`);

--
-- 限制表 `Follow3`
--
ALTER TABLE `Follow3`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`FollowTo`) REFERENCES `Post3` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk6` FOREIGN KEY (`FMaker`) REFERENCES `User` (`UID`);

--
-- 限制表 `Post1`
--
ALTER TABLE `Post1`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`PMaker`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk8` FOREIGN KEY (`PMaker`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `Post2`
--
ALTER TABLE `Post2`
  ADD CONSTRAINT `fk10` FOREIGN KEY (`PLastUser`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk9` FOREIGN KEY (`PMaker`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `Post3`
--
ALTER TABLE `Post3`
  ADD CONSTRAINT `fk11` FOREIGN KEY (`PMaker`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk12` FOREIGN KEY (`PLastUser`) REFERENCES `User` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

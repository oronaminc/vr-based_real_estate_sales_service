create database happyhouse;
use happyhouse;

CREATE TABLE `baseaddress` (
  `no` int NOT NULL AUTO_INCREMENT,
  `city` varchar(30) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `dongcode` varchar(30) DEFAULT NULL,
  `gugun` varchar(30) DEFAULT NULL,
  `dong` varchar(30) NOT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3626 DEFAULT CHARSET=utf8;

CREATE TABLE `boardcomment` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `postid` int NOT NULL,
  `userid` varchar(20) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `postid` (`postid`),
  CONSTRAINT `boardcomment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`),
  CONSTRAINT `boardcomment_ibfk_2` FOREIGN KEY (`postid`) REFERENCES `boardpost` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `boardpost` (
  `postid` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `isselling` tinyint(1) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `sido` varchar(30) DEFAULT NULL,
  `gugun` varchar(30) DEFAULT NULL,
  `dong` varchar(30) DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `dealtype` int DEFAULT NULL,
  `housetype` int DEFAULT NULL,
  `ispetallowed` tinyint(1) DEFAULT NULL,
  `usertag1` varchar(30) DEFAULT NULL,
  `usertag2` varchar(30) DEFAULT NULL,
  `usertag3` varchar(30) DEFAULT NULL,
  `housepicimg` varchar(30) DEFAULT NULL,
  `housemapimg` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `userid` (`userid`),
  CONSTRAINT `boardpost_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dongcode` (
  `dongcode` text,
  `city` text,
  `gugun` text,
  `dong` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guguncode` (
  `gugun_code` varchar(10) NOT NULL,
  `gugun_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gugun_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedeal` (
  `no` int NOT NULL AUTO_INCREMENT,
  `dong` varchar(30) NOT NULL,
  `AptName` varchar(50) NOT NULL,
  `code` varchar(30) NOT NULL,
  `dealAmount` varchar(50) NOT NULL,
  `buildYear` varchar(30) DEFAULT NULL,
  `dealYear` varchar(30) DEFAULT NULL,
  `dealMonth` varchar(30) DEFAULT NULL,
  `dealDay` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `rentMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=68865 DEFAULT CHARSET=utf8;

CREATE TABLE `houseinfo` (
  `no` int NOT NULL AUTO_INCREMENT,
  `dong` varchar(30) NOT NULL,
  `AptName` varchar(50) NOT NULL,
  `code` varchar(30) NOT NULL,
  `buildYear` varchar(30) DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5990 DEFAULT CHARSET=utf8;

CREATE TABLE `member` (
  `userid` varchar(30) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pollution` (
  `no` int DEFAULT NULL,
  `name` text,
  `dongcode` int DEFAULT NULL,
  `dong` text,
  `bizcode` int DEFAULT NULL,
  `address` text,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sidocode` (
  `sido_code` varchar(10) NOT NULL,
  `sido_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vue_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `vue_board_to_user_fk` (`writer`),
  CONSTRAINT `vue_board_to_user_fk` FOREIGN KEY (`writer`) REFERENCES `vue_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vue_user` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
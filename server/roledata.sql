-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: roledata
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` int(11) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `headIcon` varchar(255) DEFAULT NULL,
  `roomCard` int(11) NOT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `sex` int(1) NOT NULL,
  `prizecount` int(11) NOT NULL,
  `manager_up_id` int(11) NOT NULL DEFAULT '0',
  `actualCard` int(11) NOT NULL,
  `totalCard` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `isGame` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,100000,'127','127','imgicon',5,'127','21sfsd','afafsdf',1,1,0,5,5,'2017-12-12 00:11:58',NULL,'0','0'),(2,100001,'1272','127','imgicon',5,'127','21sfsd','afafsdf',1,1,0,5,5,'2017-12-19 23:58:45',NULL,'0','0');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameaccountindex`
--

DROP TABLE IF EXISTS `gameaccountindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameaccountindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `accountIndex` int(1) NOT NULL,
  `cardList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_GAME_INDEX_ID` (`game_id`),
  KEY `PK_ACCOUNT_INDEX_ID` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameaccountindex`
--

LOCK TABLES `gameaccountindex` WRITE;
/*!40000 ALTER TABLE `gameaccountindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameaccountindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamerecord`
--

DROP TABLE IF EXISTS `gamerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `type` char(1) NOT NULL,
  `cardIndex` varchar(11) NOT NULL,
  `acountindex_id` int(11) NOT NULL,
  `curentTime` datetime NOT NULL,
  `playerList_one` varchar(255) NOT NULL,
  `playerList_two` varchar(255) NOT NULL,
  `playerList_three` varchar(255) NOT NULL,
  `playerList_four` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PK_GAMERECORD_GAME_ID` (`game_id`),
  KEY `PK_GAMERECORD_ACCOUNTINDEX_ID` (`acountindex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamerecord`
--

LOCK TABLES `gamerecord` WRITE;
/*!40000 ALTER TABLE `gamerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `actualCard` int(11) NOT NULL DEFAULT '0',
  `totalCards` int(11) NOT NULL DEFAULT '0',
  `manager_up_id` int(11) DEFAULT '1',
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PK_MANANGER_MANAGER_ID` (`manager_up_id`),
  KEY `PK_MANAGER_POWER_M_ID` (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticetable`
--

DROP TABLE IF EXISTS `noticetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticetable`
--

LOCK TABLES `noticetable` WRITE;
/*!40000 ALTER TABLE `noticetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatelog`
--

DROP TABLE IF EXISTS `operatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `manager_down_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_OPERATELOG_MANAGER` (`manager_id`),
  KEY `PK_OPERATELOG_MANAGER_DOWN` (`manager_down_id`),
  KEY `PK_OPERATELOG_ACCOUNT` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatelog`
--

LOCK TABLES `operatelog` WRITE;
/*!40000 ALTER TABLE `operatelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paylog`
--

DROP TABLE IF EXISTS `paylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_manager_Id` int(11) DEFAULT NULL,
  `reced_Id` int(11) DEFAULT NULL,
  `receType` int(11) DEFAULT NULL,
  `payCount` int(11) DEFAULT NULL,
  `payTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_PAYLOG_MANAGER_ID` (`send_manager_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paylog`
--

LOCK TABLES `paylog` WRITE;
/*!40000 ALTER TABLE `paylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `paylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playrecord`
--

DROP TABLE IF EXISTS `playrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playrecord` longtext,
  `standingsDetail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_STANDINGSDETAIL_PLAYRECORDID` (`standingsDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playrecord`
--

LOCK TABLES `playrecord` WRITE;
/*!40000 ALTER TABLE `playrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `playrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prize`
--

DROP TABLE IF EXISTS `prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) NOT NULL,
  `prize_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `probability` int(6) NOT NULL DEFAULT '100',
  `status` char(1) NOT NULL DEFAULT '0',
  `prizecount` int(11) NOT NULL DEFAULT '1',
  `type` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize`
--

LOCK TABLES `prize` WRITE;
/*!40000 ALTER TABLE `prize` DISABLE KEYS */;
/*!40000 ALTER TABLE `prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prizerule`
--

DROP TABLE IF EXISTS `prizerule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prizerule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `precount` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prizerule`
--

LOCK TABLES `prizerule` WRITE;
/*!40000 ALTER TABLE `prizerule` DISABLE KEYS */;
/*!40000 ALTER TABLE `prizerule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roominfo`
--

DROP TABLE IF EXISTS `roominfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roominfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameType` char(1) DEFAULT NULL,
  `isHong` char(1) DEFAULT '0',
  `roomid` int(11) DEFAULT NULL,
  `sevenDouble` char(1) DEFAULT '0',
  `ma` int(11) DEFAULT NULL,
  `zimo` char(1) DEFAULT NULL,
  `xiayu` int(2) DEFAULT '0',
  `addWordCard` char(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `cardNumb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roominfo`
--

LOCK TABLES `roominfo` WRITE;
/*!40000 ALTER TABLE `roominfo` DISABLE KEYS */;
INSERT INTO `roominfo` VALUES (1,'1','0',707098,'0',0,'0',0,'0',NULL,'2017-12-12 00:12:19',1),(2,'1','0',551665,'0',0,'0',0,'0',NULL,'2017-12-12 00:13:25',1),(3,'1','0',727044,'0',0,'0',0,'0',NULL,'2017-12-12 00:51:07',1),(4,'1','0',271181,'0',0,'0',0,'0',NULL,'2017-12-12 00:54:51',1),(5,'1','0',519674,'0',0,'0',0,'0',NULL,'2017-12-18 23:51:29',1);
/*!40000 ALTER TABLE `roominfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_ROOM_STANDINGS_ID` (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standingsaccountrelation`
--

DROP TABLE IF EXISTS `standingsaccountrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standingsaccountrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standings_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_STANDINGS_ACCOUNT_ID` (`standings_id`),
  KEY `PK_ACCOUNT_STANDINGS_ID` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standingsaccountrelation`
--

LOCK TABLES `standingsaccountrelation` WRITE;
/*!40000 ALTER TABLE `standingsaccountrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `standingsaccountrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standingsdetail`
--

DROP TABLE IF EXISTS `standingsdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standingsdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standingsdetail`
--

LOCK TABLES `standingsdetail` WRITE;
/*!40000 ALTER TABLE `standingsdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `standingsdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standingsrelation`
--

DROP TABLE IF EXISTS `standingsrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standingsrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standings_id` int(11) NOT NULL,
  `standingsDetail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_STANDINGS_⁯ID` (`standings_id`),
  KEY `PK_STANDINGSDETAIL_ID` (`standingsDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standingsrelation`
--

LOCK TABLES `standingsrelation` WRITE;
/*!40000 ALTER TABLE `standingsrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `standingsrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techargerecord`
--

DROP TABLE IF EXISTS `techargerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techargerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `manager_up_id` int(11) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  `techargeMoney` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `PK_TECHARGEREORD_ACCOUNT_ID` (`account_id`),
  KEY `PK_TECHARGEREORD_MANAGER_ID` (`manager_id`),
  KEY `PK_TECHARGEREORD_MANAGER_UP_ID` (`manager_up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techargerecord`
--

LOCK TABLES `techargerecord` WRITE;
/*!40000 ALTER TABLE `techargerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `techargerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winnersinfo`
--

DROP TABLE IF EXISTS `winnersinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `winnersinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `awardTime` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PK_PRIZE_WINNERSINFO_ID` (`prize_id`),
  KEY `PK_ACCOUNT_WINNERSINFO_ID` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winnersinfo`
--

LOCK TABLES `winnersinfo` WRITE;
/*!40000 ALTER TABLE `winnersinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `winnersinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-23 21:46:47

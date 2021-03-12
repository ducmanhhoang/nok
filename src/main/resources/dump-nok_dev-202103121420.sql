-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: nok_dev
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

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
-- Table structure for table `a_code`
--

DROP TABLE IF EXISTS `a_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_code` (
  `CODE_ID` varchar(100) NOT NULL,
  `CODE_GROUP_ID` varchar(100) NOT NULL,
  `OPTION1` varchar(100) DEFAULT NULL,
  `OPTION2` varchar(100) DEFAULT NULL,
  `OPTION3` varchar(100) DEFAULT NULL,
  `SEQ` int(11) NOT NULL,
  PRIMARY KEY (`CODE_ID`,`CODE_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_code`
--

LOCK TABLES `a_code` WRITE;
/*!40000 ALTER TABLE `a_code` DISABLE KEYS */;
INSERT INTO `a_code` VALUES ('J','A_PROGRAM_TYPE',NULL,NULL,NULL,2),('M','A_PROGRAM_TYPE',NULL,NULL,NULL,1),('N','USE_YN',NULL,NULL,NULL,2),('P','A_PROGRAM_TYPE',NULL,NULL,NULL,3),('Y','USE_YN',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `a_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_code_group`
--

DROP TABLE IF EXISTS `a_code_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_code_group` (
  `CODE_GROUP_ID` varchar(100) NOT NULL,
  `USE_YN` varchar(100) NOT NULL,
  PRIMARY KEY (`CODE_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_code_group`
--

LOCK TABLES `a_code_group` WRITE;
/*!40000 ALTER TABLE `a_code_group` DISABLE KEYS */;
INSERT INTO `a_code_group` VALUES ('A_PROGRAM_TYPE','Y'),('USE_YN','N');
/*!40000 ALTER TABLE `a_code_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_code_group_lang`
--

DROP TABLE IF EXISTS `a_code_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_code_group_lang` (
  `CODE_GROUP_ID` varchar(100) NOT NULL,
  `LANG_CD` varchar(100) NOT NULL,
  `CODE_GROUP_NM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_GROUP_ID`,`LANG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_code_group_lang`
--

LOCK TABLES `a_code_group_lang` WRITE;
/*!40000 ALTER TABLE `a_code_group_lang` DISABLE KEYS */;
INSERT INTO `a_code_group_lang` VALUES ('A_PROGRAM_TYPE','en','Program type'),('A_PROGRAM_TYPE','vi','Loại chương trình'),('USE_YN','en','Using Yes/No'),('USE_YN','vi','Sử dụng Có/Không');
/*!40000 ALTER TABLE `a_code_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_code_lang`
--

DROP TABLE IF EXISTS `a_code_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_code_lang` (
  `CODE_ID` varchar(100) NOT NULL,
  `CODE_GROUP_ID` varchar(100) NOT NULL,
  `LANG_CD` varchar(100) NOT NULL,
  `CODE_NM` varchar(100) NOT NULL,
  PRIMARY KEY (`CODE_ID`,`CODE_GROUP_ID`,`LANG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_code_lang`
--

LOCK TABLES `a_code_lang` WRITE;
/*!40000 ALTER TABLE `a_code_lang` DISABLE KEYS */;
INSERT INTO `a_code_lang` VALUES ('J','A_PROGRAM_TYPE','en','Json'),('J','A_PROGRAM_TYPE','vi','Json'),('M','A_PROGRAM_TYPE','en','Main screen'),('M','A_PROGRAM_TYPE','vi','Màn hình chính'),('N','USE_YN','en','No'),('N','USE_YN','vi','Không'),('P','A_PROGRAM_TYPE','en','Popup'),('P','A_PROGRAM_TYPE','vi','Popup'),('Y','USE_YN','en','Yes'),('Y','USE_YN','vi','Có');
/*!40000 ALTER TABLE `a_code_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_file`
--

DROP TABLE IF EXISTS `a_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_file` (
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEQ` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TYPE` varchar(100) NOT NULL,
  `SAVE_NAME` varchar(100) NOT NULL,
  `FILE_SIZE` varchar(100) NOT NULL,
  `UPLOADED_PATH` varchar(100) NOT NULL,
  `THUMB_PATH` varchar(100) NOT NULL,
  PRIMARY KEY (`FILE_ID`,`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_file`
--

LOCK TABLES `a_file` WRITE;
/*!40000 ALTER TABLE `a_file` DISABLE KEYS */;
INSERT INTO `a_file` VALUES (1,1,'IMG_0069.JPG','JPG','20210128053209176','2334062','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0069.JPG&saveName=','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0069.JPG&saveName=20210128053209176'),(1,2,'IMG_0070.JPG','JPG','20210128053209432','2458191','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0070.JPG&saveName=','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0070.JPG&saveName=20210128053209432'),(1,3,'IMG_0071.JPG','JPG','20210128053209537','2854866','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0071.JPG&saveName=','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0071.JPG&saveName=20210128053209537'),(1,4,'IMG_0084.JPG','JPG','20210209043233068','2720553','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0084.JPG&saveName=','../../M000000/G001100/F001111/downloadFile.do?name=IMG_0084.JPG&saveName=20210209043233068');
/*!40000 ALTER TABLE `a_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_menu`
--

DROP TABLE IF EXISTS `a_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_menu` (
  `MENU_ID` varchar(7) NOT NULL,
  `MENU_DESC` varchar(100) NOT NULL,
  `UP_MENU_ID` varchar(7) DEFAULT NULL,
  `SYSTEM_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_menu`
--

LOCK TABLES `a_menu` WRITE;
/*!40000 ALTER TABLE `a_menu` DISABLE KEYS */;
INSERT INTO `a_menu` VALUES ('F001111','Up & Download','G001100','EDU'),('F001112','Grid','G001100','EDU'),('F001113','Select','G001100','EDU'),('F001211','Code Mng','G001200','EDU'),('F111111','Home','G111100','EDU'),('F111112','Books','G111100','EDU'),('F111113','References','G111100','EDU'),('F111211','Home','G111200','EDU'),('F111212','Books','G111200','EDU'),('F111213','References','G111200','EDU'),('G001100','Sample','M000000','EDU'),('G001200','System Mng','M000000','EDU'),('G111100','Grade 1','M110000','EDU'),('G111200','Grade 2','M110000','EDU'),('G111300','Grade 3','M110000','EDU'),('M000000','Common',NULL,'EDU'),('M110000','Document',NULL,'EDU');
/*!40000 ALTER TABLE `a_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_menu_lang`
--

DROP TABLE IF EXISTS `a_menu_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_menu_lang` (
  `MENU_ID` varchar(7) NOT NULL,
  `LANG_CD` varchar(100) NOT NULL,
  `MENU_NM` varchar(100) NOT NULL,
  PRIMARY KEY (`MENU_ID`,`LANG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_menu_lang`
--

LOCK TABLES `a_menu_lang` WRITE;
/*!40000 ALTER TABLE `a_menu_lang` DISABLE KEYS */;
INSERT INTO `a_menu_lang` VALUES ('F001111','en','Up & Download'),('F001111','vi','Tải lên & xuống'),('F001112','en','Grid'),('F001112','vi','Bảng dữ liệu'),('F001113','en','Select'),('F001113','vi','Select'),('F001211','en','Code Mng'),('F001211','vi','QL code'),('F111111','en','Home'),('F111111','vi','Trang chủ'),('F111112','en','Books'),('F111112','vi','Sách giáo khoa'),('F111113','en','References'),('F111113','vi','TL tham khảo'),('G001200','en','System Mng'),('G001200','vi','QL hệ thống'),('G111100','en','Grade 1'),('G111100','vi','Lớp 1'),('G111200','en','Grade 2'),('G111200','vi','Lớp 2'),('G111300','en','Grade 3'),('G111300','vi','Lớp 3'),('M110000','en','Document'),('M110000','vi','Tài liệu');
/*!40000 ALTER TABLE `a_menu_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_program`
--

DROP TABLE IF EXISTS `a_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_program` (
  `PROGRAM_ID` varchar(100) NOT NULL,
  `MENU_ID` varchar(7) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `TYPE` varchar(100) NOT NULL,
  PRIMARY KEY (`PROGRAM_ID`),
  UNIQUE KEY `a_program_un` (`MENU_ID`,`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_program`
--

LOCK TABLES `a_program` WRITE;
/*!40000 ALTER TABLE `a_program` DISABLE KEYS */;
INSERT INTO `a_program` VALUES ('F001111M1','F001111','F001111','M'),('F001112M1','F001112','F001112','M'),('F111111M1','F111111','F111111','M'),('F111112M1','F111112','F111112','M'),('F111113M1','F111113','F111113','M'),('F111211M1','F111211','F111211','M'),('F111212M1','F111212','F111212','M'),('F111213M1','F111213','F111213','M');
/*!40000 ALTER TABLE `a_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_program_lang`
--

DROP TABLE IF EXISTS `a_program_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_program_lang` (
  `PROGRAM_ID` varchar(100) NOT NULL,
  `LANG_CD` varchar(100) NOT NULL,
  `PROGRAM_NM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PROGRAM_ID`,`LANG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_program_lang`
--

LOCK TABLES `a_program_lang` WRITE;
/*!40000 ALTER TABLE `a_program_lang` DISABLE KEYS */;
INSERT INTO `a_program_lang` VALUES ('F001111M1','en','Main screen'),('F001111M1','vi','Màn hình chính'),('F001112M1','en','Main screen'),('F001112M1','vi','Màn hình chính'),('F111111M1','en','Main screen'),('F111111M1','vi','Màn hình chính'),('F111112M1','en','Main screen'),('F111112M1','vi','Màn hình chính'),('F111113M1','en','Main screen'),('F111113M1','vi','Màn hình chính'),('F111211M1','en','Main screen'),('F111211M1','vi','Màn hình chính'),('F111212M1','en','Main screen'),('F111212M1','vi','Màn hình chính'),('F111213M1','en','Main screen'),('F111213M1','vi','Màn hình chính');
/*!40000 ALTER TABLE `a_program_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_system`
--

DROP TABLE IF EXISTS `a_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_system` (
  `SYSTEM_ID` varchar(100) NOT NULL,
  `SYSTEM_NM` varchar(100) NOT NULL,
  PRIMARY KEY (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_system`
--

LOCK TABLES `a_system` WRITE;
/*!40000 ALTER TABLE `a_system` DISABLE KEYS */;
INSERT INTO `a_system` VALUES ('EDU','Education');
/*!40000 ALTER TABLE `a_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nok_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-12 14:20:53

-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: themepark
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction` (
  `ATTRACT_NO` decimal(10,0) NOT NULL,
  `ATTRACT_NAME` varchar(35) DEFAULT NULL,
  `ATTRACT_AGE` decimal(3,0) NOT NULL DEFAULT '0',
  `ATTRACT_CAPACITY` decimal(3,0) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ATTRACT_NO`),
  KEY `PARK_CODE` (`PARK_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction`
--

LOCK TABLES `attraction` WRITE;
/*!40000 ALTER TABLE `attraction` DISABLE KEYS */;
INSERT INTO `attraction` VALUES (10034,'ThunderCoaster',11,34,'FR1001'),(10056,'SpinningTeacups',4,62,'FR1001'),(10067,'FlightToStars',11,24,'FR1001'),(10078,'Ant-Trap',23,30,'FR1001'),(10098,'Carnival',3,120,'FR1001'),(20056,'3D-Lego_Show',3,200,'UK3452'),(30011,'BlackHole2',12,34,'UK3452'),(30012,'Pirates',10,42,'UK3452'),(30044,'UnderSeaWord',4,80,'UK3452'),(98764,'GoldRush',5,80,'ZA1342'),(10082,NULL,10,40,'ZA1342');
/*!40000 ALTER TABLE `attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EMP_NUM` decimal(4,0) NOT NULL,
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_DOB` date NOT NULL,
  `EMP_HIRE_DATE` date DEFAULT NULL,
  `EMP_AREA_CODE` varchar(4) NOT NULL,
  `EMP_PHONE` varchar(12) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  KEY `PARK_CODE` (`PARK_CODE`),
  KEY `EMP_LNAME_INDEX` (`EMP_LNAME`(8))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Ms','Calderdale','Emma','1972-06-15','1992-03-15','0181','324-9134','FR1001'),(101,'Ms','Ricardo','Marshel','1978-03-19','1996-04-25','0181','324-4472','UK3452'),(102,'Mr','Arshad','Arif','1969-11-14','1990-12-20','7253','675-8993','FR1001'),(103,'Ms','Roberts','Anne','1974-10-16','1994-08-16','0181','898-3456','UK3452'),(104,'Mr','Denver','Enrica','1980-11-08','2001-10-20','7253','504-4434','ZA1342'),(105,'Ms','Namowa','Mirrelle','1990-03-14','2006-11-08','0181','890-3243','FR1001'),(106,'Mrs','Smith','Gemma','1968-02-12','1989-01-05','0181','324-7845','ZA1342');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hours`
--

DROP TABLE IF EXISTS `hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hours` (
  `EMP_NUM` decimal(4,0) NOT NULL,
  `ATTRACT_NO` decimal(10,0) NOT NULL,
  `HOURS_PER_ATTRACT` decimal(2,0) NOT NULL,
  `HOUR_RATE` decimal(4,2) NOT NULL,
  `DATE_WORKED` date NOT NULL,
  PRIMARY KEY (`EMP_NUM`,`ATTRACT_NO`,`DATE_WORKED`),
  KEY `EMP_NUM` (`EMP_NUM`),
  KEY `ATTRACT_NO` (`ATTRACT_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours`
--

LOCK TABLES `hours` WRITE;
/*!40000 ALTER TABLE `hours` DISABLE KEYS */;
INSERT INTO `hours` VALUES (100,10034,6,6.50,'2007-05-18'),(100,10034,6,6.50,'2007-05-20'),(101,10034,6,6.50,'2007-05-18'),(102,30012,3,5.99,'2007-05-23'),(102,30044,6,5.99,'2007-05-21'),(102,30044,3,5.99,'2007-05-22'),(104,30011,6,7.20,'2007-05-21'),(104,30012,6,7.20,'2007-05-22'),(105,10078,3,8.50,'2007-05-18'),(105,10098,3,8.50,'2007-05-18'),(105,10098,6,8.50,'2007-05-19');
/*!40000 ALTER TABLE `hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `TRANSACTION_NO` decimal(10,0) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL,
  `SALE_DATE` date NOT NULL,
  PRIMARY KEY (`TRANSACTION_NO`),
  KEY `PARK_CODE` (`PARK_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (12781,'FR1001','2007-05-18'),(12782,'FR1001','2007-05-18'),(12783,'FR1001','2007-05-18'),(12784,'FR1001','2007-05-18'),(12785,'FR1001','2007-05-18'),(12786,'FR1001','2007-05-18'),(34534,'UK3452','2007-05-18'),(34535,'UK3452','2007-05-18'),(34536,'UK3452','2007-05-18'),(34537,'UK3452','2007-05-18'),(34538,'UK3452','2007-05-18'),(34539,'UK3452','2007-05-18'),(34540,'UK3452','2007-05-18'),(34541,'UK3452','2007-05-18'),(67589,'ZA1342','2007-05-18'),(67590,'ZA1342','2007-05-18'),(67591,'ZA1342','2007-05-18'),(67592,'ZA1342','2007-05-18'),(67593,'ZA1342','2007-05-18');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_line`
--

DROP TABLE IF EXISTS `sales_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_line` (
  `TRANSACTION_NO` decimal(10,0) NOT NULL,
  `LINE_NO` decimal(2,0) NOT NULL,
  `TICKET_NO` decimal(10,0) NOT NULL,
  `LINE_QTY` decimal(4,0) NOT NULL DEFAULT '0',
  `LINE_PRICE` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`TRANSACTION_NO`,`LINE_NO`),
  KEY `TRANSACTION_NO` (`TRANSACTION_NO`),
  KEY `TICKET_NO` (`TICKET_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_line`
--

LOCK TABLES `sales_line` WRITE;
/*!40000 ALTER TABLE `sales_line` DISABLE KEYS */;
INSERT INTO `sales_line` VALUES (12781,1,13002,2,69.98),(12781,2,13001,1,14.99),(12782,1,13002,2,69.98),(12783,1,13003,2,41.98),(12784,2,13001,1,14.99),(12785,1,13001,1,14.99),(12785,2,13002,1,34.99),(12785,3,13002,4,139.96),(34534,1,88568,4,168.40),(34534,2,88567,1,22.50),(34534,3,89720,2,21.98),(34535,1,88568,2,84.20),(34536,1,89720,2,21.98),(34537,1,88568,2,84.20),(34537,2,88567,1,22.50),(34538,1,89720,2,21.98),(34539,1,89720,2,21.98),(34539,2,88568,2,84.20),(34540,1,88568,4,168.40),(34540,2,88567,1,22.50),(34540,3,89720,2,21.98),(34541,1,88568,2,84.20),(67589,1,67833,2,57.34),(67589,2,67832,2,37.12),(67590,1,67833,2,57.34),(67590,2,67832,2,37.12),(67591,1,67832,1,18.56),(67591,2,67855,1,12.12),(67592,1,67833,4,114.68),(67593,1,67833,2,57.34),(67593,2,67832,2,37.12);
/*!40000 ALTER TABLE `sales_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themepark`
--

DROP TABLE IF EXISTS `themepark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themepark` (
  `PARK_CODE` varchar(10) NOT NULL,
  `PARK_NAME` varchar(35) NOT NULL,
  `PARK_CITY` varchar(50) DEFAULT NULL,
  `PARK_COUNTRY` char(2) NOT NULL,
  PRIMARY KEY (`PARK_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themepark`
--

LOCK TABLES `themepark` WRITE;
/*!40000 ALTER TABLE `themepark` DISABLE KEYS */;
INSERT INTO `themepark` VALUES ('FR1001','FairyLand','PARIS','FR'),('NL1202','Efling','NOORD','NL'),('SP4533','AdventurePort','BARCELONA','SP'),('SW2323','Labyrinthe','LAUSANNE','SW'),('UK2622','MiniLand','WINDSOR','UK'),('UK3452','PleasureLand','STOKE','UK'),('ZA1342','GoldTown','JOHANNESBURG','ZA');
/*!40000 ALTER TABLE `themepark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TICKET_NO` decimal(10,0) NOT NULL,
  `TICKET_PRICE` decimal(4,2) NOT NULL DEFAULT '0.00',
  `TICKET_TYPE` varchar(10) DEFAULT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TICKET_NO`),
  KEY `PARK_CODE` (`PARK_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (11001,24.99,'Adult','SP4533'),(11002,14.99,'Child','SP4533'),(11003,10.99,'Senior','SP4533'),(13001,18.99,'Child','FR1001'),(13002,34.99,'Adult','FR1001'),(13003,20.99,'Senior','FR1001'),(67832,18.56,'Child','ZA1342'),(67833,28.67,'Adult','ZA1342'),(67855,12.12,'Senior','ZA1342'),(88567,22.50,'Child','UK3452'),(88568,42.10,'Adult','UK3452'),(89720,10.99,'Senior','UK3452');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12 23:47:16

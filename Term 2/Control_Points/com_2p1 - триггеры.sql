-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: teacher
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `com_billing`
--

DROP TABLE IF EXISTS `com_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_billing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `call_id` int(10) unsigned NOT NULL,
  `cost_minute` float NOT NULL,
  `cost_call` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_billing`
--

LOCK TABLES `com_billing` WRITE;
/*!40000 ALTER TABLE `com_billing` DISABLE KEYS */;
INSERT INTO `com_billing` VALUES (1,1,1.87,3.74),(2,7,1.87,9.35);
/*!40000 ALTER TABLE `com_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_call`
--

DROP TABLE IF EXISTS `com_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_call` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `client_phone` varchar(13) NOT NULL COMMENT 'номер клиента компании',
  `abonent_phone` varchar(13) NOT NULL COMMENT 'номер абонента',
  `dt` datetime NOT NULL COMMENT 'время начала звонка',
  `call_long` float NOT NULL COMMENT 'продолжительность звонка в секундах',
  `call_type` enum('in','out') NOT NULL COMMENT 'тип звонка: in - входящий, out - исходящий',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_call`
--

LOCK TABLES `com_call` WRITE;
/*!40000 ALTER TABLE `com_call` DISABLE KEYS */;
INSERT INTO `com_call` VALUES (1,1,'+74958761239','+79256347895','2022-02-12 10:36:01',98.43,'out'),(2,1,'+74958761239','+74995628796','2022-02-12 13:01:19',149.32,'in'),(7,2,'+74991278563','+79165548947','2022-02-12 17:40:21',287.29,'out');
/*!40000 ALTER TABLE `com_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_client`
--

DROP TABLE IF EXISTS `com_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Наименование клиента',
  `money` float NOT NULL COMMENT 'Деньги на счету клиента',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_client`
--

LOCK TABLES `com_client` WRITE;
/*!40000 ALTER TABLE `com_client` DISABLE KEYS */;
INSERT INTO `com_client` VALUES (1,'ООО \"Парус\"',134.75),(2,'ООО \"Будущее уже тут\"',1.66);
/*!40000 ALTER TABLE `com_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_price`
--

DROP TABLE IF EXISTS `com_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_from` datetime NOT NULL COMMENT 'Дата и время начала действия тарифа',
  `dt_till` datetime DEFAULT NULL COMMENT 'Дата и время окончания действия тарифа. Если NULL - действует по настоящее время',
  `code` varchar(3) DEFAULT NULL,
  `code_cost` float NOT NULL COMMENT 'Стоимость минуты',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_price`
--

LOCK TABLES `com_price` WRITE;
/*!40000 ALTER TABLE `com_price` DISABLE KEYS */;
INSERT INTO `com_price` VALUES (1,'2020-01-11 00:00:00','2020-12-31 23:59:59','495',1.34),(2,'2021-01-11 00:00:00','2021-12-31 23:59:59','495',1.65),(3,'2022-01-11 00:00:00',NULL,'495',1.87),(4,'2022-01-11 00:00:00',NULL,'499',1.67),(5,'2022-01-11 00:00:00',NULL,NULL,3.45);
/*!40000 ALTER TABLE `com_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 17:26:14

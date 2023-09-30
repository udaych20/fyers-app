-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: algo1
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `banknifty_backtest`
--

DROP TABLE IF EXISTS `banknifty_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banknifty_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `instrument_token` int DEFAULT NULL,
  `last_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banknifty_data`
--

LOCK TABLES `banknifty_data` WRITE;
/*!40000 ALTER TABLE `banknifty_data` DISABLE KEYS */;
INSERT INTO `banknifty_data` VALUES (1,'2023-08-12 13:56:52',8963586,44477);
/*!40000 ALTER TABLE `banknifty_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo` (
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo`
--

LOCK TABLES `demo` WRITE;
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
INSERT INTO `demo` VALUES ('test'),('test'),('sdafsdf'),('sdafsdf'),('sdafsdf'),('sdafsdf'),('sdafsdf'),('sdafsdf');
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fyers_config`
--

DROP TABLE IF EXISTS `fyers_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fyers_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_name` varchar(300) NOT NULL,
  `value_name` varchar(1000) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fyers_config`
--

LOCK TABLES `fyers_config` WRITE;
/*!40000 ALTER TABLE `fyers_config` DISABLE KEYS */;
INSERT INTO `fyers_config` VALUES (1,'redirect_uri','http://127.0.0.1:8080',1,NULL),(2,'mobile-no','21344',1,NULL),(3,'totp-token','sgasf',1,NULL),(4,'grant_type','authorization_code',1,NULL),(5,'response_type','code',1,NULL),(6,'state','sample',1,NULL),(7,'client_id','R02BT8FHNE-100',1,NULL),(8,'secret_key','sdf',1,NULL),(9,'app_id_hash','sdfsaf',1,NULL),(10,'pin','1234',1,'2023-09-20 04:03:43'),(13,'client_id','770sadf77CssZH-100',1,NULL),(54,'symbols','NSE:NIFTY23SEPFUT',1,NULL),(55,'auth_code','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ssdfnMuaW4iLCJpYXQiOjE2OTU5NDY0OTIsImV4cCI6MTY5NTk3NjQ5MsdfxNjk1OTQ1ODkyLCJhdWQiOlsieDowIiwieDoxIiwieDoyIiwieDoxIiwieDowIl0sInN1YiI6ImF1dGhfY29kZSIsImRpc3BsYXlfbmFtZSI6IkRDMDAzNjgiLCJvbXMiOiJLMSIsImhzbV9rZXkiOm51bGwsIm5vbmNlIjoiIiwiYXBwX2lkIjoiUjAyQlQ4RkhORSIsInV1aWQiOiI3ZTEyMzY5ZTAyNzg0ZmExOGY1YTgwZjZiNTMxM2IwMCIsImlwQWRkciI6IjI0MDE6NDkwMDoxY2I1OjQwNGQ6ZWMzYzplMmIzOjcyMzc6NzAyZiwgMTcyLjY4LjE1NS4xMzAiLCJzY29wZSI6IiJ9.KUoXRmbznvIwb96LFKuA7ecmT2Ccm3ZQIvqFvPN-AII',1,'2023-09-29 05:44:54'),(56,'access_token','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.sadffGkuZnllcnMuaW4iLCJpYXQiOjE2OTYwNTIwOTgsImV4cCI6MTY5NjEyMDI1OCwibmJmIjoxNjk2MDUyMDk4LCJhdWQiOlsieDowIiwieDoxIiwieDoyIiwieDoxIiwieDowIl0sInN1YiI6ImFjY2Vzc190b2tlbiIsImF0X2hhc2giOiJnQUFBQUFCbEY3T0N5LXd5cm8tc0xYYnRRYjhreU9tQ0NTTmJfNXRxdnVHUWlwdzFBN2NvaGdtNTFzbEhZR2t4MzdYal9KVFJ0NXpJM0xndHFaNUxoVmVwUUNoa3ZtOWVDaVV0NEV6S0NsVFlEYXlqbFdaUWdUST0iLCJkaXNwbGF5X25hbWUiOiJDSElOVEFMQSBVREFZIEtVTUFSIiwib21zIjoiSzEiLCJoc21fa2V5IjpudWxsLCJmeV9pZCI6IkRDMDAzNjgiLCJhcHBUeXBlIjoxMDAsInBvYV9mbGFnIjoiTiJ9.6yGdY_j3Kdr3BYDupg_70Mz6e91vLwq-SCH42ShkCqE',1,'2023-09-30 11:04:58'),(59,'refresh_token','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.sadffZnllcnMuaW4iLCJpYXQiOjE2OTU5NDY1MDIsImV4cCI6MTY5NzI0MzQwMiwibmJmIjoxNjk1OTQ2NTAyLCJhdWQiOlsieDowIiwieDoxIiwieDoyIiwieDoxIiwieDowIl0sInN1YiI6InJlZnJlc2hfdG9rZW4iLCJhdF9oYXNoIjoiZ0FBQUFBQmxGaGNHTmJDMEhoSDdkenRwS2JPdThiWUhuaWh0eUZSMVpXbzRFZjBydDM1SDRTU3Y5dlRGNnZlQmVhdGFJUkJWMVgyeXFfMU1ULVRiWWwtU0ttUF93djFxN0lBdVc5MnRVbm1RMTIxOVotbUh4UUE9IiwiZGlzcGxheV9uYW1lIjoiQ0hJTlRBTEEgVURBWSBLVU1BUiIsIm9tcyI6IksxIiwiaHNtX2tleSI6bnVsbCwiZnlfaWQiOiJEQzAwMzY4IiwiYXBwVHlwZSI6MTAwLCJwb2FfZmxhZyI6Ik4ifQ.D6Jg7es05U86MZtIF28ZZd-B1sly4LZetiU1CpqVnHk',1,'2023-09-29 05:45:02'),(60,'login','success',1,'2023-09-29 05:45:02');
/*!40000 ALTER TABLE `fyers_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_expiries`
--

DROP TABLE IF EXISTS `index_expiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_expiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) NOT NULL,
  `expiry_date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_expiries`
--

LOCK TABLES `index_expiries` WRITE;
/*!40000 ALTER TABLE `index_expiries` DISABLE KEYS */;
INSERT INTO `index_expiries` VALUES (1,'BANKNIFTY','04-10-2023'),(2,'BANKNIFTY','11-10-2023'),(3,'BANKNIFTY','18-10-2023'),(4,'BANKNIFTY','26-10-2023'),(5,'NIFTY50','05-10-2023'),(6,'NIFTY50','12-10-2023'),(7,'NIFTY50','19-10-2023'),(8,'NIFTY50','26-10-2023'),(9,'FINNIFTY','03-10-2023'),(10,'FINNIFTY','10-10-2023'),(11,'FINNIFTY','17-10-2023'),(12,'FINNIFTY','23-10-2023'),(13,'FINNIFTY','31-10-2023');
/*!40000 ALTER TABLE `index_expiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `signal_id` int NOT NULL,
  `order_time` datetime NOT NULL,
  `buy_sl` decimal(10,2) DEFAULT NULL,
  `target` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_data`
--

DROP TABLE IF EXISTS `stock_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(200) DEFAULT NULL,
  `exch_feed_time` datetime NOT NULL,
  `ltp` decimal(10,2) NOT NULL,
  `day_high` decimal(10,2) NOT NULL,
  `day_low` decimal(10,2) NOT NULL,
  `day_open` decimal(10,2) NOT NULL,
  `prev_close_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_data`
--

LOCK TABLES `stock_data` WRITE;
/*!40000 ALTER TABLE `stock_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_resp`
--

DROP TABLE IF EXISTS `stock_resp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_resp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_resp`
--

LOCK TABLES `stock_resp` WRITE;
/*!40000 ALTER TABLE `stock_resp` DISABLE KEYS */;
INSERT INTO `stock_resp` VALUES (1,'Test');
/*!40000 ALTER TABLE `stock_resp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_data`
--

DROP TABLE IF EXISTS `trade_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_data` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `signal_time` datetime NOT NULL,
  `entry_price` decimal(10,2) NOT NULL,
  `stop_loss` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `is_price_retraced` tinyint(1) NOT NULL,
  `are_we_catched_entry` tinyint(1) NOT NULL,
  `profit_loss` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_data`
--

LOCK TABLES `trade_data` WRITE;
/*!40000 ALTER TABLE `trade_data` DISABLE KEYS */;
INSERT INTO `trade_data` VALUES (1,'SHREECEM','2023-08-12 22:35:49',24119.70,24055.00,15,0,0,NULL),(2,'PIDILITIND','2023-08-12 22:35:52',2544.35,2535.00,15,0,0,NULL),(3,'GODREJCP','2023-08-12 22:35:53',1020.80,1018.00,15,0,0,NULL),(4,'BOSCHLTD','2023-08-12 22:35:54',18145.20,18124.00,15,0,0,NULL),(5,'ABFRL','2023-08-12 22:36:04',211.30,208.00,15,0,0,NULL),(6,'PHOENIXLTD','2023-08-14 19:43:52',1716.40,1710.00,15,0,0,NULL),(7,'JSWENERGY','2023-08-14 19:43:54',349.40,342.00,15,0,0,NULL),(8,'AAVAS','2023-08-14 19:43:59',1602.25,1598.00,15,0,0,NULL),(9,'PHOENIXLTD','2023-08-14 20:38:18',1716.40,1710.00,15,0,0,NULL),(10,'JSWENERGY','2023-08-14 20:38:21',349.40,342.00,15,0,0,NULL),(11,'AAVAS','2023-08-14 20:38:26',1602.25,1598.00,15,0,0,NULL);
/*!40000 ALTER TABLE `trade_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_signals`
--

DROP TABLE IF EXISTS `trade_signals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_signals` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `signal_time` datetime NOT NULL,
  `entry` decimal(10,2) NOT NULL,
  `stop_loss` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `profit_loss` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_signals`
--

LOCK TABLES `trade_signals` WRITE;
/*!40000 ALTER TABLE `trade_signals` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_signals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-30 11:05:37

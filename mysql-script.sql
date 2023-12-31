CREATE DATABASE  IF NOT EXISTS `algo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `algo`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: algo
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
INSERT INTO `fyers_config` VALUES (1,'redirect_uri','http://127.0.0.1:8080',1,NULL),(2,'mobile-no','7123456789',1,NULL),(3,'totp-token','test',1,NULL),(4,'grant_type','authorization_code',1,NULL),(5,'response_type','code',1,NULL),(6,'state','sample',1,NULL),(7,'client_id','77077CP4ZH-99',1,NULL),(8,'secret_key','2C2NJB80IGH',1,NULL),(9,'app_id_hash','a2b78abaa073a4c84d13177093d950c476c466608505158897568a5d13b6c1716467',1,NULL),(10,'pin','1234',1,'2023-09-20 04:03:43'),(13,'client_id','7707GUP4ZH-99',1,NULL),(54,'symbols','NSE:NIFTY23SEPFUT',1,NULL),(55,'auth_code','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkubG9naW4uZnllcnMuaW4iLCJpYXQiOjE2OTUxNjQzMDYsImV4cCI6MTY5NTE5NDMwNiwibmJmIjoxNjk1MTYzNzA2LCJhdWQiOiJbXCJ4OjBcIiwgXCJkOjFcIiwgXCJkOjJcIl0iLCJzdWIiOiJhdXRoX2NvZGUiLCJkaXNwbGF5X25hbWUiOiJYUjQzNzgxIiwib21zIjoiSzEiLCJoc21fa2V5IjoiMWY1OTFlM2JlNjViMDgxYzg1YTZkODBmYjBiNmExZWZlZmE2YjA2M2QxNzZkNWJhNjk3NWZlZTgiLCJub25jZSI6IiIsImFwcsdfsgfF9pZCI6Ijc3MDc3Q1A0WkgiLCJ1dWlkIjoiODA3ZWExNGFlYTM5NDY3ZTlhNjZlNzNmMzM2NDE0ZWUiLCJpcEFkZHIiOiIwLjAuMC4wIiwic2NvcGUiOiIifQ.SuYKjhbdeYJWfujgGVd4kIYk6XxFhpSarg8P1rKP7BY',1,'2023-09-20 04:28:34'),(56,'access_token','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuZnllcnMuaW4iLCJpYXQiOjE2OTUxNjQzNDEsImV4cCI6MTY5NTE2OTgwMSwibmJmIjoxNjk1MTY0MzQxLCJhdWQiOlsieDowIiwiZDoxIiwiZDoyIl0sInN1YiI6ImFjY2Vzc190b2tlbiIsImF0X2hhc2giOiJnQUFBQUFCbENpZTEwN2lYcDlFV0NvcG1HWU1jWjE1ZGZhblFIQkhSVkpUUTM5dlcyVF9VU3JHZjA1ZEczOS1OUVB0X01DY0FwdWVYRmlYd3NiSERwT1RkN1FnMGtJdTYyM3BnYWJOSkZYRWYxZC1fa3RVRGNSaz0iLCJkaXNwbGF5X25hbWUiOiJST0pBIENISU5UQUxBIiwib21zIjoiSzEiLCJoc21fa2V5IjoiMWY1OTFlM2JlNjViMDgxYzg1YTZkODBmYjBiNmExZWZlZmE2YjA2M2QxNzZkNWJhNjk3NWZlZTgiLCJmeV9pZCI6IlhSNDM3ODEiLCJhcHBUeXBlIjoxMDAsInsdBvYV9mbGFnIjoiTiJ9.ZhAET-YTf1XsasfddsfDOst8jrO8O8Jk7KCuJa9cZLNUy21yiJU',1,'2023-09-20 04:29:02'),(59,'refresh_token','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuZnllcnMuaW4iLCJpYXQiOjE2OTUxNjQzMTgsImV4cCI6MTY5NjM3OTQzOCwibmJmIjoxNjk1MTY0MzE4LCJhdWQiOlsieDowIiwiZDoxIiwiZDoyIl0sInN1YiI6InJlZnJlc2hfdG9rZW4iLCJhdF9oYXNoIjoiZ0FBQUFBQmxDaWVlaEFDQm1Pd1N4QkJYa3lZRmR2Q1QycTZCUnZPQkl0U3RGcDQ1cjRvb0R4bTVxcHpKRXRjcUhCbUlQV21SNl9GcTFtTHdKc0lBYm9ITDFHV2xnRVNKRWhnNVJZOG1jUFpXSFY2M2RyclBJSmM9IiwiZGlzcGxheV9uYW1lIjoiUk9KQSBDSElOVEFMQSIsIm9tcyI6IksxIiwiaHNtX2tleSI6IjFmNTkxZTNiZTY1YjA4MWM4NWE2ZDgwZmIwYjZhMWVmZWZhNmIwNjNkMTc2ZDViYTY5NzVmZWU4IiwiZnlfaWQiOiJYUjQzNzgxIiwiYXBwVHlwZSI6MTAwLCJwb2FfZmxhZyI6Ik4ifQ.99LjuDYNV5Mu_U_xTn1fiM-sdfasdfsdfs',1,'2023-09-20 04:28:39'),(60,'login','failed',1,'2023-09-20 04:28:39');
/*!40000 ALTER TABLE `fyers_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-20  4:47:19

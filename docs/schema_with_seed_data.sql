-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: homeevents
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  `activity_result_id` int(11) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_result_id_idx` (`activity_result_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (4,'Magic the Gathering - Commander','A game of commander. No banlist, proxies okay',6,NULL),(5,'Go First Dice Roll','Highest roll goes 1st!',5,NULL),(6,'Go First Dice Re-Roll','Ties are broken here',5,NULL),(7,'Mulligan','Count of mulligans taken',7,NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object`
--

DROP TABLE IF EXISTS `activity_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_type_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_object_type_id_idx` (`activity_object_type_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object`
--

LOCK TABLES `activity_object` WRITE;
/*!40000 ALTER TABLE `activity_object` DISABLE KEYS */;
INSERT INTO `activity_object` VALUES (1,1,'Tergrid, God of Fright',NULL),(2,1,'Oloro, Ageless Ascetic',NULL),(3,1,'Anowon, the Ruin Thief',NULL),(4,1,'Korvold, Fae-Cursed King',NULL),(5,1,'Zhulodok, Void Gorger',NULL),(6,1,'Xenagos, God of Revels',NULL),(7,1,'Edgar Markov',NULL),(8,1,'Hylda of the Icy Crown',NULL),(9,1,'Elenda, the Dusk Rose',NULL),(10,1,'Kaalia of the Vast',NULL),(11,1,'Eriette of the Charmed Apple',NULL),(12,1,'Shaleeli, The Gifted',NULL),(13,1,'Prosper, Tomb Bound',NULL),(14,1,'Mondrak, Glory Dominus',NULL),(18,1,'Krenko, Mob Boss',NULL);
/*!40000 ALTER TABLE `activity_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_property`
--

DROP TABLE IF EXISTS `activity_object_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `value` varchar(90) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_object_id_idx` (`activity_object_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_property`
--

LOCK TABLES `activity_object_property` WRITE;
/*!40000 ALTER TABLE `activity_object_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_object_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_type`
--

DROP TABLE IF EXISTS `activity_object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id_idx` (`activity_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_type`
--

LOCK TABLES `activity_object_type` WRITE;
/*!40000 ALTER TABLE `activity_object_type` DISABLE KEYS */;
INSERT INTO `activity_object_type` VALUES (1,4,'Commander Deck',NULL);
/*!40000 ALTER TABLE `activity_object_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_result`
--

DROP TABLE IF EXISTS `activity_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `highest_wins` tinyint(4) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_result`
--

LOCK TABLES `activity_result` WRITE;
/*!40000 ALTER TABLE `activity_result` DISABLE KEYS */;
INSERT INTO `activity_result` VALUES (5,'D20 Result',1,NULL),(6,'Placement',0,NULL),(7,'Mulligan Count',0,NULL);
/*!40000 ALTER TABLE `activity_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('allowed_blank_tables','a:19:{i:0;s:8:\"activity\";i:1;s:15:\"activity_object\";i:2;s:24:\"activity_object_property\";i:3;s:20:\"activity_object_type\";i:4;s:15:\"activity_result\";i:7;s:5:\"event\";i:8;s:16:\"event_activities\";i:9;s:24:\"event_activities_results\";i:10;s:32:\"event_activities_results_objects\";i:11;s:11:\"event_users\";i:13;s:6:\"groups\";i:16;s:11:\"leaderboard\";i:17;s:8:\"location\";i:19;s:5:\"notes\";i:21;s:5:\"roles\";i:22;s:12:\"roles_groups\";i:24;s:5:\"users\";i:25;s:12:\"users_groups\";i:26;s:11:\"users_roles\";}',1730789755),('column_listing_activity','a:5:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";i:3;s:18:\"activity_result_id\";i:4;s:9:\"groups_id\";}',1730790122),('column_listing_activity_object','a:4:{i:0;s:2:\"id\";i:1;s:23:\"activity_object_type_id\";i:2;s:4:\"name\";i:3;s:9:\"groups_id\";}',1730790230),('column_listing_activity_result','a:4:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:12:\"highest_wins\";i:3;s:9:\"groups_id\";}',1730784197),('column_listing_event','a:5:{i:0;s:2:\"id\";i:1;s:11:\"location_id\";i:2;s:4:\"date\";i:3;s:5:\"title\";i:4;s:9:\"groups_id\";}',1730789981),('column_listing_event_activities','a:5:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:8:\"event_id\";i:3;s:11:\"activity_id\";i:4;s:9:\"groups_id\";}',1730790230),('column_listing_event_activities_results','a:5:{i:0;s:2:\"id\";i:1;s:19:\"event_activities_id\";i:2;s:8:\"users_id\";i:3;s:12:\"result_value\";i:4;s:9:\"groups_id\";}',1730790230),('column_listing_event_activities_results_objects','a:4:{i:0;s:2:\"id\";i:1;s:27:\"event_activities_results_id\";i:2;s:18:\"activity_object_id\";i:3;s:9:\"groups_id\";}',1730790230),('column_listing_event_users','a:4:{i:0;s:2:\"id\";i:1;s:8:\"event_id\";i:2;s:8:\"users_id\";i:3;s:9:\"groups_id\";}',1730790230),('column_listing_groups','a:3:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";}',1730789756),('column_listing_leaderboard','a:10:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";i:3;s:11:\"activity_id\";i:4;s:12:\"sql_function\";i:5;s:9:\"sort_type\";i:6;s:12:\"target_value\";i:7;s:15:\"total_positions\";i:8;s:15:\"minimum_results\";i:9;s:9:\"groups_id\";}',1730789981),('column_listing_location','a:4:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:7:\"address\";i:3;s:9:\"groups_id\";}',1730790076),('column_listing_roles','a:4:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";i:3;s:9:\"groups_id\";}',1730790235),('column_listing_roles_groups','a:4:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";i:3;s:9:\"groups_id\";}',1730790076),('column_listing_users','a:8:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:5:\"email\";i:3;s:17:\"email_verified_at\";i:4;s:8:\"password\";i:5;s:14:\"remember_token\";i:6;s:10:\"created_at\";i:7;s:10:\"updated_at\";}',1730790076),('column_listing_users_groups','a:4:{i:0;s:2:\"id\";i:1;s:9:\"groups_id\";i:2;s:8:\"users_id\";i:3;s:15:\"roles_groups_id\";}',1730789981),('column_listing_users_roles','a:3:{i:0;s:2:\"id\";i:1;s:8:\"roles_id\";i:2;s:8:\"users_id\";}',1730789756),('schema_data_leaderboard','a:10:{i:0;a:9:{s:4:\"name\";s:2:\"id\";s:9:\"type_name\";s:3:\"int\";s:4:\"type\";s:7:\"int(11)\";s:9:\"collation\";N;s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;s:7:\"comment\";N;s:10:\"generation\";N;}i:1;a:9:{s:4:\"name\";s:4:\"name\";s:9:\"type_name\";s:7:\"varchar\";s:4:\"type\";s:11:\"varchar(90)\";s:9:\"collation\";s:17:\"latin1_swedish_ci\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:2;a:9:{s:4:\"name\";s:11:\"description\";s:9:\"type_name\";s:10:\"mediumtext\";s:4:\"type\";s:10:\"mediumtext\";s:9:\"collation\";s:17:\"latin1_swedish_ci\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:3;a:9:{s:4:\"name\";s:11:\"activity_id\";s:9:\"type_name\";s:3:\"int\";s:4:\"type\";s:7:\"int(11)\";s:9:\"collation\";N;s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:4;a:9:{s:4:\"name\";s:12:\"sql_function\";s:9:\"type_name\";s:7:\"varchar\";s:4:\"type\";s:11:\"varchar(90)\";s:9:\"collation\";s:17:\"latin1_swedish_ci\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:5;a:9:{s:4:\"name\";s:9:\"sort_type\";s:9:\"type_name\";s:7:\"varchar\";s:4:\"type\";s:11:\"varchar(90)\";s:9:\"collation\";s:17:\"latin1_swedish_ci\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:6;a:9:{s:4:\"name\";s:12:\"target_value\";s:9:\"type_name\";s:7:\"varchar\";s:4:\"type\";s:11:\"varchar(45)\";s:9:\"collation\";s:17:\"latin1_swedish_ci\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:7;a:9:{s:4:\"name\";s:15:\"total_positions\";s:9:\"type_name\";s:3:\"int\";s:4:\"type\";s:6:\"int(4)\";s:9:\"collation\";N;s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:8;a:9:{s:4:\"name\";s:15:\"minimum_results\";s:9:\"type_name\";s:3:\"int\";s:4:\"type\";s:6:\"int(4)\";s:9:\"collation\";N;s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}i:9;a:9:{s:4:\"name\";s:9:\"groups_id\";s:9:\"type_name\";s:3:\"int\";s:4:\"type\";s:7:\"int(11)\";s:9:\"collation\";N;s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";N;s:10:\"generation\";N;}}',1730785949);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `title` varchar(90) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_idx` (`location_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6,3,'2024-08-11 00:00:00','3 player commander',1),(14,4,'2024-09-29 00:00:00','3 player commander',1),(13,3,'2024-09-15 00:00:00','3 player commander',1),(12,3,'2024-09-01 00:00:00','3 player commander',1),(11,3,'2024-08-18 00:00:00','3 player commander',1),(15,3,'2024-10-13 00:00:00','3 player commander',1),(16,3,'2024-10-19 00:00:00','3 player commander',1),(19,3,'2024-10-26 00:00:00','3 player commander',1);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities`
--

DROP TABLE IF EXISTS `event_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_idx` (`event_id`),
  KEY `activity_id_idx` (`activity_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities`
--

LOCK TABLES `event_activities` WRITE;
/*!40000 ALTER TABLE `event_activities` DISABLE KEYS */;
INSERT INTO `event_activities` VALUES (8,'Game 1',6,5,1),(9,'Game 1',6,7,1),(10,'Game 1',6,4,1),(11,'Game 2',6,5,1),(12,'Game 2',6,7,1),(13,'Game 2',6,4,1),(14,'Game 3',6,5,1),(15,'Game 3',6,7,1),(16,'Game 3',6,4,1),(17,'Game 1',11,5,1),(18,'Game 1',11,7,1),(19,'Game 1',11,4,1),(20,'Game 2',11,5,1),(21,'Game 2',11,7,1),(22,'Game 2',11,4,1),(23,'Game 3',11,5,1),(24,'Game 3',11,6,1),(25,'Game 3',11,7,1),(26,'Game 3',11,4,1),(27,'Game 4',11,5,1),(28,'Game 4',11,7,1),(29,'Game 4',11,4,1),(30,'Game 1',12,5,1),(31,'Game 1',12,7,1),(32,'Game 1',12,4,1),(33,'Game 2',12,5,1),(34,'Game 2',12,7,1),(35,'Game 2',12,4,1),(36,'Game 3',12,5,1),(37,'Game 3',12,7,1),(38,'Game 3',12,4,1),(39,'Game 1',13,5,1),(40,'Game 1',13,7,1),(41,'Game 1',13,4,1),(42,'Game 2',13,5,1),(43,'Game 2',13,7,1),(44,'Game 2',13,4,1),(45,'Game 3',13,5,1),(46,'Game 3',13,6,1),(47,'Game 3',13,7,1),(48,'Game 3',13,4,1),(49,'Game 4',13,5,1),(50,'Game 4',13,7,1),(51,'Game 4',13,4,1),(52,'Game 1',14,5,1),(53,'Game 1',14,7,1),(54,'Game 1',14,4,1),(55,'Game 2',14,5,1),(56,'Game 2',14,7,1),(57,'Game 2',14,4,1),(58,'Game 3',14,5,1),(59,'Game 3',14,7,1),(60,'Game 3',14,4,1),(61,'Game 1',15,5,1),(62,'Game 1',15,7,1),(63,'Game 1',15,4,1),(64,'Game 2',15,5,1),(65,'Game 2',15,7,1),(66,'Game 2',15,4,1),(67,'Game 3',15,5,1),(68,'Game 3',15,7,1),(69,'Game 3',15,4,1),(70,'Game 1',16,5,1),(71,'Game 1',16,4,1),(72,'Game 2',16,5,1),(73,'Game 2',16,7,1),(74,'Game 2',16,4,1),(75,'Game 3',16,5,1),(76,'Game 3',16,7,1),(77,'Game 3',16,4,1),(78,'Game 4',16,5,1),(79,'Game 4',16,7,1),(80,'Game 4',16,4,1),(85,'Game 1',19,5,1),(86,'Game 1',19,7,1),(87,'Game 1',19,4,1),(88,'Game 2',19,5,1),(89,'Game 2',19,6,1),(90,'Game 2',19,7,1),(91,'Game 2',19,4,1),(92,'Game 3',19,5,1),(93,'Game 3',19,6,1),(94,'Game 3',19,7,1),(95,'Game 3',19,4,1),(96,'Game 4',19,5,1),(97,'Game 4',19,4,1),(98,'Game 5',19,5,1),(99,'Game 5',19,7,1),(100,'Game 5',19,4,1);
/*!40000 ALTER TABLE `event_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities_results`
--

DROP TABLE IF EXISTS `event_activities_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_activities_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `result_value` varchar(45) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_activities_id_idx` (`event_activities_id`),
  KEY `user_id_idx` (`users_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results`
--

LOCK TABLES `event_activities_results` WRITE;
/*!40000 ALTER TABLE `event_activities_results` DISABLE KEYS */;
INSERT INTO `event_activities_results` VALUES (31,8,9,'17',1),(32,8,10,'20',1),(33,8,11,'5',1),(34,9,9,'1',1),(35,10,9,'1',1),(36,10,10,'2',1),(37,10,11,'3',1),(38,11,9,'10',1),(39,11,10,'7',1),(40,11,11,'14',1),(41,12,10,'1',1),(42,13,9,'2',1),(43,13,10,'1',1),(44,13,11,'2',1),(45,14,9,'5',1),(46,14,10,'15',1),(47,14,11,'16',1),(48,16,9,'3',1),(49,16,10,'1',1),(50,16,11,'2',1),(51,17,9,'6',1),(52,17,10,'16',1),(53,17,11,'4',1),(54,18,9,'1',1),(55,18,10,'2',1),(56,18,11,'2',1),(57,19,9,'1',1),(58,19,10,'3',1),(59,19,11,'2',1),(60,20,9,'20',1),(61,20,10,'9',1),(62,20,11,'14',1),(63,21,9,'1',1),(64,22,9,'1',1),(65,22,10,'3',1),(66,22,11,'2',1),(67,23,9,'10',1),(68,23,10,'10',1),(69,23,11,'3',1),(70,24,9,'4',1),(71,24,10,'19',1),(72,25,9,'1',1),(73,26,9,'3',1),(74,26,10,'2',1),(75,26,11,'1',1),(76,27,9,'8',1),(77,27,10,'2',1),(78,27,11,'7',1),(79,28,9,'1',1),(80,29,9,'1',1),(81,29,10,'2',1),(82,29,11,'3',1),(83,30,9,'11',1),(84,30,10,'19',1),(85,30,11,'9',1),(86,31,11,'1',1),(87,32,9,'1',1),(88,32,10,'3',1),(89,32,11,'2',1),(90,33,9,'19',1),(91,33,10,'14',1),(92,33,11,'17',1),(93,34,9,'1',1),(94,34,10,'1',1),(95,35,9,'1',1),(96,35,10,'2',1),(97,35,11,'3',1),(98,36,9,'14',1),(99,36,10,'3',1),(100,36,11,'18',1),(101,37,11,'1',1),(102,38,9,'3',1),(103,38,10,'2',1),(104,38,11,'1',1),(105,39,9,'16',1),(106,39,10,'17',1),(107,39,11,'5',1),(108,40,9,'2',1),(109,41,9,'1',1),(110,41,10,'2',1),(111,41,11,'3',1),(112,42,9,'7',1),(113,42,10,'1',1),(114,42,11,'6',1),(115,43,11,'2',1),(116,44,9,'1',1),(117,44,10,'2',1),(118,44,11,'3',1),(119,45,9,'6',1),(120,45,10,'12',1),(121,45,11,'12',1),(122,46,10,'12',1),(123,46,11,'7',1),(124,47,9,'1',1),(125,47,11,'1',1),(126,48,9,'3',1),(127,48,10,'1',1),(128,48,11,'2',1),(129,49,9,'1',1),(130,49,10,'6',1),(131,49,11,'20',1),(132,50,9,'1',1),(133,50,11,'1',1),(134,51,9,'3',1),(135,51,10,'2',1),(136,51,11,'1',1),(137,52,12,'3',1),(138,52,10,'19',1),(139,52,11,'4',1),(140,53,12,'1',1),(141,54,12,'3',1),(142,54,10,'1',1),(143,54,11,'2',1),(144,55,12,'10',1),(145,55,10,'12',1),(146,55,11,'11',1),(147,56,12,'1',1),(148,56,10,'1',1),(149,56,11,'1',1),(150,57,12,'2',1),(151,57,10,'1',1),(152,57,11,'3',1),(153,58,12,'19',1),(154,58,10,'13',1),(155,58,11,'4',1),(156,59,12,'2',1),(157,59,11,'1',1),(158,60,12,'2',1),(159,60,10,'3',1),(160,60,11,'1',1),(161,61,9,'20',1),(162,61,10,'7',1),(163,61,11,'8',1),(164,62,9,'1',1),(165,62,11,'1',1),(166,63,9,'3',1),(167,63,10,'1',1),(168,63,11,'2',1),(169,64,9,'14',1),(170,64,10,'17',1),(171,64,11,'10',1),(172,65,9,'1',1),(173,65,11,'3',1),(174,66,9,'2',1),(175,66,10,'1',1),(176,66,11,'3',1),(177,67,9,'15',1),(178,67,10,'1',1),(179,67,11,'13',1),(180,68,10,'1',1),(181,69,9,'3',1),(182,69,10,'1',1),(183,69,11,'2',1),(184,70,9,'14',1),(185,70,10,'13',1),(186,70,11,'19',1),(187,71,9,'2',1),(188,71,10,'1',1),(189,71,11,'3',1),(190,72,9,'18',1),(191,72,10,'14',1),(192,72,11,'17',1),(193,73,9,'1',1),(194,74,9,'1',1),(195,74,10,'3',1),(196,74,11,'2',1),(197,75,9,'4',1),(198,75,10,'15',1),(199,75,11,'9',1),(200,76,9,'1',1),(201,76,10,'1',1),(202,76,11,'1',1),(203,77,9,'2',1),(204,77,10,'1',1),(205,77,11,'2',1),(206,78,9,'17',1),(207,78,10,'5',1),(208,78,11,'18',1),(209,79,9,'1',1),(210,80,9,'1',1),(211,80,10,'3',1),(212,80,11,'2',1),(216,85,9,'18',1),(217,85,10,'6',1),(218,85,11,'13',1),(219,86,9,'3',1),(220,86,11,'2',1),(221,87,9,'1',1),(222,87,10,'2',1),(223,87,11,'3',1),(224,88,9,'4',1),(225,88,10,'15',1),(226,88,11,'15',1),(227,89,10,'7',1),(228,89,11,'13',1),(229,90,9,'1',1),(230,90,10,'1',1),(231,90,11,'1',1),(232,91,9,'3',1),(233,91,10,'2',1),(234,91,11,'1',1),(235,92,9,'19',1),(236,92,10,'14',1),(237,92,11,'19',1),(238,93,9,'5',1),(239,93,11,'17',1),(240,94,9,'1',1),(241,94,10,'2',1),(242,94,11,'2',1),(243,95,9,'3',1),(244,95,10,'1',1),(245,95,11,'2',1),(246,96,9,'3',1),(247,96,10,'17',1),(248,96,11,'16',1),(249,97,9,'3',1),(250,97,10,'1',1),(251,97,11,'2',1),(252,98,9,'20',1),(253,98,10,'10',1),(254,98,11,'11',1),(255,99,9,'1',1),(256,99,11,'2',1),(257,100,10,'3',1),(258,100,11,'1',1),(259,100,9,'2',1);
/*!40000 ALTER TABLE `event_activities_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities_results_objects`
--

DROP TABLE IF EXISTS `event_activities_results_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities_results_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_activities_results_id` int(11) DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_activities_results_id_idx` (`event_activities_results_id`),
  KEY `activity_object_id_idx` (`activity_object_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results_objects`
--

LOCK TABLES `event_activities_results_objects` WRITE;
/*!40000 ALTER TABLE `event_activities_results_objects` DISABLE KEYS */;
INSERT INTO `event_activities_results_objects` VALUES (1,35,1,1),(2,36,2,1),(3,37,3,1),(4,42,4,1),(5,43,2,1),(6,44,3,1),(7,48,5,1),(8,49,6,1),(9,50,3,1),(10,57,7,1),(11,58,6,1),(12,59,8,1),(13,64,1,1),(14,65,2,1),(15,66,8,1),(16,73,4,1),(17,74,2,1),(18,75,9,1),(19,80,5,1),(20,81,2,1),(21,82,9,1),(22,88,10,1),(23,89,3,1),(24,87,1,1),(25,95,4,1),(26,96,10,1),(27,97,11,1),(28,102,5,1),(29,103,10,1),(30,104,11,1),(31,109,1,1),(32,110,10,1),(33,111,9,1),(34,116,4,1),(35,117,10,1),(36,118,8,1),(37,126,7,1),(38,127,10,1),(39,128,11,1),(40,134,5,1),(41,135,10,1),(42,136,11,1),(43,141,12,1),(44,142,10,1),(45,143,11,1),(46,150,13,1),(47,151,10,1),(48,152,11,1),(49,158,14,1),(50,159,10,1),(51,160,11,1),(52,166,1,1),(53,167,10,1),(54,168,9,1),(55,174,4,1),(56,175,10,1),(57,176,9,1),(58,181,5,1),(59,182,2,1),(60,183,11,1),(61,187,1,1),(62,188,10,1),(63,189,3,1),(64,194,4,1),(65,195,10,1),(66,196,3,1),(67,203,7,1),(68,204,10,1),(69,205,3,1),(70,210,5,1),(71,211,6,1),(72,212,11,1),(74,221,1,1),(75,222,2,1),(76,223,11,1),(77,232,4,1),(78,233,10,1),(79,234,11,1),(80,243,5,1),(81,244,10,1),(82,245,9,1),(83,249,7,1),(84,250,10,1),(85,251,3,1),(86,257,6,1),(87,258,3,1),(88,259,18,1);
/*!40000 ALTER TABLE `event_activities_results_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_idx` (`event_id`),
  KEY `user_id_idx` (`users_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_users`
--

LOCK TABLES `event_users` WRITE;
/*!40000 ALTER TABLE `event_users` DISABLE KEYS */;
INSERT INTO `event_users` VALUES (11,6,9,1),(12,6,10,1),(13,6,11,1),(14,11,9,1),(15,11,10,1),(16,11,11,1),(20,12,9,1),(21,12,10,1),(22,12,11,1),(23,13,9,1),(24,13,10,1),(25,13,11,1),(26,14,12,1),(27,14,10,1),(28,14,11,1),(29,15,9,1),(30,15,10,1),(31,15,11,1),(32,16,9,1),(33,16,10,1),(34,16,11,1),(38,19,9,1),(39,19,10,1),(40,19,11,1);
/*!40000 ALTER TABLE `event_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'RHS Old Fart Gaming','A group of old guys from Renton High School what likes to play Magic');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  `activity_id` int(11) DEFAULT NULL,
  `sql_function` varchar(90) DEFAULT NULL,
  `sort_type` varchar(90) DEFAULT NULL,
  `target_value` varchar(45) DEFAULT NULL,
  `total_positions` int(4) DEFAULT NULL,
  `minimum_results` int(4) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id_idx` (`activity_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (1,'Commander Best Average Placement','Best (lowest) average placement per game played',4,'AVG','ASC','0',3,2,1),(2,'Most 20s Rolled','Most 20s rolled on a go-first roll',5,'COUNT','DESC','20',3,NULL,1),(3,'Most Mulligans','Most mulligans taken',7,'SUM','DESC','0',3,NULL,1);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (3,'The House of Andrew','Maple Valley',1),(4,'Kenyon\'s place','Renton',1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `object_type` varchar(90) DEFAULT NULL,
  `object_identifier` int(11) DEFAULT NULL,
  `note_text` mediumtext,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`users_id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','admins and things',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_groups`
--

DROP TABLE IF EXISTS `roles_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  `groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id_idx` (`groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_groups`
--

LOCK TABLES `roles_groups` WRITE;
/*!40000 ALTER TABLE `roles_groups` DISABLE KEYS */;
INSERT INTO `roles_groups` VALUES (1,'creator','This user created this group',NULL),(2,'admin','An administrator of the group',NULL),(3,'member','A regular old member',NULL);
/*!40000 ALTER TABLE `roles_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('JWk1PyettYtodW2IjbPVcuvpCDFctVh54rRVufak',9,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ3dMbWxjUEFRRGhFc1VxWk12VWxPQkI0eHlwajdEQmpPWmVRV00ydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9ob21lZXZlbnRzLWxhcmF2ZWwvZ3JvdXBzLzEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O3M6MTY6InVzZXJfZ3JvdXBzX2xpc3QiO2E6MTp7aTowO2k6MTt9fQ==',1730784418),('vO5rBrv73cWtqe3g8TkPSkxFNnT4fbIlWdTLlZ6J',9,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaWpYb01oOWNwakhHZWdESUtnMTh5OFo3MzJDWWtyNlV5R0hkakREWiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNToiaHR0cDovL2hvbWVldmVudHMtbGFyYXZlbCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwOi8vaG9tZWV2ZW50cy1sYXJhdmVsL29iamVjdHMvYWN0aXZpdHkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O3M6MTY6InVzZXJfZ3JvdXBzX2xpc3QiO2E6MTp7aTowO2k6MTt9fQ==',1730594260);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Aaron','aaron',NULL,'$2y$12$cknByYQJ.9FuCj8FplPHbeDg6l5temqTdCJiF7JyNPMXMkBBLlXhC',NULL,NULL,NULL),(10,'Andrew','andrew',NULL,'$2y$12$o0FNoLaVoULRpigkx0SWjOA8gJFseUkXQIYqJuoeVv1PNtpEHoXfK',NULL,NULL,NULL),(11,'Evan','evan',NULL,'$2y$12$UDbPmIp..4SKU7LpUl89Aut5uFbMe9Y3G8VqQDF8czI/KJgm53vXC',NULL,NULL,NULL),(12,'Kenyon','kenyon',NULL,'$2y$12$QYRnopiWhihXRNJyrNTbouS0D3fiRG8pIPINHES7ZGGf.s.yJ3P3q',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `roles_groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_id_idx` (`groups_id`),
  KEY `users_id_idx` (`users_id`),
  KEY `roles_groups_idx` (`roles_groups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,9,1),(2,1,9,2),(3,1,11,3),(4,1,10,3),(5,1,12,3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id_idx` (`roles_id`),
  KEY `user_id_idx` (`users_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1,9);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-04 21:29:01

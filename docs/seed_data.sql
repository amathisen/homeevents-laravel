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
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (4,'Magic the Gathering - Commander','A game of commander. No banlist, proxies okay',6,NULL),(5,'Go First Dice Roll','Highest roll goes 1st!',5,NULL),(6,'Go First Dice Re-Roll','Ties are broken here',5,NULL),(7,'Mulligan','Count of mulligans taken',7,NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `activity_object`
--

LOCK TABLES `activity_object` WRITE;
/*!40000 ALTER TABLE `activity_object` DISABLE KEYS */;
INSERT INTO `activity_object` VALUES (1,1,'Tergrid, God of Fright',NULL),(2,1,'Oloro, Ageless Ascetic',NULL),(3,1,'Anowon, the Ruin Thief',NULL),(4,1,'Korvold, Fae-Cursed King',NULL),(5,1,'Zhulodok, Void Gorger',NULL),(6,1,'Xenagos, God of Revels',NULL),(7,1,'Edgar Markov',NULL),(8,1,'Hylda of the Icy Crown',NULL),(9,1,'Elenda, the Dusk Rose',NULL),(10,1,'Kaalia of the Vast',NULL),(11,1,'Eriette of the Charmed Apple',NULL),(12,1,'Shaleeli, The Gifted',NULL),(13,1,'Prosper, Tomb Bound',NULL),(14,1,'Mondrak, Glory Dominus',NULL);
/*!40000 ALTER TABLE `activity_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `activity_object_property`
--

LOCK TABLES `activity_object_property` WRITE;
/*!40000 ALTER TABLE `activity_object_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_object_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `activity_object_type`
--

LOCK TABLES `activity_object_type` WRITE;
/*!40000 ALTER TABLE `activity_object_type` DISABLE KEYS */;
INSERT INTO `activity_object_type` VALUES (1,4,'Commander Deck',NULL);
/*!40000 ALTER TABLE `activity_object_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `activity_result`
--

LOCK TABLES `activity_result` WRITE;
/*!40000 ALTER TABLE `activity_result` DISABLE KEYS */;
INSERT INTO `activity_result` VALUES (5,'D20 Result',1,NULL),(6,'Placement',0,NULL),(7,'Mulligan Count',0,NULL);
/*!40000 ALTER TABLE `activity_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('allowed_blank_tables','a:18:{i:0;s:8:\"activity\";i:1;s:15:\"activity_object\";i:2;s:24:\"activity_object_property\";i:3;s:20:\"activity_object_type\";i:4;s:15:\"activity_result\";i:7;s:5:\"event\";i:8;s:16:\"event_activities\";i:9;s:24:\"event_activities_results\";i:10;s:32:\"event_activities_results_objects\";i:11;s:11:\"event_users\";i:13;s:6:\"groups\";i:16;s:8:\"location\";i:18;s:5:\"notes\";i:20;s:5:\"roles\";i:21;s:12:\"roles_groups\";i:23;s:5:\"users\";i:24;s:12:\"users_groups\";i:25;s:11:\"users_roles\";}',1730169937),('column_listing_activity','a:5:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";i:3;s:18:\"activity_result_id\";i:4;s:9:\"groups_id\";}',1730173726),('column_listing_activity_object','a:4:{i:0;s:2:\"id\";i:1;s:23:\"activity_object_type_id\";i:2;s:4:\"name\";i:3;s:9:\"groups_id\";}',1730173721),('column_listing_event','a:5:{i:0;s:2:\"id\";i:1;s:11:\"location_id\";i:2;s:4:\"date\";i:3;s:5:\"title\";i:4;s:9:\"groups_id\";}',1730169997),('column_listing_groups','a:3:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:11:\"description\";}',1730169997),('column_listing_location','a:4:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:7:\"address\";i:3;s:9:\"groups_id\";}',1730169997),('column_listing_users','a:8:{i:0;s:2:\"id\";i:1;s:4:\"name\";i:2;s:5:\"email\";i:3;s:17:\"email_verified_at\";i:4;s:8:\"password\";i:5;s:14:\"remember_token\";i:6;s:10:\"created_at\";i:7;s:10:\"updated_at\";}',1730173721),('column_listing_users_roles','a:3:{i:0;s:2:\"id\";i:1;s:8:\"roles_id\";i:2;s:8:\"users_id\";}',1730169937),('user_groups_list_9','a:1:{i:0;i:1;}',1730175937);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6,3,'2024-08-11 00:00:00','3 player commander',NULL),(14,4,'2024-09-29 00:00:00','3 player commander',NULL),(13,3,'2024-09-15 00:00:00','3 player commander',NULL),(12,3,'2024-09-01 00:00:00','3 player commander',NULL),(11,3,'2024-08-18 00:00:00','3 player commander',NULL),(15,3,'2024-10-13 00:00:00','3 player commander',NULL),(16,3,'2024-10-19 00:00:00','3 player commander',NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event_activities`
--

LOCK TABLES `event_activities` WRITE;
/*!40000 ALTER TABLE `event_activities` DISABLE KEYS */;
INSERT INTO `event_activities` VALUES (8,'Game 1',6,5,NULL),(9,'Game 1',6,7,NULL),(10,'Game 1',6,4,NULL),(11,'Game 2',6,5,NULL),(12,'Game 2',6,7,NULL),(13,'Game 2',6,4,NULL),(14,'Game 3',6,5,NULL),(15,'Game 3',6,7,NULL),(16,'Game 3',6,4,NULL),(17,'Game 1',11,5,NULL),(18,'Game 1',11,7,NULL),(19,'Game 1',11,4,NULL),(20,'Game 2',11,5,NULL),(21,'Game 2',11,7,NULL),(22,'Game 2',11,4,NULL),(23,'Game 3',11,5,NULL),(24,'Game 3',11,6,NULL),(25,'Game 3',11,7,NULL),(26,'Game 3',11,4,NULL),(27,'Game 4',11,5,NULL),(28,'Game 4',11,7,NULL),(29,'Game 4',11,4,NULL),(30,'Game 1',12,5,NULL),(31,'Game 1',12,7,NULL),(32,'Game 1',12,4,NULL),(33,'Game 2',12,5,NULL),(34,'Game 2',12,7,NULL),(35,'Game 2',12,4,NULL),(36,'Game 3',12,5,NULL),(37,'Game 3',12,7,NULL),(38,'Game 3',12,4,NULL),(39,'Game 1',13,5,NULL),(40,'Game 1',13,7,NULL),(41,'Game 1',13,4,NULL),(42,'Game 2',13,5,NULL),(43,'Game 2',13,7,NULL),(44,'Game 2',13,4,NULL),(45,'Game 3',13,5,NULL),(46,'Game 3',13,6,NULL),(47,'Game 3',13,7,NULL),(48,'Game 3',13,4,NULL),(49,'Game 4',13,5,NULL),(50,'Game 4',13,7,NULL),(51,'Game 4',13,4,NULL),(52,'Game 1',14,5,NULL),(53,'Game 1',14,7,NULL),(54,'Game 1',14,4,NULL),(55,'Game 2',14,5,NULL),(56,'Game 2',14,7,NULL),(57,'Game 2',14,4,NULL),(58,'Game 3',14,5,NULL),(59,'Game 3',14,7,NULL),(60,'Game 3',14,4,NULL),(61,'Game 1',15,5,NULL),(62,'Game 1',15,7,NULL),(63,'Game 1',15,4,NULL),(64,'Game 2',15,5,NULL),(65,'Game 2',15,7,NULL),(66,'Game 2',15,4,NULL),(67,'Game 3',15,5,NULL),(68,'Game 3',15,7,NULL),(69,'Game 3',15,4,NULL),(70,'Game 1',16,5,NULL),(71,'Game 1',16,4,NULL),(72,'Game 2',16,5,NULL),(73,'Game 2',16,7,NULL),(74,'Game 2',16,4,NULL),(75,'Game 3',16,5,NULL),(76,'Game 3',16,7,NULL),(77,'Game 3',16,4,NULL),(78,'Game 4',16,5,NULL),(79,'Game 4',16,7,NULL),(80,'Game 4',16,4,NULL);
/*!40000 ALTER TABLE `event_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event_activities_results`
--

LOCK TABLES `event_activities_results` WRITE;
/*!40000 ALTER TABLE `event_activities_results` DISABLE KEYS */;
INSERT INTO `event_activities_results` VALUES (31,8,9,'17',NULL),(32,8,10,'20',NULL),(33,8,11,'5',NULL),(34,9,9,'1',NULL),(35,10,9,'1',NULL),(36,10,10,'2',NULL),(37,10,11,'3',NULL),(38,11,9,'10',NULL),(39,11,10,'7',NULL),(40,11,11,'14',NULL),(41,12,10,'1',NULL),(42,13,9,'2',NULL),(43,13,10,'1',NULL),(44,13,11,'2',NULL),(45,14,9,'5',NULL),(46,14,10,'15',NULL),(47,14,11,'16',NULL),(48,16,9,'3',NULL),(49,16,10,'1',NULL),(50,16,11,'2',NULL),(51,17,9,'6',NULL),(52,17,10,'16',NULL),(53,17,11,'4',NULL),(54,18,9,'1',NULL),(55,18,10,'2',NULL),(56,18,11,'2',NULL),(57,19,9,'1',NULL),(58,19,10,'3',NULL),(59,19,11,'2',NULL),(60,20,9,'20',NULL),(61,20,10,'9',NULL),(62,20,11,'14',NULL),(63,21,9,'1',NULL),(64,22,9,'1',NULL),(65,22,10,'3',NULL),(66,22,11,'2',NULL),(67,23,9,'10',NULL),(68,23,10,'10',NULL),(69,23,11,'3',NULL),(70,24,9,'4',NULL),(71,24,10,'19',NULL),(72,25,9,'1',NULL),(73,26,9,'3',NULL),(74,26,10,'2',NULL),(75,26,11,'1',NULL),(76,27,9,'8',NULL),(77,27,10,'2',NULL),(78,27,11,'7',NULL),(79,28,9,'1',NULL),(80,29,9,'1',NULL),(81,29,10,'2',NULL),(82,29,11,'3',NULL),(83,30,9,'11',NULL),(84,30,10,'19',NULL),(85,30,11,'9',NULL),(86,31,11,'1',NULL),(87,32,9,'1',NULL),(88,32,10,'3',NULL),(89,32,11,'2',NULL),(90,33,9,'19',NULL),(91,33,10,'14',NULL),(92,33,11,'17',NULL),(93,34,9,'1',NULL),(94,34,10,'1',NULL),(95,35,9,'1',NULL),(96,35,10,'2',NULL),(97,35,11,'3',NULL),(98,36,9,'14',NULL),(99,36,10,'3',NULL),(100,36,11,'18',NULL),(101,37,11,'1',NULL),(102,38,9,'3',NULL),(103,38,10,'2',NULL),(104,38,11,'1',NULL),(105,39,9,'16',NULL),(106,39,10,'17',NULL),(107,39,11,'5',NULL),(108,40,9,'2',NULL),(109,41,9,'1',NULL),(110,41,10,'2',NULL),(111,41,11,'3',NULL),(112,42,9,'7',NULL),(113,42,10,'1',NULL),(114,42,11,'6',NULL),(115,43,11,'2',NULL),(116,44,9,'1',NULL),(117,44,10,'2',NULL),(118,44,11,'3',NULL),(119,45,9,'6',NULL),(120,45,10,'12',NULL),(121,45,11,'12',NULL),(122,46,10,'12',NULL),(123,46,11,'7',NULL),(124,47,9,'1',NULL),(125,47,11,'1',NULL),(126,48,9,'3',NULL),(127,48,10,'1',NULL),(128,48,11,'2',NULL),(129,49,9,'1',NULL),(130,49,10,'6',NULL),(131,49,11,'20',NULL),(132,50,9,'1',NULL),(133,50,11,'1',NULL),(134,51,9,'3',NULL),(135,51,10,'2',NULL),(136,51,11,'1',NULL),(137,52,12,'3',NULL),(138,52,10,'19',NULL),(139,52,11,'4',NULL),(140,53,12,'1',NULL),(141,54,12,'3',NULL),(142,54,10,'1',NULL),(143,54,11,'2',NULL),(144,55,12,'10',NULL),(145,55,10,'12',NULL),(146,55,11,'11',NULL),(147,56,12,'1',NULL),(148,56,10,'1',NULL),(149,56,11,'1',NULL),(150,57,12,'2',NULL),(151,57,10,'1',NULL),(152,57,11,'3',NULL),(153,58,12,'19',NULL),(154,58,10,'13',NULL),(155,58,11,'4',NULL),(156,59,12,'2',NULL),(157,59,11,'1',NULL),(158,60,12,'2',NULL),(159,60,10,'3',NULL),(160,60,11,'1',NULL),(161,61,9,'20',NULL),(162,61,10,'7',NULL),(163,61,11,'8',NULL),(164,62,9,'1',NULL),(165,62,11,'1',NULL),(166,63,9,'3',NULL),(167,63,10,'1',NULL),(168,63,11,'2',NULL),(169,64,9,'14',NULL),(170,64,10,'17',NULL),(171,64,11,'10',NULL),(172,65,9,'1',NULL),(173,65,11,'3',NULL),(174,66,9,'2',NULL),(175,66,10,'1',NULL),(176,66,11,'3',NULL),(177,67,9,'15',NULL),(178,67,10,'1',NULL),(179,67,11,'13',NULL),(180,68,10,'1',NULL),(181,69,9,'3',NULL),(182,69,10,'1',NULL),(183,69,11,'2',NULL),(184,70,9,'14',NULL),(185,70,10,'13',NULL),(186,70,11,'19',NULL),(187,71,9,'2',NULL),(188,71,10,'1',NULL),(189,71,11,'3',NULL),(190,72,9,'18',NULL),(191,72,10,'14',NULL),(192,72,11,'17',NULL),(193,73,9,'1',NULL),(194,74,9,'1',NULL),(195,74,10,'3',NULL),(196,74,11,'2',NULL),(197,75,9,'4',NULL),(198,75,10,'15',NULL),(199,75,11,'9',NULL),(200,76,9,'1',NULL),(201,76,10,'1',NULL),(202,76,11,'1',NULL),(203,77,9,'2',NULL),(204,77,10,'1',NULL),(205,77,11,'2',NULL),(206,78,9,'17',NULL),(207,78,10,'5',NULL),(208,78,11,'18',NULL),(209,79,9,'1',NULL),(210,80,9,'1',NULL),(211,80,10,'3',NULL),(212,80,11,'2',NULL);
/*!40000 ALTER TABLE `event_activities_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event_activities_results_objects`
--

LOCK TABLES `event_activities_results_objects` WRITE;
/*!40000 ALTER TABLE `event_activities_results_objects` DISABLE KEYS */;
INSERT INTO `event_activities_results_objects` VALUES (1,35,1,NULL),(2,36,2,NULL),(3,37,3,NULL),(4,42,4,NULL),(5,43,2,NULL),(6,44,3,NULL),(7,48,5,NULL),(8,49,6,NULL),(9,50,3,NULL),(10,57,7,NULL),(11,58,6,NULL),(12,59,8,NULL),(13,64,1,NULL),(14,65,2,NULL),(15,66,8,NULL),(16,73,4,NULL),(17,74,2,NULL),(18,75,9,NULL),(19,80,5,NULL),(20,81,2,NULL),(21,82,9,NULL),(22,88,10,NULL),(23,89,3,NULL),(24,87,1,NULL),(25,95,4,NULL),(26,96,10,NULL),(27,97,11,NULL),(28,102,5,NULL),(29,103,10,NULL),(30,104,11,NULL),(31,109,1,NULL),(32,110,10,NULL),(33,111,9,NULL),(34,116,4,NULL),(35,117,10,NULL),(36,118,8,NULL),(37,126,7,NULL),(38,127,10,NULL),(39,128,11,NULL),(40,134,5,NULL),(41,135,10,NULL),(42,136,11,NULL),(43,141,12,NULL),(44,142,10,NULL),(45,143,11,NULL),(46,150,13,NULL),(47,151,10,NULL),(48,152,11,NULL),(49,158,14,NULL),(50,159,10,NULL),(51,160,11,NULL),(52,166,1,NULL),(53,167,10,NULL),(54,168,9,NULL),(55,174,4,NULL),(56,175,10,NULL),(57,176,9,NULL),(58,181,5,NULL),(59,182,2,NULL),(60,183,11,NULL),(61,187,1,NULL),(62,188,10,NULL),(63,189,3,NULL),(64,194,4,NULL),(65,195,10,NULL),(66,196,3,NULL),(67,203,7,NULL),(68,204,10,NULL),(69,205,3,NULL),(70,210,5,NULL),(71,211,6,NULL),(72,212,11,NULL);
/*!40000 ALTER TABLE `event_activities_results_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event_users`
--

LOCK TABLES `event_users` WRITE;
/*!40000 ALTER TABLE `event_users` DISABLE KEYS */;
INSERT INTO `event_users` VALUES (11,6,9,NULL),(12,6,10,NULL),(13,6,11,NULL),(14,11,9,NULL),(15,11,10,NULL),(16,11,11,NULL),(20,12,9,NULL),(21,12,10,NULL),(22,12,11,NULL),(23,13,9,NULL),(24,13,10,NULL),(25,13,11,NULL),(26,14,12,NULL),(27,14,10,NULL),(28,14,11,NULL),(29,15,9,NULL),(30,15,10,NULL),(31,15,11,NULL),(32,16,9,NULL),(33,16,10,NULL),(34,16,11,NULL);
/*!40000 ALTER TABLE `event_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Test Group','A test group for users');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (3,'The House of Andrew','Maple Valley',NULL),(4,'Kenyon\'s place','Renton',NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','admins and things',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles_groups`
--

LOCK TABLES `roles_groups` WRITE;
/*!40000 ALTER TABLE `roles_groups` DISABLE KEYS */;
INSERT INTO `roles_groups` VALUES (1,'creator','This user created this group',NULL),(2,'admin','An administrator of the group',NULL),(3,'member','A regular old member',NULL);
/*!40000 ALTER TABLE `roles_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('vOaN0vzuV15BLBccHG7sXcRdibu509zluqdRbjg3',9,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT3RlMVpUd2RpM3VnQTQ4NGF6N0owUFV0YzJRSTY2WFNmb2lvelZadyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9ob21lZXZlbnRzLWxhcmF2ZWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O30=',1730169053);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Aaron','aaron',NULL,'$2y$12$cknByYQJ.9FuCj8FplPHbeDg6l5temqTdCJiF7JyNPMXMkBBLlXhC',NULL,NULL,NULL),(10,'Andrew','andrew',NULL,'$2y$12$u44dkgyasEcSbY9Woh50IeRFh1o5vE6UMdTtbQQI.sso9KfTgjiw2',NULL,NULL,NULL),(11,'Evan','evan',NULL,'$2y$12$UDbPmIp..4SKU7LpUl89Aut5uFbMe9Y3G8VqQDF8czI/KJgm53vXC',NULL,NULL,NULL),(12,'Kenyon','kenyon',NULL,'$2y$12$QYRnopiWhihXRNJyrNTbouS0D3fiRG8pIPINHES7ZGGf.s.yJ3P3q',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,9,1),(2,1,9,2),(3,1,11,3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-10-28 19:33:18

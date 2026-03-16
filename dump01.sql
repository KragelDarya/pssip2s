-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pixel_art_db
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Еда','Еда, напитки, десерты'),(2,'Растения','Цветы, букеты и растительные мотивы'),(3,'Персонажи','Люди, герои и персонажи'),(4,'Абстракции','Геометрические и абстрактные схемы'),(5,'Животные','Коты, бабочки и другие животные'),(6,'Другое','Прочие категории');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`),
  UNIQUE KEY `uq_user_collection_name` (`user_id`,`name`),
  KEY `idx_collection_user` (`user_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (6,6,'Моя коллекция','Схемы пользователя','2026-02-12 18:34:56'),(10,7,'Моя коллекция','Схемы пользователя','2026-02-13 13:27:41'),(11,8,'Моя коллекция','Схемы пользователя','2026-03-03 08:28:08');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_pattern`
--

DROP TABLE IF EXISTS `collection_pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_pattern` (
  `collection_id` int NOT NULL,
  `pattern_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`collection_id`,`pattern_id`),
  KEY `pattern_id` (`pattern_id`),
  CONSTRAINT `collection_pattern_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`) ON DELETE CASCADE,
  CONSTRAINT `collection_pattern_ibfk_2` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`pattern_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_pattern`
--

LOCK TABLES `collection_pattern` WRITE;
/*!40000 ALTER TABLE `collection_pattern` DISABLE KEYS */;
INSERT INTO `collection_pattern` VALUES (6,4,'2026-03-03 21:10:53',0,NULL),(6,5,'2026-03-02 19:26:09',0,'asdfghjkl;'),(6,6,'2026-03-03 22:18:11',1,'ывапролджэ\r\n4'),(10,4,'2026-02-13 13:27:47',0,'bvcxz'),(10,6,'2026-02-13 13:31:15',0,NULL);
/*!40000 ALTER TABLE `collection_pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `palette_id` int NOT NULL,
  `hex_code` varchar(7) NOT NULL,
  PRIMARY KEY (`color_id`),
  KEY `idx_color_palette` (`palette_id`),
  CONSTRAINT `color_ibfk_1` FOREIGN KEY (`palette_id`) REFERENCES `palette` (`palette_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palette`
--

DROP TABLE IF EXISTS `palette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palette` (
  `palette_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`palette_id`),
  KEY `idx_palette_user` (`user_id`),
  CONSTRAINT `palette_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palette`
--

LOCK TABLES `palette` WRITE;
/*!40000 ALTER TABLE `palette` DISABLE KEYS */;
/*!40000 ALTER TABLE `palette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pattern`
--

DROP TABLE IF EXISTS `pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pattern` (
  `pattern_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image_path` varchar(500) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `difficulty` enum('beginner','intermediate','advanced') DEFAULT 'beginner',
  `width` int NOT NULL,
  `height` int NOT NULL,
  `total_pixels` int NOT NULL,
  `color_count` int NOT NULL,
  `tags` text,
  `description` text,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pattern_id`),
  UNIQUE KEY `uq_pattern_title` (`title`),
  KEY `idx_pattern_title` (`title`),
  KEY `idx_pattern_category` (`category_id`),
  KEY `idx_pattern_difficulty` (`difficulty`),
  KEY `idx_pattern_is_active` (`is_active`),
  CONSTRAINT `pattern_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pattern`
--

LOCK TABLES `pattern` WRITE;
/*!40000 ALTER TABLE `pattern` DISABLE KEYS */;
INSERT INTO `pattern` VALUES (1,'Pixel Cat',NULL,5,'beginner',32,32,1024,8,NULL,'A cute pixel art cat',1,'2026-02-11 06:24:54'),(3,'Abstract Geometry','images/pattern_20260302_113213_33b0e274.png',4,'beginner',48,48,2304,6,NULL,'Geometric abstract pattern',1,'2026-02-11 06:24:54'),(4,'Роза в винтажном стиле','/assets/images/rose.png',2,'intermediate',50,50,2500,12,'[\"цветы\", \"розы\", \"винтаж\"]','Красивая роза в винтажном стиле для вышивки',1,'2026-02-11 11:10:50'),(5,'Горный пейзаж','/assets/images/mountain.png',6,'advanced',100,80,8000,25,'[\"горы\", \"пейзаж\", \"природа\"]','Живописный горный пейзаж',1,'2026-02-11 11:10:50'),(6,'Милый котёнок','/assets/images/cat.png',5,'beginner',60,60,3600,15,'[\"коты\", \"животные\", \"милые\"]','Милый котёнок для начинающих',1,'2026-02-11 11:10:50'),(7,'Букет лаванды','images/pattern_20260304_011706_2a523d80.png',2,'beginner',40,70,2800,8,'[\"цветы\", \"лаванда\", \"букет\"]','Ароматный букет лаванды',1,'2026-02-11 11:10:50'),(8,'Морской закат','images/pattern_20260302_100917_97a5b1f5.png',6,'advanced',120,90,10800,30,'[\"море\", \"закат\", \"пейзаж\"]','Красочный морской закат',1,'2026-02-11 11:10:50'),(9,'Бабочка-монарх','images/pattern_20260302_113156_b7031f56.png',5,'advanced',45,45,2025,10,'[\"бабочки\", \"насекомые\", \"природа\"]','Яркая бабочка-монарх',1,'2026-02-11 11:10:50');
/*!40000 ALTER TABLE `pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `progress_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pattern_id` int NOT NULL,
  `completion_percentage` decimal(5,2) DEFAULT '0.00',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pixels_marked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`progress_id`),
  UNIQUE KEY `unique_user_pattern` (`user_id`,`pattern_id`),
  KEY `idx_progress_user` (`user_id`),
  KEY `idx_progress_pattern` (`pattern_id`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`pattern_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (6,6,4,0.00,'2026-02-12 21:25:11',0);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_name` (`name`),
  KEY `idx_user_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'dasha','dasha12300227@gmail.com','11111111Dd','2026-02-12 18:34:56'),(7,'dashaaaaa','dashaaaa12300227@gmail.com','1111111111Aa','2026-02-13 13:27:41'),(8,'aфф','aaa@mail.ru','12341234Aa','2026-03-03 08:28:08');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pixel_art_db'
--

--
-- Dumping routines for database 'pixel_art_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-16 17:49:23

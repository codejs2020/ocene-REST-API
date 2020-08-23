-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ocene
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `class_units`
--

DROP TABLE IF EXISTS `class_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_units`
--

LOCK TABLES `class_units` WRITE;
/*!40000 ALTER TABLE `class_units` DISABLE KEYS */;
INSERT INTO `class_units` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `class_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_values`
--

DROP TABLE IF EXISTS `grade_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(56) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_values`
--

LOCK TABLES `grade_values` WRITE;
/*!40000 ALTER TABLE `grade_values` DISABLE KEYS */;
INSERT INTO `grade_values` VALUES (1,'poor'),(2,'satisfactory'),(3,'good'),(4,'very good'),(5,'excellent');
/*!40000 ALTER TABLE `grade_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `value_of_grade` int(11) DEFAULT NULL,
  `date_of_grade` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  KEY `subject` (`subject`),
  KEY `value_of_grade` (`value_of_grade`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student`) REFERENCES `students` (`id`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`value_of_grade`) REFERENCES `grade_values` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,4,'2020-08-23 10:48:38'),(2,2,2,2,'2020-08-23 10:49:07'),(3,1,2,2,'2020-08-23 10:49:16'),(4,5,4,5,'2020-08-23 10:50:00');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(56) DEFAULT NULL,
  `surname` varchar(56) DEFAULT NULL,
  `class_unit` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_unit` (`class_unit`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_unit`) REFERENCES `class_units` (`id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Student','One',1,1),(2,'Student','Two',1,2),(3,'Student','Three',1,3),(4,'Student','Four',1,7),(5,'Student','Five',2,8),(6,'Student','Six',2,9);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(56) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher` (`teacher`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Math 1',4,1),(2,'English 1',5,1),(3,'English 2',5,2),(4,'History 2',6,2);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_user` varchar(56) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'parent'),(2,'teacher');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(56) DEFAULT NULL,
  `surname` varchar(56) DEFAULT NULL,
  `username` varchar(56) DEFAULT NULL,
  `password` varchar(56) DEFAULT NULL,
  `type_of_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_of_user_id` (`type_of_user_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_of_user_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Parent','One','parent1','202cb962ac59075b964b07152d234b70',1),(2,'Parent','Two','parent2','202cb962ac59075b964b07152d234b70',1),(3,'Parent','Three','parent3','202cb962ac59075b964b07152d234b70',1),(4,'Math','Teaher','teacher1','202cb962ac59075b964b07152d234b70',2),(5,'English','Teacher','teacher2','202cb962ac59075b964b07152d234b70',2),(6,'History','Teacher','teacher2','202cb962ac59075b964b07152d234b70',2),(7,'Parent','Four','parent4','202cb962ac59075b964b07152d234b70',1),(8,'Parent','Five','parent5','202cb962ac59075b964b07152d234b70',1),(9,'Parent','Six','parent6','202cb962ac59075b964b07152d234b70',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-23 14:33:25

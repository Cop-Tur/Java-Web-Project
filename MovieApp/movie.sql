-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `movie_info`
--

DROP TABLE IF EXISTS `movie_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imgSrc` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` varchar(255) NOT NULL,
  `heat` int(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `actorImg` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_info`
--

LOCK TABLES `movie_info` WRITE;
/*!40000 ALTER TABLE `movie_info` DISABLE KEYS */;
INSERT INTO `movie_info` VALUES (1,'1917.jpg','1917','8.6',46,'剧情 / 战争','美国','姚忆文','yyw.jpg','2019-11-23 22:00:00'),(2,'寄生虫.jpg','寄生虫','8.8',48,'剧情 / 惊悚 / 爱情','美国','姚忆文',NULL,'2020-01-20 10:00:00'),(3,'小妇人.jpg','小妇人','8.2',43,'剧情 / 爱情','美国','姚忆文','yyw.jpg','2019-12-25 00:00:00'),(4,'乔乔的异想世界.jpg','乔乔兔','8.4',42,'剧情 / 喜剧 / 战争','美国','姚忆文','yyw.jpg','2019-09-08 01:00:00'),(5,'小丑.jpg','小丑','8.8',41,'剧情 / 惊悚 / 犯罪','美国','姚忆文','yyw.jpg','2019-07-04 00:00:00'),(6,'阳光普照.jpg','阳光普照','8.4',40,'剧情 / 犯罪','中国','姚忆文','yyw.jpg','2019-11-01 00:00:00'),(7,'爱尔兰人.jpg','爱尔兰人','9.0',34,'剧情 / 喜剧 / 悬疑 / 犯罪','美国','姚忆文','yyw.jpg','2019-09-07 00:00:00'),(8,'利刃出鞘.jpg','利刃出鞘','8.2',39,'剧情 / 喜剧 / 悬疑 / 犯罪','美国','姚忆文','','2019-11-28 10:00:00');
/*!40000 ALTER TABLE `movie_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'yyw','123');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 10:14:55

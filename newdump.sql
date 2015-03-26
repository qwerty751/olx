-- MySQL dump 10.13  Distrib 5.1.66, for portbld-freebsd9.1 (i386)
--
-- Host: localhost    Database: user7
-- ------------------------------------------------------
-- Server version	5.1.66

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
-- Table structure for table `olx_categories`
--

DROP TABLE IF EXISTS `olx_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olx_categories` (
  `idCat` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL,
  PRIMARY KEY (`idCat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olx_categories`
--

LOCK TABLES `olx_categories` WRITE;
/*!40000 ALTER TABLE `olx_categories` DISABLE KEYS */;
INSERT INTO `olx_categories` VALUES (1,'cars'),(2,'guns'),(3,'estates'),(4,'diploms'),(5,'arts');
/*!40000 ALTER TABLE `olx_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olx_posts`
--

DROP TABLE IF EXISTS `olx_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olx_posts` (
  `idPost` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idSub` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idPost`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olx_posts`
--

LOCK TABLES `olx_posts` WRITE;
/*!40000 ALTER TABLE `olx_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `olx_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olx_subCategories`
--

DROP TABLE IF EXISTS `olx_subCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olx_subCategories` (
  `idSub` int(11) NOT NULL AUTO_INCREMENT,
  `idCat` int(11) NOT NULL,
  `sub_name` varchar(30) NOT NULL,
  PRIMARY KEY (`idSub`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olx_subCategories`
--

LOCK TABLES `olx_subCategories` WRITE;
/*!40000 ALTER TABLE `olx_subCategories` DISABLE KEYS */;
INSERT INTO `olx_subCategories` VALUES (1,1,'sport'),(2,1,'jeeps'),(3,1,'parckets'),(4,1,'sedans'),(5,1,'universals'),(6,2,'sniper-rifles'),(7,2,'machine-guns'),(8,2,'grande-lounchers'),(9,2,'pistols'),(10,3,'house'),(11,3,'flat'),(12,3,'villa'),(13,3,'programmers'),(14,3,'medcines'),(15,3,'shipbuilders'),(16,3,'teachers'),(17,4,'teachers'),(18,4,'shipbuilders'),(19,4,'medcines'),(20,4,'medcines'),(21,4,'programmers'),(22,5,'statues'),(23,5,'pictures'),(24,5,'tea-cups'),(25,5,'weapons');
/*!40000 ALTER TABLE `olx_subCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olx_users`
--

DROP TABLE IF EXISTS `olx_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olx_users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olx_users`
--

LOCK TABLES `olx_users` WRITE;
/*!40000 ALTER TABLE `olx_users` DISABLE KEYS */;
INSERT INTO `olx_users` VALUES (1,'vasya','pupkin','123','vasya@mail.ru','1234567890'),(2,'afdsad','Adas','123456','asdas@adsa.ru','1234567890'),(3,'sasha','fsdafasdf','123456','fsdafsdf@erertert.tu','1234567890');
/*!40000 ALTER TABLE `olx_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-26  9:37:21

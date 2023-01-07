CREATE DATABASE  IF NOT EXISTS `taskly_api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `taskly_api`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: taskly_api
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add application',7,'add_application'),(26,'Can change application',7,'change_application'),(27,'Can delete application',7,'delete_application'),(28,'Can view application',7,'view_application'),(29,'Can add access token',8,'add_accesstoken'),(30,'Can change access token',8,'change_accesstoken'),(31,'Can delete access token',8,'delete_accesstoken'),(32,'Can view access token',8,'view_accesstoken'),(33,'Can add grant',9,'add_grant'),(34,'Can change grant',9,'change_grant'),(35,'Can delete grant',9,'delete_grant'),(36,'Can view grant',9,'view_grant'),(37,'Can add refresh token',10,'add_refreshtoken'),(38,'Can change refresh token',10,'change_refreshtoken'),(39,'Can delete refresh token',10,'delete_refreshtoken'),(40,'Can view refresh token',10,'view_refreshtoken'),(41,'Can add id token',11,'add_idtoken'),(42,'Can change id token',11,'change_idtoken'),(43,'Can delete id token',11,'delete_idtoken'),(44,'Can view id token',11,'view_idtoken'),(45,'Can add association',12,'add_association'),(46,'Can change association',12,'change_association'),(47,'Can delete association',12,'delete_association'),(48,'Can view association',12,'view_association'),(49,'Can add code',13,'add_code'),(50,'Can change code',13,'change_code'),(51,'Can delete code',13,'delete_code'),(52,'Can view code',13,'view_code'),(53,'Can add nonce',14,'add_nonce'),(54,'Can change nonce',14,'change_nonce'),(55,'Can delete nonce',14,'delete_nonce'),(56,'Can view nonce',14,'view_nonce'),(57,'Can add user social auth',15,'add_usersocialauth'),(58,'Can change user social auth',15,'change_usersocialauth'),(59,'Can delete user social auth',15,'delete_usersocialauth'),(60,'Can view user social auth',15,'view_usersocialauth'),(61,'Can add partial',16,'add_partial'),(62,'Can change partial',16,'change_partial'),(63,'Can delete partial',16,'delete_partial'),(64,'Can view partial',16,'view_partial'),(65,'Can add crontab',17,'add_crontabschedule'),(66,'Can change crontab',17,'change_crontabschedule'),(67,'Can delete crontab',17,'delete_crontabschedule'),(68,'Can view crontab',17,'view_crontabschedule'),(69,'Can add interval',18,'add_intervalschedule'),(70,'Can change interval',18,'change_intervalschedule'),(71,'Can delete interval',18,'delete_intervalschedule'),(72,'Can view interval',18,'view_intervalschedule'),(73,'Can add periodic task',19,'add_periodictask'),(74,'Can change periodic task',19,'change_periodictask'),(75,'Can delete periodic task',19,'delete_periodictask'),(76,'Can view periodic task',19,'view_periodictask'),(77,'Can add periodic tasks',20,'add_periodictasks'),(78,'Can change periodic tasks',20,'change_periodictasks'),(79,'Can delete periodic tasks',20,'delete_periodictasks'),(80,'Can view periodic tasks',20,'view_periodictasks'),(81,'Can add solar event',21,'add_solarschedule'),(82,'Can change solar event',21,'change_solarschedule'),(83,'Can delete solar event',21,'delete_solarschedule'),(84,'Can view solar event',21,'view_solarschedule'),(85,'Can add clocked',22,'add_clockedschedule'),(86,'Can change clocked',22,'change_clockedschedule'),(87,'Can delete clocked',22,'delete_clockedschedule'),(88,'Can view clocked',22,'view_clockedschedule'),(89,'Can add profile',23,'add_profile'),(90,'Can change profile',23,'change_profile'),(91,'Can delete profile',23,'delete_profile'),(92,'Can view profile',23,'view_profile'),(93,'Can add team',24,'add_team'),(94,'Can change team',24,'change_team'),(95,'Can delete team',24,'delete_team'),(96,'Can view team',24,'view_team'),(97,'Can add task',25,'add_task'),(98,'Can change task',25,'change_task'),(99,'Can delete task',25,'delete_task'),(100,'Can view task',25,'view_task'),(101,'Can add task list',26,'add_tasklist'),(102,'Can change task list',26,'change_tasklist'),(103,'Can delete task list',26,'delete_tasklist'),(104,'Can view task list',26,'view_tasklist'),(105,'Can add attachment',27,'add_attachment'),(106,'Can change attachment',27,'change_attachment'),(107,'Can delete attachment',27,'delete_attachment'),(108,'Can view attachment',27,'view_attachment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$cPF3tbmiYeIPkX1JFY2bv6$yxYDM2X6KxYUqQhcToXaePYAFr6PkfJXzxV2oYaWRw8=','2023-01-06 23:28:04.541757',1,'admin','','','mar@gmail.com',1,1,'2023-01-06 19:56:30.755710'),(2,'pbkdf2_sha256$390000$wDCvbMyMHpX7FVBmFb2yae$0Oa64ChmLsdVg5QsCJflYZRo1ZEpG9r3TS8i8cathz8=','2023-01-06 23:25:12.145526',0,'joana_silva','Joana','Silva','joana@hotmail.com',0,1,'2023-01-06 19:58:01.789642'),(3,'pbkdf2_sha256$390000$BIZep9Yf5S38dInRTTLpC4$r4mKAECOb1yigHeVbQaIb8Nrb3C7V+O5ylPrhzNashI=','2023-01-06 23:26:03.057600',0,'joao_silva','Joao','Silva','joa0@hotmail.com',0,1,'2023-01-06 19:58:18.804518'),(4,'pbkdf2_sha256$390000$x1REQXusuTNohFrjoCM3j0$VrhgV/WftlSsT/h4Wh24GzFDAhWHi/kwXftctzpJ0o8=','2023-01-06 23:27:16.845075',0,'carlos_carlos','Carlos','Carlos','carlos@hotmail.com',0,1,'2023-01-06 19:59:36.259008'),(5,'pbkdf2_sha256$390000$NLQ9vVESHQ6Mfur83ZJiRd$63bmAw6+MpLaOQ1E1lLAme99KrU/lUM1bZxb8EZ5LdY=',NULL,0,'milton_junior','Milton','Junior','milton@hotmail.com',0,1,'2023-01-06 19:59:56.733963'),(6,'pbkdf2_sha256$390000$GmBvmE9heO7ftwAOpGru9m$MNGBxnQD+qk0pK9jqCGZ7TFDNjlp5h1vfRsMHVvErIc=',NULL,0,'jhonatas_santos','Jhonatas','Santos','jhonatas@hotmail.com',0,1,'2023-01-06 20:00:40.041611'),(7,'pbkdf2_sha256$390000$MwmkEOLYL1eJkyq1Rtg4In$OCIG4hzCUITf7jH58WwiR1rZTNsUoT+h9IgUrWMuL+4=',NULL,1,'management','','','',1,1,'2023-01-06 20:09:16.320805');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-06 20:11:12.320060','1','OAuth2 Application',1,'[{\"added\": {}}]',7,1),(2,'2023-01-06 20:12:31.726980','1','OAuth2 Application',2,'[{\"changed\": {\"fields\": [\"Skip authorization\"]}}]',7,1),(3,'2023-01-06 20:13:00.625116','1','OAuth2 Application',2,'[{\"changed\": {\"fields\": [\"Skip authorization\", \"Algorithm\"]}}]',7,1),(4,'2023-01-06 20:13:11.630219','1','OAuth2 Application',2,'[{\"changed\": {\"fields\": [\"Algorithm\"]}}]',7,1),(5,'2023-01-06 20:14:00.120127','1','OAuth2 Application',2,'[]',7,1),(6,'2023-01-06 22:44:17.623254','5b4efd7b-d420-40a0-891a-1302b2e014e5','5b4efd7b-d420-40a0-891a-1302b2e014e5 - TI',2,'[{\"changed\": {\"fields\": [\"Manager\"]}}]',24,1),(7,'2023-01-06 23:06:46.405144','8fccd0f1-8a56-4227-af44-0de9ea40813b','8fccd0f1-8a56-4227-af44-0de9ea40813b - Finances',1,'[{\"added\": {}}]',24,1),(8,'2023-01-06 23:07:14.094740','317e25e8-a954-4402-a88f-753e6b260f5b','317e25e8-a954-4402-a88f-753e6b260f5b - HR',1,'[{\"added\": {}}]',24,1),(9,'2023-01-06 23:08:42.180768','9ca3ddef-6a78-44ba-a4dd-c388117726a8','9ca3ddef-6a78-44ba-a4dd-c388117726a8 - Events',1,'[{\"added\": {}}]',24,1),(10,'2023-01-06 23:16:43.036907','1','1 - Programar backend',1,'[{\"added\": {}}]',26,1),(11,'2023-01-06 23:16:58.717506','2','2 - Programar frontend',1,'[{\"added\": {}}]',26,1),(12,'2023-01-06 23:17:25.783701','3','3 - Criar planilhas',1,'[{\"added\": {}}]',26,1),(13,'2023-01-06 23:17:44.839105','4','4 - Demitir 3 pessoas',1,'[{\"added\": {}}]',26,1),(14,'2023-01-06 23:18:13.289349','5','5 - Fazer confraternização da firma',1,'[{\"added\": {}}]',26,1),(15,'2023-01-06 23:33:28.741551','1','celery.backend_cleanup: 0 4 * * * (m/h/dM/MY/d) UTC',3,'',19,1),(16,'2023-01-06 23:34:04.970210','1','every 10 seconds',1,'[{\"added\": {}}]',18,1),(17,'2023-01-06 23:34:07.896261','2','Calc_house_stts: every 10 seconds',1,'[{\"added\": {}}]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_crontabschedule` VALUES (1,'0','4','*','*','*','UTC');
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_intervalschedule` VALUES (1,10,'seconds');
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictask` VALUES (2,'Calc_house_stts','calculate_house_stats','[]','{}',NULL,NULL,NULL,NULL,1,'2023-01-06 23:35:45.047338',8,'2023-01-06 23:35:45.161339','',NULL,1,NULL,0,NULL,NULL,'{}',NULL,NULL),(3,'celery.backend_cleanup','celery.backend_cleanup','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2023-01-06 23:34:25.069590','',1,NULL,NULL,0,NULL,NULL,'{}',NULL,43200);
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictasks` VALUES (1,'2023-01-06 23:34:25.070588');
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(22,'django_celery_beat','clockedschedule'),(17,'django_celery_beat','crontabschedule'),(18,'django_celery_beat','intervalschedule'),(19,'django_celery_beat','periodictask'),(20,'django_celery_beat','periodictasks'),(21,'django_celery_beat','solarschedule'),(8,'oauth2_provider','accesstoken'),(7,'oauth2_provider','application'),(9,'oauth2_provider','grant'),(11,'oauth2_provider','idtoken'),(10,'oauth2_provider','refreshtoken'),(6,'sessions','session'),(12,'social_django','association'),(13,'social_django','code'),(14,'social_django','nonce'),(16,'social_django','partial'),(15,'social_django','usersocialauth'),(27,'tasks','attachment'),(25,'tasks','task'),(26,'tasks','tasklist'),(24,'teams','team'),(23,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-06 19:53:58.883353'),(2,'auth','0001_initial','2023-01-06 19:54:02.223263'),(3,'admin','0001_initial','2023-01-06 19:54:02.988422'),(4,'admin','0002_logentry_remove_auto_add','2023-01-06 19:54:03.064007'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-06 19:54:03.112348'),(6,'contenttypes','0002_remove_content_type_name','2023-01-06 19:54:03.512263'),(7,'auth','0002_alter_permission_name_max_length','2023-01-06 19:54:03.833725'),(8,'auth','0003_alter_user_email_max_length','2023-01-06 19:54:04.095421'),(9,'auth','0004_alter_user_username_opts','2023-01-06 19:54:04.168277'),(10,'auth','0005_alter_user_last_login_null','2023-01-06 19:54:04.413691'),(11,'auth','0006_require_contenttypes_0002','2023-01-06 19:54:04.464847'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-06 19:54:04.531252'),(13,'auth','0008_alter_user_username_max_length','2023-01-06 19:54:04.744823'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-06 19:54:05.025308'),(15,'auth','0010_alter_group_name_max_length','2023-01-06 19:54:05.186151'),(16,'auth','0011_update_proxy_permissions','2023-01-06 19:54:05.225180'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-06 19:54:05.515368'),(18,'django_celery_beat','0001_initial','2023-01-06 19:54:06.931295'),(19,'django_celery_beat','0002_auto_20161118_0346','2023-01-06 19:54:07.376289'),(20,'django_celery_beat','0003_auto_20161209_0049','2023-01-06 19:54:07.529305'),(21,'django_celery_beat','0004_auto_20170221_0000','2023-01-06 19:54:07.561300'),(22,'django_celery_beat','0005_add_solarschedule_events_choices','2023-01-06 19:54:07.598278'),(23,'django_celery_beat','0006_auto_20180322_0932','2023-01-06 19:54:07.882283'),(24,'django_celery_beat','0007_auto_20180521_0826','2023-01-06 19:54:08.091148'),(25,'django_celery_beat','0008_auto_20180914_1922','2023-01-06 19:54:08.154309'),(26,'django_celery_beat','0006_auto_20180210_1226','2023-01-06 19:54:08.196293'),(27,'django_celery_beat','0006_periodictask_priority','2023-01-06 19:54:08.715291'),(28,'django_celery_beat','0009_periodictask_headers','2023-01-06 19:54:09.037782'),(29,'django_celery_beat','0010_auto_20190429_0326','2023-01-06 19:54:09.218773'),(30,'django_celery_beat','0011_auto_20190508_0153','2023-01-06 19:54:09.949722'),(31,'django_celery_beat','0012_periodictask_expire_seconds','2023-01-06 19:54:10.360277'),(32,'django_celery_beat','0013_auto_20200609_0727','2023-01-06 19:54:10.425552'),(33,'django_celery_beat','0014_remove_clockedschedule_enabled','2023-01-06 19:54:10.502443'),(34,'django_celery_beat','0015_edit_solarschedule_events_choices','2023-01-06 19:54:10.545273'),(35,'django_celery_beat','0016_alter_crontabschedule_timezone','2023-01-06 19:54:10.585274'),(36,'oauth2_provider','0001_initial','2023-01-06 19:54:15.565980'),(37,'oauth2_provider','0002_auto_20190406_1805','2023-01-06 19:54:15.995243'),(38,'oauth2_provider','0003_auto_20201211_1314','2023-01-06 19:54:16.325006'),(39,'oauth2_provider','0004_auto_20200902_2022','2023-01-06 19:54:19.046736'),(40,'oauth2_provider','0005_auto_20211222_2352','2023-01-06 19:54:19.143651'),(41,'oauth2_provider','0006_alter_application_client_secret','2023-01-06 19:54:19.212660'),(42,'sessions','0001_initial','2023-01-06 19:54:19.450207'),(43,'default','0001_initial','2023-01-06 19:54:21.164302'),(44,'social_auth','0001_initial','2023-01-06 19:54:21.205213'),(45,'default','0002_add_related_name','2023-01-06 19:54:21.279050'),(46,'social_auth','0002_add_related_name','2023-01-06 19:54:21.314265'),(47,'default','0003_alter_email_max_length','2023-01-06 19:54:21.382359'),(48,'social_auth','0003_alter_email_max_length','2023-01-06 19:54:21.405064'),(49,'default','0004_auto_20160423_0400','2023-01-06 19:54:21.469040'),(50,'social_auth','0004_auto_20160423_0400','2023-01-06 19:54:21.494197'),(51,'social_auth','0005_auto_20160727_2333','2023-01-06 19:54:21.638208'),(52,'social_django','0006_partial','2023-01-06 19:54:22.202184'),(53,'social_django','0007_code_timestamp','2023-01-06 19:54:22.403194'),(54,'social_django','0008_partial_timestamp','2023-01-06 19:54:22.614295'),(55,'social_django','0009_auto_20191118_0520','2023-01-06 19:54:23.123178'),(56,'social_django','0010_uid_db_index','2023-01-06 19:54:23.301179'),(57,'users','0001_initial','2023-01-06 19:54:23.725141'),(58,'teams','0001_initial','2023-01-06 19:54:24.505179'),(59,'users','0002_profile_team','2023-01-06 19:54:25.024068'),(60,'tasks','0001_initial','2023-01-06 19:54:25.720167'),(61,'tasks','0002_tasklist_attachment_task_task_list','2023-01-06 19:54:27.572154'),(62,'tasks','0003_attachment_description','2023-01-06 19:54:27.663145'),(63,'social_django','0001_initial','2023-01-06 19:54:27.705147'),(64,'social_django','0005_auto_20160727_2333','2023-01-06 19:54:27.763158'),(65,'social_django','0004_auto_20160423_0400','2023-01-06 19:54:27.895430'),(66,'social_django','0003_alter_email_max_length','2023-01-06 19:54:27.995151'),(67,'social_django','0002_add_related_name','2023-01-06 19:54:28.051154');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lf82enrtt28tspjix9lie1ykdh0z9x7t','.eJxVjDEOAiEQAP9CbcjCEkBLe99AFhbk1EBy3FXGvxuSK7SdmcxbBNq3GvaR17CwuAglTr8sUnrmNgU_qN27TL1t6xLlTORhh7x1zq_r0f4NKo06t9oBJkSPShuNBbDEGAmsp-SLZmdycWdnMVrHCn0GIHAmsQfWho34fAG_Tzct:1pDw84:arzLx245JZhvNMOg3OLu7z-jxcSYAjGenfozXrk51FE','2023-01-20 23:28:04.571884');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'kzfjinqn2ikykn4STtjXdpFCp8dJE3','2023-01-07 06:11:46.105799','read write',1,1,'2023-01-06 20:11:46.106800','2023-01-06 20:11:46.106800',NULL,NULL),(2,'yp06FW6Hs1BOl2GVMtG5yYFK9k0Ow8','2023-01-07 08:42:54.158583','read write',1,4,'2023-01-06 22:42:54.159583','2023-01-06 22:42:54.159583',NULL,NULL),(3,'yrqF0AQ5Eny4LOY1CUDt0oj3yU89vf','2023-01-07 09:09:45.890044','read write',1,6,'2023-01-06 23:09:45.890044','2023-01-06 23:09:45.890044',NULL,NULL),(4,'J8wDPiKu0Bi8xTCG2BV977rAv4XT9f','2023-01-07 09:10:43.976327','read write',1,5,'2023-01-06 23:10:43.977329','2023-01-06 23:10:43.977329',NULL,NULL),(5,'MYDPTLcGN2t8ngNvulMi8wtGE4Ib8f','2023-01-07 09:12:15.442687','read write',1,2,'2023-01-06 23:12:15.443689','2023-01-06 23:12:15.443689',NULL,NULL),(6,'CJLfcJM1ia9Q0kmVeiYqTZPVh542TH','2023-01-07 09:14:10.677762','read write',1,4,'2023-01-06 23:14:10.677762','2023-01-06 23:14:10.677762',NULL,NULL),(7,'FX8WdE46KfOsLViJwtGDzE7th8stTA','2023-01-07 09:15:16.227228','read write',1,3,'2023-01-06 23:15:16.228230','2023-01-06 23:15:16.228230',NULL,NULL),(8,'ygKPEfvinVK0yfpnExVrlvfW0PZzho','2023-01-07 09:30:35.272128','read write',1,1,'2023-01-06 23:30:35.273128','2023-01-06 23:30:35.273128',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'9jdeposgCqrSqegOwr00rflj4BwhXcpyMBtqOhD6','','confidential','password','pbkdf2_sha256$390000$h87Sccg7R3JCqISVxVCZLm$6jtjH3vSMGWbC35UdER/jwymc0FSAQ404KbJyZl9QP4=','OAuth2 Application',7,0,'2023-01-06 20:11:12.318059','2023-01-06 20:14:00.119136','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `claims` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'ADc4gcrZTOZURycfALKJVz0t4bJy1C',1,1,1,'2023-01-06 20:11:46.110800','2023-01-06 20:11:46.110800',NULL),(2,'NzF7QphEBaXxcZTpkQAKgE5l1UTvWU',2,1,4,'2023-01-06 22:42:54.190576','2023-01-06 22:42:54.190576',NULL),(3,'JL7k0S6s7jrr3JHcp7MeUHZeSPgrDM',3,1,6,'2023-01-06 23:09:45.892040','2023-01-06 23:09:45.892040',NULL),(4,'f295psOK6WLx2VngkpdtpclGA9UIMf',4,1,5,'2023-01-06 23:10:43.978327','2023-01-06 23:10:43.978327',NULL),(5,'bGjPPXLydDYBWbqnqwnCAqD7e3IRNt',5,1,2,'2023-01-06 23:12:15.445694','2023-01-06 23:12:15.445694',NULL),(6,'hb07XjwbSqC1W5u2mrBiShIkBQeb06',6,1,4,'2023-01-06 23:14:10.679759','2023-01-06 23:14:10.679759',NULL),(7,'rGiFwJxq6pY1ohJ9eBnFvbz8Fg7fch',7,1,3,'2023-01-06 23:15:16.230223','2023-01-06 23:15:16.230223',NULL),(8,'LG9EsPrnIXxMMoEt4Y7qWHkvm2neIm',8,1,1,'2023-01-06 23:30:35.274125','2023-01-06 23:30:35.274125',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_attachment`
--

DROP TABLE IF EXISTS `tasks_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_attachment` (
  `id` char(32) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `data` varchar(100) NOT NULL,
  `task_id` bigint NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `tasks_attachment_task_id_4e218594_fk_tasks_task_id` (`task_id`),
  CONSTRAINT `tasks_attachment_task_id_4e218594_fk_tasks_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_attachment`
--

LOCK TABLES `tasks_attachment` WRITE;
/*!40000 ALTER TABLE `tasks_attachment` DISABLE KEYS */;
INSERT INTO `tasks_attachment` VALUES ('6703d4e9774946daa5b8fe2a3689e686','2023-01-06 23:32:02.626050','media/tasks/2/attachments/6703d4e9-7749-46da-a5b8-fe2a3689e686.jfif',2,NULL),('6eefbeeff8f9467d9f20b59c26912ba3','2023-01-06 23:31:35.497823','media/tasks/1/attachments/6eefbeef-f8f9-467d-9f20-b59c26912ba3.jfif',1,NULL);
/*!40000 ALTER TABLE `tasks_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_task`
--

DROP TABLE IF EXISTS `tasks_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `completed_on` datetime(6) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext,
  `status` varchar(2) NOT NULL,
  `completed_by_id` bigint DEFAULT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `task_list_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_task_completed_by_id_473548b4_fk_users_profile_id` (`completed_by_id`),
  KEY `tasks_task_created_by_id_1345568a_fk_users_profile_id` (`created_by_id`),
  KEY `tasks_task_task_list_id_140627d7_fk_tasks_tasklist_id` (`task_list_id`),
  CONSTRAINT `tasks_task_completed_by_id_473548b4_fk_users_profile_id` FOREIGN KEY (`completed_by_id`) REFERENCES `users_profile` (`id`),
  CONSTRAINT `tasks_task_created_by_id_1345568a_fk_users_profile_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_profile` (`id`),
  CONSTRAINT `tasks_task_task_list_id_140627d7_fk_tasks_tasklist_id` FOREIGN KEY (`task_list_id`) REFERENCES `tasks_tasklist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_task`
--

LOCK TABLES `tasks_task` WRITE;
/*!40000 ALTER TABLE `tasks_task` DISABLE KEYS */;
INSERT INTO `tasks_task` VALUES (1,'2023-01-06 23:23:51.027735','2023-01-06 23:30:42.518621','Conectar ao banco','','C',1,1,1),(2,'2023-01-06 23:24:12.747665','2023-01-06 23:31:12.885892','Serializar a request','','C',1,1,1),(3,'2023-01-06 23:24:23.879053','2023-01-06 23:35:24.884643','Fazer botões','','C',1,1,2),(4,'2023-01-06 23:25:38.858039',NULL,'Criar relatorio de gastos','','NC',NULL,2,3),(5,'2023-01-06 23:25:44.763530',NULL,'Criar relatorio de receitas','','NC',NULL,2,3),(6,'2023-01-06 23:26:52.491113',NULL,'Demitir pessoa 1','','NC',NULL,3,4),(7,'2023-01-06 23:26:56.507285',NULL,'Demitir pessoa 2','','NC',NULL,3,4),(8,'2023-01-06 23:26:59.803242',NULL,'Demitir pessoa 3','','NC',NULL,3,4),(9,'2023-01-06 23:27:28.104001',NULL,'Comprar salgados','','NC',NULL,4,5),(10,'2023-01-06 23:27:34.004959',NULL,'Comprar refri','','NC',NULL,4,5);
/*!40000 ALTER TABLE `tasks_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_tasklist`
--

DROP TABLE IF EXISTS `tasks_tasklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_tasklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `completed_on` datetime(6) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext,
  `status` varchar(2) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `team_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_tasklist_created_by_id_1d8bb34f_fk_users_profile_id` (`created_by_id`),
  KEY `tasks_tasklist_team_id_083445c5_fk_teams_team_id` (`team_id`),
  CONSTRAINT `tasks_tasklist_created_by_id_1d8bb34f_fk_users_profile_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_profile` (`id`),
  CONSTRAINT `tasks_tasklist_team_id_083445c5_fk_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_tasklist`
--

LOCK TABLES `tasks_tasklist` WRITE;
/*!40000 ALTER TABLE `tasks_tasklist` DISABLE KEYS */;
INSERT INTO `tasks_tasklist` VALUES (1,'2023-01-06 23:16:43.012433',NULL,'Programar backend','','C',1,'5b4efd7bd42040a0891a1302b2e014e5'),(2,'2023-01-06 23:16:58.716506',NULL,'Programar frontend','','C',1,'5b4efd7bd42040a0891a1302b2e014e5'),(3,'2023-01-06 23:17:25.782702',NULL,'Criar planilhas','','NC',2,'8fccd0f18a564227af440de9ea40813b'),(4,'2023-01-06 23:17:44.839105',NULL,'Demitir 3 pessoas','','NC',3,'317e25e8a9544402a88f753e6b260f5b'),(5,'2023-01-06 23:18:13.288351',NULL,'Fazer confraternização da firma','','NC',4,'9ca3ddef6a7844baa4ddc388117726a8');
/*!40000 ALTER TABLE `tasks_tasklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_team`
--

DROP TABLE IF EXISTS `teams_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_team` (
  `id` char(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `points` int NOT NULL,
  `completed_tasks_count` int NOT NULL,
  `notcompleted_tasks_count` int NOT NULL,
  `manager_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_id` (`manager_id`),
  CONSTRAINT `teams_team_manager_id_3f329f8c_fk_users_profile_id` FOREIGN KEY (`manager_id`) REFERENCES `users_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_team`
--

LOCK TABLES `teams_team` WRITE;
/*!40000 ALTER TABLE `teams_team` DISABLE KEYS */;
INSERT INTO `teams_team` VALUES ('317e25e8a9544402a88f753e6b260f5b','HR','media/teams/317e25e8-a954-4402-a88f-753e6b260f5b/images/main.png','2023-01-06 23:07:14.093739','Galera do RH',0,0,3,3),('5b4efd7bd42040a0891a1302b2e014e5','TI','media/teams/5b4efd7b-d420-40a0-891a-1302b2e014e5/images/main.png','2023-01-06 20:01:09.303576','Galera dos PC',30,3,0,1),('8fccd0f18a564227af440de9ea40813b','Finances','media/teams/8fccd0f1-8a56-4227-af44-0de9ea40813b/images/main.png','2023-01-06 23:06:46.404148','planilhas excel',0,0,2,2),('9ca3ddef6a7844baa4ddc388117726a8','Events','media/teams/9ca3ddef-6a78-44ba-a4dd-c388117726a8/images/main.jfif','2023-01-06 23:08:42.179771','Sem ideias',0,0,2,4);
/*!40000 ALTER TABLE `teams_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  `team_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_profile_team_id_14b6fa44_fk_teams_team_id` (`team_id`),
  CONSTRAINT `users_profile_team_id_14b6fa44_fk_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams_team` (`id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'media/accounts/1/images/profile_image.jfif',1,'5b4efd7bd42040a0891a1302b2e014e5'),(2,'',2,'8fccd0f18a564227af440de9ea40813b'),(3,'',3,'317e25e8a9544402a88f753e6b260f5b'),(4,'',4,'9ca3ddef6a7844baa4ddc388117726a8'),(5,'',5,'317e25e8a9544402a88f753e6b260f5b'),(6,'',6,'5b4efd7bd42040a0891a1302b2e014e5'),(7,'',7,NULL);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'taskly_api'
--

--
-- Dumping routines for database 'taskly_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-07 17:31:27

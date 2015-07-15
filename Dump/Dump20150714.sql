CREATE DATABASE  IF NOT EXISTS `vitae_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vitae_v1`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: vitae_v1
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `conf_group`
--

DROP TABLE IF EXISTS `conf_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_group` (
  `pk_conf_group` varchar(10) NOT NULL,
  `conf_group` varchar(45) NOT NULL,
  `fk_field_type` varchar(10) NOT NULL,
  `xml` varchar(45) NOT NULL,
  `pk_group` varchar(10) NOT NULL,
  `order` int(11) NOT NULL,
  `xml_description` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `conf_groupcol` varchar(45) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk_conf_group`),
  UNIQUE KEY `pk_group_type_UNIQUE` (`pk_conf_group`),
  KEY `fk_group_types_field_types1_idx` (`fk_field_type`),
  KEY `fk_conf_group_groups1_idx` (`pk_group`),
  CONSTRAINT `fk_group_types_field_types1` FOREIGN KEY (`fk_field_type`) REFERENCES `field_types` (`pk_field_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conf_group_groups1` FOREIGN KEY (`pk_group`) REFERENCES `groups` (`pk_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_group`
--

LOCK TABLES `conf_group` WRITE;
/*!40000 ALTER TABLE `conf_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_users`
--

DROP TABLE IF EXISTS `conf_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_users` (
  `pk_conf_user` varchar(10) NOT NULL,
  `fk_status` varchar(10) NOT NULL,
  `config` varchar(45) NOT NULL,
  `xml` varchar(45) NOT NULL,
  `fk_field_type` varchar(10) NOT NULL,
  PRIMARY KEY (`pk_conf_user`),
  UNIQUE KEY `pk_conf_user_UNIQUE` (`pk_conf_user`),
  KEY `fk_conf_users_status1_idx` (`fk_status`),
  KEY `fk_conf_users_field_types1_idx` (`fk_field_type`),
  CONSTRAINT `fk_conf_users_status1` FOREIGN KEY (`fk_status`) REFERENCES `status` (`pk_states`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conf_users_field_types1` FOREIGN KEY (`fk_field_type`) REFERENCES `field_types` (`pk_field_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_users`
--

LOCK TABLES `conf_users` WRITE;
/*!40000 ALTER TABLE `conf_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_types`
--

DROP TABLE IF EXISTS `field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_types` (
  `pk_field_type` varchar(10) NOT NULL,
  `field_type` varchar(45) NOT NULL,
  PRIMARY KEY (`pk_field_type`),
  UNIQUE KEY `pk_field type_UNIQUE` (`pk_field_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_types`
--

LOCK TABLES `field_types` WRITE;
/*!40000 ALTER TABLE `field_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `pk_group_users` varchar(10) NOT NULL,
  `fk_group` varchar(10) NOT NULL,
  `fk_user` varchar(10) NOT NULL,
  `order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk_group_users`),
  UNIQUE KEY `pk_group_users_UNIQUE` (`pk_group_users`),
  KEY `fk_group_users_groups1_idx` (`fk_group`),
  KEY `fk_group_users_users1_idx` (`fk_user`),
  CONSTRAINT `fk_group_users_groups1` FOREIGN KEY (`fk_group`) REFERENCES `groups` (`pk_group`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_users_users1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`pk_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `pk_group` varchar(10) NOT NULL,
  `group` varchar(100) NOT NULL,
  `fk_states` varchar(10) NOT NULL,
  `xml` varchar(45) NOT NULL,
  `active_xml` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk_group`),
  UNIQUE KEY `pk_group_UNIQUE` (`pk_group`),
  KEY `fk_groups_status1_idx` (`fk_states`),
  CONSTRAINT `fk_groups_status1` FOREIGN KEY (`fk_states`) REFERENCES `status` (`pk_states`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inf_groups`
--

DROP TABLE IF EXISTS `inf_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inf_groups` (
  `pk_inf_group` varchar(10) NOT NULL,
  `fk_conf_group` varchar(10) NOT NULL,
  `fk_group_users` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`pk_inf_group`),
  UNIQUE KEY `pk_inf_group_UNIQUE` (`pk_inf_group`),
  KEY `fk_table6_conf_group1_idx` (`fk_conf_group`),
  KEY `fk_inf_groups_group_users1_idx` (`fk_group_users`),
  CONSTRAINT `fk_table6_conf_group1` FOREIGN KEY (`fk_conf_group`) REFERENCES `conf_group` (`pk_conf_group`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inf_groups_group_users1` FOREIGN KEY (`fk_group_users`) REFERENCES `group_users` (`pk_group_users`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inf_groups`
--

LOCK TABLES `inf_groups` WRITE;
/*!40000 ALTER TABLE `inf_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `inf_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inf_users`
--

DROP TABLE IF EXISTS `inf_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inf_users` (
  `pk_inf_user` varchar(10) NOT NULL,
  `value` text NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `fk_conf_user` varchar(10) NOT NULL,
  `fk_user` varchar(10) NOT NULL,
  PRIMARY KEY (`pk_inf_user`),
  UNIQUE KEY `pk_inf_user_UNIQUE` (`pk_inf_user`),
  KEY `fk_inf_users_conf_users2_idx` (`fk_conf_user`),
  KEY `fk_inf_users_users2_idx` (`fk_user`),
  CONSTRAINT `fk_inf_users_conf_users2` FOREIGN KEY (`fk_conf_user`) REFERENCES `conf_users` (`pk_conf_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inf_users_users2` FOREIGN KEY (`fk_user`) REFERENCES `users` (`pk_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inf_users`
--

LOCK TABLES `inf_users` WRITE;
/*!40000 ALTER TABLE `inf_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `inf_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `pk_language` varchar(10) NOT NULL,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`pk_language`),
  UNIQUE KEY `pk_language_UNIQUE` (`pk_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalities`
--

DROP TABLE IF EXISTS `nationalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationalities` (
  `pk_nationality` varchar(10) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  PRIMARY KEY (`pk_nationality`),
  UNIQUE KEY `pk_nationality_UNIQUE` (`pk_nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
/*!40000 ALTER TABLE `nationalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `pk_professions` varchar(10) NOT NULL,
  `profession` varchar(45) NOT NULL,
  `fk_language` varchar(10) NOT NULL,
  PRIMARY KEY (`pk_professions`),
  UNIQUE KEY `pk_professions_UNIQUE` (`pk_professions`),
  KEY `fk_professions_languages1_idx` (`fk_language`),
  CONSTRAINT `fk_professions_languages1` FOREIGN KEY (`fk_language`) REFERENCES `languages` (`pk_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `pk_states` varchar(10) NOT NULL,
  `states` varchar(45) NOT NULL,
  PRIMARY KEY (`pk_states`),
  UNIQUE KEY `pk_states_UNIQUE` (`pk_states`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `pk_template` varchar(10) NOT NULL,
  `template` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `fk_states` varchar(10) NOT NULL,
  PRIMARY KEY (`pk_template`),
  UNIQUE KEY `pk_template_UNIQUE` (`pk_template`),
  KEY `fk_templates_status1_idx` (`fk_states`),
  CONSTRAINT `fk_templates_status1` FOREIGN KEY (`fk_states`) REFERENCES `status` (`pk_states`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user`
--

DROP TABLE IF EXISTS `user`;
/*!50001 DROP VIEW IF EXISTS `user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user` (
  `pk_user` tinyint NOT NULL,
  `fk_nationality` tinyint NOT NULL,
  `user` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `phone_home` tinyint NOT NULL,
  `cell_phone` tinyint NOT NULL,
  `phone_office` tinyint NOT NULL,
  `alternate email` tinyint NOT NULL,
  `fk_professions` tinyint NOT NULL,
  `pk_professions` tinyint NOT NULL,
  `profession` tinyint NOT NULL,
  `fk_language` tinyint NOT NULL,
  `pk_nationality` tinyint NOT NULL,
  `nationality` tinyint NOT NULL,
  `pk_language` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_templates`
--

DROP TABLE IF EXISTS `user_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_templates` (
  `pk_user_template` varchar(10) NOT NULL,
  `fk_template` varchar(10) NOT NULL,
  `fk_user` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk_user_template`),
  UNIQUE KEY `pk_user_template_UNIQUE` (`pk_user_template`),
  KEY `fk_user_templates_templates1_idx` (`fk_template`),
  KEY `fk_user_templates_users1_idx` (`fk_user`),
  CONSTRAINT `fk_user_templates_templates1` FOREIGN KEY (`fk_template`) REFERENCES `templates` (`pk_template`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_templates_users1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`pk_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_templates`
--

LOCK TABLES `user_templates` WRITE;
/*!40000 ALTER TABLE `user_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `pk_user` varchar(10) NOT NULL,
  `fk_nationality` varchar(10) NOT NULL,
  `user` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_home` varchar(45) DEFAULT NULL,
  `cell_phone` varchar(45) DEFAULT NULL,
  `phone_office` varchar(45) DEFAULT NULL,
  `alternate email` varchar(100) DEFAULT NULL,
  `fk_professions` varchar(10) NOT NULL,
  PRIMARY KEY (`pk_user`),
  UNIQUE KEY `pk_user_UNIQUE` (`pk_user`),
  KEY `fk_users_nationalities_idx` (`fk_nationality`),
  KEY `fk_users_professions1_idx` (`fk_professions`),
  CONSTRAINT `fk_users_nationalities` FOREIGN KEY (`fk_nationality`) REFERENCES `nationalities` (`pk_nationality`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_professions1` FOREIGN KEY (`fk_professions`) REFERENCES `professions` (`pk_professions`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `user`
--

/*!50001 DROP TABLE IF EXISTS `user`*/;
/*!50001 DROP VIEW IF EXISTS `user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user` AS select `u`.`pk_user` AS `pk_user`,`u`.`fk_nationality` AS `fk_nationality`,`u`.`user` AS `user`,`u`.`email` AS `email`,`u`.`password` AS `password`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`phone_home` AS `phone_home`,`u`.`cell_phone` AS `cell_phone`,`u`.`phone_office` AS `phone_office`,`u`.`alternate email` AS `alternate email`,`u`.`fk_professions` AS `fk_professions`,`p`.`pk_professions` AS `pk_professions`,`p`.`profession` AS `profession`,`p`.`fk_language` AS `fk_language`,`n`.`pk_nationality` AS `pk_nationality`,`n`.`nationality` AS `nationality`,`i`.`pk_language` AS `pk_language`,`i`.`language` AS `language` from (((`users` `u` join `professions` `p`) join `nationalities` `n`) join `languages` `i`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-14 20:45:36

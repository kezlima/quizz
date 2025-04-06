-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: teste
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `quant_moedas` int DEFAULT NULL,
  `ponto_atual` int DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('','',0,0),('Eduarda Gomes','00000000000',60,4),('Afonso Gomes','01010101010',40,4),('Alfredo','01159316430',50,5),('Eduardo','09090909090',20,2),('Diego','11111111111',70,7),('Aline','12345678911',50,5),('luiz','12356663452',110,11),('Fabiano','21212121212',20,2),('Osvaldo','22222222222',0,0),('Carla maria','23690380048',0,0),('Carla maria','23690380049',230,23),('Carla maria','23790380048',80,8),('João Paulo','24242424242',20,2),('Angeline','31313131313',80,8),('Aparecida','33333333333',40,4),('Joana','44444444444',0,0),('henrique','55555555555',80,8),('Maria Anderson','65656565656',20,2),('Luciana Gomes','66666666666',30,3),('Ana Laura','71657384440',170,17),('George','77777777777',70,7),('Filipe','87878787874',80,8),('Amanda Gomes','88888888888',80,8),('Ursula','91919191912',80,8),('Luardo','93939393939',20,2),('Maria','98765432111',30,3),('Anbrosio','99999999999',50,5);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_material`
--

DROP TABLE IF EXISTS `aluno_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aluno_cpf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_material` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno` (`aluno_cpf`),
  KEY `fk_material` (`id_material`),
  CONSTRAINT `fk_aluno` FOREIGN KEY (`aluno_cpf`) REFERENCES `aluno` (`cpf`) ON DELETE CASCADE,
  CONSTRAINT `fk_material` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_material`
--

LOCK TABLES `aluno_material` WRITE;
/*!40000 ALTER TABLE `aluno_material` DISABLE KEYS */;
INSERT INTO `aluno_material` VALUES (2,'00000000000',9),(3,'23690380049',2),(4,'23690380049',8),(5,'23690380049',10),(6,'23690380049',11),(7,'11111111111',11),(8,'23690380049',3),(9,'71657384440',2),(10,'71657384440',9),(11,'71657384440',11),(12,'23690380049',7),(13,'12356663452',2),(14,'12356663452',3),(15,'12356663452',3),(16,'12356663452',7),(17,'12356663452',11),(18,'12356663452',8),(19,'12356663452',9),(20,'11111111111',2),(21,'11111111111',3),(22,'11111111111',10),(23,'11111111111',8),(24,'11111111111',7),(25,'11111111111',9),(26,'71657384440',3),(27,'71657384440',7),(28,'71657384440',8),(29,'71657384440',10),(30,'12345678911',2),(31,'12345678911',10),(32,'00000000000',2),(33,'00000000000',3),(34,'00000000000',7),(35,'00000000000',8),(36,'77777777777',2),(37,'77777777777',3),(38,'77777777777',7),(39,'77777777777',8),(40,'77777777777',10),(41,'77777777777',11),(42,'77777777777',9),(43,'12356663452',10),(44,'01010101010',2),(45,'01010101010',3),(46,'01010101010',7),(47,'01010101010',8),(48,'99999999999',2),(49,'99999999999',3),(50,'99999999999',7),(51,'99999999999',8),(52,'99999999999',11),(53,'21212121212',2),(54,'21212121212',3),(55,'87878787874',2),(56,'87878787874',3),(57,'65656565656',2),(58,'65656565656',3),(59,'24242424242',9),(60,'24242424242',12),(61,'87878787874',7),(62,'87878787874',8),(63,'87878787874',10),(64,'87878787874',11),(65,'87878787874',9),(66,'87878787874',12),(67,'91919191912',2),(68,'91919191912',3),(69,'91919191912',7),(70,'91919191912',8),(71,'91919191912',10),(72,'91919191912',11),(73,'55555555555',2),(74,'55555555555',3),(75,'55555555555',7),(76,'55555555555',8),(77,'55555555555',10),(78,'55555555555',9),(79,'55555555555',12),(80,'55555555555',11),(81,'91919191912',9),(82,'91919191912',12),(83,'88888888888',2),(84,'88888888888',3),(85,'88888888888',7),(86,'88888888888',8),(87,'88888888888',10),(88,'88888888888',11),(89,'88888888888',9),(90,'88888888888',12),(91,'01159316430',2),(92,'01159316430',3),(93,'01159316430',7),(94,'01159316430',8),(95,'01159316430',11),(96,'23790380048',2),(97,'23790380048',3),(98,'23790380048',7),(99,'23790380048',8),(100,'23790380048',10),(101,'23790380048',11),(102,'23790380048',9),(103,'23790380048',12),(104,'33333333333',2),(105,'33333333333',3),(106,'33333333333',9),(107,'33333333333',12),(108,'31313131313',2),(109,'31313131313',3),(110,'31313131313',7),(111,'31313131313',8),(112,'31313131313',10),(113,'31313131313',9),(114,'31313131313',11),(115,'31313131313',12),(116,'66666666666',2),(117,'66666666666',10),(118,'66666666666',12),(119,'93939393939',2),(120,'93939393939',3),(121,'23690380049',12),(122,'23690380049',9),(123,'09090909090',2),(124,'09090909090',7);
/*!40000 ALTER TABLE `aluno_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `conteudo` varchar(2000) DEFAULT NULL,
  `id_percurso` int NOT NULL,
  `etapa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pertence_idx` (`id_percurso`),
  CONSTRAINT `pertence` FOREIGN KEY (`id_percurso`) REFERENCES `percurso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (2,'o que é variavel?','https://youtu.be/Vbabsye7mWo',1,1),(3,'variaveis com python','https://www.cos.ufrj.br/~bfgoldstein/python/compI/slides/aula4_teorica.pdf',1,1),(7,'Aprendendo html','https://www.bing.com/ck/a?!&&p=9fd051bc05034de5ba37dea543cb8a97f9f4a9900fd1ba9fbbbebf78b93257c1JmltdHM9MTc0MjY4ODAwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9aHRtbCtkbyt6ZXJvJm1pZD1GNDgzRUYyQTMzM0E5Njg3QzkyN0Y0ODNFRjJBMzMzQTk2ODdDOTI3Jm1jaWQ9NjAyQTYzQTA2QkFCNEU0OUE1REMxQjUyOTkwQjZDRDMmRk9STT1WSVJF&ntb=1',1,1),(8,'Aprendendo html','https://www.bing.com/ck/a?!&&p=9fd051bc05034de5ba37dea543cb8a97f9f4a9900fd1ba9fbbbebf78b93257c1JmltdHM9MTc0MjY4ODAwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9aHRtbCtkbyt6ZXJvJm1pZD1GNDgzRUYyQTMzM0E5Njg3QzkyN0Y0ODNFRjJBMzMzQTk2ODdDOTI3Jm1jaWQ9NjAyQTYzQTA2QkFCNEU0OUE1REMxQjUyOTkwQjZDRDMmRk9STT1WSVJF&ntb=1',1,1),(9,'Aprendendo Flask','https://www.bing.com/ck/a?!&&p=1443dbafe2dd89b26896ed7f23a5445ffc4b4d307410c04ef981a04dae1d074eJmltdHM9MTc0MzAzMzYwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9YXByZW5kZW5kbytmbGFzaytkbyt6ZXJvJm1pZD0yQzM2NTRCRTYxQTEyMEYzMzgyNjJDMzY1NEJFNjFBMTIwRjMzODI2JkZPUk09VklSRQ&ntb=1',2,1),(10,'aprendendo javaScript','https://www.google.com/search?q=aprendendo+javascript&oq=aprendendo+java+&gs_lcrp=EgZjaHJvbWUqCQgCEAAYChiABDILCAAQRRgKGDkYgAQyBwgBEAAYgAQyCQgCEAAYChiABDIHCAMQABiABDIJCAQQABgKGIAEMgkIBRAuGAoYgAQyCQgGEAAYChiABDIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCTEwMDc2ajBqN6gCCLACAfEF7ebYRgyKi0c&sourceid=chrome&ie=UTF-8#',1,2),(11,'aprendendo javaScript','https://www.google.com/search?q=aprendendo+javascript&oq=aprendendo+java+&gs_lcrp=EgZjaHJvbWUqCQgCEAAYChiABDILCAAQRRgKGDkYgAQyBwgBEAAYgAQyCQgCEAAYChiABDIHCAMQABiABDIJCAQQABgKGIAEMgkIBRAuGAoYgAQyCQgGEAAYChiABDIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCTEwMDc2ajBqN6gCCLACAfEF7ebYRgyKi0c&sourceid=chrome&ie=UTF-8#',1,2),(12,'Aprendendo CSS','https://youtu.be/vwbegraDXD8',2,1);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percurso`
--

DROP TABLE IF EXISTS `percurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percurso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percurso`
--

LOCK TABLES `percurso` WRITE;
/*!40000 ALTER TABLE `percurso` DISABLE KEYS */;
INSERT INTO `percurso` VALUES (1,'1 bimestre','conceitos fundamentais da programação'),(2,'2 bimestre','Introdução a aprendizagem do Flask');
/*!40000 ALTER TABLE `percurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_quiz`
--

DROP TABLE IF EXISTS `pergunta_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta_quiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_percurso` int NOT NULL,
  `pergunta` text,
  `opcao_a` varchar(255) DEFAULT NULL,
  `opcao_b` varchar(255) DEFAULT NULL,
  `opcao_c` varchar(255) DEFAULT NULL,
  `resposta_correta` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_percurso` (`id_percurso`),
  CONSTRAINT `pergunta_quiz_ibfk_1` FOREIGN KEY (`id_percurso`) REFERENCES `percurso` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_quiz`
--

LOCK TABLES `pergunta_quiz` WRITE;
/*!40000 ALTER TABLE `pergunta_quiz` DISABLE KEYS */;
INSERT INTO `pergunta_quiz` VALUES (1,1,'O que é uma variável?','É uma linguagem de programação','Um outro nome para While',' É um nome simbólico associado a um valor ou dado armazenado na memória do computador','c'),(2,2,'O que é HTML?','É uma linguagem de programação','Linguagem de marcação',' É um nome simbólico associado a um valor ou dado armazenado na memória do computador','B');
/*!40000 ALTER TABLE `pergunta_quiz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 19:58:29

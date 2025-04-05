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
INSERT INTO `aluno` VALUES ('','',0,0),('Eduarda Gomes','00000000000',20,0),('Diego','11111111111',70,7),('Aline','12345678911',30,3),('luiz','12356663452',100,10),('Carla maria','23690380048',0,0),('Carla maria','23690380049',210,21),('Carla maria','23790380048',0,0),('Ana Laura','71657384440',130,13),('Maria','98765432111',30,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_material`
--

LOCK TABLES `aluno_material` WRITE;
/*!40000 ALTER TABLE `aluno_material` DISABLE KEYS */;
INSERT INTO `aluno_material` VALUES (2,'00000000000',9),(3,'23690380049',2),(4,'23690380049',8),(5,'23690380049',10),(6,'23690380049',11),(7,'11111111111',11),(8,'23690380049',3),(9,'71657384440',2),(10,'71657384440',9),(11,'71657384440',11),(12,'23690380049',7),(13,'12356663452',2),(14,'12356663452',3),(15,'12356663452',3),(16,'12356663452',7),(17,'12356663452',11),(18,'12356663452',8),(19,'12356663452',9),(20,'11111111111',2),(21,'11111111111',3),(22,'11111111111',10),(23,'11111111111',8),(24,'11111111111',7),(25,'11111111111',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (2,'o que é variavel?','https://youtu.be/Vbabsye7mWo',1,1),(3,'variaveis com python','https://www.cos.ufrj.br/~bfgoldstein/python/compI/slides/aula4_teorica.pdf',1,1),(7,'Aprendendo html','https://www.bing.com/ck/a?!&&p=9fd051bc05034de5ba37dea543cb8a97f9f4a9900fd1ba9fbbbebf78b93257c1JmltdHM9MTc0MjY4ODAwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9aHRtbCtkbyt6ZXJvJm1pZD1GNDgzRUYyQTMzM0E5Njg3QzkyN0Y0ODNFRjJBMzMzQTk2ODdDOTI3Jm1jaWQ9NjAyQTYzQTA2QkFCNEU0OUE1REMxQjUyOTkwQjZDRDMmRk9STT1WSVJF&ntb=1',1,1),(8,'Aprendendo html','https://www.bing.com/ck/a?!&&p=9fd051bc05034de5ba37dea543cb8a97f9f4a9900fd1ba9fbbbebf78b93257c1JmltdHM9MTc0MjY4ODAwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9aHRtbCtkbyt6ZXJvJm1pZD1GNDgzRUYyQTMzM0E5Njg3QzkyN0Y0ODNFRjJBMzMzQTk2ODdDOTI3Jm1jaWQ9NjAyQTYzQTA2QkFCNEU0OUE1REMxQjUyOTkwQjZDRDMmRk9STT1WSVJF&ntb=1',1,1),(9,'Aprendendo Flask','https://www.bing.com/ck/a?!&&p=1443dbafe2dd89b26896ed7f23a5445ffc4b4d307410c04ef981a04dae1d074eJmltdHM9MTc0MzAzMzYwMA&ptn=3&ver=2&hsh=4&fclid=1b3c32a6-01a1-68ad-0278-27b7007a69eb&u=a1L3ZpZGVvcy9yaXZlcnZpZXcvcmVsYXRlZHZpZGVvP3E9YXByZW5kZW5kbytmbGFzaytkbyt6ZXJvJm1pZD0yQzM2NTRCRTYxQTEyMEYzMzgyNjJDMzY1NEJFNjFBMTIwRjMzODI2JkZPUk09VklSRQ&ntb=1',2,1),(10,'aprendendo javaScript','https://www.google.com/search?q=aprendendo+javascript&oq=aprendendo+java+&gs_lcrp=EgZjaHJvbWUqCQgCEAAYChiABDILCAAQRRgKGDkYgAQyBwgBEAAYgAQyCQgCEAAYChiABDIHCAMQABiABDIJCAQQABgKGIAEMgkIBRAuGAoYgAQyCQgGEAAYChiABDIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCTEwMDc2ajBqN6gCCLACAfEF7ebYRgyKi0c&sourceid=chrome&ie=UTF-8#',1,2),(11,'aprendendo javaScript','https://www.google.com/search?q=aprendendo+javascript&oq=aprendendo+java+&gs_lcrp=EgZjaHJvbWUqCQgCEAAYChiABDILCAAQRRgKGDkYgAQyBwgBEAAYgAQyCQgCEAAYChiABDIHCAMQABiABDIJCAQQABgKGIAEMgkIBRAuGAoYgAQyCQgGEAAYChiABDIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCTEwMDc2ajBqN6gCCLACAfEF7ebYRgyKi0c&sourceid=chrome&ie=UTF-8#',1,2);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 22:07:26

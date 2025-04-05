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
  `nome` varchar(500) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `quant_moedas` int DEFAULT NULL,
  `ponto_atual` int DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('','',0,0),('Aline','12345678911',20,2),('luiz','12356663452',0,0),('Carla maria','23690380048',0,0),('Carla maria','23690380049',80,8),('Carla maria','23790380048',0,0),('Ana Laura','71657384440',100,10),('Maria','98765432111',0,0);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (2,'o que é variavel?','https://youtu.be/Vbabsye7mWo',1,1),(3,'variaveis com python','https://www.cos.ufrj.br/~bfgoldstein/python/compI/slides/aula4_teorica.pdf',1,1);
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
  `cpf_aluno` varchar(11) DEFAULT NULL,
  `ponto_atual` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cpf_aluno` (`cpf_aluno`),
  CONSTRAINT `fk_cpf_aluno` FOREIGN KEY (`cpf_aluno`) REFERENCES `aluno` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percurso`
--

LOCK TABLES `percurso` WRITE;
/*!40000 ALTER TABLE `percurso` DISABLE KEYS */;
INSERT INTO `percurso` VALUES (1,'1 bimestre','conceitos fundamentais da programação',NULL,NULL);
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

-- Dump completed on 2025-02-08  6:34:01

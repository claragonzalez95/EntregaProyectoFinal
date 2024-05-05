-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: burguer_house
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `calificacion_id` int NOT NULL AUTO_INCREMENT,
  `local_id` int NOT NULL,
  `calificacion` int NOT NULL,
  `opinion` varchar(200) NOT NULL,
  PRIMARY KEY (`calificacion_id`),
  KEY `fk_calificaciones_locales` (`local_id`),
  CONSTRAINT `fk_calificaciones_locales` FOREIGN KEY (`local_id`) REFERENCES `locales` (`local_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,2,6,'¡Excelente servicio y comida deliciosa! Definitivamente volveré pronto.'),(2,5,3,'La comida no estuvo a la altura de mis expectativas. No lo recomendaría.'),(3,2,7,'Muy buen ambiente y personal amable. La comida estaba deliciosa.'),(4,1,7,'¡Increíble experiencia! La hamburguesa estaba perfectamente cocinada.'),(5,4,1,'Decepcionante. La comida estaba fría y mal preparada.'),(6,2,4,'Servicio rápido, pero la calidad de la comida dejó mucho que desear.'),(7,1,2,'No quedé impresionado con la comida ni con el servicio.'),(8,1,5,'Buena comida a un precio razonable. El servicio podría mejorar.'),(9,2,9,'¡Increíble! Probablemente la mejor hamburguesa que he tenido.'),(10,4,4,'La comida estaba bien, pero el servicio fue lento y desorganizado.'),(11,4,5,'Buena comida y ambiente acogedor. Definitivamente regresaré.'),(12,4,7,'¡La mejor hamburguesa que he probado en mucho tiempo!'),(13,2,8,'Servicio excepcional y comida deliciosa. Altamente recomendado.'),(14,4,8,'Increíble experiencia gastronómica. El personal fue muy atento.'),(15,4,7,'La comida estaba deliciosa, pero el restaurante estaba un poco sucio.'),(16,5,3,'La comida era mediocre y el servicio era lento.'),(17,3,5,'Buena comida y servicio amable. Volveré en el futuro.'),(18,5,9,'¡Simplemente increíble! La mejor hamburguesa que he probado.'),(19,3,1,'La comida estaba fría y sin sabor. Definitivamente no volveré.'),(20,1,1,'Experiencia terrible. La comida estaba quemada y el servicio fue pésimo.'),(21,2,4,'La comida era decente, pero el lugar estaba muy concurrido.'),(22,1,3,'La comida no cumplió mis expectativas. El servicio fue lento.'),(23,5,9,'La hamburguesa estaba deliciosa y el personal era muy amable.'),(24,2,5,'La comida era aceptable, pero nada especial.'),(25,4,10,'¡La mejor hamburguesa que he probado en mi vida!'),(26,2,8,'La comida estaba deliciosa y el servicio fue excelente.'),(27,4,6,'La comida era decente, pero el restaurante estaba un poco descuidado.'),(28,4,3,'La comida tardó mucho en llegar y no estaba tan buena como esperaba.'),(29,5,6,'La hamburguesa estaba bien, pero el servicio fue lento.'),(30,4,8,'Buena comida y ambiente agradable. El servicio podría ser más rápido.');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 17:20:44

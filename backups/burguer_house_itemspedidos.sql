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
-- Table structure for table `itemspedidos`
--

DROP TABLE IF EXISTS `itemspedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemspedidos` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `precio_unitario` decimal(11,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_itemspedidos_pedidos` (`pedido_id`),
  CONSTRAINT `fk_itemspedidos_pedidos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemspedidos`
--

LOCK TABLES `itemspedidos` WRITE;
/*!40000 ALTER TABLE `itemspedidos` DISABLE KEYS */;
INSERT INTO `itemspedidos` VALUES (1,9,'Big Mac',9194.00,4),(2,6,'Whopper',2319.00,2),(3,12,'McNífica',6790.00,1),(4,8,'Coca-Cola',479.00,3),(5,4,'Coca-Cola',8079.00,1),(6,17,'Chicken Burger',9189.00,2),(7,16,'Double Cheeseburger',8864.00,4),(8,14,'Sprite',2378.00,2),(9,6,'Whopper',5900.00,5),(10,4,'Coca-Cola',7924.00,5),(11,20,'Big King',2238.00,1),(12,10,'Chicken Burger',9221.00,5),(13,8,'Coca-Cola',734.00,3),(14,3,'McNífica',614.00,2),(15,12,'Sprite',2428.00,4),(16,18,'Double Cheeseburger',6819.00,1),(17,7,'Big Mac',3977.00,5),(18,14,'Sprite',2604.00,1),(19,20,'Ice Cream Cone',4702.00,2),(20,20,'McFlurry',6412.00,5),(21,3,'Root Beer',6827.00,5),(22,19,'Onion Rings',3176.00,3),(23,5,'Hot Dog',6382.00,3),(24,11,'Fish Burger',3931.00,5),(25,18,'McFlurry',491.00,1);
/*!40000 ALTER TABLE `itemspedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 17:20:45

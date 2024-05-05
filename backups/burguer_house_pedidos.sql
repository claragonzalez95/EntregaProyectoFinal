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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total_pedido` decimal(11,2) NOT NULL,
  `cliente_id` int NOT NULL,
  `local_id` int NOT NULL,
  `promocion_id` int DEFAULT NULL,
  `mesa_id` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedidos_clientes` (`cliente_id`),
  KEY `fk_pedidos_locales` (`local_id`),
  KEY `fk_pedidos_promociones` (`promocion_id`),
  KEY `fk_pedidos_mesas` (`mesa_id`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `fk_pedidos_locales` FOREIGN KEY (`local_id`) REFERENCES `locales` (`local_id`),
  CONSTRAINT `fk_pedidos_mesas` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`mesa_id`),
  CONSTRAINT `fk_pedidos_promociones` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`promocion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2023-10-13',62.22,1,4,1,4),(2,'2023-12-13',11.57,6,1,2,3),(3,'2023-11-01',72.09,3,5,1,1),(4,'2023-09-26',77.11,9,5,1,1),(5,'2023-10-05',93.89,12,3,1,1),(6,'2023-11-28',94.05,14,4,2,1),(7,'2023-07-06',22.58,5,1,3,1),(8,'2023-07-03',43.48,11,4,4,1),(9,'2023-12-11',66.39,11,4,1,1),(10,'2024-01-22',7.76,9,4,1,1),(11,'2023-10-19',84.84,3,1,4,5),(12,'2023-09-03',40.88,14,3,1,1),(13,'2023-06-17',74.49,6,2,1,1),(14,'2023-06-15',58.84,6,2,1,1),(15,'2023-04-12',46.50,11,2,1,1),(16,'2023-12-14',85.31,13,3,1,1),(17,'2023-06-25',47.65,15,5,1,1),(18,'2023-03-27',16.25,14,3,1,1),(19,'2023-11-14',41.09,6,5,1,1),(20,'2023-06-25',58.22,9,1,1,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CalcularTotalPedido` BEFORE INSERT ON `pedidos` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(precio_unitario * cantidad) INTO total
    FROM Items_de_Pedidos
    WHERE pedido_id = NEW.pedido_id;
    SET NEW.total_pedido = total;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarInventarioDespuesDePedido` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
    DECLARE producto_id INT;
    DECLARE cantidad INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT producto_id, cantidad FROM Items_de_Pedidos WHERE pedido_id = NEW.pedido_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO producto_id, cantidad;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Inventarios
        SET cantidad_disponible = cantidad_disponible - cantidad
        WHERE producto_id = producto_id;
    END LOOP;

    CLOSE cur;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 17:20:45

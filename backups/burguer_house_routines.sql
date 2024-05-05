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
-- Temporary view structure for view `vw_promociones_por_pedidos`
--

DROP TABLE IF EXISTS `vw_promociones_por_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_promociones_por_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_promociones_por_pedidos` AS SELECT 
 1 AS `pedido_id`,
 1 AS `fecha`,
 1 AS `total_pedido`,
 1 AS `nombre_promocion`,
 1 AS `descuento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cajeros_por_local`
--

DROP TABLE IF EXISTS `vw_cajeros_por_local`;
/*!50001 DROP VIEW IF EXISTS `vw_cajeros_por_local`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cajeros_por_local` AS SELECT 
 1 AS `empleado_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `puesto`,
 1 AS `nombre_local`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_promocion_mas_utilizada`
--

DROP TABLE IF EXISTS `vw_promocion_mas_utilizada`;
/*!50001 DROP VIEW IF EXISTS `vw_promocion_mas_utilizada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_promocion_mas_utilizada` AS SELECT 
 1 AS `promocion_id`,
 1 AS `cantidad_utilizada`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pedidos_calificaciones_detractoras`
--

DROP TABLE IF EXISTS `vw_pedidos_calificaciones_detractoras`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_calificaciones_detractoras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_calificaciones_detractoras` AS SELECT 
 1 AS `pedido_id`,
 1 AS `fecha`,
 1 AS `total_pedido`,
 1 AS `calificacion`,
 1 AS `opinion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mayores_pedidos_por_local`
--

DROP TABLE IF EXISTS `vw_mayores_pedidos_por_local`;
/*!50001 DROP VIEW IF EXISTS `vw_mayores_pedidos_por_local`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mayores_pedidos_por_local` AS SELECT 
 1 AS `pedido_id`,
 1 AS `fecha`,
 1 AS `total_pedido`,
 1 AS `nombre_cliente`,
 1 AS `nombre_local`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_promociones_por_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_promociones_por_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_promociones_por_pedidos` AS select `p`.`pedido_id` AS `pedido_id`,`p`.`fecha` AS `fecha`,`p`.`total_pedido` AS `total_pedido`,`pr`.`nombre` AS `nombre_promocion`,`pr`.`descuento` AS `descuento` from (`pedidos` `p` left join `promociones` `pr` on((`p`.`promocion_id` = `pr`.`promocion_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cajeros_por_local`
--

/*!50001 DROP VIEW IF EXISTS `vw_cajeros_por_local`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cajeros_por_local` AS select `e`.`empleado_id` AS `empleado_id`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`e`.`puesto` AS `puesto`,`l`.`nombre` AS `nombre_local` from (`empleados` `e` join `locales` `l` on((`e`.`local_id` = `l`.`local_id`))) where (`e`.`puesto` = 'Cajero/a') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_promocion_mas_utilizada`
--

/*!50001 DROP VIEW IF EXISTS `vw_promocion_mas_utilizada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_promocion_mas_utilizada` AS select `pedidos`.`promocion_id` AS `promocion_id`,count(0) AS `cantidad_utilizada` from `pedidos` where (`pedidos`.`promocion_id` is not null) group by `pedidos`.`promocion_id` order by count(0) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pedidos_calificaciones_detractoras`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_calificaciones_detractoras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_calificaciones_detractoras` AS select `p`.`pedido_id` AS `pedido_id`,`p`.`fecha` AS `fecha`,`p`.`total_pedido` AS `total_pedido`,`c`.`calificacion` AS `calificacion`,`c`.`opinion` AS `opinion` from (`pedidos` `p` join `calificaciones` `c` on((`p`.`local_id` = `c`.`local_id`))) where (`c`.`calificacion` < 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mayores_pedidos_por_local`
--

/*!50001 DROP VIEW IF EXISTS `vw_mayores_pedidos_por_local`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mayores_pedidos_por_local` AS select `p`.`pedido_id` AS `pedido_id`,`p`.`fecha` AS `fecha`,`p`.`total_pedido` AS `total_pedido`,`c`.`nombre` AS `nombre_cliente`,`l`.`nombre` AS `nombre_local` from ((`pedidos` `p` join `locales` `l` on((`p`.`local_id` = `l`.`local_id`))) join `clientes` `c` on((`p`.`cliente_id` = `c`.`cliente_id`))) where (`p`.`total_pedido` > 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'burguer_house'
--

--
-- Dumping routines for database 'burguer_house'
--
/*!50003 DROP FUNCTION IF EXISTS `CalificacionPorLocal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalificacionPorLocal`(local_id INT) RETURNS decimal(4,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE calificacion_promedio DECIMAL(4, 2);
    SELECT AVG(calificacion) INTO calificacion_promedio FROM calificaciones WHERE local_id = local_id;
    RETURN calificacion_promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VentasPorLocal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VentasPorLocal`(local_id INT) RETURNS decimal(11,2)
    READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(11, 2);
    
    SELECT SUM(total_pedido) INTO total_ventas
    FROM pedidos
    WHERE local_id = local_id;
    
    RETURN total_ventas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ST_InsertarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_InsertarPedido`(
    IN p_fecha DATE,
    IN p_total_pedido DECIMAL(11, 2),
    IN p_cliente_id INT,
    IN p_local_id INT,
    IN p_promocion_id INT
)
BEGIN

    INSERT INTO pedidos (fecha, total_pedido, cliente_id, local_id, promocion_id)
    VALUES (p_fecha, p_total_pedido, p_cliente_id, p_local_id, p_promocion_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ST_OrdenarTablas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ST_OrdenarTablas`(
IN columna VARCHAR (50))
BEGIN
SET @query_stmt = CONCAT("SELECT * 
FROM burguer_house.PEDIDOS
ORDER BY " , columna) ;
PREPARE stmt FROM @query_stmt ;
EXECUTE stmt ;
DEALLOCATE PREPARE stmt;
END ;;
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

-- Dump completed on 2024-05-04 17:20:46

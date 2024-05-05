DROP DATABASE IF EXISTS burguer_house;
CREATE DATABASE burguer_house;
USE burguer_house;

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE locales (
    local_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE mesas(
    mesa_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    local_id INT NOT NULL,
	capacidad INT NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE promociones (
    promocion_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descuento DECIMAL(11, 2) NOT NULL,
	fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    total_pedido DECIMAL(11, 2) NOT NULL,
    cliente_id INT NOT NULL,
    local_id INT NOT NULL,
    promocion_id INT,
    mesa_id INT 
    );

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_clientes
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_promociones
FOREIGN KEY (promocion_id) REFERENCES promociones(promocion_id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_mesas
FOREIGN KEY (mesa_id) REFERENCES mesas(mesa_id);

CREATE TABLE empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    local_id INT NOT NULL
);

ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);

CREATE TABLE itemspedidos (
    item_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
	nombre_producto VARCHAR(50) NOT NULL,
    precio_unitario DECIMAL(11,2) NOT NULL,
    cantidad INT NOT NULL
);

ALTER TABLE itemspedidos
ADD CONSTRAINT fk_itemspedidos_pedidos
FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id);

CREATE TABLE calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    local_id INT NOT NULL,
	calificacion INT NOT NULL,
    opinion VARCHAR(200) NOT NULL
);

ALTER TABLE calificaciones
ADD CONSTRAINT fk_calificaciones_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);


INSERT INTO clientes (cliente_id, nombre, apellido, correo, telefono)
VALUES (1,'Murray','McCritichie','mmccritichie0@sciencedaily.com',2776663322),
(2,'Adara','Dysart','adysart1@examiner.com',3123360463),
(3,'Cass','Sunshine','csunshine2@google.fr',1363323015),
(4,'Oona','Denerley','odenerley3@prnewswire.com',7594102187),
(5,'Amii','Cheston','acheston4@gnu.org',9376570185),
(6,'Carissa','Bottleson','cbottleson5@ca.gov',6986360333),
(7,'Marchelle','Atkins','matkins6@rakuten.co.jp',5273912154),
(8,'Jonathon','Jakes','jjakes7@ucla.edu',9576724580),
(9,'Willy','Savatier','wsavatier8@mac.com',8503410097),
(10,'Felicdad','Avrahm','favrahm9@bloglovin.com',3259660016),
(11,'Krissie','Tute','ktutea@shareasale.com',9546875184),
(12,'Kincaid','Braunston','kbraunstonb@furl.net',9299533552),
(13,'Garnette','Marchello','gmarchelloc@purevolume.com',6307889833),
(14,'Nancie','McDaid','nmcdaidd@usnews.com',6038942960),
(15,'Juliana','Pennells','jpennellse@walmart.com',1075847868);

INSERT INTO locales (local_id, nombre, direccion, ciudad, telefono)
VALUES (1,'Twin Pines','77124 Linden Park','Kuvshinovo',2747553878),
(2,'Delladonna','86346 Schlimgen Crossing','Uozu',1186276474),
(3,'Calypso','2 Swallow Drive','Vale',7537737682),
(4,'Maple Wood','52420 Dunning Junction','Wenwucao',3959253192),
(5,'Fairview','682 Coolidge Parkway','Tangzi',6367630680);



INSERT INTO empleados(empleado_id,nombre, apellido, puesto, local_id)
VALUES(1,'Pinchas','Constanza','Cocinero/a',1),
(2, 'Aldus', 'Ferrant', 'Cocinero/a', 2),
(3, 'Ancell', 'Dobbison', 'Cocinero/a', 1),
(4, 'Maynord', 'Giraudoux', 'Gerente de Ventas', 4),
(5, 'Dru', 'Lyfield', 'Cajero/a', 5),
(6, 'Bibbye', 'Higbin', 'Cajero/a', 3),
(7, 'Shelby', 'Gullivan', 'Cajero/a', 2),
(8, 'Lawrence', 'Petrasso', 'Limpieza', 4),
(9, 'Felizio', 'Bradock', 'Limpieza', 4),
(10, 'Vlad', 'Rosengart', 'Repartidor/a', 3),
(11, 'Travis', 'Scotter', 'Repartidor/a', 3),
(12, 'Blake', 'Critoph', 'Asistente de Cocina', 3),
(13, 'Omero', 'Houlworth', 'Asistente de Cocina', 4),
(14, 'Celestina', 'Cook', 'Gerente de Turno', 2),
(15, 'Christalle', 'Wareham', 'Gerente de Turno', 4);


INSERT INTO calificaciones (calificacion_id, local_id, calificacion, opinion) 
VALUES (1, 2, 6, '¡Excelente servicio y comida deliciosa! Definitivamente volveré pronto.'),
(2, 5, 3, 'La comida no estuvo a la altura de mis expectativas. No lo recomendaría.'),
(3, 2, 7, 'Muy buen ambiente y personal amable. La comida estaba deliciosa.'),
(4, 1, 7, '¡Increíble experiencia! La hamburguesa estaba perfectamente cocinada.'),
(5, 4, 1, 'Decepcionante. La comida estaba fría y mal preparada.'),
(6, 2, 4, 'Servicio rápido, pero la calidad de la comida dejó mucho que desear.'),
(7, 1, 2, 'No quedé impresionado con la comida ni con el servicio.'),
(8, 1, 5, 'Buena comida a un precio razonable. El servicio podría mejorar.'),
(9, 2, 9, '¡Increíble! Probablemente la mejor hamburguesa que he tenido.'),
(10, 4, 4, 'La comida estaba bien, pero el servicio fue lento y desorganizado.'),
(11, 4, 5, 'Buena comida y ambiente acogedor. Definitivamente regresaré.'),
(12, 4, 7, '¡La mejor hamburguesa que he probado en mucho tiempo!'),
(13, 2, 8, 'Servicio excepcional y comida deliciosa. Altamente recomendado.'),
(14, 4, 8, 'Increíble experiencia gastronómica. El personal fue muy atento.'),
(15, 4, 7, 'La comida estaba deliciosa, pero el restaurante estaba un poco sucio.'),
(16, 5, 3, 'La comida era mediocre y el servicio era lento.'),
(17, 3, 5, 'Buena comida y servicio amable. Volveré en el futuro.'),
(18, 5, 9, '¡Simplemente increíble! La mejor hamburguesa que he probado.'),
(19, 3, 1, 'La comida estaba fría y sin sabor. Definitivamente no volveré.'),
(20, 1, 1, 'Experiencia terrible. La comida estaba quemada y el servicio fue pésimo.'),
(21, 2, 4, 'La comida era decente, pero el lugar estaba muy concurrido.'),
(22, 1, 3, 'La comida no cumplió mis expectativas. El servicio fue lento.'),
(23, 5, 9, 'La hamburguesa estaba deliciosa y el personal era muy amable.'),
(24, 2, 5, 'La comida era aceptable, pero nada especial.'),
(25, 4, 10, '¡La mejor hamburguesa que he probado en mi vida!'),
(26, 2, 8, 'La comida estaba deliciosa y el servicio fue excelente.'),
(27, 4, 6, 'La comida era decente, pero el restaurante estaba un poco descuidado.'),
(28, 4, 3, 'La comida tardó mucho en llegar y no estaba tan buena como esperaba.'),
(29, 5, 6, 'La hamburguesa estaba bien, pero el servicio fue lento.'),
(30, 4, 8, 'Buena comida y ambiente agradable. El servicio podría ser más rápido.');

INSERT INTO mesas(mesa_id, local_id, capacidad, estado)
VALUES(1,1,1,'Reservado'),
(2,2,5,'Libre'),
(3,3,4,'No disponible'),
(4,4,1,'Reservado'),
(5,5,5,'Libre');

INSERT INTO promociones(promocion_id,nombre,descuento,fecha_inicio,fecha_fin)
VALUES (1,'BurguerDoble30',0.30,'2022-12-16','2024-09-05'),
(2,'Bebida20',0.20,'2023-01-03','2024-05-09'),
(3,'BurguerTriple50',0.50,'2023-04-08','2023-06-01'),
(4,'Papas20',0.20,'2023-03-11','2024-01-21'),
(5,'Papas10',0.10,'2023-07-05','2023-09-10');

INSERT INTO pedidos (pedido_id,fecha,total_pedido,cliente_id,local_id,promocion_id,mesa_id)
VALUES (1,'2023-10-13',62.22,1,4,1,4),
(2,'2023-12-13',11.57,6,1,2,3),
(3,'2023-11-01',72.09,3,5,1,1),
(4,'2023-09-26',77.11,9,5,1,1),
(5,'2023-10-05',93.89,12,3,1,1),
(6,'2023-11-28',94.05,14,4,2,1),
(7,'2023-07-06',22.58,5,1,3,1),
(8,'2023-07-03',43.48,11,4,4,1),
(9,'2023-12-11',66.39,11,4,1,1),
(10,'2024-01-22',7.76,9,4,1,1),
(11,'2023-10-19',84.84,3,1,4,5),
(12,'2023-09-03',40.88,14,3,1,1),
(13,'2023-06-17',74.49,6,2,1,1),
(14,'2023-06-15',58.84,6,2,1,1),
(15,'2023-04-12',46.5,11,2,1,1),
(16,'2023-12-14',85.31,13,3,1,1),
(17,'2023-06-25',47.65,15,5,1,1),
(18,'2023-03-27',16.25,14,3,1,1),
(19,'2023-11-14',41.09,6,5,1,1),
(20,'2023-06-25',58.22,9,1,1,1);


INSERT INTO itemspedidos (item_id,pedido_id,nombre_producto,precio_unitario,cantidad)
VALUES (1, 9, 'Big Mac', 9194, 4),
(2, 6, 'Whopper', 2319, 2),
(3, 12, 'McNífica', 6790, 1),
(4, 8, 'Coca-Cola', 479, 3),
(5, 4, 'Coca-Cola', 8079, 1),
(6, 17, 'Chicken Burger', 9189, 2),
(7, 16, 'Double Cheeseburger', 8864, 4),
(8, 14, 'Sprite', 2378, 2),
(9, 6, 'Whopper', 5900, 5),
(10, 4, 'Coca-Cola', 7924, 5), 
(11, 20, 'Big King', 2238, 1),
(12, 10, 'Chicken Burger', 9221, 5),
(13, 8, 'Coca-Cola', 734, 3),
(14, 3, 'McNífica', 614, 2),
(15, 12, 'Sprite', 2428, 4),
(16, 18, 'Double Cheeseburger', 6819, 1),
(17, 7, 'Big Mac', 3977, 5),
(18, 14, 'Sprite', 2604, 1),
(19, 20, 'Ice Cream Cone', 4702, 2),
(20, 20, 'McFlurry', 6412, 5),
(21, 3, 'Root Beer', 6827, 5),
(22, 19, 'Onion Rings', 3176, 3),
(23, 5, 'Hot Dog', 6382, 3),
(24, 11, 'Fish Burger', 3931, 5),
(25, 18, 'McFlurry', 491, 1);

DROP PROCEDURE ST_OrdenarTablas
DELIMITER $$

CREATE PROCEDURE ST_OrdenarTablas(
IN columna VARCHAR (50))
BEGIN
SET @query_stmt = CONCAT("SELECT * 
FROM burguer_house.PEDIDOS
ORDER BY " , columna) ;
PREPARE stmt FROM @query_stmt ;
EXECUTE stmt ;
DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;

DROP PROCEDURE ST_InsertarPedido
DELIMITER //

CREATE PROCEDURE ST_InsertarPedido (
    IN p_fecha DATE,
    IN p_total_pedido DECIMAL(11, 2),
    IN p_cliente_id INT,
    IN p_local_id INT,
    IN p_promocion_id INT
)
BEGIN

    INSERT INTO pedidos (fecha, total_pedido, cliente_id, local_id, promocion_id)
    VALUES (p_fecha, p_total_pedido, p_cliente_id, p_local_id, p_promocion_id);
END //

DELIMITER ;

DROP VIEW IF EXISTS VW_Cajeros_Por_Local;
CREATE VIEW VW_Cajeros_Por_Local AS
SELECT E.empleado_id, E.nombre, E.apellido, E.puesto, L.nombre AS nombre_local
FROM empleados E
JOIN locales L ON E.local_id = L.local_id
WHERE E.puesto = 'Cajero/a';

DROP VIEW IF EXISTS VW_Mayores_Pedidos_Por_Local;

CREATE VIEW VW_Mayores_Pedidos_Por_Local AS
SELECT P.pedido_id, P.fecha, P.total_pedido, C.nombre AS nombre_cliente, L.nombre AS nombre_local
FROM pedidos P
JOIN locales L ON P.local_id = L.local_id
JOIN clientes C ON P.cliente_id = C.cliente_id
WHERE P.total_pedido > 50;


DROP VIEW IF EXISTS VW_Promociones_Por_Pedidos;
CREATE VIEW VW_Promociones_Por_Pedidos AS
SELECT P.pedido_id, P.fecha, P.total_pedido, PR.nombre AS nombre_promocion, PR.descuento
FROM pedidos P
LEFT JOIN promociones PR ON P.promocion_id = PR.promocion_id;

DROP VIEW IF EXISTS VW_Promocion_Mas_Utilizada;
CREATE VIEW VW_Promocion_Mas_Utilizada AS
SELECT promocion_id, COUNT(*) AS cantidad_utilizada
FROM Pedidos
WHERE promocion_id IS NOT NULL
GROUP BY promocion_id
ORDER BY COUNT(*) DESC
LIMIT 1;

DROP VIEW IF EXISTS VW_Pedidos_Calificaciones_Detractoras;
CREATE VIEW VW_Pedidos_Calificaciones_Detractoras AS
SELECT P.pedido_id, P.fecha, P.total_pedido, C.calificacion, C.opinion
FROM Pedidos P
JOIN Calificaciones C ON P.local_id = C.local_id
WHERE C.calificacion < 6;

DROP FUNCTION IF EXISTS CalificacionPorLocal;
DELIMITER //

CREATE FUNCTION CalificacionPorLocal(local_id INT) 
RETURNS DECIMAL(4, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE calificacion_promedio DECIMAL(4, 2);
    SELECT AVG(calificacion) INTO calificacion_promedio FROM calificaciones WHERE local_id = local_id;
    RETURN calificacion_promedio;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS VentasPorLocal;
DELIMITER //

CREATE FUNCTION VentasPorLocal(local_id INT) 
RETURNS DECIMAL(11, 2)
READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(11, 2);
    
    SELECT SUM(total_pedido) INTO total_ventas
    FROM pedidos
    WHERE local_id = local_id;
    
    RETURN total_ventas;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS ActualizarInventarioDespuesDePedido;
DELIMITER //

CREATE TRIGGER ActualizarInventarioDespuesDePedido
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
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
END //

DELIMITER ;

DROP FUNCTION IF EXISTS CalcularTotalPedido;
DELIMITER //

CREATE TRIGGER CalcularTotalPedido BEFORE INSERT ON Pedidos FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(precio_unitario * cantidad) INTO total
    FROM Items_de_Pedidos
    WHERE pedido_id = NEW.pedido_id;
    SET NEW.total_pedido = total;
END //

DELIMITER ;

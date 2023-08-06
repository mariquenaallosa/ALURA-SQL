CREATE TABLE TB_FACTURACION(
FECHA DATE NULL,
VENTA_TOTAL FLOAT
);

SELECT * FROM tb_facturacion;


CREATE TABLE `tb_items_facturas1` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(20) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUCTO1` (`CODIGO`),
  CONSTRAINT `FK_FACTURA1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO1` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
);


CREATE TABLE `tb_factura1` (
  `NUMERO` varchar(5) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `IMPUESTO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_CLIENTE1` (`DNI`),
  KEY `FK_VENDEDOR1` (`MATRICULA`),
  CONSTRAINT `FK_CLIENTE1` FOREIGN KEY (`DNI`) REFERENCES `tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR1` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_vendedor` (`MATRICULA`)
);



SELECT * FROM tb_facturacion;
SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_factura1;
SELECT * FROM tb_cliente;
SELECT * FROM tb_vendedor;
SELECT * FROM tb_producto;

DELETE FROM tb_factura1
WHERE NUMERO = '100';


INSERT INTO tb_factura1 VALUES
('0100', '2021-01-01', '1471156710', '235', 0.1);

INSERT INTO tb_items_facturas1 VALUES
('0100', '1002767', 100, 25),
('0100', '1004327', 200, 25),
('0100', '1013793', 300, 25);


SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
FROM tb_factura1 A
INNER JOIN 
tb_items_facturas1 B
ON A.NUMERO = B.NUMERO
GROUP BY A.FECHA;

INSERT INTO tb_factura1 VALUES
('0101', '2021-01-01', '1471156710', '235', 0.1);

INSERT INTO tb_items_facturas1 VALUES
('0101', '1002767', 100, 25),
('0101', '1004327', 200, 25),
('0101', '1013793', 300, 25);


INSERT INTO tb_factura1 VALUES
('0102', '2021-01-01', '1471156710', '235', 0.1);

INSERT INTO tb_items_facturas1 VALUES
('0102', '1002767', 200, 25),
('0102', '1004327', 300, 25),
('0102', '1013793', 400, 25);



DELIMITER //
CREATE TRIGGER TG_FACTURACION_INSERT
AFTER INSERT ON tb_items_facturas1
FOR EACH ROW BEGIN
		DELETE FROM tb_facturacion;
		INSERT INTO tb_facturacion 
		SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
		FROM tb_factura1 A
		INNER JOIN 
		tb_items_facturas1 B
		ON A.NUMERO = B.NUMERO
		GROUP BY A.FECHA;
END //


INSERT INTO tb_factura1 VALUES
('0105', '2021-01-01', '1471156710', '235', 0.1);

INSERT INTO tb_items_facturas1 VALUES
('0105', '1002767', 200, 25),
('0105', '1004327', 300, 25),
('0105', '1013793', 400, 25);

/*
Calculando la edad del cliente
El siguiente comando SQL calcula la edad actual del cliente:
SELECT DNI, EDAD, FECHA_NACIMIENTO, timestampdiff(YEAR, FECHA_NACIMIENTO, 
NOW()) AS ANOS FROM tb_clientes;

Construye un TRIGGER (Lo llamaremos TG_EDAD_CLIENTES_INSERT) 
que actualiza las edades de los clientes, en la tabla de clientes, 
siempre que la tabla sufra una inclusión.

*/


DELIMITER //
CREATE TRIGGER TG_EDAD_CLIENTES_INSERT 
BEFORE INSERT ON tb_cliente
FOR EACH ROW BEGIN
SET NEW.EDAD = timestampdiff(YEAR, NEW.FECHA_NACIMIENTO, NOW());
END//

INSERT INTO tb_cliente VALUES
('39765342', 'Mariana Rodre', 'Felix bogado',
'Palomar', 'Posadas', 'Misiones', '3300', 
'2023-06-08', 27, 'f' , 24000, 45000, 0 );

-- seleccionar schema
USE jugos_ventas;


-- Seleccionar todas las columnnas de la tabla de clientes
-- opcion1:
SELECT DNI,NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO,
EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA FROM tabla_de_clientes;

-- opcion2:
SELECT * FROM tabla_de_clientes;


-- seleccionar algunas columnas
SELECT DNI, NOMBRE FROM tabla_de_clientes;


-- crear un alias
SELECT DNI AS IDENTIFICACCION , NOMBRE AS CLIENTE FROM tabla_de_clientes;


-- visualizar la tabla de productos
SELECT * FROM tabla_de_productos;


-- aplicar un filtro
SELECT * FROM tabla_de_productos WHERE SABOR= 'Uva';
SELECT * FROM tabla_de_productos WHERE SABOR= 'Mango';

	-- mysql no es case sensitive por lo que lo siguienta da igual:
SELECT * FROM tabla_de_productos WHERE ENVASE= 'Botella PET';
SELECT * FROM tabla_de_productos WHERE ENVASE= 'Botella pet';


	-- utilizacion de operadores
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA > 16;
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA <= 17;

	-- escoger rangos
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 16.02;

-- CONSULTAS CONDICIONALES
-- OR 
SELECT * FROM tabla_de_productos WHERE SABOR='mango' OR TAMANO= '470 ml';


-- AND 
SELECT * FROM tabla_de_productos WHERE SABOR='mango' AND TAMANO= '470 ml';


-- NOR(NOT OR)
SELECT * FROM tabla_de_productos WHERE NOT SABOR='mango' OR TAMANO= '470 ml';


-- NAND (NOT AND)
SELECT * FROM tabla_de_productos WHERE NOT SABOR='mango' AND NOT TAMANO= '470 ml';

-- IN (LISTA) // similar a OR 
SELECT * FROM tabla_de_productos WHERE SABOR IN ('mango','uva');

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('ciudad de méxico','guadalajara')
AND (EDAD BETWEEN 20 AND 25 );

-- FILTRANDO CONSULTAS
-- LIKE 
-- SELECT * FROM TB WHERE CAMPO LIKE '%<CONDICION>'

-- seleccionar en cualquier parte '%condicion%'
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%';
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana%'
AND ENVASE = 'botella pet';

-- registro que acaban con '%condicion'
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana';

-- registro que comienza con 'condicion%'
SELECT * FROM tabla_de_productos WHERE SABOR LIKE 'cereza%';

-- EJERCICIO BUSCANDO CLIENTES
-- ¿ Cuántos clientes tienen apellido que acaban con 'ez'?

SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';
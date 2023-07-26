-- JOIN 
-- SELECT A.NOMBRE, B.HOBBY FROM TABLA A
-- x JOIN 
-- TABLA B 
-- ON A.ID=B.ID

-- INNER JOIN : devuelve únicamente los registros con llaves correspondientes.
-- (interno)
-- LEFT JOIN : mantiene todos los registros de la tabla de la izq
-- RIGTH JOIN : mantiene todos los registros de la tabla de la derecha
-- FULL JOIN: mantiene todo
-- CROSS JOIN: devuelve el producto cartesiano de los registros de las tablas.(mezcla todos con todos)
-- SELECT A.NOMBRE, B.HOBBY FROM TABLA A, TABLA B



SELECT * FROM tabla_de_vendedores;

SELECT * FROM facturas;

-- inner join 

SELECT * FROM tabla_de_vendedores A 
INNER JOIN facturas B
ON A.MATRICULA = B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores A 
INNER JOIN facturas B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.NOMBRE, B.MATRICULA;

-- CROSS
SELECT A.NOMBRE, B.MATRICULA, COUNT(*) 
FROM tabla_de_vendedores A , facturas B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.NOMBRE, B.MATRICULA;


-- EJERCICIO 
-- Obteniendo la facturación anual
-- Obtén la facturación anual de la empresa. 
-- Ten en cuenta que el valor financiero de las ventas consiste en multiplicar la cantidad por el precio.
SELECT SUM(IFa.PRECIO*IFa.CANTIDAD) as FACTURACION , YEAR(F.FECHA_VENTA) FROM items_facturas IFa
INNER JOIN facturas F
ON IFa.NUMERO = F.NUMERO
GROUP BY YEAR(FECHA_VENTA);

SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);
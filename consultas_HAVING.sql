-- HAVING 
SELECT ESTADO, BARRIO, SUM(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes 
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >300000;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
GROUP BY ENVASE 
HAVING SUM(PRECIO_DE_LISTA)>80;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO, 
MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO, 
SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO
FROM tabla_de_productos
GROUP BY ENVASE 
HAVING SUM(PRECIO_DE_LISTA)>=80 
AND MAX(PRECIO_DE_LISTA)>= 5;


-- EJERCICIO 
-- Clientes que realizaron compras en 2016
-- ¿Quiénes fueron los clientes que realizaron más de 2000 compras en 2016?

SELECT DNI , COUNT(*)
FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

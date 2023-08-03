SELECT * FROM FACTURAS;
SELECT * FROM items_facturas;

-- RELACION FACTURAS E ITEMS FACTURAS
SELECT F.DNI , F.FECHA_VENTA , IFa.CANTIDAD 
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO;


-- POR MES Y AÑO
SELECT F.DNI , date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, IFa.CANTIDAD 
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO;

-- CONSULTA DE LA CANTIDAD DE VENTAS PARA CADA CLIENTE POR MES

SELECT F.DNI , date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
GROUP BY F.DNI, date_format(F.FECHA_VENTA , "%m - %Y");

-- LIMITE DE VENTAS POR CLIENTE (VOLUMEN EN DL)
SELECT * FROM tabla_de_clientes TC;

SELECT DNI, NOMBRE, VOLUMEN_DE_COMPRA FROM tabla_de_clientes;


SELECT F.DNI , TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(TC.VOLUMEN_DE_COMPRA)/10 AS VOLUMEN_MAX
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON F.DNI = TC.DNI
GROUP BY F.DNI,TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y");

SELECT A.DNI, A.NOMBRE , A.MES_AÑO, A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX AS DIFERENCIA
FROM (
SELECT F.DNI , TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(TC.VOLUMEN_DE_COMPRA)/10 AS VOLUMEN_MAX
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON F.DNI = TC.DNI
GROUP BY F.DNI,TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y")
) A;



SELECT A.DNI, A.NOMBRE , A.MES_AÑO, A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX AS DIFERENCIA,
CASE 
	WHEN A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX <= 0 THEN 'VENTA VÁLIDA'
    ELSE 'VENTA INVÁLIDA'
END AS STATUS_VENTA
FROM (
SELECT F.DNI , TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(TC.VOLUMEN_DE_COMPRA)/10 AS VOLUMEN_MAX
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON F.DNI = TC.DNI
GROUP BY F.DNI,TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y")
) A;


-- REALIZANDO UNA CONSULTA AL INFORME
/*
En esta aula construimos un informe que presentó a los clientes que tenían ventas inválidas.
Complementa este informe listando solamente a los que tuvieron ventas inválidas y 
calcula la diferencia entre el límite de venta máximo y la cantidad vendida en porcentuales.

Tips:
Utiliza el comando SQL empleado al final del video.
Filtra solamente las líneas donde: (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) < 0
Lista el campo X.CANTIDAD_LIMITE
Crea nuevo campo ejecutando la fórmula: (1 - (X.CANTIDAD_LIMITE/X.CANTIDAD_VENDAS)) * 100.

*/

SELECT A.DNI, A.NOMBRE , A.MES_AÑO, A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX AS DIFERENCIA,
CASE 
	WHEN A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX <= 0 THEN 'VENTA VÁLIDA'
    ELSE 'VENTA INVÁLIDA'
END AS STATUS_VENTA, ROUND((1 - (A.VOLUMEN_MAX/A.CANTIDAD_VENDIDA)) *100,2)  AS PORCENTAJE 
FROM (
SELECT F.DNI , TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(TC.VOLUMEN_DE_COMPRA)/10 AS VOLUMEN_MAX
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON F.DNI = TC.DNI
GROUP BY F.DNI,TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y")
) A
WHERE (A.VOLUMEN_MAX - A.CANTIDAD_VENDIDA) < 0;


-- REALIZANDO UNA NUEVA CONSULTA AL INFORME 
/*
En esta aula construimos un informe que presentó a los clientes que tenían ventas inválidas. 
Ahora lista solamente a los que tuvieron ventas inválidas en el año 2018 
excediendo más del 50% de su límite permitido por mes. 
Calcula la diferencia entre el límite de venta máximo y la cantidad vendida, en porcentuales.

Tips:
Te puedes apoyar en el código que realizaste para el desafío anterior.

*/

SELECT A.DNI, A.NOMBRE , A.MES_AÑO, A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX AS DIFERENCIA,
CASE 
	WHEN A.CANTIDAD_VENDIDA - A.VOLUMEN_MAX <= 0 THEN 'VENTA VÁLIDA'
    ELSE 'VENTA INVÁLIDA'
END AS STATUS_VENTA, ROUND((1 - (A.VOLUMEN_MAX/A.CANTIDAD_VENDIDA)) *100,2)  AS PORCENTAJE 
FROM (
SELECT F.DNI , TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y") AS MES_AÑO, SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(TC.VOLUMEN_DE_COMPRA)/10 AS VOLUMEN_MAX
FROM facturas F
INNER JOIN items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC
ON F.DNI = TC.DNI
GROUP BY F.DNI,TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y")
) A
WHERE (A.VOLUMEN_MAX - A.CANTIDAD_VENDIDA) < 0 AND ROUND((1 - (A.VOLUMEN_MAX/A.CANTIDAD_VENDIDA)) *100,2) > 50 
AND A.MES_AÑO LIKE "%2018" ;




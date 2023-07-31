SELECT CURDATE();

SELECT current_timestamp();

SELECT YEAR(current_timestamp());

SELECT MONTH(current_timestamp());

SELECT DAY(current_timestamp());

SELECT MONTHNAME(current_timestamp());

SELECT DAYNAME(current_timestamp());

SELECT DATEDIFF(CURRENT_TIMESTAMP(), "2023-01-01") AS DIFERENCIA;

SELECT current_timestamp() AS DIA_HOY, DATE_SUB(current_timestamp(), INTERVAL 1 MONTH) AS RESULTADO;


SELECT DISTINCT FECHA_VENTA,
dayname(FECHA_VENTA)AS DIA,
monthname(FECHA_VENTA) AS MES,
year(FECHA_VENTA) AS AÑO
FROM facturas;
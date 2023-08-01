SELECT current_timestamp() AS RESULTADO;


SELECT concat("La fecha y la hora de hoy son: ", current_timestamp() ) AS RESULTADO;

SELECT CONCAT("LA FECHA Y EL HORARIO SON: ", DATE_FORMAT(current_timestamp(), " %W,  %d/%m/%Y y son las %T")) AS RESULTADO;

SELECT CONVERT(23.45, CHAR) AS RESULTADO;

SELECT substring(CONVERT(23.45, CHAR),3,1) AS RESULTADO;

-- listando con expresión natural 
-- Queremos construir un SQL cuyo resultado sea, para cada cliente:
-- “El cliente Pepito Pérez facturó 120000 en el año 2016”.
-- Solamente para el año 2016.

SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', 
CONVERT(SUM(IFa.CANTIDAD * IFa.PRECIO),CHAR(20)),
' en el año ', CONVERT(YEAR(F.FECHA_VENTA),CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);



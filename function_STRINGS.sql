SELECT LTRIM("         MySQL es fácil");
SELECT RTRIM("MySQL es fácil     ");
SELECT TRIM("         MySQL es fácil              ");
SELECT concat(" MySQL es fácil,", " no lo crees?");

SELECT CONCAT(NOMBRE, " " , DNI) FROM tabla_de_clientes;


-- Listando la dirección completa
SELECT NOMBRE ,CONCAT(DIRECCION_1, " " , BARRIO, " " , CIUDAD, " " , ESTADO) AS DOMICILIO
FROM tabla_de_clientes;
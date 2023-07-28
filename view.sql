-- VIEW 
-- es una tabla lógica que resulta de una consulta que puede ser usada posteriormente en cualquier otra consulta

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO
FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE,X.PRECIO_MAXIMO FROM 
vw_envases_grandes X 
WHERE PRECIO_MAXIMO >=10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, B.PRECIO_MAXIMO FROM tabla_de_productos A
INNER JOIN 
vw_envases_grandes B 
ON A.ENVASE = B.ENVASE;


-- con indicador
SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, ((A.PRECIO_DE_LISTA/B.PRECIO_MAXIMO)-1)*100 as VARIACION
FROM tabla_de_productos A
INNER JOIN 
vw_envases_grandes B 
ON A.ENVASE = B.ENVASE;
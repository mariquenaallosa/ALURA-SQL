-- Usando DISTINCT 
SELECT ENVASE, TAMANO FROM tabla_de_productos;
SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos;

SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos
WHERE SABOR = 'naranja';


-- EJERCICIO BARRIOS CIUDAD DE MEXICO
-- ¿ Cuáles con los barrios en Ciudad de México que tienen clientes?

SELECT DISTINCT BARRIO, CIUDAD FROM tabla_de_clientes 
WHERE CIUDAD ='ciudad de mexico'; 

-- Usando LIMIT . Limita el número de registros exhibidos
-- SELECT * FROM tb LIMIT n;  SELECT * FROM tb LIMIT i, n; i= indice n= cantidad
SELECT * FROM tabla_de_productos LIMIT 5;
SELECT * FROM tabla_de_productos LIMIT 5,3;

 -- EJERCICIO OBSERVANDO UNA MMUESTRA DE DATOS
 -- Queremos obtener las 10 primeras ventas del día 01/01/2017. 
 -- ¿Cuál sería el comando SQL para obtener este resultado?
 
 SELECT * FROM facturas WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;
 
 -- USANDO ORDER BY
 -- SELECT * FROM tb ORDER BY campo; 
 -- SELECT * FROM tb ORDER BY campo DESC;
 -- SELECT * FROM tb ORDER BY campo DESC campo_2 ASC;
 
 
 SELECT * FROM tabla_de_productos
 ORDER BY PRECIO_DE_LISTA;
 
  SELECT * FROM tabla_de_productos
 ORDER BY PRECIO_DE_LISTA DESC;
 
 SELECT * FROM tabla_de_productos
 ORDER BY NOMBRE_DEL_PRODUCTO;
 
 SELECT * FROM tabla_de_productos
 ORDER BY NOMBRE_DEL_PRODUCTO DESC;
 
SELECT * FROM tabla_de_productos
 ORDER BY ENVASE ASC, NOMBRE_DEL_PRODUCTO DESC;
 
 
 -- EJERCICIO MAYORES VENTAS
 -- ¿Cuál (o cuáles) fue (fueron) la(s) mayor(es) venta(s) del producto 
 -- “Refrescante, 1 Litro, Frutilla/Limón”, en cantidad? 
 -- (Obtenga este resultado utilizando 2 comandos SQL).
SELECT CODIGO_DEL_PRODUCTO FROM tabla_de_productos 
WHERE NOMBRE_DEL_PRODUCTO = "Refrescante" AND TAMANO = "1 Litro" 
AND SABOR = "Frutilla/Limón"; 

SELECT * FROM items_facturas 
WHERE CODIGO_DEL_PRODUCTO = "1101035" 
ORDER BY CANTIDAD DESC;

-- USANDO GROUP BY
 -- SELECT<campos>FN FROM tb GROUP BY campo
-- fn podemos usar SUM() . MAX() . MIN() . AVG() . COUNT()
-- si se omite el campo de agregación, la operación se a va a efectuar en toda la tabla.

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL 
FROM tabla_de_clientes GROUP BY ESTADO;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO 
FROM tabla_de_productos GROUP BY ENVASE;

SELECT ENVASE, COUNT(*) FROM tabla_de_productos GROUP BY ENVASE;

SELECT BARRIO, sum(LIMITE_DE_CREDITO) AS LIMITE FROM tabla_de_clientes
GROUP BY BARRIO;


SELECT CIUDAD, BARRIO, sum(LIMITE_DE_CREDITO) AS LIMITE FROM tabla_de_clientes 
WHERE CIUDAD = 'ciudad de mexico'
GROUP BY BARRIO;

SELECT ESTADO, BARRIO, MAX(LIMITE_DE_CREDITO) AS LIMITE FROM tabla_de_clientes 
GROUP BY ESTADO, BARRIO;

SELECT CIUDAD, BARRIO, sum(LIMITE_DE_CREDITO) AS LIMITE, EDAD FROM tabla_de_clientes 
WHERE EDAD >= 20
GROUP BY BARRIO
ORDER BY EDAD;

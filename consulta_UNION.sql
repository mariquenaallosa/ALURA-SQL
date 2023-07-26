-- UNION

-- <consulta 1>
-- UNION
-- <consulta 2>;
-- -----------------hace un distinct enonce no repite registros
-- tenemos que tener los mismos tipos de datos y misma cantidad.


-- UNION ALL
-- <consulta 1>
-- UNION ALL
-- <consulta 2>;

SELECT distinct BARRIO FROM tabla_de_clientes;
SELECT distinct BARRIO FROM tabla_de_vendedores;


SELECT distinct BARRIO FROM tabla_de_clientes
UNION
SELECT distinct BARRIO FROM tabla_de_vendedores;

SELECT distinct BARRIO FROM tabla_de_clientes
UNION ALL
SELECT distinct BARRIO FROM tabla_de_vendedores;



SELECT distinct BARRIO, NOMBRE, 'Cliente' as TIPO FROM tabla_de_clientes
UNION
SELECT distinct BARRIO, NOMBRE, 'Vendedor' as TIPO FROM tabla_de_vendedores;


SELECT distinct BARRIO, NOMBRE, 'Cliente' as TIPO_CLIENTE, DNI FROM tabla_de_clientes
UNION
SELECT distinct BARRIO, NOMBRE, 'Vendedor' as TIPO_VENDEDOR, MATRICULA FROM tabla_de_vendedores;



-- full join 

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
LEFT JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO
UNION 
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
RIGHT JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

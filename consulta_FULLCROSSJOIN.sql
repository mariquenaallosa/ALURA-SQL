SELECT COUNT(*) FROM tabla_de_clientes;
SELECT COUNT(*) FROM tabla_de_vendedores;

-- barrios de clientes que tienen vendedores
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,  tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
INNER JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

-- barrios y/o ciudades que no tienen vendedores
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
LEFT JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;


-- los que están haciendo atendidos y que vendedores están de vacaciones
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
RIGHT JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes
RIGHT JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;


-- ASÍ NO ES LA MANERA DE HACERLO , NO FUNCIONA 
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes
FULL JOIN 
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;


SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,tabla_de_clientes.CIUDAD, tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes, tabla_de_vendedores
WHERE tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;






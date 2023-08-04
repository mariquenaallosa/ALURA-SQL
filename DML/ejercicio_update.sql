/*
Modificando el volumen de compra
PRÓXIMA ACTIVIDAD

Podemos observar que los vendedores se encuentran en barrios asociados a ellos. 
Vamos a aumentar en 30% el volumen de compra de los clientes que tienen, en sus direcciones, barrios donde los vendedores cuentan con oficinas.

Tip: Vamos a usar un UPDATE con FROM apoyándonos con el siguiente INNER JOIN:
SELECT A.DNI FROM tb_clientes A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO

*/

SELECT * FROM tb_cliente;
SELECT * FROM tb_vendedor;

SELECT A.DNI FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO;


UPDATE tb_cliente A 
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3;
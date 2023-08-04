SELECT * from tb_vendedor;

SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT * FROM tb_vendedor A 
INNER JOIN jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA,3,3);


UPDATE tb_vendedor A
INNER JOIN jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA, 3, 3)
SET A.DE_VACACIONES = B.VACACIONES;

INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);


SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';


DELETE FROM tb_producto
WHERE CODIGO = '1001000';

DELETE FROM tb_producto 
WHERE TAMANO = '1 Litro';


-- SINCRO CON OTRA TB DE OTRA DB
SELECT CODIGO_DEl_PRODUCTO FROM jugos_ventas.tabla_de_productos;

SELECT CODIGO FROM tb_producto
WHERE CODIGO NOT IN (SELECT CODIGO_DEl_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

DELETE from tb_producto 
WHERE CODIGO NOT IN (SELECT CODIGO_DEl_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

/*
Excluyendo facturas

Vamos a excluir las facturas (Apenas el encabezado) cuyos clientes tengan menos de 18 años.
Tip: Usaremos la siguiente consulta:

SELECT A.DNI FROM tb_clientes A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO

Puedes usar una sintaxis semejante a la usada en UPDATE con FROM.
*/

SELECT A.DNI FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO;

DELETE A FROM tb_factura A
INNER JOIN 
tb_cliente B 
ON A.DNI = B.DNI
WHERE B.EDAD < 18;

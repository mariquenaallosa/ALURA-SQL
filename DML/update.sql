USE ventas_jugos;

SELECT * FROM tb_producto;

UPDATE tb_producto SET 
PRECIO_LISTA = 5 
WHERE CODIGO = '1000889';

UPDATE tb_producto SET 
DESCRIPCION = 'Sabor de la Montaña',
TAMANO = '1 Litro',
ENVASE = 'Botella PET' 
WHERE CODIGO = '1000889';


SELECT * FROM tb_cliente;

UPDATE tb_cliente SET
VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;

/*
Actualiza la dirección del cliente con el DNI 5840119709 
Colocando como nueva dirección Jorge Emilio 23, barrio San Antonio, ciudad Guadalajara, Estado de Jalisco y el CP 44700000.
*/

SELECT * FROM tb_cliente;

UPDATE tb_cliente SET
DIRECCION = 'Jorge Emilio 23',
BARRIO = 'San Antonio',
CIUDAD = 'Guadalajara',
ESTADO = 'JC',
CP= '44700000'
WHERE DNI = '5840119709'; 

USE ventas_jugos;

INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA) VALUES (
'1040107', 'Ligth', 'Sandia' , '350 ml', 'Lata', 4.56
);

SELECT * FROM tb_producto;

INSERT INTO tb_producto (CODIGO,SABOR,DESCRIPCION,TAMANO,ENVASE,PRECIO_LISTA) VALUES (
'1040108', 'Gunábana' , 'Ligth', '350 ml', 'Lata', 4.00
);

INSERT INTO tb_producto VALUES
('1040109', 'Ligth', 'Asai' , '350 ml', 'Lata', 5.60),
('1040110', 'Ligth', 'Manzana' , '350 ml', 'Lata', 6.00),
('1040111', 'Ligth', 'Mango' , '350 ml', 'Lata', 3.50)
;

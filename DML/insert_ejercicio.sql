/*
EJERCICIO 
Incluye los siguientes registros en la tabla de clientes:
DNI: 9283760794, NOMBRE: Edson Calisaya, DIRECCION: Sta Úrsula Xitla, 
BARRIO: Barrio del Niño Jesús, CIUDAD: Ciudad de México, ESTADO: EM, 
CP: 22002002, FECHA DE NACIMIENTO: 1995-01-07, EDAD: 25, SEXO: M, 
LIMITE DE CREDITO: 150000, VOLUMEN DE COMPRA: 250000, PRIMERA COMPRA: Sí.

DNI: 7771579779, NOMBRE: Marcelo Perez, DIRECCION: F.C. de Cuernavaca 13,
BARRIO: Carola, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88202912, 
FECHA DE NACIMIENTO: 1992-01-25, EDAD: 29, SEXO: M, LIMITE DE CREDITO: 70000, 
VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.

DNI: 5576228758, NOMBRE: Patricia Olivera, DIRECCION: Pachuca 75, BARRIO: Condesa, 
CIUDAD: Ciudad de México, ESTADO: EM, CP: 88192029, FECHA DE NACIMIENTO: 1995-01-14 , 
EDAD: 25, SEXO: F, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.
*/

USE ventas_jugos;

INSERT INTO 
tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) 
VALUES 
('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1);
INSERT INTO 
tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) 
VALUES 
('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 120000, 200000, 1);
INSERT INTO 
tb_cliente (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) 
VALUES ('5576228758', 'Patricia Olivera', 'Pachuca 75',  'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1);


/*
Incluye todos los clientes en la tabla tb_clientes basado en los registros de la tabla tabla_de_clientes de la base jugos_ventas.
Observación: Atención al nombre de los campos y recuerda que ya incluimos 3 clientes en nuestra tabla durante el ejercicio anterior.
*/


SELECT * FROM jugos_ventas.tabla_de_clientes;


SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO, EDAD, SEXO, 
LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,PRIMERA_COMPRA
FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN(SELECT DNI FROM tb_cliente);

INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO, EDAD, SEXO, 
LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,PRIMERA_COMPRA
FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN(SELECT DNI FROM tb_cliente);


SELECT * FROM tb_cliente;
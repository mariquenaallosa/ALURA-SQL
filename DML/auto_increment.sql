CREATE TABLE tb_identificacion(
ID INT AUTO_INCREMENT NOT NULL,
DESCRIPCION VARCHAR(50) NULL,
PRIMARY KEY(ID)
);

SELECT * FROM tb_identificacion;

INSERT INTO tb_identificacion (DESCRIPCION) 
VALUES ('Cliente A');

INSERT INTO tb_identificacion (DESCRIPCION) VALUES 
('Cliente B'),
('Cliente C'),
('Cliente D'),
('Cliente E');

DELETE FROM tb_identificacion
WHERE ID = 6;

INSERT INTO tb_identificacion (DESCRIPCION) 
VALUES ('Cliente G');


INSERT INTO tb_identificacion (ID, DESCRIPCION) 
VALUES (100 ,'Cliente H');

INSERT INTO tb_identificacion (DESCRIPCION) 
VALUES ('Cliente H');


INSERT INTO tb_identificacion (ID, DESCRIPCION) 
VALUES (NULL ,'Cliente I');




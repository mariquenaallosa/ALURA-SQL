USE ventas_jugos;

CREATE TABLE tb_venta(
NUMERO VARCHAR(5) NOT NULL,
FECHA DATE NULL,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT NULL,
PRIMARY KEY (NUMERO)
);

ALTER TABLE tb_venta ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI ) REFERENCES tb_cliente(DNI); 

ALTER TABLE tb_venta ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA); 


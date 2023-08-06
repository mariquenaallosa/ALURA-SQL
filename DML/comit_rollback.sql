select * from tb_vendedor;


START TRANSACTION;
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('257',
'Fernando Rojas',
'Oblatos',
0.1,
'2015-06-14',
0),
('258',
'David Rojas',
'Del Valle',
0.15,
'2015-06-14',
0);

UPDATE tb_vendedor
SET COMISION = COMISION * 1.05;

ROLLBACK;

COMMIT;
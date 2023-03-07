create database tarjeta
use tarjeta

create table tarjetas(
ID_T int,
TIPO_T VARCHAR(150),
CONSTRAINT PK_IDT PRIMARY KEY(ID_T))

CREATE TABLE CLIENTE(
ID_CLI INT,
NOM_CLI VARCHAR(150),
INGRESO FLOAT,
CONSTRAINT PK_IDCLI PRIMARY KEY(ID_CLI))

INSERT INTO CLIENTE VALUES(100,'DAVID MEDINA',70000)
INSERT INTO CLIENTE VALUES(200,'rAUL rAMIREZ',80000)
INSERT INTO CLIENTE VALUES(300,'EDGAR REZA',90000)

CREATE TABLE TARCLI(
ID_T1 INT,
ID_CLI1 INT,
S_AUT FLOAT,
CONSTRAINT FK_IDT1 FOREIGN KEY(ID_T1) REFERENCES TARJETAS(ID_T),
CONSTRAINT FK_IDCL1 FOREIGN KEY(ID_CLI1) REFERENCES CLIENTE(ID_CLI))

waitfor delay '00:00:03'
INSERT INTO TARCLI VALUES(1,100,300000)


UPDATE TARCLI
SET S_AUT=S_AUT-125000
FROM TARJETAS INNER JOIN TARCLI ON TARJETAS.ID_T=TARCLI.ID_T1 INNER JOIN CLIENTE ON CLIENTE.ID_CLI=TARCLI.ID_CLI1
WHERE ID_CLI1=100 AND ID_T1=1
waitfor delay '00:00:02'
SELECT *
FROM TARJETAS INNER JOIN TARCLI ON TARJETAS.ID_T=TARCLI.ID_T1 INNER JOIN CLIENTE ON CLIENTE.ID_CLI=TARCLI.ID_CLI1

 
INSERT INTO TARJETAS VALUES(1,'DEBITO')
INSERT INTO TARJETAS VALUES(2,'CREDITO')
INSERT INTO TARJETAS VALUES(3,'DEBITO')


SELECT * FROM TARJETAS

UPDATE TARJETAS
SET TIPO_T='NOMINA'

BEGIN TRANSACTION PRUEBA1
ROLLBACK TRANSACTION PRUEBA1
SAVE TRANSACTION PRUEBA1
COMMIT TRANSACTION PRUEBA1


waitfor delay '00:00:03'
UPDATE TARJETAS
SET TIPO_T='nomina'
select * from tarjetas


sp_helpdb tarjeta
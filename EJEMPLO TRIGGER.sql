CREATE DATABASE DISPARADOR2017
USE DISPARADOR2017

DROP DATABASE DISPARADOR2017
CREATE TABLE PRUEBA(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(45),
FECHA_N SMALLDATETIME,
NOTA VARCHAR(30))

SET DATEFORMAT DMY

INSERT INTO PRUEBA VALUES(5,'JUAN','10-10-1989',NULL)
INSERT INTO PRUEBA VALUES(7,'JUANITO','10-10-1999',NULL)
INSERT INTO PRUEBA VALUES(9,'PEDRO','5-4-2000',NULL)
INSERT INTO PRUEBA VALUES(19,'juanit','25-10-1990',NULL)
INSERT INTO PRUEBA VALUES(16,'pablito','27-10-1990',NULL)
INSERT INTO PRUEBA VALUES(18,'pablo','27-10-1990',NULL)
INSERT INTO PRUEBA VALUES(20,'reza','27-10-1990',NULL)
INSERT INTO PRUEBA VALUES(21,'altair','27-11-1990',NULL)
INSERT INTO PRUEBA VALUES(22,'yolanda','27-11-1990',NULL)
INSERT INTO PRUEBA VALUES(23,'maria','19-11-1990',NULL)

SELECT *
FROM PRUEBA

DROP TABLE PRUEBA

DROP TRIGGER MENSAJE

CREATE TRIGGER MENSAJE
ON PRUEBA
FOR INSERT
AS
BEGIN
PRINT'REGISTRO ALMACENADO CORRECTAMENTE'
UPDATE PRUEBA
SET NOTA='es mayor de edad'
WHERE DATEDIFF(YY,FECHA_N,GETDATE())>=18
UPDATE PRUEBA
SET NOTA='es menor de edad'
WHERE DATEDIFF(YY,FECHA_N,GETDATE())<18
UPDATE PRUEBA
SET NOMBRE=UPPER(NOMBRE),
NOTA=UPPER(NOTA)
SELECT *
FROM PRUEBA
END

DROP TRIGGER MENSAJE

CREATE DATABASE SAVM
USE SAVM

CREATE TABLE ESPECIALIDAD(
ID_ED VARCHAR(10) PRIMARY KEY,
NOM_ED VARCHAR(50))
--PRUEBA
drop table especialidad
INSERT INTO ESPECIALIDAD VALUES('1','BIOLOGIA')
INSERT INTO ESPECIALIDAD VALUES('0','MATE')

INSERT INTO ESPECIALIDAD VALUES('493','BIOLOG')

SELECT *
FROM ESPECIALIDAD

DELETE
FROM ESPECIALIDAD

DROP TRIGGER ADMIN1
CREATE TRIGGER ADMIN1
ON ESPECIALIDAD
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDED VARCHAR(10)
DECLARE @NOMES VARCHAR(50)
select @IDED=I.ID_ED,@NOMES=I.NOM_ED
FROM inserted I

--DUPLICACION
if(EXISTS(select * from ESPECIALIDAD where @IDED<>ESPECIALIDAD.ID_ED and @NOMES=ESPECIALIDAD.NOM_ED))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro con exito'
update ESPECIALIDAD
set NOM_ED=upper(NOM_ED),
ID_ED=DATENAME(ms,GETDATE())

where ID_ED=@IDED
commit transaction
end
END

--ENCRIPTACION
UPDATE ESPECIALIDAD
SET NOM_ED=reverse(replace((replace((replace((replace((replace((replace((NOM_ED),'O','#')),'U','*')),'M','-')),'C','+')),'A','R')),'R','7'))


CREATE TABLE DIAGNOSTICO(
ID_DIAG VARCHAR(5)PRIMARY KEY,
NOM_DIAG VARCHAR(50))

SELECT *
FROM DIAGNOSTICO

INSERT INTO DIAGNOSTICO VALUES('1','CANCER')
INSERT INTO DIAGNOSTICO VALUES('2','SIDA')
INSERT INTO DIAGNOSTICO VALUES('3','SIDA')
DROP TRIGGER DIAG


CREATE TRIGGER DIAG
ON DIAGNOSTICO
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDDIAG VARCHAR(5)
DECLARE @NODIAG VARCHAR(50)
select @IDDIAG=I.ID_DIAG,@NODIAG=I.NOM_DIAG
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from DIAGNOSTICO where @IDDIAG<>DIAGNOSTICO.ID_DIAG and @NODIAG=DIAGNOSTICO.NOM_DIAG ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update DIAGNOSTICO
set NOM_DIAG=upper(NOM_DIAG),
--ASIGNACION DE CLAVE PRIMARIA
ID_DIAG=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_DIAG),3)
where id_diag=@IDDIAG
commit transaction
end
END
--ENCRIPTACION
UPDATE DIAGNOSTICO
SET NOM_DIAG=reverse(replace((replace((replace((replace((replace((NOM_DIAG),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE DIAGNOSTICO
SET NOM_DIAG=reverse(replace((replace((replace((replace((replace((NOM_DIAG),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))



CREATE TABLE CALLE(
ID_CA VARCHAR(5)PRIMARY KEY,
NOM_CALLE VARCHAR(70))

INSERT INTO CALLE VALUES('1','REFORMA')
INSERT INTO CALLE VALUES('2','REFORMA')
INSERT INTO CALLE VALUES('3','COYUYA')

select *
from calle

CREATE TRIGGER CAL
ON CALLE
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDCA VARCHAR(5)
DECLARE @NOCA VARCHAR(50)
select @IDCA=I.ID_CA,@NOCA=I.NOM_CALLE
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from CALLE where @IDCA<>CALLE.ID_CA and @NOCA=CALLE.NOM_CALLE ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update CALLE
set NOM_CALLE=upper(NOM_CALLE),
--ASIGNACION DE CLAVE PRIMARIA
ID_CA=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_CALLE),3)
where id_CA=@IDCA
commit transaction
end
END
--ENCRIPTACION
UPDATE CALLE
SET NOM_CALLE=reverse(replace((replace((replace((replace((replace((NOM_CALLE),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE CALLE
SET NOM_CALLE=reverse(replace((replace((replace((replace((replace((NOM_CALLE),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))



CREATE TABLE PRESENTACION(
ID_PRE VARCHAR(5)PRIMARY KEY,
NOM_PREN VARCHAR(50))

INSERT INTO PRESENTACION VALUES('1','p&g')
INSERT INTO PRESENTACION VALUES('2','SENSIBIT')
INSERT INTO PRESENTACION VALUES('3','PEPTOBISMOL')
INSERT INTO PRESENTACION VALUES('4','P&G')

CREATE TRIGGER PRE
ON PRESENTACION
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDPRE VARCHAR(5)
DECLARE @NOPRE VARCHAR(50)
select @IDPRE=I.ID_PRE,@NOPRE=I.NOM_PREN
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from PRESENTACION where @IDPRE<>PRESENTACION.ID_PRE and @NOPRE=PRESENTACION.NOM_PREN ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update PRESENTACION
set NOM_PREN=upper(NOM_PREN),
--ASIGNACION DE CLAVE PRIMARIA
ID_PRE=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_PREN),3)
where ID_PRE=@IDPRE
commit transaction
end
END
--ENCRIPTACION
UPDATE PRESENTACION
SET NOM_PREN=reverse(replace((replace((replace((replace((replace((NOM_PREN),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE PRESENTACION
SET NOM_PREN=reverse(replace((replace((replace((replace((replace((NOM_PREN),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

CREATE TABLE VIAADMON(
ID_VIA VARCHAR(5) PRIMARY KEY,
NOM_VA VARCHAR(50))

SELECT *
FROM VIADDMON

INSERT INTO VIAADMON VALUES('1','VIA1')
INSERT INTO VIAADMON VALUES('2','VIA1')
INSERT INTO VIAADMON VALUES('3','VIA2')

CREATE TRIGGER VIAD
ON VIAADMON
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDVI VARCHAR(5)
DECLARE @NOVI VARCHAR(50)
select @IDVI=I.ID_VIA,@NOVI=I.NOM_VA
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from VIAADMON where @IDVI<>VIAADMON.ID_VIA and @NOVI=VIAADMON.NOM_VA ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update VIAADMON
set NOM_VA=upper(NOM_VA),
--ASIGNACION DE CLAVE PRIMARIA
ID_VIA=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_VA),3)
where ID_VIA=@IDVI
commit transaction
end
END
--ENCRIPTACION
UPDATE VIAADMON
SET NOM_VA=reverse(replace((replace((replace((replace((replace((NOM_VA),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE VIAADMON
SET NOM_VA=reverse(replace((replace((replace((replace((replace((NOM_VA),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))



CREATE TABLE LABORATORIO(
ID_LAB VARCHAR(5) PRIMARY KEY,
NOM_LAB VARCHAR(50))

SELECT *
FROM LABORATORIO
INSERT INTO LABORATORIO VALUES('1','P&G')
INSERT INTO LABORATORIO VALUES('2','P&G')
INSERT INTO LABORATORIO VALUES('3','SELLINT')

CREATE TRIGGER ADMIN6 -----------------------TRIGGER LABORATORIO
ON LABORATORIO
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDLAB VARCHAR(5)
DECLARE @NOMLAB VARCHAR(50)
SELECT @IDLAB=Z.ID_LAB,@NOMLAB=Z.NOM_LAB
FROM inserted Z

--DUPLICIDAD
if(EXISTS(select * from LABORATORIO 
where @IDLAB<>LABORATORIO.ID_LAB and @NOMLAB=LABORATORIO.NOM_LAB ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update LABORATORIO
set NOM_LAB=upper(NOM_LAB),

--ASIGNACION DE CLAVE PRIMARIA
ID_LAB=CHAR(10)+CHAR(20)+CHAR(30)+LEFT(ASCII(NOM_LAB),3)
commit transaction
end
END
--ENCRIPTACION

UPDATE LABORATORIO
SET NOM_LAB=reverse(replace((replace((replace((replace((replace((NOM_LAB),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE LABORATORIO
SET NOM_LAB=reverse(replace((replace((replace((replace((replace((NOM_LAV),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

CREATE TABLE COMPONENTE(
ID_COM VARCHAR(5) PRIMARY KEY,
NOM_COM VARCHAR(50))

SELECT *
FROM COMPONENTE

INSERT INTO COMPONENTE VALUES('1','PENICILINA')
INSERT INTO COMPONENTE VALUES('2','PARACETAMOL')
INSERT INTO COMPONENTE VALUES('3','peni')



CREATE TRIGGER ADMIN7 -----------------------TRIGGER COMPONENTE
ON COMPONENTE
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDCOM VARCHAR(5)
DECLARE @NOMCOM VARCHAR(50)
SELECT @IDCOM=X.ID_COM,@NOMCOM=X.NOM_COM
FROM inserted X

--DUPLICIDAD

if(EXISTS(select * from COMPONENTE 
where @IDCOM<>COMPONENTE.ID_COM and @NOMCOM=COMPONENTE.NOM_COM ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update COMPONENTE
set NOM_COM=upper(NOM_COM),

--ASIGNACION DE CLAVE PRIMARIA

ID_COM=CHAR(11)+CHAR(22)+CHAR(33)+LEFT(ASCII(NOM_COM),3)
commit transaction
end
END

--ENCRIPTACION

UPDATE COMPONENTE
SET NOM_COM=reverse(replace((replace((replace((replace((replace((NOM_COM),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE COMPONENTE
SET NOM_COM=reverse(replace((replace((replace((replace((replace((NOM_COM),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE UNIDAD(
ID_UN VARCHAR(5) PRIMARY KEY,
NOM_UN VARCHAR(50))

INSERT INTO UNIDAD VALUES('1','GRAMOS')
INSERT INTO UNIDAD VALUES('2','KILOGRAMOS')
INSERT INTO UNIDAD VALUES('3','GRAMOS')

SELECT *
FROM UNIDAD

CREATE TRIGGER ADMIN8 -----------------------TRIGGER UNIDAD
ON UNIDAD
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDUN VARCHAR(5)
DECLARE @NOMUN VARCHAR(50)
SELECT @IDUN=C.ID_UN,@NOMUN=C.NOM_UN
FROM inserted C

--DUPLICIDAD
if(EXISTS(select * from UNIDAD 
where @IDUN<>UNIDAD.ID_UN and @NOMUN=UNIDAD.NOM_UN ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update UNIDAD
set NOM_UN=upper(NOM_UN),

--ASIGNACION DE CLAVE PRIMARIA

ID_UN=CHAR(40)+CHAR(50)+CHAR(60)+LEFT(ASCII(NOM_UN),3)
commit transaction
end

END

--ENCRIPTACION

UPDATE UNIDAD
SET NOM_UN=reverse(replace((replace((replace((replace((replace((NOM_UN),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE UNIDAD
SET NOM_UN=reverse(replace((replace((replace((replace((replace((NOM_UN),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ALERGIA(
ID_AL VARCHAR(5) PRIMARY KEY,
NOM_AL VARCHAR(50))

SELECT *
FROM ALERGIA

INSERT INTO ALERGIA VALUES('1','INFLUENZA')
INSERT INTO ALERGIA VALUES('2','GRIPA')
INSERT INTO ALERGIA VALUES('3','GRIPA')

CREATE TRIGGER ADMIN9 -----------------------TRIGGER ALERGIA
ON ALERGIA
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDAL VARCHAR(5)
DECLARE @NOMAL VARCHAR(50)
SELECT @IDAL=V.ID_AL,@NOMAL=V.NOM_AL
FROM inserted V

--DUPLICIDAD
if(EXISTS(select * from ALERGIA 
where @IDAL<>ALERGIA.ID_AL and @NOMAL=ALERGIA.NOM_AL ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update ALERGIA
set NOM_AL=upper(NOM_AL),
--ASIGNACION DE CLAVE PRIMARIA
ID_AL=CHAR(44)+CHAR(55)+CHAR(66)+LEFT(ASCII(NOM_AL),3)
commit transaction
end

END




--ENCRIPTACION

UPDATE ALERGIA
SET NOM_AL=reverse(replace((replace((replace((replace((replace((NOM_AL),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE ALERGIA
SET NOM_AL=reverse(replace((replace((replace((replace((replace((NOM_AL),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE DELEGACION(
ID_DEL VARCHAR(5) PRIMARY KEY,
NOM_DEL VARCHAR(50))

SELECT *
FROM DELEGACION
INSERT INTO DELEGACION VALUES('1','CUAJIMALPA')
INSERT INTO DELEGACION VALUES('2','CUAJIMALPA')
INSERT INTO DELEGACION VALUES('3','VENUSTIANO CARRANZA')
INSERT INTO DELEGACION VALUES('6','milpaalta')

CREATE TRIGGER ADMIN10 -----------------------TRIGGER DELEGACION
ON DELEGACION
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDDEL VARCHAR(5)
DECLARE @NOMDEL VARCHAR(50)
SELECT @IDDEL=B.ID_DEL,@NOMDEL=B.NOM_DEL
FROM inserted B
--DUPLICIDAD
if(EXISTS(select * from DELEGACION 
where @IDDEL<>DELEGACION.ID_DEL and @NOMDEL=DELEGACION.NOM_DEL ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update DELEGACION
set NOM_DEL=upper(NOM_DEL),
--ASIGNACION DE CLAVE PRIMARIA
ID_DEL=CHAR(70)+CHAR(80)+CHAR(90)+LEFT(ASCII(NOM_DEL),3)
commit transaction
end
END

--ENCRIPTACION
UPDATE DELEGACION
SET NOM_DEL=reverse(replace((replace((replace((replace((replace((NOM_DEL),'u','*')),'o','-')),'i','1')),'A','3')),'E','7'))
UPDATE DELEGACION
SET NOM_DEL=reverse(replace((replace((replace((replace((replace((NOM_DEL),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

CREATE TABLE ENFERMEDAD(
ID_EMF VARCHAR(5) PRIMARY KEY,
NOM_ENF VARCHAR(50))

SELECT *
FROM ENFERMEDAD

INSERT INTO ENFERMEDAD VALUES('1','SIFILIS')
INSERT INTO ENFERMEDAD VALUES('2','GONORREA')
INSERT INTO ENFERMEDAD VALUES('3','SIFILIS')


CREATE TRIGGER ADMIN16
ON ENFERMEDAD
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDEM VARCHAR(5)
DECLARE @NOEM VARCHAR(50)
select @IDEM=I.ID_EMF,@NOEM=I.NOM_ENF
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from ENFERMEDAD where @IDEM<>ENFERMEDAD.ID_EMF and @NOEM=ENFERMEDAD.NOM_ENF ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update ENFERMEDAD
set NOM_ENF=upper(NOM_ENF),
--ASIGNACION DE CLAVE PRIMARIA
ID_EMF=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_ENF),3)
where ID_EMF=@IDEM
commit transaction
end
END
--ENCRIPTACION
UPDATE ENFERMEDAD
SET NOM_ENF=reverse(replace((replace((replace((replace((replace((nom_ENF),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE ENFERMEDAD
SET NOM_ENF=reverse(replace((replace((replace((replace((replace((nom_ENF),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


CREATE TABLE TIPOPAR(
ID_TPR VARCHAR(5) PRIMARY KEY,
NOM_TPR VARCHAR(50))

SELECT *
FROM TIPOPAR
INSERT INTO TIPOPAR VALUES('1','')

CREATE TRIGGER ADMIN11
ON TIPOPAR
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDTP VARCHAR(5)
DECLARE @NOMTP VARCHAR(50)
select @IDTP=I.ID_TPR,@NOMTP=I.NOM_TPR
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from TIPOPAR where @IDTP<>TIPOPAR.ID_TPR and @NOMTP=TIPOPAR.NOM_TPR ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update TIPOPAR
set NOM_TPR=upper(NOM_TPR),
--ASIGNACION DE CLAVE PRIMARIA
ID_TPR=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_TPR),3)
where id_tpr=@IDTP
commit transaction
end
END
--ENCRIPTACION
UPDATE TIPOPAR
SET NOM_TPR=reverse(replace((replace((replace((replace((replace((nom_tpr),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE TIPOPAR
SET NOM_TPR=reverse(replace((replace((replace((replace((replace((nom_tpr),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

CREATE TABLE TIPO_SANGRE(
ID_TS VARCHAR(5) PRIMARY KEY,
NOM_TS VARCHAR(50))

SELECT *
FROM SANGRE

CREATE TRIGGER ADMIN12
ON TIPO_SANGRE
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDTS VARCHAR(5)
DECLARE @NOMTS VARCHAR(50)
select @IDTS=I.ID_TS,@NOMTS=I.NOM_TS
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from TIPO_SANGRE where @IDTS<>TIPO_SANGRE.ID_TS and @NOMTS=TIPO_SANGRE.NOM_TS ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update TIPO_SANGRE
set NOM_TS=upper(NOM_TS),
--ASIGNACION DE CLAVE PRIMARIA
ID_TS=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_TS),3)
where id_ts=@IDTS
commit transaction
end
END
--ENCRIPTACION
UPDATE TIPO_SANGRE
SET NOM_TS=reverse(replace((replace((replace((replace((replace((NOM_TS),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE TIPO_SANGRE
SET NOM_TS=reverse(replace((replace((replace((replace((replace((NOM_TS),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

CREATE TABLE TIPOTEL(
ID_TEL VARCHAR(5) PRIMARY KEY,
TIPO_TEL VARCHAR(50))

CREATE TRIGGER ADMIN13
ON TIPOTEL
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDTEL VARCHAR(5)
DECLARE @TIPTEL VARCHAR(50)
select @IDTEL=I.ID_TEL,@TIPTEL=I.TIPO_TEL
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from TIPOTEL where @IDTEL<>TIPOTEL.ID_TEL and @TIPTEL=TIPOTEL.TIPO_TEL ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update TIPOTEL
set TIPO_TEL=upper(TIPO_TEL),
--ASIGNACION DE CLAVE PRIMARIA
ID_TEL=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(TIPO_TEL),3)
where id_tel=@IDTEL
commit transaction
end
END
--ENCRIPTACION
UPDATE TIPOTEL
SET TIPO_TEL=reverse(replace((replace((replace((replace((replace((TIPO_TEL),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE TIPOTEL
SET TIPO_TEL=reverse(replace((replace((replace((replace((replace((TIPO_TEL),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))


CREATE TABLE COLONIA(
ID_COL VARCHAR(5) PRIMARY KEY,
NOM_COL VARCHAR(50))

CREATE TRIGGER ADMIN14
ON COLONIA
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDCO VARCHAR(5)
DECLARE @NOMCO VARCHAR(50)
select @IDCO=I.ID_COL,@NOMCO=I.NOM_COL
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from COLONIA where @IDCO<>COLONIA.ID_COL and @NOMCO=COLONIA.NOM_COL ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update COLONIA
set NOM_COL=upper(NOM_COL),
--ASIGNACION DE CLAVE PRIMARIA
ID_COL=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_COL),3)
where id_COL=@IDCO
commit transaction
end
END
--ENCRIPTACION
UPDATE COLONIA
SET NOM_COL=reverse(replace((replace((replace((replace((replace((NOM_COL),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE COLONIA
SET NOM_COL=reverse(replace((replace((replace((replace((replace((NOM_COL),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

CREATE TABLE SERVICIO(
ID_SER VARCHAR(5) PRIMARY KEY,
NOM_SER VARCHAR(50))

SELECT *
FROM 
INSERT INTO SERVICIO VALUES('1','ONCOLOIGA')
INSERT INTO SERVICIO VALUES('2','DEMARTOLOGIA')
INSERT INTO SERVICIO VALUES('3','ONCOLOGIA')




CREATE TRIGGER ADMIN15
ON SERVICIO
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @IDSE VARCHAR(5)
DECLARE @NOMSE VARCHAR(50)
select @IDSE=I.ID_SER,@NOMSE=I.NOM_SER
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from SERVICIO where @IDSE<>SERVICIO.ID_SER and @NOMSE=SERVICIO.NOM_SER ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update SERVICIO
set NOM_SER=upper(NOM_SER),
--ASIGNACION DE CLAVE PRIMARIA
ID_SER=CHAR(70)+CHAR(69)+CHAR(45)+LEFT(ASCII(NOM_SER),3)
where id_ser=@IDSE
commit transaction
end
END
--ENCRIPTACION
UPDATE SERVICIO
SET NOM_SER=reverse(replace((replace((replace((replace((replace((NOM_SER),'U','*')),'O','-')),'I','1')),'A','3')),'E','7'))
UPDATE SERVICIO
SET NOM_SER=reverse(replace((replace((replace((replace((replace((NOM_SER),'*','U')),'-','O')),'1','I')),'3','A')),'7','E'))

select *
from sysobjects
where xtype='tr'

drop trigger admin16
drop trigger admin15
drop trigger admin14
drop trigger admin13
drop trigger admin12
drop trigger admin11
drop trigger admin10
drop trigger admin9
drop trigger admin8
drop trigger admin7
drop trigger admin6
drop trigger viad
drop trigger pre
drop trigger cal
drop trigger diag
drop trigger admin1

drop database SAVM
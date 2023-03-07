create database hospitales ON PRIMARY(
name=hospitales_DATA,
filename='C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\Data\hospitales_DATOS.MDF',
size=10MB,
MAXSIZE=2GB,
filegrowth=1MB
)
LOG ON
(
name=hospitales_log,
filename='C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\Data\hospitales_LOGS.LDF',
size=10MB,
MAXSIZE=2GB,
FILEGROWTH=1MB
)
USE hospitales;

-----------------------------------------------------------------------------------------------------------------------------------------------ESPECIALIDAD
CREATE TABLE ESPECIALIDAD(
ID_ED VARCHAR(7),
NOM_ED VARCHAR(50),
constraint pk_ided primary key(ID_ED))
ENGINE=InnoDB;


INSERT INTO ESPECIALIDAD VALUES('0','FARMACOLOGIA')
INSERT INTO ESPECIALIDAD VALUES('2','anatomia')


SELECT *
FROM ESPECIALIDAD

---------------------------------------------------TRIGGER DE ESPECIALIDAD
CREATE TRIGGER ADMIN1
ON ESPECIALIDAD
FOR INSERT
AS
BEGIN
DECLARE @IDED VARCHAR(7)
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
ID_ED=UPPER(CHAR(69)+CHAR(83)+CHAR(45)+LEFT(LEN(NOM_ED),1)+LEFT(ASCII(UPPER(REVERSE(NOM_ED))),2)+LEFT(NOM_ED,1))
where ID_ED=@IDED
commit transaction
end
END

CREATE PROCEDURE ENESPECIALIDAD
AS
UPDATE ESPECIALIDAD 
SET 
NOM_ED=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_ED),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM ESPECIALIDAD

EXEC ENESPECIALIDAD
select *
from especialidad

CREATE PROCEDURE DESESPECIALIDAD
AS
UPDATE ESPECIALIDAD SET
NOM_ED=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_ED),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM ESPECIALIDAD


EXEC DESespecialidad



----------------------------------------------------------------------------------------------------------------------------------------------------horario
CREATE TABLE HORARIO(
ID_HR VARCHAR(7),
NOM_HR VARCHAR(50),
constraint pk_hr primary key(ID_HR))



INSERT INTO HORARIO values('0','matutino')
INSERT INTO HORARIO VALUES('1','vespertino')

select *
FROM HORARIO




---------------------------------------------------TRIGGER DE HORARIO
CREATE TRIGGER ADMIN2
ON HORARIO
FOR INSERT
AS
BEGIN
DECLARE @IDHR VARCHAR(7)
DECLARE @NOMHR VARCHAR(50)
select @IDHR=I.ID_HR,@NOMHR=I.NOM_HR
FROM inserted I
--DUPLICACION
if(EXISTS(select * from HORARIO where @IDHR<>HORARIO.ID_HR and @NOMHR=HORARIO.NOM_HR))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro con exito'
commit transaction
--ASIGNACION DE LA CLAVE
UPDATE HORARIO
SET ID_HR=UPPER(CHAR(72)+CHAR(82)+CHAR(45)+LEFT(LEN(NOM_HR),1)+LEFT(ASCII(UPPER(REVERSE(NOM_HR))),2)+LEFT(NOM_HR,1)),
NOM_HR=UPPER(NOM_HR)
where ID_HR=@IDHR
end
END


CREATE PROCEDURE ENHORARIO
AS
UPDATE HORARIO SET
NOM_HR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_HR),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM HORARIO

EXEC ENHORARIO

CREATE PROCEDURE DESHORARIO
AS
UPDATE HORARIO SET
NOM_HR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_HR),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM HORARIO

EXEC desHORARIO

select *
from horario


------------------------------------------------------------------------------------------------------------------------------------------------------DOCTOR

CREATE TABLE DOCTOR(
ID_D VARCHAR(7),
NOM_D VARCHAR(150),
CED_D BIGINT,
ID_ED1 VARCHAR(7),
ID_HR1 VARCHAR(7),
constraint pk_dr primary key(ID_D),
CONSTRAINT FK_IDE1 FOREIGN KEY(ID_ED1) REFERENCES ESPECIALIDAD(ID_ED) on delete cascade,
CONSTRAINT FK_IDHR1 FOREIGN KEY(ID_HR1) REFERENCES HORARIO(ID_HR) on delete cascade,
CHECK(CED_D>0 AND CED_D<99999))  
ENGINE=InnoDB;
------------------------PRUEBAS
INSERT INTO DOCTOR VALUES('0','JUAN',24324,'ES-165F','HR-879M')
INSERT INTO DOCTOR VALUES('0','Pablo',5345,'ES-865A','HR-179V')

select *
from horario

---------------------------------------------------DOCTOR
CREATE TRIGGER ADMIN3
ON DOCTOR
FOR INSERT
AS
BEGIN
DECLARE @IDD VARCHAR(7)
DECLARE @NOMD VARCHAR(150)
DECLARE @CEDD INT
select @IDD=i.ID_D,@NOMD=i.NOM_D,@CEDD=i.CED_D
from inserted i
--DUPLICACION
if(EXISTS(select * from DOCTOR where @IDD<>DOCTOR.ID_D and @NOMD=DOCTOR.NOM_D))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro con exito'
--ASIGNACION DE LA CLAVE
update DOCTOR
set ID_D=UPPER(CHAR(68)+CHAR(82)+CHAR(45)+LEFT(LEN(NOM_D),1)+LEFT(ASCII(UPPER(REVERSE(NOM_D))),2)+LEFT(NOM_D,1)),
NOM_D=UPPER(NOM_D)
where ID_D=@IDD
commit transaction
end
END


------------------------ENCRIPTACION
CREATE PROCEDURE ENDOCTOR
AS
UPDATE DOCTOR SET
NOM_D=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_D),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM DOCTOR


CREATE PROCEDURE DESDOCTOR
AS
UPDATE DOCTOR SET
NOM_D=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_D),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM DOCTOR

EXEC ENDOCTOR
SELECT *
FROM DOCTOR
EXEC DESDOCTOR


------------------------------------------------------------------------------------------------------------------------------DIAGNOSTICO
CREATE TABLE DIAGNOSTICO(
ID_DIAG VARCHAR(7),
NOM_DIAG VARCHAR(50),
constraint pk_diag primary key(ID_DIAG))
ENGINE=InnoDB;

INSERT INTO DIAGNOSTICO VALUES('0','REPOSO')
INSERT INTO DIAGNOSTICO VALUES('0','GRAVE')
INSERT INTO DIAGNOSTICO VALUES ('0','SALUDABLE')

---------------------------------------------------TRIGGER DE DIAGNOSTICO
CREATE TRIGGER ADMIN4
ON DIAGNOSTICO
FOR INSERT
AS
BEGIN
DECLARE @IDDIAG VARCHAR(7)
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
print'REGISTRO CON EXITO'
commit transaction
update DIAGNOSTICO
set 
--ASIGNACION DE CLAVE PRIMARIA
ID_DIAG=UPPER(CHAR(68)+CHAR(71)+CHAR(45)+LEFT(LEN(NOM_DIAG),1)+LEFT(ASCII(UPPER(REVERSE(NOM_DIAG))),2)+LEFT(NOM_DIAG,1)),
NOM_DIAG=upper(NOM_DIAG)
where ID_DIAG=@IDDIAG
end
END


SELECT *
FROM DIAGNOSTICO


CREATE PROCEDURE enDIAGNOSTICO
AS
UPDATE DIAGNOSTICO SET
NOM_DIAG=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_DIAG),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM DIAGNOSTICO

CREATE PROCEDURE DESDIAGNOSTICO
AS
UPDATE DIAGNOSTICO SET
NOM_DIAG=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_DIAG),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM DOCTOR



----------------------------------------------------------------------------------------------------------------------------------TIPOTEL
CREATE TABLE TIPOTEL(
ID_TEL VARCHAR(7),
TIPO_TEL VARCHAR(50),
constraint pk_tel primary key(ID_TEL))
ENGINE=InnoDB;

INSERT INTO TIPOTEL VALUES('0','CELULAR')
INSERT INTO TIPOTEL VALUES('0','TELEFONO')
INSERT INTO TIPOTEL VALUES('0','FAX')

CREATE PROCEDURE CONTIPOTEL
AS
SELECT *
FROM TIPOTEL
 CONTIPOTEL
---------------------------------------------------TRIGGER DE TIPOTEL

CREATE TRIGGER ADMIN5
ON TIPOTEL
FOR INSERT
AS
BEGIN
DECLARE @IDTEL VARCHAR(7)
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
--ASIGNACION DE CLAVE PRIMARIA
update TIPOTEL
set TIPO_TEL=upper(TIPO_TEL),
ID_TEL=UPPER(CHAR(84)+CHAR(84)+CHAR(45)+LEFT(LEN(TIPO_TEL),1)+LEFT(ASCII(UPPER(REVERSE(TIPO_TEL))),2)+LEFT(TIPO_TEL,1))
where id_tel=@IDTEL
commit transaction
end
END


CREATE PROCEDURE ENTIPOTEL
AS
UPDATE TIPOTEL SET
TIPO_TEL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TIPO_TEL),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM TIPOTEL

CREATE PROCEDURE DESTIPOTEL
AS
UPDATE TIPOTEL SET
TIPO_TEL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TIPO_TEL),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM TIPOTEL

------------------------------------------------------------------------------------------------------------------------------tipoenf
CREATE TABLE TIPOENF(
ID_TE VARCHAR(7),
NOM_TE VARCHAR(150),
constraint pk_te primary key(ID_TE))
ENGINE=InnoDB;

INSERT INTO TIPOENF VALUES('0','RESPIRATORIA')
INSERT INTO TIPOENF VALUES('0','DIGESTION')

SELECT *
FROM TIPOENF

---------------------------------------------------TRIGGER DE TIPOENF

CREATE TRIGGER ADMIN6
ON TIPOENF
FOR INSERT
AS
BEGIN
DECLARE @IDTE VARCHAR(7)
DECLARE @NOMTE VARCHAR(50)
select @IDTE=I.ID_TE,@NOMTE=I.NOM_TE
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from TIPOENF where @IDTE<>TIPOENF.ID_TE and @NOMTE=TIPOENF.NOM_TE ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
--ASIGNACION DE CLAVE PRIMARIA
update TIPOENF
set NOM_TE=upper(NOM_TE),
ID_TE=UPPER(CHAR(84)+CHAR(69)+CHAR(45)+LEFT(LEN(NOM_TE),1)+LEFT(ASCII(UPPER(REVERSE(NOM_TE))),2)+LEFT(NOM_TE,1))
where id_TE=@IDTE
commit transaction
end
END

CREATE PROCEDURE ENTIPOENF
AS
UPDATE TIPOENF SET
NOM_TE=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TE),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM TIPOENF

CREATE PROCEDURE DESTIPOENF
AS
UPDATE TIPOENF SET
NOM_TE=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TE),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM TIPOENF

------------------------------------------------------------------------------------------------------------------------------colonia
CREATE TABLE COLONIA(
ID_COL VARCHAR(7),
NOM_COL VARCHAR(50),
constraint pk_col primary key(ID_COL))
ENGINE=InnoDB;

insert into colonia values('0','balbuena')
insert into colonia values('0','LORENZO')

SELECT *
FROM COLONIA



---------------------------------------------------TRIGGER DE COLONIA
CREATE TRIGGER ADMIN7
ON COLONIA
FOR INSERT
AS
BEGIN
DECLARE @IDCO VARCHAR(7)
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
--ASIGNACION DE CLAVE PRIMARIA
update COLONIA
set NOM_COL=upper(NOM_COL),
ID_COL=UPPER(CHAR(67)+CHAR(79)+CHAR(45)+LEFT(LEN(NOM_COL),1)+LEFT(ASCII(UPPER(REVERSE(NOM_COL))),2)+LEFT(NOM_COL,1))
where id_COL=@IDCO
commit transaction
end
END


CREATE PROCEDURE ENCOLONIA
AS
UPDATE COLONIA SET
NOM_COL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_COL),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM COLONIA

exec ENCOLONIA


CREATE PROCEDURE DESCOLONIA
AS
UPDATE COLONIA SET
NOM_COL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_COL),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM COLONIA

exec DESCOLONIA
------------------------------------------------------------------------------------------------------------------------------calle
CREATE TABLE CALLE(
ID_CA VARCHAR(7),
NOM_CALLE VARCHAR(70),
constraint pk_calle primary key(ID_CA))
ENGINE=InnoDB;

insert into calle values('0','reforma')
insert into calle values('0','fservando')

select *
from calle




---------------------------------------------------TRIGGER DE CALLE
CREATE TRIGGER ADMIN8
ON CALLE
FOR INSERT
AS
BEGIN
DECLARE @IDCA VARCHAR(7)
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
set
--ASIGNACION DE CLAVE PRIMARIA
ID_CA=UPPER(CHAR(67)+CHAR(65)+CHAR(45)+LEFT(LEN(NOM_CALLE),1)+LEFT(ASCII(UPPER(REVERSE(NOM_CALLE))),2)+LEFT(NOM_CALLE,1)),
NOM_CALLE=upper(NOM_CALLE)
where id_CA=@IDCA
commit transaction
end
END

CREATE PROCEDURE ENCALLE
AS
UPDATE CALLE SET
NOM_CALLE=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_CALLE),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM CALLE

EXEC ENCALLE

CREATE PROCEDURE DESCALLE
AS
UPDATE CALLE SET
NOM_CALLE=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_CALLE),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM CALLE

EXEC DESCALLE

------------------------------------------------------------------------------------------------------------------------------presentacion

CREATE TABLE PRESENTACION(
ID_PRE VARCHAR(7),
NOM_PREN VARCHAR(50),
constraint pk_pre primary key(ID_PRE))
ENGINE=InnoDB;

insert into presentacion values('0','botellas')
insert into presentacion values('0','capsulas')

select *
from presentacion


---------------------------------------------------TRIGGER DE PRESENTACION
CREATE TRIGGER ADMIN9
ON PRESENTACION
FOR INSERT
AS
BEGIN
DECLARE @IDPRE VARCHAR(7)
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
ID_PRE=UPPER(CHAR(80)+CHAR(82)+CHAR(45)+LEFT(LEN(NOM_PREN),1)+LEFT(ASCII(UPPER(REVERSE(NOM_PREN))),2)+LEFT(NOM_PREN,1))
where ID_PRE=@IDPRE
commit transaction
end
END


CREATE PROCEDURE ENPRESENTACION
AS
UPDATE PRESENTACION SET
NOM_PREN=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_PREN),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM PRESENTACION

EXEC ENPRESENTACION

CREATE PROCEDURE DESPRESENTACION
AS
UPDATE PRESENTACION SET
NOM_PREN=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_PREN),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM PRESENTACION

EXEC DESPRESENTACION

SELECT *
FROM PRESENTACION

------------------------------------------------------------------------------------------------------------------------------viadadmon

CREATE TABLE VIAADMON(
ID_VIA VARCHAR(7),
NOM_VA VARCHAR(50),
constraint pl_via primary key(ID_VIA))
ENGINE=InnoDB;

INSERT INTO VIAADMON VALUES('0','INYECTADO')
INSERT INTO VIAADMON VALUES('0','ORAL')

select *
from viaadmon

---------------------------------------------------TRIGGER DE CIAADMON
CREATE TRIGGER ADMIN10
ON VIAADMON
FOR INSERT
AS
BEGIN
DECLARE @IDVI VARCHAR(7)
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
ID_VIA=UPPER(CHAR(86)+CHAR(73)+CHAR(45)+LEFT(LEN(NOM_VA),1)+LEFT(ASCII(UPPER(REVERSE(NOM_VA))),2)+LEFT(NOM_VA,1))
where ID_VIA=@IDVI
commit transaction
end
END


CREATE PROCEDURE ENVIAADMON
AS
UPDATE VIAADMON SET
NOM_VA=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_VA),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM VIAADMON


CREATE PROCEDURE DESVIAADMON
AS
UPDATE VIAADMON 
SET NOM_VA=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_VA),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM VIAADMON



------------------------------------------------------------------------------------------------------------------------------laboratorio
CREATE TABLE LABORATORIO(
ID_LAB VARCHAR(7),
NOM_LAB VARCHAR(50),
constraint pk_lab primary key(ID_LAB))
ENGINE=InnoDB;

INSERT INTO LABORATORIO VALUES('0','LAB')
INSERT INTO LABORATORIO VALUES('0','SHERIN')

SELECT *
FROM LABORATORIO


---------------------------------------------------TRIGGER DE LABORATORIO
CREATE TRIGGER ADMIN11 
ON LABORATORIO
FOR INSERT
AS
BEGIN
DECLARE @IDLAB VARCHAR(7)
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
ID_LAB=UPPER(CHAR(76)+CHAR(65)+CHAR(45)+LEFT(LEN(NOM_LAB),1)+LEFT(ASCII(UPPER(REVERSE(NOM_LAB))),2)+LEFT(NOM_LAB,1))
WHERE ID_LAB=@IDLAB
commit transaction
end
END

CREATE PROCEDURE ENLABORATORIO
AS
UPDATE LABORATORIO SET
NOM_LAB=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_LAB),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM LABORATORIO

CREATE PROCEDURE DESLABORATORIO
AS
UPDATE LABORATORIO 
SET
NOM_LAB=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_LAB),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM LABORATORIO



------------------------------------------------------------------------------------------------------------------------------componente
CREATE TABLE COMPONENTE(
ID_COM VARCHAR(7),
NOM_COM VARCHAR(50),
constraint pk_com primary key(ID_COM))
ENGINE=InnoDB;

INSERT INTO COMPONENTE VALUES('0','H20')
INSERT INTO COMPONENTE VALUES('0','0H3')
INSERT INTO COMPONENTE VALUES('0','CO2')

SELECT *
FROM COMPONENTE
---------------------------------------------------------TRIGGER COMPONENTE
CREATE TRIGGER ADMIN12 
ON COMPONENTE
FOR INSERT
AS
BEGIN
DECLARE @IDCOM VARCHAR(7)
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
ID_COM=UPPER(CHAR(67)+CHAR(77)+CHAR(45)+LEFT(LEN(NOM_COM),1)+LEFT(ASCII(UPPER(REVERSE(NOM_COM))),2)+LEFT(NOM_COM,1))
WHERE ID_COM=@IDCOM
commit transaction
end
END

CREATE PROCEDURE ENCOMPONENTE
AS
UPDATE COMPONENTE SET
NOM_COM=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_COM),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM COMPONENTE

EXEC ENCOMPONENTE

CREATE PROCEDURE DESCOMPONENTE
AS
UPDATE COMPONENTE SET
NOM_COM=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_COM),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM COMPONENTE

EXEC DESCOMPONENTE

------------------------------------------------------------------------------------------------------------------------------unidad
CREATE TABLE UNIDAD(
ID_UN VARCHAR(7),
NOM_UN VARCHAR(50),
NUM_UNI INT,
PRECIO_UNI FLOAT,
TOTAL_UNI FLOAT,
constraint pk_un primary key(ID_UN),
CHECK(NUM_UNI>0),
CHECK(PRECIO_UNI>0),
CHECK(TOTAL_UNI>0))
ENGINE=InnoDB;

INSERT INTO UNIDAD VALUES('0','GRAMO',5,4,20)
INSERT INTO UNIDAD VALUES('0','MILILITROS',2,3,18)
INSERT INTO UNIDAD VALUES('0','kilo',7,2,14)
SELECT *
FROM UNIDAD

------------------------------------------------------------------TRIGGER UNIDAD
CREATE TRIGGER ADMIN13 
ON UNIDAD
FOR INSERT
AS
BEGIN
DECLARE @IDUN VARCHAR(7)
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
ID_UN=UPPER(CHAR(85)+CHAR(78)+CHAR(45)+LEFT(LEN(NOM_UN),1)+LEFT(ASCII(UPPER(REVERSE(NOM_UN))),2)+LEFT(NOM_UN,1))
commit transaction
end
END


CREATE PROCEDURE ENUNIDAD
AS
UPDATE UNIDAD SET
NOM_UN=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_UN),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM UNIDAD

EXEC ENUNIDAD

CREATE PROCEDURE DESUNIDAD
AS
UPDATE UNIDAD SET
NOM_UN=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_UN),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM UNIDAD

EXEC DESUNIDAD

SELECT *
FROM UNIDAD
------------------------------------------------------------------------------------------------------------------------------medicamento
CREATE TABLE MEDICAMENTO(
ID_MED VARCHAR(7),
NOM_MED VARCHAR(150)
constraint pk_med primary key(ID_MED))
ENGINE=InnoDB;


insert into medicamento values('0','paracetamol')
insert into medicamento values('0','tabalon')
insert into medicamento values('0','PEPTO')

select *
from medicamento


--------------------------------------------------------------MEDICAMENTO
CREATE TRIGGER ADMIN14
ON MEDICAMENTO
FOR INSERT
AS
BEGIN
DECLARE @IDMED VARCHAR(7)
DECLARE @NOMED VARCHAR(50)
select @IDMED=I.ID_MED,@NOMED=I.NOM_MED
FROM inserted I
--DUPLICACION
if(EXISTS(select * from MEDICAMENTO where @IDMED<>MEDICAMENTO.ID_MED and @NOMED=MEDICAMENTO.NOM_MED))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro con exito'
update MEDICAMENTO
set NOM_MED=upper(NOM_MED),
ID_MED=UPPER(CHAR(77)+CHAR(69)+CHAR(45)+LEFT(LEN(NOM_MED),1)+LEFT(ASCII(UPPER(REVERSE(NOM_MED))),2)+LEFT(NOM_MED,1))
where ID_MED=@IDMED
commit transaction
end
END

CREATE PROCEDURE ENMEDICAMENTO
AS
UPDATE MEDICAMENTO SET
NOM_MED=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_MED),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM MEDICAMENTO

EXEC ENMEDICAMENTO

CREATE PROCEDURE DESMEDICAMENTO
AS
UPDATE MEDICAMENTO SET
NOM_MED=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_MED),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM MEDICAMENTO

EXEC DESMEDICAMENTO

------------------------------------------------------------------------------------------------------------------------------mepe
CREATE TABLE MEPE(
ID_MED1 VARCHAR(7),
ID_PRE1 VARCHAR(7),
CONSTRAINT FK_IDME1 FOREIGN KEY(ID_MED1) REFERENCES MEDICAMENTO(ID_MED)on delete cascade ,
CONSTRAINT FK_IPR1 FOREIGN KEY(ID_PRE1) REFERENCES PRESENTACION(ID_PRE)on delete cascade)
ENGINE=InnoDB;



insert into mepe values('me-176P','pr-883b')


CREATE PROCEDURE COMEPE
AS
SELECT *
FROM MEPE

COMEPE

---------------------------------------------------TRIGGER DE MEPE
CREATE TRIGGER ADMIN15
ON MEPE
FOR INSERT
AS
BEGIN
DECLARE @IDMED1 VARCHAR(7)  
DECLARE @IDPRE1 VARCHAR(7)
DECLARE @X INT
select @IDMED1=LOWER(I.ID_MED1),@IDPRE1=I.ID_PRE1 FROM inserted I
SET @X=ASCII(@IDMED1)
UPDATE MEPE
SET ID_MED1=UPPER(ID_MED1),
ID_PRE1=UPPER(ID_PRE1)
END




------------------------------------------------------------------------------------------------------------------------------meviad
CREATE TABLE MEVIAD(
ID_MED2 VARCHAR(7),
ID_VIA1 VARCHAR(7),
CONSTRAINT FK_IDMED2 FOREIGN KEY(ID_MED2) REFERENCES MEDICAMENTO(ID_MED) on delete cascade,
CONSTRAINT FK_IDVIA1 FOREIGN KEY(ID_VIA1) REFERENCES VIAADMON(ID_VIA) on delete cascade)
ENGINE=InnoDB;

INSERT INTO MEVIAD values('me-176p','vi-979i')
CREATE PROCEDURE COMEVIAD
AS
SELECT *
FROM MEVIAD

COMEVIAD

---------------------------------------------------TRIGGER DE MEVIAD
CREATE TRIGGER ADMIN16
ON MEVIAD
FOR INSERT
AS
BEGIN
DECLARE @IDMED2 VARCHAR(7)  
DECLARE @IDVIA1 VARCHAR(7)
DECLARE @X INT
select @IDMED2=LOWER(I.ID_MED2),@IDVIA1=I.ID_VIA1 FROM inserted I
SET @X=ASCII(@IDMED2)
--DUPLICACION
UPDATE MEVIAD
SET ID_MED2=UPPER(ID_MED2),ID_VIA1=UPPER(ID_VIA1)
END


------------------------------------------------------------------------------------------------------------------------------mela
CREATE TABLE MELA(
ID_MED3 VARCHAR(7),
ID_LAB1 VARCHAR(7),
CONSTRAINT FK_IDMED3 FOREIGN KEY(ID_MED3) REFERENCES MEDICAMENTO(ID_MED) on delete cascade,
CONSTRAINT FK_IDLAB1 FOREIGN KEY(ID_LAB1) REFERENCES LABORATORIO(ID_LAB) on delete cascade)
ENGINE=InnoDB;

INSERT INTO MELA VALUES('me-176p','la-366l')

CREATE PROCEDURE COMELA
AS
SELECT *
FROM MELA

COMELA

---------------------------------------------------TRIGGER DE MELA
CREATE TRIGGER ADMIN17
ON MELA
FOR INSERT
AS
BEGIN
DECLARE @IDMED3 VARCHAR(7)  
DECLARE @IDLAB1 VARCHAR(7)
DECLARE @X INT
select @IDMED3=LOWER(I.ID_MED3),@IDLAB1=I.ID_LAB1 FROM inserted I
SET @X=ASCII(@IDMED3)
--DUPLICACION
UPDATE MELA
SET ID_MED3=UPPER(ID_MED3),ID_LAB1=UPPER(ID_LAB1)
END


------------------------------------------------------------------------------------------------------------------------------meco
CREATE TABLE MECO(
ID_MED4 VARCHAR(7),
ID_COM1 VARCHAR(7),
CONSTRAINT FK_IDMED4 FOREIGN KEY(ID_MED4) REFERENCES MEDICAMENTO(ID_MED) on delete cascade,
CONSTRAINT FK_IDCOM1 FOREIGN KEY(ID_COM1) REFERENCES COMPONENTE(ID_COM) on delete cascade)
ENGINE=InnoDB;

INSERT INTO MECO VALUES('me-176p','cm-348h')

CREATE PROCEDURE COMECO
AS
SELECT *
FROM MECO


COMECO
---------------------------------------------------TRIGGER DE MECO
CREATE TRIGGER ADMIN18
ON MECO
FOR INSERT
AS
BEGIN
DECLARE @IDMED4 VARCHAR(7)  
DECLARE @IDCOM1 VARCHAR(7)
DECLARE @X INT
select @IDMED4=LOWER(I.ID_MED4),@IDCOM1=I.ID_COM1 FROM inserted I
SET @X=ASCII(@IDMED4)
--DUPLICACION
UPDATE MECO
SET ID_MED4=UPPER(ID_MED4),ID_COM1=UPPER(ID_COM1)
END

------------------------------------------------------------------------------------------------------------------------------meun
CREATE TABLE MEUN(
ID_MED5 VARCHAR(7),
ID_UN1 VARCHAR(7),
CONSTRAINT FK_IDMED5 FOREIGN KEY(ID_MED5) REFERENCES MEDICAMENTO(ID_MED) on delete cascade,
CONSTRAINT FK_IDUN1 FOREIGN KEY(ID_UN1) REFERENCES UNIDAD(ID_UN) on delete cascade)
ENGINE=InnoDB;

INSERT INTO MEUN VALUES('me-176p','un-579g')
CREATE PROCEDURE COMEUN
AS
SELECT *
FROM MEUN

COMEUN


---------------------------------------------------TRIGGER DE MEUN
CREATE TRIGGER ADMIN19
ON MEUN
FOR INSERT
AS
BEGIN
DECLARE @IDMED5 VARCHAR(7)  
DECLARE @IDUN1 VARCHAR(7)
DECLARE @X INT
select @IDMED5=LOWER(I.ID_MED5),@IDUN1=I.ID_UN1 FROM inserted I
SET @X=ASCII(@IDMED5)
--DUPLICACION
UPDATE MEUN
SET ID_MED5=UPPER(ID_MED5),ID_UN1=UPPER(ID_UN1)
END

------------------------------------------------------------------------------------------------------------------------------alergia
CREATE TABLE ALERGIA(
ID_AL VARCHAR(7),
NOM_AL VARCHAR(50),
constraint pk_al primary key(ID_AL))
ENGINE=InnoDB;

INSERT INTO ALERGIA VALUES('0','H1N1')
INSERT INTO ALERGIA VALUES('0','INFLUENZA')

SELECT *
FROM ALERGIA
 -----------------------------------------------------------TRIGGER ALERGIA
CREATE TRIGGER ADMIN20
ON ALERGIA
FOR INSERT
AS
BEGIN
DECLARE @IDAL VARCHAR(7)
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
ID_AL=UPPER(CHAR(65)+CHAR(76)+CHAR(45)+LEFT(LEN(NOM_AL),1)+LEFT(ASCII(UPPER(REVERSE(NOM_AL))),2)+LEFT(NOM_AL,1))
commit transaction
end
END

CREATE PROCEDURE ENALERGIA
AS
UPDATE ALERGIA SET
NOM_AL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_AL),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM ALERGIA

EXEC ENALERGIA

CREATE PROCEDURE DESALERGIA
AS
UPDATE ALERGIA SET
NOM_AL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_AL),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM ALERGIA

EXEC DESALERGIA

SELECT *
FROM ALERGIA

------------------------------------------------------------------------------------------------------------------------------delegacion

CREATE TABLE DELEGACION(
ID_DEL VARCHAR(7),
NOM_DEL VARCHAR(50),
constraint pk_del primary key(ID_DEL))
ENGINE=InnoDB;

INSERT INTO DELEGACION VALUES('0','CUAJIMALPA')
INSERT INTO DELEGACION VALUES('0','VENUSTIANO CARRANZA')

SELECT *
FROM DELEGACION
------------------------------------------------------TRIGGER DELEGACION
CREATE TRIGGER ADMIN21 
ON DELEGACION
FOR INSERT
AS
BEGIN
DECLARE @IDDEL VARCHAR(7)
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
ID_DEL=UPPER(CHAR(68)+CHAR(69)+CHAR(45)+LEFT(LEN(NOM_DEL),1)+LEFT(ASCII(UPPER(REVERSE(NOM_DEL))),2)+LEFT(NOM_DEL,1))
commit transaction
end
END


CREATE PROCEDURE ENDELEGACION
AS
UPDATE DELEGACION SET
NOM_DEL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_DEL),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM DELEGACION

EXEC ENDELEGACION

CREATE PROCEDURE DESDELEGACION
AS
UPDATE DELEGACION SET
NOM_DEL=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_DEL),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM DELEGACION

EXEC DESDELEGACION


------------------------------------------------------------------------------------------------------------------------------enfermedad
CREATE TABLE ENFERMEDAD(
ID_EMF VARCHAR(7),
NOM_EMF VARCHAR(50),
constraint pk_emf primary key(ID_EMF))
ENGINE=InnoDB;

INSERT INTO ENFERMEDAD VALUES('0','SIFILIS')
INSERT INTO ENFERMEDAD VALUES('0','GONORREA')

SELECT *
FROM ENFERMEDAD

-------------------------------------------------------------TRIGGER DE ENFERMEDAD
CREATE TRIGGER ADMIN22
ON ENFERMEDAD
FOR INSERT
AS
BEGIN
DECLARE @IDEM VARCHAR(7)
DECLARE @NOEM VARCHAR(50)
select @IDEM=I.ID_EMF,@NOEM=I.NOM_EMF
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from ENFERMEDAD where @IDEM<>ENFERMEDAD.ID_EMF and @NOEM=ENFERMEDAD.NOM_EMF ))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update ENFERMEDAD
set NOM_EMF=upper(NOM_EMF),
--ASIGNACION DE CLAVE PRIMARIA
ID_EMF=UPPER(CHAR(69)+CHAR(77)+CHAR(45)+LEFT(LEN(NOM_EMF),1)+LEFT(ASCII(UPPER(REVERSE(NOM_EMF))),2)+LEFT(NOM_EMF,1))
where ID_EMF=@IDEM
commit transaction
end
END

CREATE PROCEDURE ENENFERMEDAD
AS
UPDATE ENFERMEDAD SET
NOM_EMF=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_EMF),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM ENFERMEDAD

EXEC ENENFERMEDAD

CREATE PROCEDURE DESENFERMEDAD
AS
UPDATE ENFERMEDAD SET
NOM_EMF=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_EMF),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM ENFERMEDAD

EXEC DESENFERMEDAD

SELECT *
FROM ENFERMEDAD

------------------------------------------------------------------------------------------------------------------------------tipopar
CREATE TABLE TIPOPAR(
ID_TPR VARCHAR(7),
NOM_TPR VARCHAR(50),
constraint pk_tpr primary key(ID_TPR))
ENGINE=InnoDB;

INSERT INTO TIPOPAR VALUES('0','TERAPIA1')
INSERT INTO TIPOPAR VALUES('0','TERAPIA2')

select *
from tipopar
---------------------------------------------------------------------TIPOPAR
CREATE TRIGGER ADMIN23
ON TIPOPAR
FOR INSERT
AS
BEGIN
DECLARE @IDTP VARCHAR(7)
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
ID_TPR=UPPER(CHAR(84)+CHAR(80)+CHAR(45)+LEFT(LEN(NOM_TPR),1)+LEFT(ASCII(UPPER(REVERSE(NOM_TPR))),2)+LEFT(NOM_TPR,1))
where id_tpr=@IDTP
commit transaction
end
END

CREATE PROCEDURE ENTIPOPAR
AS
UPDATE TIPOPAR SET
NOM_TPR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TPR),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*'))
FROM TIPOPAR

CREATE PROCEDURE DESTIPOPAR
AS
UPDATE TIPOPAR SET
NOM_TPR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TPR),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L'))
FROM TIPOPAR

------------------------------------------------------------------------------------------------------------------------------tiposangre
CREATE TABLE TIPO_SANGRE(
ID_TS VARCHAR(7),
NOM_TS VARCHAR(50),
constraint pk_sange primary key(ID_TS))
ENGINE=InnoDB;

INSERT INTO TIPO_SANGRE VALUES('0','O+')
INSERT INTO TIPO_SANGRE VALUES('0','O-')
INSERT INTO TIPO_SANGRE VALUES('0','A+')

SELECT *
FROM TIPO_SANGRE
----------------------------------------------------------------------SANGRE
CREATE TRIGGER ADMIN24
ON TIPO_SANGRE
FOR INSERT
AS
BEGIN
DECLARE @IDTS VARCHAR(7)
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
ID_TS=UPPER(CHAR(84)+CHAR(83)+CHAR(45)+LEFT(LEN(NOM_TS),1)+LEFT(ASCII(UPPER(REVERSE(NOM_TS))),2)+LEFT(NOM_TS,1))
where id_ts=@IDTS
commit transaction
end
END

CREATE PROCEDURE ENTIPOSANGRE
AS
UPDATE TIPO_SANGRE SET
NOM_TS=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TS),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','Ñ')),'P','=')),'N','\')),'L','*'))
FROM TIPO_SANGRE

EXEC ENTIPOSANGRE

CREATE PROCEDURE DESTIPOSANGRE
AS
UPDATE TIPO_SANGRE SET
NOM_TS=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_TS),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'Ñ','S')),'=','P')),'\','N')),'*','L'))
FROM TIPO_SANGRE

EXEC DESTIPOSANGRE

SELECT *
FROM TIPO_SANGRE
------------------------------------------------------------------------------------------------------------------------------enfermo
CREATE TABLE ENFERMO(
CLAVE_ENF VARCHAR(7),
NOM_ENF VARCHAR(200),
FEHE_ENF DATETIME,
FEHS_ENF DATETIME,
ID_CA1 VARCHAR(7),
ID_CO1 VARCHAR(7),
ID_DEL1 VARCHAR(7),
CP_ENF INT,
ID_EN1 VARCHAR(7),
ID_TS1 VARCHAR(7),
constraint pk_enf primary key(CLAVE_ENF),
CONSTRAINT FK_K FOREIGN KEY(ID_CA1) REFERENCES CALLE(ID_CA) on delete cascade,
CONSTRAINT FK_CO FOREIGN KEY(ID_CO1) REFERENCES COLONIA(ID_COL) on delete cascade,
CONSTRAINT FK_DEL FOREIGN KEY(ID_DEL1) REFERENCES DELEGACION(ID_DEL) on delete cascade,
CONSTRAINT FK_N FOREIGN KEY(ID_EN1) REFERENCES TIPOENF(ID_TE) on delete cascade,
CONSTRAINT FK_TSO FOREIGN KEY(ID_TS1) REFERENCES TIPO_SANGRE(ID_TS) on delete cascade,
CHECK(CP_ENF>0 AND CP_ENF<99999))
ENGINE=InnoDB;


INSERT INTO ENFERMO VALUES('0','pedrito','06/01/17','07/11/17','CA-765R','CO-779L','DE-165C',15900,'TE-165R','TS-243O')
SELECT *
FROM ENFERMO
----------------------------------------------------------------ENFERMO
CREATE TRIGGER ADMIN25
ON ENFERMO
FOR INSERT
AS
BEGIN
DECLARE @IDENF VARCHAR(7)
DECLARE @NOMENF VARCHAR(50)
DECLARE @CPENF INT
select @IDENF=I.CLAVE_ENF,@NOMENF=I.NOM_ENF,@CPENF=I.CP_ENF
FROM inserted I
--DUPLICIDAD
if(EXISTS(select * from ENFERMO where @IDENF<>ENFERMO.CLAVE_ENF and @NOMENF=ENFERMO.NOM_ENF AND @CPENF=ENFERMO.CP_ENF))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'DATOS ALMACENADOS'
update ENFERMO
set NOM_ENF=upper(NOM_ENF),
--ASIGNACION DE CLAVE PRIMARIA
CLAVE_ENF=UPPER(CHAR(69)+CHAR(78)+CHAR(45)+LEFT(LEN(NOM_ENF),1)+LEFT(ASCII(UPPER(REVERSE(NOM_ENF))),2)+LEFT(NOM_ENF,1))
where CLAVE_ENF=@IDENF
commit transaction
end
END


CREATE PROCEDURE ENENFERMO
AS
UPDATE ENFERMO SET
NOM_ENF=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_ENF),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*')),
FEHE_ENF=DATEADD(DD,-172,FEHE_ENF),
FEHS_ENF=DATEADD(DD,-135,FEHS_ENF)
FROM ENFERMO

EXEC ENENFERMO

CREATE PROCEDURE DESENFERMO
AS
UPDATE ENFERMO SET
NOM_ENF=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((NOM_ENF),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L')),
FEHE_ENF=DATEADD(DD,172,FEHE_ENF),
FEHS_ENF=DATEADD(DD,135,FEHS_ENF)
FROM ENFERMO

EXEC DESENFERMO



------------------------------------------------------------------------------------------------------------------------------enfer
CREATE TABLE  ENFER(
CLAVE_E2 VARCHAR(7),
ID_ENF2 VARCHAR(7),
CONSTRAINT FK_E2 FOREIGN KEY(CLAVE_E2) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade,
CONSTRAINT FK_EF2 FOREIGN KEY(ID_ENF2) REFERENCES ENFERMEDAD(ID_EMF)on delete cascade)
ENGINE=InnoDB;

INSERT INTO ENFER VALUES('en-779p','em-783s')

CREATE PROCEDURE COENFER
AS
SELECT *
FROM ENFER

COENFER

-----------------------------------------------------------------ENFER
CREATE TRIGGER ADMIN26
ON ENFER
FOR INSERT
AS
BEGIN
DECLARE @CLAE2 VARCHAR(7)  
DECLARE @IDENF2 VARCHAR(7)
DECLARE @X INT
select @CLAE2=LOWER(I.CLAVE_E2),@IDENF2=I.ID_ENF2 FROM inserted I
SET @X=ASCII(@CLAE2)
--DUPLICACION
UPDATE ENFER
SET CLAVE_E2=UPPER(CLAVE_E2),ID_ENF2=UPPER(ID_ENF2)
END


------------------------------------------------------------------------------------------------------------------------------tifer
CREATE TABLE TIFER(
CLAVE_E3 VARCHAR(7),
ID_TEL1 VARCHAR(7),
TELEFONO VARCHAR(10),
CONSTRAINT FK_CE7 FOREIGN KEY(CLAVE_E3) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade,
CONSTRAINT FK_TE1 FOREIGN KEY(ID_TEL1) REFERENCES TIPOTEL(ID_TEL)on delete cascade)
ENGINE=InnoDB;

INSERT INTO tifer values('en-779p','tt-782c','55520297')

CREATE PROCEDURE COTIFER
AS
SELECT *
FROM TIFER

COTIFER

--------------------------------------------------------------TRIGGGER TIPOFER
CREATE TRIGGER ADMIN27
ON TIFER
FOR INSERT
AS
BEGIN
DECLARE @CLAE3 VARCHAR(7)  
DECLARE @IDTEL1 VARCHAR(7)
DECLARE @X INT
select @CLAE3=LOWER(I.CLAVE_E3),@IDTEL1=I.ID_TEL1 FROM inserted I
SET @X=ASCII(@CLAE3)
--DUPLICACION
UPDATE TIFER
SET CLAVE_E3=UPPER(CLAVE_E3),ID_TEL1=UPPER(ID_TEL1)
END

CREATE PROCEDURE ENTIFER
AS
UPDATE TIFER SET
TELEFONO=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TELEFONO),'1','#')),'2','%')),'3','/')),'4','$')),'5','{')),'6','?')),'7','+')),'8','=')),'9','\')),'0','*'))
FROM TIFER

CREATE PROCEDURE DESTIFER
AS
UPDATE TIFER SET
TELEFONO=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TELEFONO),'#','1')),'%','2')),'/','3')),'$','4')),'{','5')),'?','6')),'+','7')),'=','8')),'\','9')),'*','0'))
FROM TIFER

------------------------------------------------------------------------------------------------------------------------------aleenf
CREATE TABLE ALEENF(
CLAVE_E4 VARCHAR(7),
ID_ALE1 VARCHAR(7),
CONSTRAINT FK_CE3 FOREIGN KEY(CLAVE_E4) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade,
CONSTRAINT FK_ALE FOREIGN KEY(ID_ALE1) REFERENCES ALERGIA(ID_AL)on delete cascade)
ENGINE=InnoDB;

INSERT INTO aleenf values('en-779p','al-449h')
CREATE PROCEDURE COALEENF
AS
SELECT *
FROM ALEENF

COALEENF

------------------------------------------------------------TRIGGER ALEENF
CREATE TRIGGER ADMIN28
ON ALEENF
FOR INSERT
AS
BEGIN
DECLARE @CLAE4 VARCHAR(7)  
DECLARE @IDALE1 VARCHAR(7)
DECLARE @X INT
select @CLAE4=LOWER(I.CLAVE_E4),@IDALE1=I.ID_ALE1 FROM inserted I
SET @X=ASCII(@CLAE4)
--DUPLICACION
UPDATE ALEENF
SET CLAVE_E4=UPPER(CLAVE_E4),ID_ALE1=UPPER(ID_ALE1)
END

------------------------------------------------------------------------------------------------------------------------------tipoen
CREATE TABLE TIPOEN(
CLAVE_E5 VARCHAR(7),
ID_TPAR1 VARCHAR(7),
CONSTRAINT FK_RDR FOREIGN KEY(CLAVE_E5) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade,
CONSTRAINT FK_AL FOREIGN KEY(ID_TPAR1) REFERENCES TIPOPAR(ID_TPR)on delete cascade)
ENGINE=InnoDB;

INSERT INTO TIPOEN values('en-779p','tp-849t')
CREATE PROCEDURE COTIPOEN
AS
SELECT *
FROM TIPOEN

COTIPOEN

--------------------------------------------------------------trigger deTIPOEN
CREATE TRIGGER ADMIN29
ON TIPOEN
FOR INSERT
AS
BEGIN
DECLARE @CLAE5 VARCHAR(7)  
DECLARE @IDTPAR1 VARCHAR(7)
DECLARE @X INT
select @CLAE5=LOWER(I.CLAVE_E5),@IDTPAR1=I.ID_TPAR1 FROM inserted I
SET @X=ASCII(@CLAE5)
--DUPLICACION
UPDATE TIPOEN
SET CLAVE_E5=UPPER(CLAVE_E5),ID_TPAR1=UPPER(ID_TPAR1)
END

------------------------------------------------------------------------------------------------------------------------------endia
CREATE TABLE ENDIA(
NUM_M VARCHAR(7),
RECON_E VARCHAR(200),
FECHA_PC DATETIME,
FECHA_C DATETIME,
TIEM_E VARCHAR(200),
STAD_E VARCHAR(200),
ID_D1 VARCHAR(7),
ID_DIAG1 VARCHAR(7),
CLAVE_E6 VARCHAR(7),
CONSTRAINT FK_DD FOREIGN KEY(ID_D1) REFERENCES  DOCTOR (ID_D)on delete cascade,
CONSTRAINT FK_FR FOREIGN KEY(ID_DIAG1 ) REFERENCES DIAGNOSTICO(ID_DIAG)on delete cascade,
CONSTRAINT FK_NN FOREIGN KEY(CLAVE_E6) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade)
ENGINE=InnoDB;

INSERT INTO endia values('55','a','04/04/96','15/12/96','5','66','dr-478j','dg-679r','en-779p')
CREATE PROCEDURE COENDIA
AS
DELETE
FROM endia

COENDIA

drop trigger admin30
--------------------------------------------------------trigger endia
CREATE TRIGGER ADMIN30
ON endia
FOR INSERT
AS
BEGIN
DECLARE @CLAE6 VARCHAR(7)  
DECLARE @IDDG1 VARCHAR(7)
DECLARE @X INT
select @CLAE6=LOWER(I.CLAVE_E6),@IDDG1=I.ID_DIAG1 FROM inserted I
SET @X=ASCII(@CLAE6)
--DUPLICACION
UPDATE endia
SET CLAVE_E6=UPPER(CLAVE_E6),ID_DIAG1=UPPER(ID_DIAG1),ID_D1=UPPER(ID_D1)
END

CREATE PROCEDURE ENENDIA
AS
UPDATE ENDIA SET
RECON_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((RECON_E),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*')),
TIEM_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TIEM_E),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*')),
STAD_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((STAD_E),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*')),
FECHA_PC=DATEADD(MM,-187,FECHA_PC),
FECHA_C=DATEADD(MM,-182,FECHA_C)
FROM ENDIA

EXEC ENENDIA

CREATE PROCEDURE DESENDIA
AS
UPDATE ENDIA SET
RECON_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((RECON_E),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L')),
TIEM_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((TIEM_E),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L')),
STAD_E=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((STAD_E),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L')),
FECHA_PC=DATEADD(MM,187,FECHA_PC),
FECHA_C=DATEADD(MM,182,FECHA_C)

EXEC DESENDIA

SELECT *
FROM ENDIA
------------------------------------------------------------------------------------------------------------------------------meen
CREATE TABLE MEEN(
CLAVE_E7 VARCHAR(7),
ID_MED6 VARCHAR(7),
DOSIS_MR VARCHAR(200),
TIEMPO DATETIME,
CONSTRAINT FK_CL5 FOREIGN KEY(CLAVE_E7) REFERENCES ENFERMO(CLAVE_ENF)on delete cascade,
CONSTRAINT FK_FDS FOREIGN KEY(ID_MED6) REFERENCES MEDICAMENTO(ID_MED)on delete cascade)
ENGINE=InnoDB;

INSERT INTO MEEN values('en-779p','me-778t','5 mmg de tabalo cada 12 hrs','04/04/96')
CREATE PROCEDURE COMEEN
AS
delete
FROM MEen

COMEEN


----------------------------------------------------trigger de meen
CREATE TRIGGER ADMIN31
ON MEEN
FOR INSERT
AS
BEGIN
DECLARE @CLAE7 VARCHAR(7)  
DECLARE @IDMED6 VARCHAR(7)
DECLARE @X INT
select @CLAE7=LOWER(I.CLAVE_E7),@IDMED6=I.ID_MED6 FROM inserted I
SET @X=ASCII(@CLAE7)
--DUPLICACION
UPDATE MEEN
SET CLAVE_E7=UPPER(CLAVE_E7),ID_MED6=UPPER(ID_MED6),DOSIS_MR=UPPER(DOSIS_MR)
END


CREATE PROCEDURE ENMEEN
AS
UPDATE MEEN SET
DOSIS_MR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((DOSIS_MR),'A','#')),'E','%')),'I','/')),'O','$')),'U','{')),'M','?')),'S','+')),'P','=')),'N','\')),'L','*')),
TIEMPO=DATEADD(YY,-20,TIEMPO)
FROM MEEN

EXEC ENMEEN

CREATE PROCEDURE DESMEEN
AS
UPDATE MEEN SET
DOSIS_MR=REVERSE(REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((REPLACE((DOSIS_MR),'#','A')),'%','E')),'/','I')),'$','O')),'{','U')),'?','M')),'+','S')),'=','P')),'\','N')),'*','L')),
TIEMPO=DATEADD(YY,20,TIEMPO)
FROM MEEN

EXEC DESMEEN


PROCEDIMIENTOS




CREATE PROCEDURE B2                        --------------------------------B2
@NOMDOC VARCHAR (150),
@CEDDOC BIGINT,
@NOMED VARCHAR (50),
@NOM_HR VARCHAR (50) 
AS  
SELECT *
FROM
ESPECIALIDAD INNER JOIN DOCTOR ON ESPECIALIDAD.ID_ED=DOCTOR.ID_ED1
INNER JOIN HORARIO ON HORARIO.ID_HR =DOCTOR.ID_HR1
WHERE
NOM_D=@NOMDOC  AND
CED_D=@CEDDOC AND
NOM_ED=@NOMED AND
NOM_HR=@NOM_HR

select *
from doctor
exec b2 juan,23424,paracetamol,matutino



CREATE PROCEDURE B3                        --------------------------------B3
@NOMED VARCHAR(150), 
@NOMCOM VARCHAR (50)
AS  
SELECT *
FROM
MEDICAMENTO INNER JOIN MECO ON MEDICAMENTO.ID_MED=MECO.ID_MED4
INNER JOIN COMPONENTE ON MECO.ID_COM1=COMPONENTE.ID_COM
WHERE
NOM_MED=@NOMED AND
NOM_COM=@NOMCOM

exec b3 paracetamol,h20

select *
from viaadmon


CREATE PROCEDURE B4                        --------------------------------B4
@NOMED VARCHAR(150),
@NOMLAB VARCHAR (50)
AS  
SELECT *
FROM
MEDICAMENTO INNER JOIN MELA ON MEDICAMENTO.ID_MED=MELA.ID_MED3
INNER JOIN LABORATORIO ON LABORATORIO.ID_LAB=MELA.ID_LAB1
WHERE
NOM_MED=@NOMED  AND
NOM_LAB=@NOMLAB

exec b4 paracetamol,lab

CREATE PROCEDURE B5                       --------------------------------B5
@NOMED VARCHAR(150),
@NOMUN VARCHAR (50)
AS  
SELECT *
FROM
MEDICAMENTO INNER JOIN MEUN ON MEDICAMENTO.ID_MED=MEUN.ID_MED5
INNER JOIN UNIDAD ON MEUN.ID_UN1=UNIDAD.ID_UN
WHERE
NOM_MED=@NOMED  AND
NOM_UN=@NOMUN 

exec b5 paracetamol,gramo

CREATE PROCEDURE B6                      --------------------------------B6
@NOMED VARCHAR(150),
@NOMVA VARCHAR (50)
AS  
SELECT *
FROM
MEDICAMENTO INNER JOIN MEVIAD ON MEDICAMENTO.ID_MED=MEVIAD.ID_MED2
INNER JOIN VIAADMON ON VIAADMON.ID_VIA=MEVIAD.ID_VIA1
WHERE
NOM_MED=@NOMED AND
NOM_VA=@NOMVA 

exec b6 paracetamol,inyectado

CREATE PROCEDURE B7                        --------------------------------B7
@NOMED VARCHAR(150),
@NOMPREN VARCHAR (50)
AS  
SELECT *
FROM
MEDICAMENTO INNER JOIN MEPE ON MEDICAMENTO.ID_MED=MEPE.ID_MED1
INNER JOIN PRESENTACION ON PRESENTACION.ID_PRE=MEPE.ID_PRE1
WHERE
NOM_MED=@NOMED AND
NOM_PREN=@NOMPREN 

select * from presentacion
exec b7 paracetamol,botellas

CREATE PROCEDURE B8                        --------------------------------B8
@NOMENF VARCHAR(200),
@NOMTS VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN TIPO_SANGRE ON TIPO_SANGRE.ID_TS=ENFERMO.ID_TS1
WHERE
NOM_ENF=@NOMENF  AND
NOM_TS=@NOMTS 


CREATE PROCEDURE B9                        --------------------------------B9
@NOMENF VARCHAR(200),
@NOMTPR VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN TIPOEN ON ENFERMO.CLAVE_ENF=TIPOEN.CLAVE_E5
INNER JOIN TIPOPAR ON TIPOPAR.ID_TPR=TIPOEN.ID_TPAR1
WHERE
NOM_ENF=@NOMENF AND
NOM_TPR=@NOMTPR 


CREATE PROCEDURE B10                        --------------------------------B10
@NOMENF VARCHAR(200),
@NOMCALLE VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN CALLE ON CALLE.ID_CA=ENFERMO.ID_CA1
WHERE
NOM_ENF=@NOMENF AND
NOM_CALLE=@NOMCALLE 


CREATE PROCEDURE B11                        --------------------------------B11
@NOMENF VARCHAR(200),
@NOMDEL VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN DELEGACION ON DELEGACION.ID_DEL=ENFERMO.ID_DEL1
WHERE
NOM_ENF=@NOMENF AND
NOM_DEL=@NOMDEL 


CREATE PROCEDURE B12                        --------------------------------B12
@NOMENF VARCHAR(200),
@NOMCOL VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN COLONIA ON COLONIA.ID_COL=ENFERMO.ID_CO1
WHERE
@NOMENF =NOM_ENF AND
@NOMCOL =NOM_COL

DROP PROCEDURE B13

CREATE PROCEDURE B13                        --------------------------------B13
@NOMENF VARCHAR(200),
@NOMTE VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN TIPOENF ON TIPOENF.ID_TE=ENFERMO.ID_EN1
WHERE
NOM_ENF=@NOMENF  AND
NOM_TE=@NOMTE 

CREATE PROCEDURE B14                        --------------------------------B14
@NOMENF VARCHAR(200),
@TIPOTEL VARCHAR (50)
AS  
SELECT *
FROM
ENFERMO INNER JOIN TIFER ON TIFER.CLAVE_E3=ENFERMO.CLAVE_ENF
INNER JOIN TIPOTEL ON TIFER.ID_TEL1=TIPOTEL.ID_TEL
WHERE
NOM_ENF=@NOMENF AND
TIPO_TEL=@TIPOTEL 


CREATE PROCEDURE B15                        --------------------------------B15
@NOMDIAG VARCHAR(50),
@NOMD VARCHAR (50),
@NOMED VARCHAR (50)
AS  
SELECT *
FROM
DIAGNOSTICO INNER JOIN ENDIA ON DIAGNOSTICO.ID_DIAG=ENDIA.ID_DIAG1
INNER JOIN DOCTOR ON ENDIA.ID_D1=DOCTOR.ID_D
INNER JOIN ESPECIALIDAD ON DOCTOR.ID_ED1 = ESPECIALIDAD.ID_ED
WHERE
NOM_DIAG=@NOMDIAG AND
NOM_D=@NOMD AND
NOM_ED=@NOMED 

SELECT *
FROM ESPECIALIDAD


CREATE PROCEDURE BUS1--
AS
select NOM_D,NOM_ED
from ESPECIALIDAD INNER JOIN DOCTOR ON ESPECIALIDAD.ID_ED=DOCTOR.ID_ED1
where NOM_D='FARMACOLOGIA'

CREATE PROCEDURE BUS2--
AS
select CLAVE_ENF, NOM_ENF, NOM_TS
from ENFERMO INNER JOIN TIPO_SANGRE ON ENFERMO.ID_TS1=TIPO_SANGRE.ID_TS
where NOM_TS='O+'

CREATE PROCEDURE BUS3--
AS
select NOM_ENF,CLAVE_ENF,NOM_MED
from ENFERMO INNER JOIN MEEN ON ENFERMO.CLAVE_ENF=MEEN.CLAVE_E7
INNER JOIN MEDICAMENTO ON MEEN.ID_MED6 = MEDICAMENTO.ID_MED
where NOM_MED='PARACETAMOL'

SELECT *
FROM LABORATORIO

CREATE PROCEDURE BUS4--
AS
select NOM_ENF,NOM_CALLE,NOM_COL
from ENFERMO INNER JOIN CALLE ON ENFERMO.ID_CA1=CALLE.ID_CA
INNER JOIN COLONIA ON ENFERMO.ID_CO1=COLONIA.ID_COL
where NOM_ENF='JUANITO'

CREATE  PROCEDURE BUS5--
AS
select NOM_MED,NOM_VA,ID_VIA
from MEDICAMENTO INNER JOIN MEVIAD ON MEDICAMENTO.ID_MED=MEVIAD.ID_MED2
INNER JOIN VIAADMON ON MEVIAD.ID_VIA1 =VIAADMON.ID_VIA
where NOM_VA='INYECTADO'

CREATE PROCEDURE BUS6--
AS
select NOM_LAB,NOM_MED
from LABORATORIO INNER JOIN MELA ON LABORATORIO.ID_LAB=MELA.ID_LAB1
INNER JOIN MEDICAMENTO ON MELA.ID_MED3 = MEDICAMENTO.ID_MED
where NOM_LAB='LAB'

CREATE PROCEDURE BUS7--
AS
select NOM_ENF,NOM_AL,FEHE_ENF
from ALERGIA INNER JOIN ALEENF ON ALERGIA.ID_AL=ALEENF.ID_ALE1
INNER JOIN ENFERMO ON ALEENF.CLAVE_E4 = ENFERMO.CLAVE_ENF
where NOM_AL='H1N1'

SELECT *
FROM ALERGIA
DROP PROCEDURE BUS8


CREATE PROCEDURE BUS8--
AS
SELECT NOM_MED,NOM_VA
FROM MEDICAMENTO INNER JOIN MEVIAD ON MEDICAMENTO.ID_MED=MEVIAD.ID_MED2
INNER JOIN VIAADMON ON MEVIAD.ID_VIA1 =VIAADMON.ID_VIA
WHERE NOM_MED='PARACETAMOL'

CREATE PROCEDURE BUS9--
AS
select NOM_ENF,NOM_AL
from ALERGIA INNER JOIN ALEENF ON ALERGIA.ID_AL=ALEENF.ID_ALE1
INNER JOIN ENFERMO ON ALEENF.CLAVE_E4 = ENFERMO.CLAVE_ENF
where NOM_ENF='JUANITO'


CREATE PROCEDURE BUS10--
AS
select TIPO_TEL,NOM_ENF
from ENFERMO INNER JOIN TIFER ON TIFER.CLAVE_E3=ENFERMO.CLAVE_ENF
INNER JOIN TIPOTEL ON TIFER.ID_TEL1=TIPOTEL.ID_TEL
where NOM_ENF='JUANITO'

CREATE PROCEDURE BUS11--
AS
select NOM_ED, NOM_D
from ESPECIALIDAD INNER JOIN DOCTOR ON ESPECIALIDAD.ID_ED=DOCTOR.ID_ED1
where NOM_ED='FARMACOLOGIA'

CREATE PROCEDURE BUS12--
AS
select NOM_ENF,NOM_MED,CLAVE_ENF
from ENFERMO INNER JOIN MEEN ON ENFERMO.CLAVE_ENF=MEEN.CLAVE_E7
INNER JOIN MEDICAMENTO ON MEEN.ID_MED6 = MEDICAMENTO.ID_MED
where CLAVE_ENF='EN-779J'

DROP PROCEDURE BUS13


CREATE PROCEDURE BUS13--
AS
select NOM_MED,NOM_LAB
from LABORATORIO INNER JOIN MELA ON LABORATORIO.ID_LAB=MELA.ID_LAB1
INNER JOIN MEDICAMENTO ON MELA.ID_MED3 = MEDICAMENTO.ID_MED
where NOM_MED='PARACETAMOL'


CREATE PROCEDURE BUS14--
AS
select NOM_AL,NOM_ENF
from ALERGIA INNER JOIN ALEENF ON ALERGIA.ID_AL=ALEENF.ID_ALE1
INNER JOIN ENFERMO ON ALEENF.CLAVE_E4 = ENFERMO.CLAVE_ENF
where NOM_ENF='JUANITO'


CREATE PROCEDURE BUS15--
AS
select NOM_ENF,NOM_AL,FEHS_ENF
from ALERGIA INNER JOIN ALEENF ON ALERGIA.ID_AL=ALEENF.ID_ALE1
INNER JOIN ENFERMO ON ALEENF.CLAVE_E4 = ENFERMO.CLAVE_ENF
where NOM_ENF='JUANITO'

BUS1
BUS2
BUS3
BUS4
BUS5
BUS6
BUS7
BUS8
BUS9
BUS10
BUS11
BUS12
BUS13
BUS14
BUS15


select *
from sysobjects
where xtype='u'

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
drop trigger admin5
drop trigger admin4
drop trigger admin3
drop trigger admin2
drop trigger admin1

drop database SAVM2

create procedure csaleenf
as
begin
Select NOM_ENF,NOM_AL 
FROM enfermo join aleenf on enfermo.CLAVE_ENF=aleenf.CLAVE_E4 join alergia on aleenf.ID_ALE1=alergia.ID_AL
end


create procedure csalergia
as
begin
select *
from alergia
end


create procedure cscalle
as
begin
select *
from calle
end

create procedure cscolonia
as
begin
select *
from colonia
end

create procedure cscomponente
as
begin
select *
from componente
end

create procedure csdelegacion
as
begin
select *
from delegacion
end

create procedure csdiagnostico
as
begin
select *
from diagnostico
end

create procedure csdoctor
as
begin
Select ID_D,NOM_D,CED_D,NOM_ED,NOM_HR 
from especialidad inner join doctor on especialidad.ID_ED=doctor.ID_ED1 inner join horario on doctor.ID_HR1=horario.ID_HR 
end

create procedure csendia 
as
begin
Select NOM_ENF,NOM_DIAG,NOM_D,NUM_M,RECON_E,FECHA_PC,FECHA_C,TIEM_E,STAD_E 
FROM enfermo inner join ENDIA on enfermo.CLAVE_ENF=endia.CLAVE_E6 inner join diagnostico on endia.ID_DIAG1=diagnostico.ID_DIAG inner join doctor on endia.ID_D1=doctor.ID_D
end

create procedure csenfer
as
begin
Select NOM_ENF,NOM_EMF
FROM enfermo join enfer on enfermo.CLAVE_ENF=enfer.CLAVE_E2 join enfermedad on enfer.ID_ENF2=enfermedad.ID_EMF
end




create procedure csenfermedad
as
begin
select *
from enfermedad
end

create procedure csenfermo
as
begin
Select CLAVE_ENF,NOM_ENF,FEHE_ENF,FEHS_ENF,NOM_CALLE,NOM_COL,NOM_DEL,CP_ENF,NOM_TE,NOM_TS 
from calle inner join enfermo on calle.ID_CA=enfermo.ID_CA1 inner join colonia on enfermo.ID_CO1=colonia.ID_COL inner join delegacion on enfermo.ID_DEL1=delegacion.ID_DEL join tipoenf on enfermo.ID_EN1=tipoenf.ID_TE join tipo_sangre on enfermo.ID_TS1=tipo_sangre.ID_TS
end

create procedure csespecialidad
as
begin
select *
from especialidad
end

create procedure cshorario
as
begin
select *
from horario
end

create procedure cslaboratorio
as
begin
select *
from laboratorio
end

create procedure csmeco
as
begin
select NOM_MED,NOM_COM 
from medicamento inner join meco on medicamento.ID_MED=meco.ID_MED4 inner join componente on meco.ID_COM1=componente.ID_COM
end

create procedure csmedicamento
as
begin
select *
from medicamento
end

create procedure csmeen
as
begin
Select NOM_ENF,NOM_MED,DOSIS_MR,TIEMPO FROM enfermo inner join meen on enfermo.CLAVE_ENF=meen.CLAVE_E7 inner join medicamento on meen.ID_MED6=medicamento.ID_MED
end

create procedure csmela
as
begin
Select ID_MED,NOM_MED,NOM_LAB 
from laboratorio inner join mela on laboratorio.ID_LAB=mela.ID_LAB1 inner join medicamento on MELA.ID_MED3=medicamento.ID_MED
end

create procedure csmepe
as
begin
Select NOM_MED,NOM_PREN
from medicamento inner join mepe on medicamento.ID_MED=mepe.ID_MED1 inner join presentacion on mepe.ID_PRE1=presentacion.ID_PRE
end

create procedure csmeun
as
begin
Select NOM_MED,NOM_UN,NUM_UNI,PRECIO_UNI,total_uni
from medicamento inner join meun on medicamento.ID_MED=meun.ID_MED5 inner join unidad on meun.ID_UN1=unidad.ID_UN
end


create procedure csmeviad
as
begin
Select NOM_MED,NOM_va
from medicamento inner join meviad on medicamento.ID_MED=meviad.ID_MED2 inner join viaadmon on meviad.ID_VIA1=viaadmon.id_via
end

create procedure cspresentacion
as
begin
Select *
from presentacion
end

create procedure cstiposangre
as
begin
Select *
from tipo_sangre
end

create procedure cstipoenf
as
begin
Select *
from tipoenf
end

create procedure cstifer
as
begin
Select NOM_ENF,TELEFONO,TIPO_TEL 
FROM enfermo inner join tifer on enfermo.CLAVE_ENF=tifer.CLAVE_E3 inner join tipotel on tifer.ID_TEL1=TIPOTEL.ID_TEL
end

create procedure cstipoen
as
begin
Select NOM_ENF,NOM_TPR 
FROM enfermo inner join tipoen on enfermo.CLAVE_ENF=tipoen.CLAVE_E5 inner join tipopar on tipoen.ID_TPAR1=tipopar.ID_TPR
end

create procedure cstipopar
as
begin
Select *
from tipopar
end

create procedure cstipotel
as
begin
Select *
from tipotel
end

create procedure csunidad
as
begin
Select *
from unidad
end

create procedure csviaadmon
as
begin
Select *
from viaadmon
end



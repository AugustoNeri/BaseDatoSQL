create database medico
use medico

create table enfermedad(
ID_ENF INT,
NOM_END VARCHAR(200),
CONSTRAINT PK_EN PRIMARY KEY (ID_ENF))

INSERT INTO enfermedad values(0,'gripa')
INSERT INTO enfermedad values(0,'tos')
INSERT INTO enfermedad values(0,'fdsfds')
INSERT INTO enfermedad values(0,'hola')
INSERT INTO enfermedad values(0,'pepe')
INSERT INTO enfermedad values(0,'kj')
INSERT INTO enfermedad values(0,'kfdsj')
iNSERT INTO enfermedad values(0,'kdfdf')

select * 
from enfermedad

drop trigger NUMALE

create trigger NUMALE
on enfermedad
for  insert
as
begin
declare @IDE int
declare @NOME VARCHAR(200)
select @IDE=i.ID_ENF,@NOME=i.NOM_END
from inserted i
begin 
update enfermedad
set ID_ENF=ABS(CHECKSUM(NEWID()))
end
begin 
update enfermedad
set NOM_END=upper(NOM_END)
commit transaction
print 'DATOS GUARDADOS'
end
END


/*ENCRIPTADO*/
update enfermedad
set
NOM_END=reverse(replace((replace((replace((replace((replace((NOM_END),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/


select * 
from enfermedad

update enfermedad
set
NOM_END=reverse(replace((replace((replace((replace((replace((NOM_END),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/
create table CALLE(
ID_CA INT,
NOM_CA VARCHAR(200),
CONSTRAINT PK_CA PRIMARY KEY (ID_CA))

select * 
from CALLE

INSERT INTO CALLE VALUES(0,'COYUYA')

create trigger CALLES
on CALLE
for  insert
as
begin
declare @ICA int
declare @NOCA VARCHAR(200)
select @ICA=i.ID_CA,@NOCA=i.NOM_CA
from inserted i
begin 
update CALLE
set ID_CA=ABS(CHECKSUM(NEWID()))
end
begin 
update CALLE
set NOM_CA=upper(NOM_CA)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update CALLE
set
NOM_CA=reverse(replace((replace((replace((replace((replace((NOM_CA),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/

select * 
from calle

update CALLE
set
NOM_CA=reverse(replace((replace((replace((replace((replace((NOM_CA),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table TIPOTEL(
ID_TEL INT,
NOM_TEL VARCHAR(200),
CONSTRAINT PK_TEL PRIMARY KEY (ID_TEL))

select * 
from TIPOTEL

INSERT INTO TIPOTEL VALUES(0,'TELMEX')
INSERT INTO TIPOTEL VALUES(0,'LOLA')

create trigger TIPOTEL1
on TIPOTEL
for  insert
as
begin
declare @ITE int
declare @NOTE VARCHAR(200)
select @ITE=i.ID_TEL,@NOTE=i.NOM_TEL
from inserted i
begin 
update TIPOTEL
set ID_TEL=ABS(CHECKSUM(NEWID()))
end
begin 
update TIPOTEL
set NOM_TEL=upper(NOM_TEL)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update TIPOTEL
set
NOM_TEL=reverse(replace((replace((replace((replace((replace((NOM_TEL),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update TIPOTEL
set
NOM_TEL=reverse(replace((replace((replace((replace((replace((NOM_TEL),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table ALERGIA(
ID_ALE INT,
NOM_ALE VARCHAR(200),
CONSTRAINT PK_ALE PRIMARY KEY (ID_ALE))

select * 
from ALERGIA

INSERT INTO ALERGIA VALUES(0,'POLEM')
INSERT INTO ALERGIA VALUES(0,'POLVO')

create trigger ALERGIA1
on ALERGIA
for  insert
as
begin
declare @IAL int
declare @NOAL VARCHAR(200)
select @IAL=i.ID_ALE,@NOAL=i.NOM_ALE
from inserted i
begin 
update ALERGIA
set ID_ALE=ABS(CHECKSUM(NEWID()))
end
begin 
update ALERGIA
set NOM_ALE=upper(NOM_ALE)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update ALERGIA
set
NOM_ALE=reverse(replace((replace((replace((replace((replace((NOM_ALE),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update ALERGIA
set
NOM_ALE=reverse(replace((replace((replace((replace((replace((NOM_ALE),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table DELEGACION(
ID_DEL INT,
NOM_DEL VARCHAR(200),
CONSTRAINT PK_DEL PRIMARY KEY (ID_DEL))

select * 
from DELEGACION

INSERT INTO DELEGACION VALUES(0,'IZTACALCO')
INSERT INTO DELEGACION VALUES(0,'POLVO')

create trigger DELEGACION1
on DELEGACION
for  insert
as
begin
declare @IDE int
declare @NODE VARCHAR(200)
select @IDE=i.ID_DEL,@NODE=i.NOM_DEL
from inserted i
begin 
update DELEGACION
set ID_DEL=ABS(CHECKSUM(NEWID()))
end
begin 
update DELEGACION
set NOM_DEL=upper(NOM_DEL)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update DELEGACION
set
NOM_DEL=reverse(replace((replace((replace((replace((replace((NOM_DEL),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update DELEGACION
set
NOM_DEL=reverse(replace((replace((replace((replace((replace((NOM_DEL),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table TIPOPAR(
ID_TEPAR INT,
NOM_TEPAR VARCHAR(200),
CONSTRAINT PK_TEPAR PRIMARY KEY (ID_TEPAR))

select * 
from TIPOPAR

INSERT INTO TIPOPAR VALUES(0,'IZTACALCO')
INSERT INTO TIPOPAR VALUES(0,'POLVO')

create trigger TIPOPAR1
on TIPOPAR
for  insert
as
begin
declare @ITR int
declare @NOTR VARCHAR(200)
select @ITR=i.ID_TEPAR,@NOTR=i.NOM_TEPAR
from inserted i
begin 
update TIPOPAR
set ID_TEPAR=ABS(CHECKSUM(NEWID()))
end
begin 
update TIPOPAR
set NOM_TEPAR=upper(NOM_TEPAR)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update TIPOPAR
set
NOM_TEPAR=reverse(replace((replace((replace((replace((replace((NOM_TEPAR),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update TIPOPAR
set
NOM_TEPAR=reverse(replace((replace((replace((replace((replace((NOM_TEPAR),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table TIPOENF(
ID_EN INT,
NOM_EN VARCHAR(200),
CONSTRAINT PK_ENF PRIMARY KEY (ID_EN))

select * 
from TIPOENF

INSERT INTO TIPOENF VALUES(0,'CONTAGIOSA')
INSERT INTO TIPOENF VALUES(0,'POLVO')

create trigger TIPOENF1
on TIPOENF
for  insert
as
begin
declare @IEN int
declare @NOEN VARCHAR(200)
select @IEN=i.ID_EN,@NOEN=i.NOM_EN
from inserted i
begin 
update TIPOENF
set ID_EN=ABS(CHECKSUM(NEWID()))
end
begin 
update TIPOENF
set NOM_EN=upper(NOM_EN)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update TIPOENF
set
NOM_EN=reverse(replace((replace((replace((replace((replace((NOM_EN),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update TIPOENF
set
NOM_EN=reverse(replace((replace((replace((replace((replace((NOM_EN),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table TIPOSANGRE(
ID_TS INT,
NOM_TS VARCHAR(200),
CONSTRAINT PK_TS PRIMARY KEY (ID_TS))

select * 
from TIPOSANGRE

INSERT INTO TIPOSANGRE VALUES(0,'A+')
INSERT INTO TIPOSANGRE VALUES(0,'POLVO')

create trigger TIPOSANGRE1
on TIPOSANGRE
for  insert
as
begin
declare @ITS int
declare @NOTS VARCHAR(200)
select @ITS=i.ID_TS,@NOTS=i.NOM_TS
from inserted i
begin 
update TIPOSANGRE
set ID_TS=ABS(CHECKSUM(NEWID()))
end
begin 
update TIPOSANGRE
set NOM_TS=upper(NOM_TS)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update TIPOSANGRE
set
NOM_TS=reverse(replace((replace((replace((replace((replace((NOM_TS),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update TIPOSANGRE
set
NOM_TS=reverse(replace((replace((replace((replace((replace((NOM_TS),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table VADMECUM(
ID_VAD INT,
NOM_VAD VARCHAR(200),
CONSTRAINT PK_VAD PRIMARY KEY (ID_VAD))

select * 
from VADMECUM

INSERT INTO VADMECUM VALUES(0,'NORTE')
INSERT INTO VADMECUM VALUES(0,'POLVO')

create trigger VADMECUM1
on VADMECUM
for  insert
as
begin
declare @IVA int
declare @NOVA VARCHAR(200)
select @IVA=i.ID_VAD,@NOVA=i.NOM_VAD
from inserted i
begin 
update VADMECUM
set ID_VAD=ABS(CHECKSUM(NEWID()))
end
begin 
update VADMECUM
set NOM_VAD=upper(NOM_VAD)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update VADMECUM
set
NOM_VAD=reverse(replace((replace((replace((replace((replace((NOM_VAD),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update VADMECUM
set
NOM_VAD=reverse(replace((replace((replace((replace((replace((NOM_VAD),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table LABORATORIO(
ID_LAB INT,
NOM_LAB VARCHAR(200),
CONSTRAINT PK_LAB PRIMARY KEY (ID_LAB))

select * 
from LABORATORIO

INSERT INTO LABORATORIO VALUES(0,'CHOPO')
INSERT INTO LABORATORIO VALUES(0,'POLVO')

create trigger LABORATORIO1
on LABORATORIO
for  insert
as
begin
declare @ILA int
declare @NOLA VARCHAR(200)
select @ILA=i.ID_LAB,@NOLA=i.NOM_LAB
from inserted i
begin 
update LABORATORIO
set ID_LAB=ABS(CHECKSUM(NEWID()))
end
begin 
update LABORATORIO
set NOM_LAB=upper(NOM_LAB)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update LABORATORIO
set
NOM_LAB=reverse(replace((replace((replace((replace((replace((NOM_LAB),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update LABORATORIO
set
NOM_LAB=reverse(replace((replace((replace((replace((replace((NOM_LAB),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table COMPONENTES(
ID_COM INT,
NOM_COM VARCHAR(200),
CONSTRAINT PK_COM PRIMARY KEY (ID_COM))

select * 
from COMPONENTES

INSERT INTO COMPONENTES VALUES(0,'SODIO')
INSERT INTO COMPONENTES VALUES(0,'POLVO')

create trigger COMPONENTES1
on COMPONENTES
for  insert
as
begin
declare @ICO int
declare @NOCO VARCHAR(200)
select @ICO=i.ID_COM,@NOCO=i.NOM_COM
from inserted i
begin 
update COMPONENTES
set ID_COM=ABS(CHECKSUM(NEWID()))
end
begin 
update COMPONENTES
set NOM_COM=upper(NOM_COM)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update COMPONENTES
set
NOM_COM=reverse(replace((replace((replace((replace((replace((NOM_COM),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update COMPONENTES
set
NOM_COM=reverse(replace((replace((replace((replace((replace((NOM_COM),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table PRESENTACION(
ID_PRES INT,
NOM_PRES VARCHAR(200),
CONSTRAINT PK_PRES PRIMARY KEY (ID_PRES))

select * 
from PRESENTACION

INSERT INTO PRESENTACION VALUES(0,'ML')
INSERT INTO PRESENTACION VALUES(0,'POLVO')

create trigger PRESENTACION1
on PRESENTACION
for  insert
as
begin
declare @IPR int
declare @NOPR VARCHAR(200)
select @IPR=i.ID_PRES,@NOPR=i.NOM_PRES
from inserted i
begin 
update PRESENTACION
set ID_PRES=ABS(CHECKSUM(NEWID()))
end
begin 
update PRESENTACION
set NOM_PRES=upper(NOM_PRES)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update PRESENTACION
set
NOM_PRES=reverse(replace((replace((replace((replace((replace((NOM_PRES),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update PRESENTACION
set
NOM_PRES=reverse(replace((replace((replace((replace((replace((NOM_PRES),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table UNIDAD(
ID_UNI INT,
NOM_UNI VARCHAR(200),
CONSTRAINT PK_UNI PRIMARY KEY (ID_UNI))

select * 
from UNIDAD

INSERT INTO UNIDAD VALUES(0,'PASTILLAS')
INSERT INTO UNIDAD VALUES(0,'POLVO')

create trigger UNIDAD1
on UNIDAD
for  insert
as
begin
declare @IUN int
declare @NOUN VARCHAR(200)
select @IUN=i.ID_UNI,@NOUN=i.NOM_UNI
from inserted i
begin 
update UNIDAD
set ID_UNI=ABS(CHECKSUM(NEWID()))
end
begin 
update UNIDAD
set NOM_UNI=upper(NOM_UNI)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update UNIDAD
set
NOM_UNI=reverse(replace((replace((replace((replace((replace((NOM_UNI),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update UNIDAD
set
NOM_UNI=reverse(replace((replace((replace((replace((replace((NOM_UNI),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table COLONIA(
ID_CO INT,
NOM_CO VARCHAR(200),
CONSTRAINT PK_CO PRIMARY KEY (ID_CO))

select * 
from COLONIA

INSERT INTO COLONIA VALUES(0,'HERNAN')
INSERT INTO COLONIA VALUES(0,'POLVO')

create trigger COLONIA1
on COLONIA
for  insert
as
begin
declare @ICO1 int
declare @NOCO1 VARCHAR(200)
select @ICO1=i.ID_CO,@NOCO1=i.NOM_CO
from inserted i
begin 
update COLONIA
set ID_CO=ABS(CHECKSUM(NEWID()))
end
begin 
update COLONIA
set NOM_CO=upper(NOM_CO)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update COLONIA
set
NOM_CO=reverse(replace((replace((replace((replace((replace((NOM_CO),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update COLONIA
set
NOM_CO=reverse(replace((replace((replace((replace((replace((NOM_CO),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table DIAGNOSTICO(
ID_DIAG INT,
NOM_DIAG VARCHAR(200),
CONSTRAINT PK_DIAG PRIMARY KEY (ID_DIAG))

select * 
from DIAGNOSTICO

INSERT INTO DIAGNOSTICO VALUES(0,'HERNAN')
INSERT INTO DIAGNOSTICO VALUES(0,'POLVO')

create trigger DIAGNOSTICO1
on DIAGNOSTICO
for  insert
as
begin
declare @IDI int
declare @NODI VARCHAR(200)
select @IDI=i.ID_DIAG,@NODI=i.NOM_DIAG
from inserted i
begin 
update DIAGNOSTICO
set ID_DIAG=ABS(CHECKSUM(NEWID()))
end
begin 
update DIAGNOSTICO
set NOM_DIAG=upper(NOM_DIAG)
commit transaction
print 'DATOS GUARDADOS'
end
END

/*ENCRIPTADO*/
update DIAGNOSTICO
set
NOM_DIAG=reverse(replace((replace((replace((replace((replace((NOM_DIAG),'U','&')),'O','/')),'I','$')),'A','+')),'E','#'))
/*DESENCRIPTADO*/
update DIAGNOSTICO
set
NOM_DIAG=reverse(replace((replace((replace((replace((replace((NOM_DIAG),'&','U')),'/','O')),'$','I')),'+','A')),'#','E'))
/*-------------------------------------------------------------------------*/

create table ESPECIALIDAD(
ID_PSP INT,
NOM_PSP VARCHAR(200),
CONSTRAINT PK_PSP PRIMARY KEY (ID_PSP))

create table HORARIOS(
ID_HR INT,
NOM_HR VARCHAR(200),
CONSTRAINT PK_HR PRIMARY KEY (ID_HR))

create table ENFERMO(
CLAVE_E INT,
NOM_E VARCHAR(200),
CP_E VARCHAR(200),
FEHE_E DATETIME,
FEHS_E DATETIME,
ID_CA1 INT,
ID_CO1 INT,
ID_DEL1 INT,
ID_EN1 INT,
ID_TS1 INT,
CONSTRAINT PK_HRH PRIMARY KEY (CLAVE_E),
CONSTRAINT FK_K FOREIGN KEY(ID_CA1) REFERENCES CALLE(ID_CA),
CONSTRAINT FK_CO FOREIGN KEY(ID_CO1) REFERENCES COLONIA(ID_CO),
CONSTRAINT FK_DEL FOREIGN KEY(ID_DEL1) REFERENCES DELEGACION(ID_DEL),
CONSTRAINT FK_N FOREIGN KEY(ID_EN1) REFERENCES TIPOENF(ID_EN),
CONSTRAINT FK_TSO FOREIGN KEY(ID_TS1) REFERENCES TIPOSANGRE(ID_TS))

create table  ENFER(
CLAVE_E2 INT,
ID_ENF2 INT,
CONSTRAINT FK_E2 FOREIGN KEY(CLAVE_E2) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT FK_EF2 FOREIGN KEY(ID_ENF2) REFERENCES ENFERMEDAD(ID_ENF))

create table TIFER(
CLAVE_E7 INT,
ID_TEL1 INT,
TELEFONO INT,
CONSTRAINT FK_CE7 FOREIGN KEY(CLAVE_E7) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT FK_TE1 FOREIGN KEY(ID_TEL1) REFERENCES TIPOTEL(ID_TEL))

create table ALEENF(
CLAVE_E3 INT,
ID_ALE1 INT,
CONSTRAINT FK_CE3 FOREIGN KEY(CLAVE_E3) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT FK_ALE FOREIGN KEY(ID_ALE1) REFERENCES ALERGIA(ID_ALE))

create table TIPOEN(
CLAVE_E1 INT,
ID_TPAR1 INT,
CONSTRAINT FK_RDR FOREIGN KEY(CLAVE_E1) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT FK_AL FOREIGN KEY(ID_TPAR1) REFERENCES TIPOPAR(ID_TEPAR))


create table MEDICAMENTOS(
ID_ME INT,
NOM_ME VARCHAR(200),
CONSTRAINT PK_ME PRIMARY KEY (ID_ME))

create table MEEN(
CLAVE_E5 INT,
ID_ME6 INT,
DOSIS_MR VARCHAR(200),
TIEMPO DATETIME,
CONSTRAINT FK_CL5 FOREIGN KEY(CLAVE_E5) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT FK_FDS FOREIGN KEY(ID_ME6) REFERENCES MEDICAMENTOS(ID_ME))


create table MEUNI(
ID_UNI1 INT,
ID_ME3 INT,
CAN INT,
CONSTRAINT FK_DSD FOREIGN KEY(ID_UNI1) REFERENCES UNIDAD(ID_UNI),
CONSTRAINT FK_DS FOREIGN KEY(ID_ME3) REFERENCES MEDICAMENTOS(ID_ME))


create table UNIDOSIS(
ID_UNIDO INT,
CAN_UNIDO INT,
PRE_UNIDO INT,
TOTAL AS PRE_UNIDO*CAN_UNIDO,
CONSTRAINT PK_RE PRIMARY KEY (ID_UNIDO))

create table UNIME(
ID_UNIDO1 INT,
ID_ME5 INT,
CONSTRAINT FK_FG FOREIGN KEY(ID_UNIDO1) REFERENCES  UNIDOSIS(ID_UNIDO),
CONSTRAINT FK_BB FOREIGN KEY(ID_ME5) REFERENCES MEDICAMENTOS(ID_ME))

create table PREME(
ID_PRES1 INT,
ID_ME4 INT,
CONSTRAINT FK_NJ FOREIGN KEY(ID_PRES1) REFERENCES  PRESENTACION(ID_PRES),
CONSTRAINT FK_KJ FOREIGN KEY(ID_ME4) REFERENCES MEDICAMENTOS(ID_ME))

create table COMME(
ID_COM1 INT,
ID_ME1 INT,
CONSTRAINT FK_GY FOREIGN KEY(ID_COM1 ) REFERENCES COMPONENTES (ID_COM),
CONSTRAINT FK_PO FOREIGN KEY(ID_ME1) REFERENCES MEDICAMENTOS(ID_ME))

create table LADME(
ID_LAB1 INT,
ID_ME8 INT,
CONSTRAINT FK_YT FOREIGN KEY(ID_LAB1 ) REFERENCES  LABORATORIO (ID_LAB),
CONSTRAINT FK_SE FOREIGN KEY(ID_ME8) REFERENCES MEDICAMENTOS(ID_ME))

create table VAME(
ID_VAD1 INT,
ID_ME5 INT,
CONSTRAINT FK_RT FOREIGN KEY(ID_VAD1 ) REFERENCES  VADMECUM (ID_VAD),
CONSTRAINT FK_PL FOREIGN KEY(ID_ME5) REFERENCES MEDICAMENTOS(ID_ME))

CREATE TABLE DOCTOR(
ID_D INT,
NOM_D VARCHAR(200),
CED_D VARCHAR(200),
ID_HR1 INT,
ID_PSP1 INT,
CONSTRAINT FK_YY FOREIGN KEY(ID_HR1 ) REFERENCES  HORARIOS (ID_HR),
CONSTRAINT FK_MM FOREIGN KEY(ID_PSP1) REFERENCES ESPECIALIDAD(ID_PSP),
CONSTRAINT PK_RR PRIMARY KEY (ID_D))

create table ENDIA(
NUM_M INT,
RECON_E VARCHAR(200),
FECHA_PC DATETIME,
FECHA_C DATETIME,
TIEM_E VARCHAR(200),
STAD_E VARCHAR(200),
ID_D1 INT,
ID_DIAG1 INT,
CLAVE_E8 INT
CONSTRAINT FK_DD FOREIGN KEY(ID_D1) REFERENCES  DOCTOR (ID_D),
CONSTRAINT FK_FR FOREIGN KEY(ID_DIAG1 ) REFERENCES DIAGNOSTICO(ID_DIAG),
CONSTRAINT FK_NN FOREIGN KEY(CLAVE_E8) REFERENCES ENFERMO(CLAVE_E),
CONSTRAINT PK_HH PRIMARY KEY (NUM_M))
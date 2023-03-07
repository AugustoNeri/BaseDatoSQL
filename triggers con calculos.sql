CREATE DATABASE TRIGGERS2
USE TRIGGERS2

CREATE TABLE MARCA(
ID_MARCA INT PRIMARY KEY,
MARCA VARCHAR(50))
INSERT INTO MARCA VALUES(1,'PATITO')

CREATE TABLE PRODUCTO(
ID_PROD INT PRIMARY KEY,
NOM_PROD VARCHAR(70),
FECHA_CAD DATETIME,
PRECIO_COMP FLOAT,
PRECIO_VENT FLOAT,
COD_BARRAS INT,
EXIS INT,
CONT INT,
ID_MARCA1 INT FOREIGN KEY REFERENCES MARCA(ID_MARCA))

delete 
from producto

select *
from producto
insert into producto values
(1,'prod1','15-05-2017',-10,null,1,15,100,1)

insert into producto values
(2,'prod2','20-03-2017',50,null,2,10,3,1)

insert into producto values
(6,'prod3','20-03-2017',400,null,2,10,3,1,null)

insert into producto values
(15,'prod3','28-01-2017',700,null,2,10,3,1,null)

insert into producto values
(16,'prod4','28-01-2016',700,null,2,10,3,1,null)

insert into producto values
(16,'prod9','26-02-2017',700,null,2,10,3,1,null)

insert into producto values
(17,'prod5','28-01-2019',60,null,2,10,3,1,null)

insert into producto values(4,'prod4','15-05-2017',1500,null,3,10,3,1)

drop trigger calculo

create trigger calculo
on producto
for insert,update
as
begin
declare @idp int
declare @nom varchar(70)
declare @pc float
declare @pv float
declare @fc datetime
declare @ofer float
select @pc=I.precio_comp,
@pv=I.precio_vent,@fc=I.fecha_cad,@ofer=I.oferta,
@idp=I.id_prod,@nom=I.nom_prod
from inserted I
if(@pc>=1 and @pc<=100)
begin
update producto
set precio_vent=@pc*1.07
where((precio_comp>=1 and precio_comp<=100)and precio_vent is null)
end

if(@pc>100 and @pc<=500)
begin
update producto
set precio_vent=@pc*1.11
where ((@pc>100 and @pc<=500)and precio_vent is null)
end

if(@pc>500 and @pc<=3000)
begin
update producto
set precio_vent=@pc*1.15
where(@pc>500 and @pc<=3000 and precio_vent is null)
end

if(@pc>3000)
begin
update producto
set precio_vent=@pc*1.16
where(@pc>3000 and precio_vent is null)
end

if(@pc<=0)
begin
print'dato incorrecto'
rollback
end

if(month(getdate())=month(@fc)and year(@fc)=year(getdate()))
begin
print 'Proximo a caducar'
update producto
set oferta=precio_vent-(precio_vent*0.6)
where (month(fecha_cad)=month(getdate())and year(fecha_cad)=year(@fc) and oferta is null)
end

update producto
set nom_prod=lower(nom_prod)

if(EXISTS(select * from producto where @idp<>producto.id_prod and @nom=producto.nom_prod and @fc=producto.fecha_cad and @pc=producto.precio_comp))
begin
print'datos duplicados'
rollback transaction
end
else
begin
print'registro ok'
update producto
set nom_prod=upper(nom_prod)
commit transaction
end
end

alter table producto
add oferta float


--PROCEDIMIENTOS ALMACENADOS
--CREATE PROCEDURE NOMBRE PARAMETROS
--AS
--CUERPO DEL PROCEDIMIENTO

CREATE PROCEDURE CON
AS
SELECT *
FROM PRODUCTO


CREATE PROCEDURE CON1
AS
SELECT NOM_PROD,FECHA_CAD,MARCA
FROM PRODUCTO INNER JOIN MARCA ON MARCA.ID_MARCA=PRODUCTO.ID_MARCA1

CON

CON1

SELECT *
FROM MARCA
CON

SELECT *
FROM MARCA
EXEC CON

DROP PROCEDURE BUSCAR 
CREATE PROCEDURE BUSCAR @PROD VARCHAR(70)
AS
SELECT *
FROM PRODUCTO
WHERE NOM_PROD=@PROD

EXEC BUSCAR PROD2

CREATE PROCEDURE BUSCAR2 @PROD1 VARCHAR(70),@MARCA1 VARCHAR(50)
AS
SELECT *
FROM PRODUCTO INNER JOIN MARCA ON MARCA.ID_MARCA=PRODUCTO.ID_MARCA1
WHERE NOM_PROD=@PROD1 AND MARCA=@MARCA1

EXEC BUSCAR2 PROD2,PATITO

CREATE PROCEDURE BUSCAR3 @PROD1 VARCHAR(70),@MARCA1 VARCHAR(50)
AS
SELECT *
FROM PRODUCTO INNER JOIN MARCA ON MARCA.ID_MARCA=PRODUCTO.ID_MARCA1
WHERE NOM_PROD=@PROD1 OR MARCA=@MARCA1

EXEC BUSCAR3 PROD3,PATITO

CREATE TABLE PRODUCTOS1(
ID_PROD INT PRIMARY KEY,
NOM_PROD VARCHAR(70),
FECHA_CAD DATETIME,
PRECIO_COMP FLOAT,
PRECIO_VENT FLOAT,
COD_BARRAS INT,
EXIS INT,
CONT INT,
)

create procedure agregar @id_p int, @nom varchar(35),
@cad datetime,@pc float, @pv float, @cb int, @exis int, @cont int
as
begin
set dateformat dmy
insert into PRODUCTOS1
values(@id_p,@nom,@cad,@pc,@pv,@cb,@exis,@cont)
select *
from productoS1
end

agregar 99,'agua','05-05-05',55,66,78,34,40

agregar 98,'galletas','05-05-05',55,null,78,34,40


create procedure actualizar @ID_PR int
AS
BEGIN
UPDATE PRODUCTOS1
SET PRECIO_VENT=PRECIO_COMP*1.15
WHERE ID_PROD=@ID_PR
SELECT *
FROM PRODUCTOS1
END

DROP PROCEDURE BORRAR
CREATE PROCEDURE BORRAR @ID_PR INT
AS
BEGIN
DELETE
FROM PRODUCTOS1
WHERE ID_PROD=@ID_PR
SELECT *
FROM PRODUCTOS1
END

BORRAR 98
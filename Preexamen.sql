create database producto
use producto

create table productos(
clave_prod int,
nom_prod varchar(150),
desc_prod varchar(150),
existencia int,
precio_c float,
fecha_c datetime,
constraint pk_prod primary key(clave_prod))

create table cliente(
clave_client int,
nom_client varchar(150),
constraint pk_client primary key(clave_client))

create table pro_client(
clave_prod1 int,
clave_client1 int,
cantidad int,
precio_v float,
total float,
folio varchar(150),
fecha_v datetime,
constraint fk_prod1 foreign key(clave_prod1) references productos(clave_prod),
constraint fk_client1 foreign key(clave_client1) references cliente(clave_client))

insert into cliente values(1,'Augusto')
insert into cliente values(2,'Axel')

insert into productos values(1,'galletas','ricas',5,10,'25/05/17')
insert into productos values(2,'helado','fresco',20,15,'24/06/18')

insert into pro_client values(1,1,8,15,120,'5540','19/02/17')
insert into pro_client values(2,2,9,25,225,'5541','30/01/17')

select *
from cliente

select *
from productos
select *
from pro_client


create procedure agregarclient @id_c int, @nomc varchar(150)
as
begin
insert into cliente
values(@id_c,@nomc)
select *
from cliente
end



create  procedure consultarclient 
as
begin
select *
from cliente
end



create  procedure buscarclient  @nomc varchar(150)
as
begin
select *
from cliente
where nom_client=@nomc
end



create procedure agregarprod @id_p int, @nomp varchar(150),@desc_prod varchar(150),@exis int,@prc float,@fc datetime
as
begin
insert into productos values(@id_p,@nomp,@desc_prod,@exis,@prc,@fc)
select *
from productos
end



create procedure consultarprod
as
begin
select *
from productos
end

create procedure buscarprod @nomp varchar(150)
as
begin
select *
from productos
where nom_prod=@nomp
end



create procedure agregarpc @id_p int, @idc int,@cant int,@pv float,@total float,@fo varchar(150),@fv datetime 
as
begin
set dateformat dmy
insert into pro_client values(@id_p,@idc,@cant,@pv,@total,@fo,@fv)
select *
from pro_client
end



create procedure consultarprodclient
as
begin
select *
from pro_client
end



create procedure buscarprodclient @fo varchar(150),@fv datetime
as
begin
select *
from pro_client
where folio=@fo and fecha_v=@fv
end


create procedure calcular 
as begin
update pro_client 
set precio_v=productos.precio_c*1.18,total=precio_v*cantidad
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
select clave_prod,nom_prod,desc_prod,existencia,fecha_c,precio_c,clave_client1,cantidad,precio_v,total,fecha_v,folio
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
end

create procedure calcular1 @id_p1 int, @idc1 int,@cant int,@precio float,@total float,@fv datetime,@fo varchar(150)
as begin
insert into pro_client values(@id_p1,@idc1,@cant,0,0,@fv,@fo)
update productos
set existencia=existencia-pro_client.cantidad
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
where clave_prod1=@id_p1 and clave_client1=@idc1
select clave_prod,nom_prod,desc_prod,existencia,fecha_c,precio_c,clave_client1,cantidad,precio_v,total,fecha_v,folio
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
end

create procedure calcular2 @id_p1 int, @idc1 int,@cant int,@precio float,@total float,@fv datetime,@fo varchar(150)
as begin
insert into pro_client values(@id_p1,@idc1,@cant,0,0,@fv,@fo)
update pro_client 
set precio_v=productos.precio_c*1.18,total=precio_v*cantidad
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
update productos
set existencia=existencia-pro_client.cantidad
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
where clave_prod1=@id_p1 and clave_client1=@idc1
select clave_prod,nom_prod,desc_prod,existencia,fecha_c,precio_c,clave_client1,cantidad,precio_v,total,fecha_v,folio
from productos inner join pro_client on productos.clave_prod=pro_client.clave_prod1
end



calcular2 2,1,3,0,0,'24/03/16','3423'

 
create procedure eliminatabla $id varchar(7)
as
begin
delete
from nomtabla
where id_tb=$id
end

agregarclient 6,jos
consultarclient
buscarclient 'Augusto'

agregarprod 7,'paletas','dulce',5,4,'24/03/18'
consultarprod 
buscarprod 'helado'

agregarpc 3,1,9,15,120,'5540','19/02/17'
consultarprodclient
buscarprodclient '5541','30/01/17'
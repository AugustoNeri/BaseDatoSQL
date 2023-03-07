create database agenda1;
use agenda1;

create table carrera(
clave_ca int,
nom_ca varchar(50),
constraint pk_ca primary key(clave_ca))
ENGINE=InnoDB;

create table hobbie(
id_ho int,
nom_hob varchar(50),
constraint pk_ho primary key(id_ho))
ENGINE=InnoDB;

create table estado_civil(
id_ec int,
nom_ec varchar(50),
constraint pk_ec primary key(id_ec))
ENGINE=InnoDB;

create table amigo1(
id_am int,
nom_am varchar(100),
foto varchar(150),
telefono int,
direccion varchar(150),
correo varchar(150),
clave_ca1 int,
id_ec1 int,
id_ho1 int,
constraint pk_am primary key(id_am),
constraint fk_ca foreign key(clave_ca1) references carrera(clave_ca),
constraint fk_ec1 foreign key(id_ec1) references estado_civil(id_ec),
constraint fk_ho1 foreign key(id_ho1) references hobbie(id_ho))
ENGINE=InnoDB;
Select id_am,nom_am,foto,telefono,direccion,correo,nom_ca,nom_ec,nom_hob from  carrera inner join amigo on carrera.clave_ca=amigo.clave_ca1 inner join estado_civil on amigo.id_ec1=estado_civil.id_ec inner join hobbie on amigo.id_ho1=hobbie.id_ho

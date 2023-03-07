create database personalizar ON PRIMARY(
name=personalizar_DATA,
filename='C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\Data\persolanizar_DATA.MDF',
size=10MB,
MAXSIZE=25MB,
filegrowth=1MB
)
LOG ON
(
name=personalizar_log,
filename='C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\Data\personalizar_LOG.LDF',
size=10MB,
MAXSIZE=25MB,
FILEGROWTH=1MB
)
SP_HELPDB personalizar
--visualiza todas lasbases de datos
select *
from sysdatabases
-- visualiza todos los tipos de datos validos de sql
select *
from systypes
--visualiza todos los usuarios de la instancia actual
sp_helpuser personalizar
--visualiza todos los objetos de la base de datos actual
select *
from sysobjects



select * from sysobjects where xtype='p'

select * from sysobjects where xtype='tr'

select * from sysobjects where xtype='u'
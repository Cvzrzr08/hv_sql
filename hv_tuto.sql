create database tutorial --creear db (a1)

--drop database tutorial  --eliminar
	/*
 Comentario en varias líneas.
 * Compatible con el estándar SQL99
 */
-----------------------------part2

use tutorial;  --(a1)nota: seleccionar todo para que pueda crear la tabla 
/*
CREATE TABLE hv_table1
(
	id int,
	firtName nvarchar(50),
	lastName nvarchar(50),
	birthDay date
)
	drop table tutorial
	*/

create table hb_table2  --tabla vacia
(
id int,
firtName nvarchar(20),
lastName nvarchar(20),
birtDay date
);
	---suponiendo que se olvido agregar la columna adresss
	alter table hv_table1 add adress nvarchar (250)


----agregardo filas
insert into hb_table2(id,lastName,birtDay,adress)
values(2,'han','madisoon','15-04-1999',null)	 

select * from hb_table2
select * from hv_table1


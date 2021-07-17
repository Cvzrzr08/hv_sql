create database hv_db1
--drop database hv_db1

use hv_db1;
create table tabletr1(
id nvarchar (20),
nombre nvarchar(20),
cumpleanios date
);
--drop table hv_db1t1
alter table tabletr1 add direccion nvarchar(120)

insert into tabletr1(id,nombre,cumpleanios,direccion)
values (3,'Eduardo','12-29-1997', 'constitucion')

select * from tabletr1             ----consulta en sqlStudio

----consula con vscode_tr2
    /*1- instalar extension de sql, seguido de instalado reiniciar 'code
      2.- Seleccionar icono de sql, presionar ctrl + shift + p 
        3.-copiar y poner el nombre del servidor locarl 'DESKTOP...... 
            -Ingresar el nombre de la db
            -Elegir integrated(ya que es local)
            -poner alias con que aparecerá en lista en 'code(opcional)
        */
USE hv_db1;
CREATE TABLE tabletr2(
    id int IDENTITY, --autoincremental ***
    nombre VARCHAR(50),
    correo VARCHAR(50),
    edad SMALLINT
)
--agregando nuevo dato a la tabla
ALTER TABLE tabletr2 add direccion NVARCHAR(120)

--ingresando datos en tabla  
INSERT INTO tabletr2 (nombre, correo, edad, direccion)
values('Jose ', 'JsepC@gmail.com',35,'Calle 45')

SELECT * from tabletr2

---------------------- Editando informacion(actualizando)
UPDATE tabletr2 SET edad = 25 WHERE id = 2
UPDATE tabletr2 SET nombre = 'Calos Eduardo' WHERE id = 1
UPDATE tabletr2 SET direccion = 'Guaycura' WHERE Id = 2

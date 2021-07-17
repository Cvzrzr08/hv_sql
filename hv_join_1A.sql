use testJoin;
go
SELECT * FROM Departamentos
SELECT * FROM Empleados
go
/* clauusula innere Join
Está busca dos coincidencias  entre 2 tablas en funcion a una columna que tienen en común
	de modo que solo se mostrará solo la intersección de ambas  --INTERSECCIÓN RESPETADA

	ejemplo:
 */

 select *
 from Empleados E
 Join Departamentos D
 on E.DepartameentoId = D.Id
 go
 --haciendo una consulta más especifica
  
 select --consultando todo los empleados dentro de un departamento
 E.Nombre as 'Empleado', --rotulando el titulo de las tablas
 D.nombre as 'Departamento'
 from Empleados E
 Join Departamentos D
 on E.DepartameentoId = D.Id
 go
											
 /* LEFT EXCLUDING JOIN
 Da prioridad a la tabla izquierda, se busca en la derecha. Es decir no se respeta la intersección como en Inner Join
 SI NO EXISTE COINCIDENCIA para alguna de las filas de la izquiera, de igual forma los resultados  de la primera tabla se muestra.
*/
use testJoin;
select 
E.nombre as 'Empleado',
D.nombre as 'Departamento'
from Empleados E
left Join Departamentos D
on E.DepartameentoId = D.Id
go
/*clausula Join Right, caso similar a Join left; A diferencia de que se da prioridad en la tabla derecha
ejemplo:*/

select
E.Nombre as 'Empleado',
D.Nombre as 'Departamento'
from Empleados E
right join Departamentos D
on E.DepartameentoId = D.Id
go
/* clausula full Join muestra tanto las filas de la tabla derecha e izquierda; Full Outer Join(Full Join) se encarga de mostrar  tolas las filas  de ambas tablas,
sin importar que  no existan coincidencia(usará NULL como valor por defecto  para dicho casos). Ejemplo:*/

select
E.Nombre as 'Empleado',
D.Nombre as 'Departamento'
from Empleados E
full join Departamentos D
on E.DepartameentoId = D.Id
go

			-- Por presentación mostraremos null como 'sin departamento'
	select 
	E.Nombre as 'Empleado',
	ISNULL (D.Nombre, 'Sin departameento') as 'Departamento'
	from Empleados E
	full Join Departamentos D
	on E. DepartameentoId = D.Id
						---consultando a los empleados que no tienen departamento asignado
	where D.Id is null	



											/*	
											insert into Empleados(Nombre,DepartameentoId)
											values('Valentina',null)
											select * from Departamentos
											select * from Empleados
						                        */
/* Extras:
Left Excluding JOIN nos permitirá obtener la lista de empleados que aún no han sido asignados a ningún departamento de trabajo.
Mientras que Right Excluding JOIN nos mostrará la lista de departamentos que no tienen a ningún trabajador asociado.
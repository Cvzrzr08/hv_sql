use testJoin;
go
SELECT * FROM Departamentos
SELECT * FROM Empleados
go
/* clauusula innere Join
Est� busca dos coincidencias  entre 2 tablas en funcion a una columna que tienen en com�n
	de modo que solo se mostrar� solo la intersecci�n de ambas  --INTERSECCI�N RESPETADA

	ejemplo:
 */

 select *
 from Empleados E
 Join Departamentos D
 on E.DepartameentoId = D.Id
 go
 --haciendo una consulta m�s especifica
  
 select --consultando todo los empleados dentro de un departamento
 E.Nombre as 'Empleado', --rotulando el titulo de las tablas
 D.nombre as 'Departamento'
 from Empleados E
 Join Departamentos D
 on E.DepartameentoId = D.Id
 go
											
 /* LEFT EXCLUDING JOIN
 Da prioridad a la tabla izquierda, se busca en la derecha. Es decir no se respeta la intersecci�n como en Inner Join
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
sin importar que  no existan coincidencia(usar� NULL como valor por defecto  para dicho casos). Ejemplo:*/

select
E.Nombre as 'Empleado',
D.Nombre as 'Departamento'
from Empleados E
full join Departamentos D
on E.DepartameentoId = D.Id
go

			-- Por presentaci�n mostraremos null como 'sin departamento'
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
Left Excluding JOIN nos permitir� obtener la lista de empleados que a�n no han sido asignados a ning�n departamento de trabajo.
Mientras que Right Excluding JOIN nos mostrar� la lista de departamentos que no tienen a ning�n trabajador asociado.
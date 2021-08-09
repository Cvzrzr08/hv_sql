------------------##############OPERADORES LÓGICOS
USE [A_BINARIO];
GO
------------------AND
--SELECT *
--FROM [dbo].[Employees] AS [e]
--WHERE [e].[employee_salary] >= 300 --buscando quienes ganar mayor o igual a 300
--AND [e].[employee_salary] <= 500 --y menor a 500
--AND [e].[departament_id] = 3 --Señalando solo departamento de producción
----AND [e].[employee_gender] = 0 --solo mujeres
--AND [e].[employee_gender] = 1 --solo hombres
--ORDER BY 
--[e].[employee_salary] ASC --ORDENANDOLO ASC

------------------OR
--SELECT 
--* 
--FROM [dbo].[Employees] AS E
--WHERE
--E.departament_id = 1  --SOLO PIDIENDO DEP 1 O 5 O 3, CUALQUIERA QUE LO CUMPLA
--OR E.departament_id = 5
--OR E.departament_id = 3
--ORDER BY
--E.departament_id ASC

------------------IN
--SELECT * 
--FROM [dbo].[Employees] AS E
--WHERE
--E.departament_id IN (1,3,5)  --SIMILAR AL OR PERO RESUMIDO
--ORDER BY
--E.departament_id ASC
						--SELECT * 
						--FROM[dbo].[Employees] AS E
						--WHERE 
						--E.employee_positionName IN ('Ayudante general','Supervisor')
						--ORDER BY 
						--E.employee_salary DESC

--------------------NOT IN
--SELECT * 
--FROM [dbo].[Employees] AS E
--WHERE
--E.departament_id NOT IN (1,2,5) --QUE MUESTRE TODOS EXCEPTO(1,2,5)
--ORDER BY 
--E.departament_id ASC
					
					--SELECT * 
					--FROM [dbo].[Employees] AS E
					--WHERE
					--E.employee_positionName  IN ('Supervisor','Ayudante general' ) --APARECERAN TODOS EXCEPTO()
					--ORDER BY 
					--E.departament_id ASC
					
					-----APLICANDO CONDICIONES CON ()
					--SELECT * FROM [dbo].[Employees] AS E
					--WHERE
					--(E.employee_salary <= 500
					--AND E.employee_gender = 1) --1ERA CONDICION A EVALUAR, SE RESPETA ()
					--OR
					----E.departament_id = 5 --DEBIDO AL OR ARROJARA RESULTADO
					--E.departament_id IN (4, 5) --QUE ESTEN DENTRO DE LOS DEP(), PUEDE QUE APAREZCA UNA MUJER DEBIDO AL USO DEL OR FUERA DEL PARENTECIS EN 1ERA CONDICION
					--ORDER BY 
					--E.employee_salary ASC
					--,E.departament_id DESC

-----------------------------------------BETWEEN
--SELECT * 
--FROM [dbo].[Employees] AS E
--WHERE
--E.employee_salary BETWEEN 500 AND 600  --CONDICIÓN, RANGO DE VALORES A DELIMITAR
----E.employee_salary >= 500 AND E.employee_salary <= 600 --MANERA LARGA DE BETWEEN
--	ORDER BY
--	E.employee_salary DESC

	--SELECT * FROM [dbo].[Employees] AS E
	--WHERE 
	--E.employee_birthday BETWEEN ('01-01-1990') AND ('12-31-1993')


-----------------------------------------------------------------------------LIKE
--SELECT * 
--FROM [dbo].[Employees] AS E
--WHERE 
--E.employee_lastname LIKE 'M%'  --FILTRO, PRIMERA LETRA DEL APELLIDO SEA 'M
--E.employee_lastname LIKE 'R%'  --QUE COMIENCEN CON R
--E.employee_lastname LIKE '%A' --FILTRO, ÚLTIMA LETRA DE APELLIDO SEA 'A
--E.employee_lastname LIKE '%RO'

--SELECT * FROM [dbo].[Employees] AS E
--WHERE
----E.employee_name LIKE '%A%' --FILTRAR TODOS LOS NOMBRES QUE ALMENOS TENGA UNA 'A
----E.employee_name LIKE '%U%' --NO IMPORTA LA POSICION
----E.employee_lastname LIKE '%_I_%' --QUE TENGA UN CARACTER O LETRA DE LADO A LADO 
----E.employee_lastname LIKE '%_I___%' --QUE TENGA ANTES 1, I , 2 CARACTERES A SU LADO
--E.employee_lastname LIKE '%__LI%'


--SELECT * FROM [dbo].[Employees] AS E
--WHERE 
----E.employee_lastname LIKE '[MR]%'  --FILTRAR APELLEDOS QUE ALMENOS TENGAN 'M O 'R  AL INICIO
----E.employee_lastname LIKE '%[OA]' --APELLIDOS QUE TERMINEN CON O Ó A
--E.employee_lastname LIKE '[A-J]%' --BUSQUEDA POR UN RANDO DE 'A HASTA 'J, AL INICIO DEL APELLIDO


																		--UPDATE [dbo].[Employees] SET [employee_lastname]='Savaleta'
																		--WHERE employee_id = 18
--SELECT * FROM [dbo].[Employees] AS E
--WHERE 
----E.employee_lastname LIKE '[zs]avaleta'  --Buscar apellido z(s)avaleta
--E.employee_lastname like '[zs]%'   --Fitrar quienes empiza con 's o 'z

--SELECT * FROM [dbo].[Employees] AS E
--WHERE	--Busqueda con negacion 
--E.employee_lastname LIKE '[^MLR]%' --Discriminar apellidos que comiencen con M, L y R

--SELECT * FROM [dbo].[Employees] AS E
--WHERE --Buscar apellidos que inicien con 'R y que perciban un salario menor a 500
--(E.employee_lastname LIKE 'R%' AND E.employee_salary < 500)
----OR
----E.employee_gender = 1
--	ORDER BY
--	E.employee_salary ASC
	

SELECT * FROM [dbo].[Employees] AS E
WHERE
E.departament_id IN
	(
	SELECT [departament_id]  --SUBCONSULTA DENTRO DE UNA CONSULTA
	FROM [dbo].[Departaments] AS D
	WHERE D.departament_name LIKE '%AS' --FILTRANDO SOLO LOS DEP QUE INICIEN CON 'AS
	)


------------------UNION ALL --Aparece todas las filas repetidas
------------------UNION		--Devuelve filas distintas o únicas (no repetidas)
------------------INTERSECT --Devuelve filas que en ambas consultas son devueltas
------------------EXCEPT	--Devuelve filas encontradas en el primer query y además descarta las filas encontradas en el segundo query o tercer query
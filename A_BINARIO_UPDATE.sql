USE [A_BINARIO]

------UPDATE [dbo].[Employees] SET [departament_id]=1 
------WHERE [employee_id] = 18

----UPDATE [dbo].[Employees] SET [departament_id]=5
----WHERE [employee_id]=11

----UPDATE [dbo].[Employees] SET 
----[departament_id]=3
----WHERE employee_id =17

----UPDATE [dbo].[Employees] 
----	SET [departament_id]=2
----	WHERE [employee_id]=3
--Update [dbo].[Employees]
--SET [departament_id]=4
--WHERE [employee_id]=9

--UPDATE [dbo].[Employees]
--SET [departament_id] = 5
--WHERE [employee_id] = 7

--INSERT INTO [dbo].[Employees]
--	(
--	[employee_name]
--	,[employee_lastname]
--	,[employee_birthday]
--	,[employee_gender]
--	,[employee_salary]
--	,[employee_positionName]
--	,[employee_createdDate]
--	,[departament_id]
--	)
--	VALUES
--	('Marisol', 'Perez', '1992-12-07', 0, 558.30, 'Gerente RH','2018-03-17',2)
--	--,('Luis', 'carranza', '1995-05-30', 1, 782, 'Comprador SR', '2021-05-05',5)
--	--,('Mariana', 'Carranza', '1993-07-15', 0, 750, 'Supervisor', '2021-05-05',3)
--	--,('Ismael', 'Perez', '1993-06-22', 1, 600, 'Supervisor de calidad', '2021-05-05',3)
--	--,('Miguel', 'Rios', '1996-02-10', 1, 350, 'Ayudante General', '2021-05-05',3)
--	;


---------------------------------------------------------OPERADOR	AND
--SELECT * 

--FROM [dbo].[Employees] AS [e]
--	WHERE 
--	[e].[employee_salary] >=300
--	AND [e].[employee_salary] <= 500
--	AND [e].[departament_id] = 3   --CREITERIO DEPARTAMENTO DE PRODUCCIÓN
--	--AND [e].[employee_gender] = 0 --CRITERIO: MUJERES
--	AND [e].[employee_gender] = 1 --SOLO HOMBRE
--	ORDER BY
--		[e].[employee_salary] ASC

---------------------------------------------------------OPERADOR	OR
--SELECT * 
--FROM 
--	[dbo].[Employees] AS [e]
--WHERE
--	[e].[departament_id]=1
--	OR	[e].[departament_id]=5
--	OR	[e].[departament_id]=3
--	ORDER BY
--	[e].[employee_salary] DESC
							-----PASANDO LO ANTERIOR EN UN OPERADOR 'IN
							--SELECT * 
							--FROM [dbo].[Employees] AS [e]
							--WHERE
							--[e].[departament_id] IN (1,5,3) --MOSTRANDO A PERSONAS QUE PERTENEZCAN A 1,5,3 
							--ORDER BY
							--[e].[employee_salary] ASC

							--SELECT * 
							--FROM [dbo].[Employees] AS [e]
							--WHERE
							--[e].[departament_id] NOT IN (1,5,3) --MOSTRANDO TODO EXCEPTO 1,5,3
							--ORDER BY
							--[e].[employee_salary] ASC

--SELECT * 
--FROM [dbo].[Employees] AS [E]
--WHERE
----[E].[employee_positionName] IN ('Supervisor','Auyudante general') --QUE LA CONSULTA SOLO LOS INCLUYA
--[E].[employee_positionName] NOT IN ('Supervisor','Auyudante general') --QUE LA CONSULTA NO LOS INCLUYA
--ORDER BY 
--[E].[employee_salary] DESC

---------------------------------------------------------APLICANDO AND, OR -: APLICAN LA LEYES DE LOS PARENTESIS


SELECT * 
FROM [dbo].[Employees] AS [E]
WHERE
	(
	[E].[employee_salary] <=500
	AND [E].[employee_gender] = 1
	)
	OR
	[E].[departament_id] IN (4,5)
ORDER BY 
[E].[departament_id] ASC
,[E].[employee_salary]

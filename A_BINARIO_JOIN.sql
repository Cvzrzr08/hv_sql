USE A_BINARIO

--CREATE TABLE [dbo].[Employees]
--	(
--	[employee_id]			INT				NOT NULL			IDENTITY(1,1)			PRIMARY KEY
--	,[employee_name]		VARCHAR(100)	NOT NULL
--	,[departamento_id]		int				NULL
--	);

--CREATE TABLE [dbo].[Departaments]
--	(
--	[departament_id]		INT				NOT NULL			IDENTITY(1,1)			PRIMARY KEY
--	,[departament_name]		VARCHAR(100)	NULL
--	);

--INSERT INTO [dbo].[Employees]
--	(
--	[employee_name]
--	,[departamento_id]
--	)
--	VALUES
--	('Axel Romero',1)
--	,('Roberto Mujica',1)
--	,('Alondra Rosas',2)
--	,('Rodrigo Lara',3)
--	,('Monica Galindo',4)
--	,('Rosario Galicia',NULL)
--	,('Fernando Roa',6)
--	,('Paola Leon',NULL);

--INSERT INTO [dbo].[Departaments]
--([departament_name])
--	VALUES
--	('Sistemas')
--	,('Recurso Humanos')
--	,('Producción')
--	,('Ventas')
--	,('Compras');

SELECT * FROM [dbo].[Departaments]
SELECT * FROM [dbo].[Employees]

--INNER JOIN

	--SELECT [e].[employee_name], [d].[departament_name]
	--FROM [dbo].[Employees] AS [e]
	--INNER JOIN [dbo].[Departaments] AS [d]
	--ON [e].[departamento_id] = [d].[departament_id]

	----LEF JOIN --muestra hasta los null
	--SELECT [e].[employee_name], [d].[departament_name]
	--FROM [dbo].[Employees] AS [e]
	--LEFT JOIN [dbo].[Departaments] as [d]
	--ON [e].[departamento_id] = [d].[departament_id]

	--RIGHT JOIN --muestra null del apartado departaments -ya que no hay nadien en ese dep.
	--SELECT [e].[employee_name], [d].[departament_name]
	--FROM [dbo].[Employees] AS [e]
	--RIGHT JOIN [dbo].[Departaments] AS [d]
	--ON [e].[departamento_id] = [d].[departament_id]

--Mostrado todas la relaciones --FULL JOIN OUTER JOIN
--SELECT [e].[employee_name], [b].[departament_name]
--FROM [dbo].[Employees] AS [e]
--FULL OUTER JOIN [dbo].[Departaments] AS [d]
--ON [e].[employee_id] = [d].[departament_id]

--CONDICIONADO LEFT Y RAGHT JOIN CON NULL
SELECT [e].[employee_name], [d].[departament_name] 
FROM [dbo].[Employees] AS [e]
LEFT JOIN [dbo].[Departaments] AS [d]
	ON [e].[departamento_id] = [d].[departament_id]
	WHERE
		[d].[departament_id] IS NULL;  --MUESTRA QUIENES NO TIENEN DEPARTAMENTO ASIGNADO
	
SELECT [e].[employee_name], [d].[departament_name] 
FROM [dbo].[Employees] AS [e]
LEFT JOIN [dbo].[Departaments] AS [d]
	ON [e].[departamento_id] = [d].[departament_id]
	WHERE
		[d].[departament_id] IS NOT NULL; --VISUALIZANDO QUIENES SI TIENEN DEPARTAMENTO
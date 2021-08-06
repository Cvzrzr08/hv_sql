USE [A_BINARIO]
--DROP TABLE [dbo].[Employees]

--CREATE TABLE [dbo].[Employees]
--	(
--	[employee_id]				INT				NOT NULL		IDENTITY(1,1)			PRIMARY KEY
--	,[employee_name]			VARCHAR(100)	NOT NULL		
--	,[employee_lastname]			VARCHAR(100)	NOT NULL
--	,[employee_birthday]			DATE			NULL
--	,[employee_gender]				BIT				NOT NULL
--	,[employee_salary]			DECIMAL(18,2)	NOT NULL
--	,[employee_positionName]		VARCHAR(100)	NOT NULL
--	,[employee_createdDate]		DATE			NOT NULL		DEFAULT				GETDATE()
--	,[departament_id]			INT				NOT NULL		
--	);

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
--	('Axwel', 'Romero', '1990-03-22', 1, 550.20, 'Programador Sr.', '2020-10-01', 1)
--	,('Roberto', 'Mujica', '1995-03-22', 1, 250, 'Analista', '2019-05-05', 1)
--	,('Alondra', 'Rosas', '1985-05-20', 0, 400, 'Generalista', '2018-11-01', 2)
--	,('Rodrigo', 'Lara', '1995-05-20', 1, 355, 'Supervisor', '2020-01-01', 3)
--	,('Monica', 'Galindo', '1996-02-05', 0, 211, 'Ventas Mayoreo', '2020-03-03', 4)
--	,('Rosario', 'Galicia', '1994-01-21', 0, 211, 'Ventas Autoservicio', '2020-03-03', 4)
--	,('Fernando', 'Roa', '1998-01-29', 1, 750, 'Gerente de compras', '2017-06-18', 5)
--	,('Paola', 'Leon', '1993-09-12',1 , 433.50, 'Ventas menudeo', '2021-01-12', 4)
--	,('Diago', 'Zavaleta', '1991-11-12', 1, 558.30, 'Gerente de RHH', '2018-03-17', 2)
--	;

------------------------ORDER BY

--SELECT 
--[e].[employee_name]
--,[e].[employee_lastname]
--,[e].[employee_positionName]
--,[e].[employee_salary]
--,[e].[employee_createdDate]
----,[e].[departament_id]
--,[d].[departament_name]

--FROM [dbo].[Employees] AS [e]
--INNER JOIN [dbo].[Departaments] AS d
-- ON [E].[departament_id] = [d].[departament_id]
--	ORDER BY
--	--[e].[employee_name] ASC  --PRIORIDAD DEL ORDEN EN SENTIDO ASCENDENTE
--	--[e].[employee_name] DESC		--DE FORMA DESCENDENTE
	
--	--[e].[employee_salary] ASC--APLICANDO DOS CRITERIOS PARA EL ORDER BY  1.SALARIO 2.FECHA DE INGRESO
--	--,[e].[employee_createdDate] ASC
--	[d].[departament_name] DESC

--SELECT * FROM [dbo].[Departaments]


------------------------CONCATENACIÓN

--SELECT 
--[e].[employee_name]
--,[e].[employee_lastname]
--,[e].[employee_name] + N' ' + [e].[employee_lastname]			AS [employee_fullName]
--,CONCAT([e].[employee_lastname], N' ' ,[e].[employee_name])		AS [employee_fullName2]
--,[e].[employee_positionName]
--,[e].[employee_salary]
--,[e].[employee_createdDate]
--,[d].[departament_name]

--,[d].[departament_name] 
--+ '/' + CAST([e].[employee_salary] AS NVARCHAR(100)) --FORZANDO CONVERSION DE DEC A STRING PARA PODER CONCATENAR4
--+ '/' + [e].[employee_positionName]								AS  [employee_fullInfo]

--FROM [dbo].[Employees] AS [e]
--INNER JOIN [dbo].[Departaments] AS d
-- ON [E].[departament_id] = [d].[departament_id]
--	ORDER BY
--	[d].[departament_name] DESC

--------------------------------------------------------- SELECT TOP
--SELECT TOP(3)* FROM [dbo].[Employees] AS [e]
--ORDER BY 
--[e].[employee_createdDate] ASC    --PRESENTANDO LOS PRIMEROS 3 EMPLEADOS DE LA COMPAÑIA
--[e].[employee_createdDate] DESC

--SELECT
--	TOP 25 PERCENT*    --REDONDEA Y MUESTRA 3 REGISTRO 
--FROM [dbo].[Employees] AS [e]
--ORDER BY 
----[e].[employee_createdDate] ASC    --PRESENTANDO LOS PRIMEROS 3 EMPLEADOS DE LA COMPAÑIA
--[e].[employee_createdDate] DESC


---------------------------------------------------DISTINCT

SELECT 
	DISTINCT [e].[employee_salary] --MOSTRANDO LOS DIVERSOS SALARIOS QUE SE OTORGAN(MO REPETICIONES)
FROM [dbo].[Employees] AS [e]
GO
SELECT * FROM [dbo].[Employees];


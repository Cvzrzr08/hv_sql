--CREATE DATABASE HV_NITE;
----DROP DATABASE hv_nite

--USE HV_NITE;
--CREATE TABLE [dbo].[User]
--(
--	[UserID]			INT				IDENTITY(1,1)		PRIMARY KEY
--	,[UserName]			VARCHAR(50)		NOT NULL
--	,[UserLastName]		VARCHAR(50)		NOT NULL
--	,[UserMiddleName]	VARCHAR(50)		NULL
--	,[UserEmail]		VARCHAR(100)	NULL
--	,[UserAddres]		VARCHAR(100)	NULL
--	,[UserBirthDate]	DATE			NULL
--	--CREANDO UNA REGLA, [NAME/RULE]
--	,CONSTRAINT[UserBithDateGreater] CHECK ([UserBirthDate] >= '01/01/1990')

--);

--SELECT 
--* 
--FROM 
--	[dbo].[User];

--INSERT INTO [dbo].[User]
--	(
--		[UserName]
--		,[UserLastName]
--		,[UserMiddleName]
--		,[UserEmail]
--		,[UserAddres]
--		,[UserBirthDate])
--VALUES
--	(
--	'Ricardo '
--	,'Piña'
--	,NULL
--	,'pina@gmail.com'
--	,Null
--	,'01/01/1995'
--	);

--SELECT * FROM [dbo].[User]
--go


--use AdvenchureWorks
--SELECT 
--	[poh].[OrderDate]
--	,[poh].[ShipDate]
--	,[poh].[TotalDue]
--FROM 
--	[Purchasing].[PurchaseOrderHeader] as [poh];


--use AdvenchureWorks --1. ejecutando relaciones, quién entregará, quién levanto la compra FK's
--SELECT
--	*
--	FROM
--	[Purchasing].[Vendor]  ---principio

--use AdvenchureWorks --2. Join
--SELECT
--	[v].[Name] --3. descubriendo el nombre del provedor
--	,[poh].[OrderDate]
--	,[poh].[ShipDate]
--	,[poh].[TotalDue]
--FROM 
--	[Purchasing].[PurchaseOrderHeader] as [poh]
--	Inner Join 	[Purchasing].[Vendor] as [v] --info,Provedor
--				--Apoyo
--				----SELECT * FROM [Purchasing].[Vendor]  ---info provedor
--				----SELECT * FROM [Purchasing].[PurchaseOrderHeader] --info ordenes
--	ON	[poh].[VendorID] = [v].[BusinessEntityID]	;--MAIN

--use AdvenchureWorks --2. Join
--SELECT
--	--3. descubriendo el nombre del provedor
--	[v].[Name] as 'Nombre del provedor'
--	,[poh].[OrderDate] as 'Fecha de orden de compra' --4.Rotulando columnas, no afecta a 'db
--	,[poh].[ShipDate] as 'Fecha de envio'
--	,[poh].[TotalDue] as 'Total'
--FROM 
--	[Purchasing].[PurchaseOrderHeader] as [poh]
--	Inner Join 	[Purchasing].[Vendor] as [v] --info,Provedor
--				--Apoyo
--				----SELECT * FROM [Purchasing].[Vendor]  ---info provedor
--				----SELECT * FROM [Purchasing].[PurchaseOrderHeader] --info ordenes
--	ON	[poh].[VendorID] = [v].[BusinessEntityID];


	--Checando Usuario quien levanto orden [5]
--SELECT * FROM [HumanResources].[Employee]

USE AdvenchureWorks --2. Join
SELECT
	--3. descubriendo el nombre del provedor
	[v].[Name]			AS 'Nombre del provedor'
	,[poh].[OrderDate]	AS 'Fecha de orden de compra' --4.Rotulando columnas, no afecta a 'db
	,[poh].[ShipDate]	AS 'Fecha de envio'
	,[poh].[TotalDue]	AS 'Total'
	,[e].[LoginID]		AS 'Total' --5.1
	,[e].[JobTitle] --5.2++
FROM 
	[Purchasing].[PurchaseOrderHeader] AS [poh]
	Inner Join 	[Purchasing].[Vendor] AS [v] --info,Provedor
				--Apoyo
				----SELECT * FROM [Purchasing].[Vendor]  ---info provedor
				----SELECT * FROM [Purchasing].[PurchaseOrderHeader] --info ordenes
		ON	[poh].[VendorID] = [v].[BusinessEntityID]
		INNER JOIN	[HumanResources].[Employee] AS [e]
			ON [e].[BusinessEntityID] = [poh].[EmployeeID] --5
--Aplicando condición[6]
WHERE
	[poh].[TotalDue] >= 1000000;  --Buscando compra mayor a 'x


--Asignando permisos para poder manipular los diagramas[Database Diagrams], ya que estamos en un ambiente local
ALTER AUTHORIZATION ON DATABASE::AdvenchureWorks TO sa

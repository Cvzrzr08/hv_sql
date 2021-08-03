----CREATE DATABASE HV_BIN
	--CREAR BASE DE DATOS

--DROP DATABASE [hv_Binario1];
--ALTER DATABASE [HV_BIN] MODIFY NAME =  H_BINARIO;
--ALTER DATABASE [H_BINARIO] MODIFY NAME = A_BINARIO

-----INSERT 
	--CREAR TABLAS
--USE [A_BINARIO]
--CREATE TABLE [dbo].[Orders]
--(
--order_id			INT			NOT NULL			IDENTITY(1,1)			PRIMARY KEY
--,order_number		INT			NOT NULL			
--,order_date			DATETIME	NOT NULL
--,order_status		INT			NOT NULL
--);

--CREATE TABLE [dbo].[Products]
--(
--product_id			INT			NOT NULL			IDENTITY(1,1)			PRIMARY KEY
--,product_code		VARCHAR(10)	NOT NULL			
--,product_description	varchar(100)
--);


--use [A_BINARIO];
----drop table [dbo].[OrderDetai]

--CREATE TABLE [dbo].[OrderDetails]
--(
--orderDetail_id				INT				NOT NULL			IDENTITY(1,1)	PRIMARY KEY
--,order_id					INT				NOT NULL	--FK
--,orderDetail_number			INT				NOT NULL
--,product_id					INT				NOT NULL	--FK
--,orderDetail_quantity		DECIMAL(18,2)	NOT NULL
--,orderDetail_price			DECIMAL(18,2)	NOT NULL
--,measure_id					INT				NOT NULL	--FK
--,notes						VARCHAR(MAX)	NULL

----INDICANDO LAS RELACIONES
--,CONSTRAINT					FK_Orders		FOREIGN KEY (order_id)		REFERENCES [dbo].[Orders]([order_id])
--,CONSTRAINT					FK_Products		FOREIGN KEY (product_id)	REFERENCES [dbo].[Products]([product_id])
--,CONSTRAINT					FK_Measures		FOREIGN KEY (measure_id)	REFERENCES [dbo].[Measures]([measure_id])
--);



--Modificando
--USE A_BINARIO;
--ALTER TABLE [dbo].[OrderDetails]
--	ADD PRIMARY KEY([orderDetail_id])

--ALTER TABLE [dbo].[OrderDetails]
--	ADD IDENTITY(1,1)

						----renombrando tabla
						--EXEC sp_rename 'OrderDetails','OrderDetailsX'
						--EXEC sp_rename '[dbo].[OrderDetailsX]','[dbo].[OrderDetails]' 
						--EXEC sp_rename '[dbo].[[dbo]].[OrderDetails]]]','OrderDetails'
						
----AGREGANDO COLUMNA EN TABLA
--ALTER TABLE [dbo].[OrderDetails]
--	ADD [STATUS] INT 
--	--ELIMINANDO MISMA COLUMNA
--	ALTER TABLE [dbo].[OrderDetails]
--	DROP COLUMN [STATUS];   --[] AYUDA A EVADIR PALABRA RESERVADAS POR SQL


--INSERT
	--RELLENANDO LOS CATALOGOS
--INSERT INTO [dbo].[Measures]
--	(
--	[measure_code]
--	,[measure_description]
--	)
--VALUES 
--	(
--	'Pz'
--	,'Pieza'
--	);
		----insertando varios a la vez
		--INSERT INTO [dbo].[Measures]
		--	(
		--	[measure_code]
		--	,[measure_description]
		--	)
		--VALUES 
		--	('H87','Pieza')
		--	,('EA','Elemento')
		--	,('Kg','Kilogramo')
		--	,('LT','Litro');

--INSERT INTO [dbo].[Products]
--	(
--	[product_code]
--	,[product_description]
--	)
--VALUES
--	('LPR', 'Libreta profecional con rayas')
--	,('LCP', 'Libreta profecional a cuadros')
--	,('GM', 'Goma bicolor azul-rojo')
--	,('LPP', 'Lapiz profecional de puntillas')
--	,('HBC', 'Hoja blanca tamaño carta');

--INSERT INTO [dbo].[Orders]
--	(
--	[order_number]
--	,[order_date]
--	,[order_status]
--	)
--	VALUES
--	(
--	1000
--	,GETDATE() --FECHA EN QUE SE REGISTRARA
--	,1);

--INSERT INTO [dbo].[OrderDetails]
--	(
--	[order_id]
--	,[orderDetail_number]
--	,[product_id]
--	,[orderDetail_quantity]
--	,[orderDetail_price]
--	,[measure_id]
--	)
--	VALUES
--		(1,1,1,10,40,1)
--		,(1,2,3,10,10,1)
--		,(1,3,4,10,25,1)
--		,(1,4,5,10,1,1);
						----PARA SAVER EL CONSECUTIVO DEFINIDO POR EL IDENTITY(1,1). AL INSERTA OTRA ORDEN [dbo].[Orders]
						--INSERT INTO [dbo].[Orders]
						--(
						--[order_number]
						--,[order_date]
						--,[order_status])
						--OUTPUT INSERTED.order_id --IMPRIMIENDO EL CONSECUTIVO EN CONSOLA
						--	VALUES
						--	(
						--	1002
						--	,GETDATE()
						--	,1);
--INSERT INTO [dbo].[OrderDetails]
--	(
--	[order_id]
--	,[orderDetail_number]
--	,[product_id]
--	,[orderDetail_quantity]
--	,[orderDetail_price]
--	,[measure_id]
--	,[notes]
--	)
--	VALUES
--		(2,1,2,5,40,1, 'prueba de que es una nota')
--		,(2,2,3,2,10,1, null);

----SELECT
--SELECT * FROM [dbo].[Orders];
--SELECT * FROM [dbo].[OrderDetails];
--SELECT * FROM [dbo].[Products];
--SELECT * FROM [dbo].[Measures];

	--SELECT * FROM [A_BINARIO].[dbo].[Orders]  --SIENDO MÁS ESPECIFICOS
	--WHERE order_id=1;						--Busqueda por PK, recomendable
	----WHERE order_number=1002;
	
	--	SELECT * FROM [dbo].[OrderDetails]
	--	WHERE order_id=1;

	--	SELECT * FROM [dbo].[Products]
	--	WHERE product_id=3;

--SELECT * FROM [dbo].[OrderDetails]   --SELECCIONANDO SOLO 3 CAMPOS EN ESPECIFICO
--SELECT [orderDetail_number], [orderDetail_quantity], [orderDetail_price] FROM [dbo].[OrderDetails]
	--SELECT [orderDetail_number], [orderDetail_quantity], [orderDetail_price] 
	--FROM [dbo].[OrderDetails]
	--		--WHERE orderDetail_price >= 25;  --mayor que 
	--		WHERE [orderDetail_price] < 25;		--menor que


--SELECT * FROM [dbo].[Orders]
--USE A_BINARIO;
--SELECT 
--	[o].order_number
--	,[o].order_date
--	--,[od].*				--imprimiendo todo los campos de [OrderDetails] /ORDEN EN QUE IMPRIMIRA EL RESULTADO DE LA CONSULTA
--	,[od].[orderDetail_number]
--	,[od].[orderDetail_quantity]
--	,[od].[orderDetail_price]
--	,[p].[product_description]
--	,[m].[measure_description]
--FROM 
--	[dbo].[Orders] AS [o]
--		INNER JOIN [dbo].[OrderDetails] AS [od]
--		ON [o].[order_id] = [od].[order_id]
--		INNER JOIN [dbo].[Products] AS [p]	--AVERIGUANDO QUE PRODUCTOS LLEVA PK->FK
--		ON [od].[product_id] = [p].[product_id]
--		INNER JOIN [dbo].[Measures] AS [m]	--Añadiendo unidad de medida PK->FK
--		ON [od].[measure_id] = [m].[measure_id]
--WHERE
--[o].[order_id]=1;



--------------------------------------UPDATE
--SELECT * FROM [dbo].[Products]
--WHERE product_id=4; --IMPRIMIENDO LAÍZ
----WHERE product_id=1 --IMPRIMIENDO LIBRETA DE RALLAS
--	--ACTUALIZANDO UN REGISTRO EN ESPECIFICO
--		UPDATE [dbo].[Products]
--			SET [product_description] = 'Lapiz de puntillas finas'
--			WHERE product_id=4; --producto que afectará

		--UPDATE MASIVO
		--SELECT * FROM [dbo].[OrderDetails]
		
		--UPDATE [dbo].[OrderDetails] --DE ESTA SECCION ACTUALIZARA 
		--	SET [orderDetail_price]=5 --TODA LA COLUMNA DE OrderDetailPrice
		
		--UPDATE [dbo].[OrderDetails]
		--	SET [orderDetail_price]=99.99
		--	WHERE product_id=4
		
		--UPDATE [dbo].[OrderDetails]
		--	SET [orderDetail_quantity]=33
		--	WHERE order_id=2

--SELECT * FROM  [dbo].[Orders]

--UPDATE [dbo].[Orders]
--	SET [order_date]=GETDATE()
--	WHERE order_id=2;


--UPDATE [dbo].[Orders]
--	SET [order_number]=1001
--	WHERE order_id=1


------------DELETE
--SELECT * FROM	[dbo].[Measures] --IDENTIFICANDO
--WHERE measure_id=1002
--	DELETE FROM [dbo].[Measures] --BORRANDO REGISTRO
--	WHERE [measure_id]=5

--DELETE FROM [dbo].[Measures]
--WHERE [measure_code] = 'kGz'

--	DELETE FROM [dbo].[Measures]
--	WHERE [measure_id]=1003

--DELETE FROM [dbo].[Measures]
--WHERE measure_id=1 --no puede eliminar(conflicto), ya que tiene información ligada a otras tablas

--TRATANDO DE ELIMINAR ORDEN CON REFERENCIAS ()
SELECT * FROM [dbo].[Orders]
WHERE order_id=2

SELECT * FROM [dbo].[OrderDetails]
WHERE order_id=2
	
	DELETE  FROM [dbo].[Orders] --CONFLICTO DE REFERENCIA
	WHERE order_id=2

--EVITANDO CONFLICTO 
--PARA ELLO ELIMINAMOS EN DONDE ESTAN REFERENCIADAS
DELETE FROM [dbo].[OrderDetails]
WHERE order_id=2
	--SEGUIDO ELIMINANDO LA ORDEN DE RAIZ
	DELETE FROM [dbo].[Orders]
	WHERE order_id=2
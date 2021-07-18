--CREATE DATABASE hv_Binario1


USE hv_Binario1;	

	--ALUSIVO A QUE ES UN OBJETO (dbo)	
CREATE TABLE [dbo].[Orders]
(--nombre/campoo    TIPO	No permite vacio	AUTONUMERICO(1,1)	JAMAS SE REPETIRÁ(LLAVE PRIMARIA)
order_id				INT			NOT NULL		IDENTITY(1,1)			PRIMARY KEY
,order_number			INT			NOT NULL		
,order_date				DATETIME
,order_status			INT
);
GO
CREATE TABLE [dbo].[Products]
(																						
product_id				INT				NOT NULL		IDENTITY(1,1)			PRIMARY KEY
,product_code			VARCHAR(10)		NOT NULL
,product_description	VARCHAR(100)	NOT NULL		
);

CREATE TABLE [dbo].[OrderDetails]
(
orderDetail_id			INT				NOT NULL		IDENTITY(1,1)			PRIMARY KEY
,order_id				INT				NOT NULL
,orderDetail_number		INT				NOT NULL
,product_id				INT				NOT NULL
,orderDetail_quatity	DECIMAL(18,2)	NOT NULL
,orderDetail_price		DECIMAL(18,2)	NOT NULL
,measure_id				INT				NOT NULL
,notes					VARCHAR(MAX)	 NULL --si acepta campo vacio
--DEF DE LAS LLAVES FORANEAS		.union			--tabla/referencia-campo	
,CONSTRAINT	fk_Orders	FOREIGN KEY	(order_id)		REFERENCES Orders(order_id)
,CONSTRAINT fk_Products FOREIGN KEY (product_id)	REFERENCES Products(product_id)
,CONSTRAINT fk_Meassure FOREIGN KEY (measure_id)	REFERENCES Meassures(meassure_id)
);

---test renombrar tabla 
EXEC sp_rename 'Orders', 'Orders2'
-----test añadir columna
ALTER TABLE [dbo].[Orders2]
ADD order_test VARCHAR(1) NULL
------test borar columna
ALTER TABLE [dbo].[Orders2]
DROP COLUMN order_test;











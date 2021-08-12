USE Northwind
GO
-- -- ---------------------------------------------------------------EJERCICIO 1. TOP 10 DE LOS  'PRODUCTOS COMPRADOS, ORDENAR ASCENDENTEMENTE POR UNIDADES VENDIDAS                                                               

-- SELECT 
-- TOP(10)
-- OD.[ProductID]
-- ,sum(OD.[Quantity]) AS [Units Sold]
-- FROM [dbo].[Order Details] AS OD
-- GROUP BY
-- OD.ProductID
-- ORDER BY
-- [Units Sold] desc

--         SELECT 
--         TOP(10)
--         -- OD.[ProductID]
--         P.[ProductName] --RESULTADO DE LA UNION, RECORDAR EL GROUP BY
--         ,sum(OD.[Quantity]) AS [Units Sold]
--         FROM [dbo].[Order Details] AS OD
--             INNER JOIN [dbo].[Products] AS P
--             ON OD.ProductID = P.ProductID
--         GROUP BY
--         -- OD.ProductID
--         P.ProductName
--         ORDER BY
--         [Units Sold] desc

---------------------------------------------------------------------------------------EJERCICIO 2. 
-- ENCONTRAR EL 'PRODUCTO QUE TENGA EL PRECIO MÁS ALTO EN LA COMPAÑIA
-- USE Northwind;
-- GO                                                               
-- -- Select rows from a Table or View '[Products]' in schema '[dbo]'
-- SELECT TOP(2)
-- P.ProductID
-- ,P.ProductName
-- ,P.UnitPrice
-- FROM [dbo].[Products] AS P
-- ORDER BY
-- UnitPrice DESC

---------------------------------------------------------------------------------------EJERCICIO 3
-- CREAR UN RANK DE LOS PRODUCTOS MÁS VENDIDOS ORDENADOS POR CIUDAD Y CANTIDAD EN USA

-- SELECT 
-- C.City
-- ,OD.[Quantity]
-- ,P.ProductName

-- FROM [dbo].[Customers] AS C
-- INNER JOIN [dbo].[Orders] AS O
--     ON C.CustomerID = O.CustomerID
--     INNER JOIN [Order Details] AS OD
--     ON OD.OrderID = O.OrderID
--         INNER JOIN [dbo].[Products] AS P
--         ON P.ProductID = OD.ProductID
-- WHERE
-- [Country] = 'USA'
-- ORDER BY Quantity DESC

        -- SELECT 
        -- C.City
        -- ,OD.[Quantity]
        -- ,P.ProductName          --PARTICIONANDO EL RANK POR CITY Y ORDENANDO POR CANTIDADES DE LOS PRODUCTOS MÁS VENDIDOS
        --     ,DENSE_RANK () OVER (PARTITION BY C.City ORDER BY OD.Quantity DESC) AS RANK --FX(RANK)

        -- FROM [dbo].[Customers] AS C
        -- INNER JOIN [dbo].[Orders] AS O
        --     ON C.CustomerID = O.CustomerID
        --     INNER JOIN [Order Details] AS OD
        --     ON OD.OrderID = O.OrderID
        --         INNER JOIN [dbo].[Products] AS P
        --         ON P.ProductID = OD.ProductID
        -- WHERE
        -- [Country] = 'USA'
        -- -- AND C.City = 'Boise' --QUITA SENTIDO AL PARTITION BY CITY
        -- ORDER BY 
        -- -- C.City DESC
        -- RANK ---MUESTRA RANK POR CIUDAD
        

---------------------------------------------------------------------------------------EJERCICIO 4
-- Encontrar las 'ordenes que tardaron más de 2 dias en entregar despues de ser realizadas por el 'usuario, donde el valor sea mayor a 10000
-- Mostrar número  de dias, fecha de la orden , CustomerID y el pais de envio

-- -- Select rows from a Table or View '[dbo].[Orders]' in schema '[dbo]'
-- SELECT  
-- O.OrderID
-- ,O.CustomerID
-- ,O.OrderDate
-- ,O.ShippedDate
-- ,O.ShipCountry
-- -- calculado la diferencia de dias
--                 --Fx(ESCANEAR DIAS, MOTH, AGE) --COMPARANDO 2 VAR    
-- ,DATEDIFF(DAY, [OrderDate],[ShippedDate]) AS Duration_to_ship
-- ,SUM(OD.Quantity*OD.UnitPrice) AS [Total Sale Amount]
-- FROM [dbo].[Orders] AS O
-- INNER JOIN [Order Details] AS OD 
--         ON OD.OrderID= O.OrderID
-- WHERE 
-- DATEDIFF(DAY, [OrderDate],[ShippedDate]) > 2 --CONDICIONANDO LAS VISTAS DE LA DEFERENCIA DE DIAS

-- GROUP BY --necesario para la agrupacion de las 'SUM
--         O.OrderID
--         ,O.CustomerID
--         ,O.OrderDate
--         ,O.ShippedDate  
--         ,O.ShipCountry
--         -- ORDER BY 
--         -- Duration_to_ship DESC

-- HAVING SUM(OD.Quantity*OD.UnitPrice) > 10000
-- ORDER BY 
-- Duration_to_ship ASC
-- ,ShipCountry 

-- SELECT                  -- para sacar la dif de dias    --visualizar pais en que se envio.................................................
-- o.OrderID, CustomerID, o.OrderDate, o.ShippedDate, o.ShipCountry
-- ,DATEDIFF(DAY, OrderDate, ShippedDate) as Duration_to_ship
-- FROM Orders as o
-- INNER JOIN [Order Details] as od
--         ON od.OrderID = o.OrderID
-- --dif de dias


                        -- SELECT 
                        -- o.OrderID , o.CustomerID , o.OrderDate, o.ShippedDate, o.ShipCountry
                        -- -- ,od.UnitPrice, od.Quantity
                        -- --caldulando la dif de dias ordenes y entregas
                        -- -- ,DATEDIFF(DAY, o.ShippedDate, o.OrderDate) as DarationToShip
                        -- ,DATEDIFF(DAY, o.OrderDate, o.ShippedDate) as DarationToShip2
                        -- --multiplicando cantidades por precios para ver que sea mayor a 10k..................................................................
                        --         ,SUM(od.Quantity * od.UnitPrice) as TotalSellAmound
                        
                        -- from Orders as o
                        -- INNER JOIN [dbo].[Order Details] as od
                        --         ON od.OrderID = o.OrderID
                        -- WHERE
                        -- DATEDIFF(DAY, o.OrderDate, o.ShippedDate) > 2
                        -- GROUP BY
                        -- o.OrderID , o.CustomerID , o.OrderDate, o.ShippedDate, o.ShipCountry
                        -- order BY DarationToShip2 ASC ---mostrando resultados mayores a 2 dias
                                
                        
--------------mostrando que sea moyor a 10k
select 
o.OrderID
,o.CustomerID
,o.OrderDate
,o.ShippedDate
,o.ShipCountry 

,DATEDIFF(DAY, o.OrderDate, o.ShippedDate) as DurationToShip
,SUM([Quantity]*[UnitPrice]) as TotalSellAmoun




from Orders as o
INNER JOIN [Order Details] as od
        ON o.OrderID = od.OrderID

WHERE
DATEDIFF(DAY, o.OrderDate, o.ShippedDate) > 2

GROUP BY
o.OrderID
,o.CustomerID
,o.OrderDate
,o.ShippedDate
,o.ShipCountry 

HAVING SUM([Quantity]*[UnitPrice]) > 10000 -------------------------mostrando mayor a 10k

        ORDER BY
        DurationToShip asc

--1ero crear la db
--create database testJoin  


go
	Use testJoin
go

--2do generar las tablas
CREATE TABLE Departamentos
(
	Id int,
	Nombre varchar(20)
);

CREATE TABLE Empleados
(
	Nombre varchar(20),
	DepartameentoId int
); 

---Agregando datos a las tablas
INSERT INTO Departamentos VALUES(31,'Sales');
INSERT INTO Departamentos VALUES(33,'Engenieering');
INSERT INTO Departamentos VALUES(35,'Clerical');
INSERT INTO Departamentos VALUES(35,'MARKETING');

INSERT INTO Empleados VALUES('Rafferty', 31);
INSERT INTO Empleados VALUES('jones',33);
INSERT INTO Empleados VALUES('heisenberg',33);
INSERT INTO Empleados VALUES('robinson',34);
INSERT INTO Empleados VALUES('Smith', 33);
INSERT INTO Empleados VALUES('Wiliians',null);

--Visualizando tablas
SELECT * FROM Departamentos
SELECT * FROM Empleados
/*
DROP TABLE Departamentos
DROP TABLE EMPLEADOS
*/
															
--3ro principio básico del inner join: tabla1 join tabla2 on tabla1.id = tabla2.id
SELECT * 
				--ligandolo a 'E, para uso agil, mismo caso en Departamentos 'D}
FROM Empleados E
JOIN Departamentos D 
--punto de ligue =
ON E.DepartameentoId = D.Id


---4to siendo mas especificos(proyectar 2 columnas -con un alias)
select 
E.Nombre as 'Empleado',
D.Nombre as 'Departamento'
FROM Empleados E
JOIN Departamentos D
ON E.DepartameentoId = D.Id

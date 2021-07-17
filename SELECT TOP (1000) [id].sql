SELECT TOP (1000) [id]
      ,[firtName]
      ,[lastName]
      ,[birtDay]
  FROM [tutorial].[dbo].[hb_table2]

  CREATE TABLE tr1 (
      id int IDENTITY, --autoincremental
      nombre VARCHAR(50),
      correo VARCHAR(50),
      edad SMALLINT
  );

  INSERT into tr1(nombre,correo,edad)
  VALUES('karen', 'kara@gmail.com', 10);

  select * from tr1
  UPDATE tr1 set edad = 28 WHERE id = 2
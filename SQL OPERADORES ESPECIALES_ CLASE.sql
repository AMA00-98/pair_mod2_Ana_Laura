
-- SQL OPERADORES ESPECIALES DE FILTRO


USE tienda

-- nos da dos tablas temporales para separar los resultados de oficinas y clientes
SELECT country, "cliente" AS relacion
	FROM customers
UNION ALL
SELECT country, "oficina" 
	FROM offices;
    
    -- NECESITAMOS TODOS LOS NOMBRES DE CLIENTES Y EMPLEADOS
    
    SELECT contact_last_name, contact_first_name          -- BUSCAMOS PRIMERO CLIENTES
		from customers;
        
	SELECT last_name,first_name                 -- BUSCAMOS EMPLEADOS
		from employees;
        
        
      SELECT contact_last_name, contact_first_name , "cliente" AS relacion                   -- HACEMOS LA UNION
		from customers
        UNION ALL                   -- CON ESTO COMBINAMOS AMBAS CONSULTAS
	SELECT last_name,first_name,   "trabajador"
		from employees;   
        
        
-- la empresa matriz neceit llos datos de todos los clientes de la empresa tienda y notwind--ACCEDER A 2 BBDD
        
        SELECT ContactName, "northwind" AS empresa                 -- COLUMNA- COLUMNA RELACION EL AS SE PONE EN LA PRIMERA QUERI
	FROM northwind.customers                                        -- AQUI PASAMOS A LA BBDD DE NORTWIN
    
UNION ALL 

SELECT CONCAT(contact_first_name," ", contact_last_name), "tienda"       -- (CONCAT) CONCATENAMOS 2 COLUMNAS (UNIMOS) NOMBRE Y APELLIDO XEJ 
	FROM tienda.customers;                                               -- PASAMOS A TRABAJAR CON LA BBDD TIENDA 
    
    
    
    -- LIKE
    
    SELECT*
    FROM customers
    LIMIT 3;
    
    -- encuentra los clientes que vivan en una ciudad que termina en "on" O Pais que empieze por S
    
     SELECT*
    FROM customers
    WHERE city LIKE "%ON";          -- WHERE (CUANDO) EN CIUDAD LIKE ( PORCENTAJE SEGUN LO QUE QUERAOMS BUSCAR)%ON QUE ACABE EN ON
    
    
    SELECT*
    FROM customers
    WHERE city LIKE "%ON" OR country LIKE "S%";       -- ciudad que termina en "on" O Pais que empieze por S
    
    -- LO MISMO PARA CIUDADES DE 4 CARACTERES
    
    SELECT*
    FROM customers
    WHERE city LIKE "__on";                       -- lleva dos guiones bajo 4 caraceters = _ _ o n 
    
    -- TRUQUINCHI -->  LO MISMO PARA CIUDADES DE 4 CARACTERES
    
    SELECT*
    FROM customers
    WHERE city LIKE "%on" AND char_length(city) =4;                   -- QUIERO QUE TERMINEN EN ON Y 4 CARQCTERES
															 
    
    SELECT*
    FROM customers
    WHERE city LIKE "%on" AND length(city) =4;   -- tambien funcionar solo con lenght pero en este caso pero la contabilidad es distinta
    
    -- el length cuenta las palabras con acento como un caractere mas LEÓN = 5 CARACTERES
    
    
    -- REGEXS
    
    SELECT*
    FROM customers
    where city  REGEXP "..on";   -- funciona con patrones diferentes
    
    
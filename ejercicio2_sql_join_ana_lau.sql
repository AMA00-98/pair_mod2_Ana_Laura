USE northwind;

-- Pedidos por empresa en UK:

SELECT * -- Consulto primero los clientes de UK 📌
    FROM Customers
    WHERE Country = 'UK';
    
-- Nos piden el ID del cliente y el nombre de la empresa de los clientes (TABLA 1)

SELECT CustomerID, CompanyName  -- Veo la tabla con el id y nombre de la empresa 📌
    FROM Customers;

-- Tengo que unir el numero de pedidos (TABLA 2)

SELECT OrderID -- Veo el id de los pedidos 📌
    FROM Orders; 

-- Resultado uniendo todo lo de arriba con JOIN

SELECT c.CustomerID AS Identificador, c.CompanyName AS NombreEmpresa, o.OrderID AS NumeroPedidos -- Seleccionamos las 2 columnas (Tab.1) y la columna (Tab.2) + Alias
    FROM Customers AS c -- De la Tabla 1
        INNER JOIN Orders AS o -- Y lo unimos con la Tabla 2
            ON c.CustomerID = o.CustomerID -- Donde 'CustomerID' = FK de ambas tablas, coinciden
	WHERE c.Country = "UK"; -- En donde los clientes pertenecen al país UK
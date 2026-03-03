USE Northwind;

-- Pedidos por empresa en UK:

SELECT * -- Consulto primero los clientes de UK
    FROM Customers
    WHERE Country = 'UK';

-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos

SELECT CustomerID, CompanyName  -- Veo la tabla con el id y nombre de la empresa 
    FROM Customers

-- Tengo que unir el numero de pedidos

SELECT ProductID
    FROM products 

-- Resultado uniendo todo lo de arriba con JOIN

SELECT                                               -- no me sale
    c.CustomerID,
    c.CompanyName,
    o.OrderID
    FROM Customers AS c
        INNER JOIN Orders AS o
            ON c.CustomerID = o.CustomerID;
    SELECT c.CustomerID,c.CompanyName,COUNT(o.OrderID) AS NumberOfOrders
    FROM Customers AS c

USE Northwind

-- Pedidos por empresa en UK:

SELECT*                           -- consulto primero los clientes de UK
FROM Customers
WHERE Country = 'UK';

-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT CustomerID,CompanyName                      -- veo la tabla con el id y nombre de la empresa 
FROM Customers

-- tengo que unir el numero de pedidos

SELECT ProductID
FROM products                                        -- TENGO QUE UNIR ESTO CON LO DE ARRIBA


SELECT                                               -- no me sale
    c.CustomerID,
    c.CompanyName,
    o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID;
    
SELECT c.CustomerID,c.CompanyName,COUNT(o.OrderID) AS NumberOfOrders
FROM Customers AS c

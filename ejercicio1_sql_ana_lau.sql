USE northwind;

-- Productos más baratos y caros de nuestra la bases de datos

SELECT MAX(UnitPrice) AS highestPrice, MIN(UnitPrice) AS lowestPrice
FROM products;                                    -- 263.5000	2.5000

-- Conociendo el numero de productos y su precio medio

SELECT COUNT(ProductName), AVG (UnitPrice)
FROM products;                             -- resultado 77	28.86636364


-- Sacad la máxima y mínima carga de los pedidos de UK

SELECT*
FROM orders 
WHERE ShipCountry;

SELECT MAX(Freight) , MIN(Freight) 
FROM orders
WHERE shipcountry= "uk";                       -- resultado 288.4300	0.9000

-- Qué productos se venden por encima del precio medio

SELECT  ProductName, UnitPrice
FROM products
WHERE UnitPrice > 28.86636364
ORDER BY UnitPrice DESC;

SELECT COUNT(*)
FROM products
WHERE DISCONTINUED = 1;                      -- RESULTADO 8

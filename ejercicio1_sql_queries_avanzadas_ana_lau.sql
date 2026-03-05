USE northwind;

-- Productos más baratos y caros de nuestra la bases de datos

SELECT MAX(UnitPrice) AS highestPrice, MIN(UnitPrice) AS lowestPrice
FROM products; -- Resultado: 263.5000 | 2.5000

-- Conociendo el numero de productos y su precio medio

SELECT COUNT(ProductName), AVG (UnitPrice)
FROM products; -- Resultado: 77 | 28.86636364


-- Sacad la máxima y mínima carga de los pedidos de UK

SELECT*
FROM orders 
WHERE ShipCountry;

SELECT MAX(Freight) , MIN(Freight) 
FROM orders
WHERE shipcountry= "uk"; -- Resultado: 288.4300	| 0.9000

-- Qué productos se venden por encima del precio medio (A esto se le llama 'Subconsultas')

SELECT  ProductName, UnitPrice
FROM products
WHERE UnitPrice > 28.86636364
ORDER BY UnitPrice DESC; -- Resultado: - (Datos masivos)

-- Qué productos se venden por encima del precio medio -> Manera correcta según el profesor ahora mismo

SELECT AVG(UnitPrice)
FROM products;

SELECT *
FROM products
WHERE UnitPrice > 28.86636364
ORDER BY UnitPrice DESC;

-- Qué productos se han descontinuado

SELECT COUNT(*)
FROM products
WHERE DISCONTINUED = 1; -- Resultado: 8

-- Qué productos se han descontinuado -> Manera correcta según el profesor

SELECT COUNT(UnitPrice)
FROM products
WHERE DISCONTINUED = 1; 

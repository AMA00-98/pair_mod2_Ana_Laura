USE northwind;

-- Ejercicio 2: Una lista con todas las categorías de productos, incluso si no tienen productos asociados --> RIGHT JOIN

SELECT p.ProductName, c.CategoryName -- Columnas con el nombre que queremos sacar + Alias de las Tablas (antes con '.')
	FROM Categories AS c -- Tabla 1 que queremos observar = Tabla Protagonista
		LEFT JOIN Products AS p -- Tabla 2 que queremos extraer información
		ON c.CategoryID = p.CategoryID; -- FK

SELECT c.CategoryName, p.ProductName -- Lo mismo, pero con RIGHT JOIN -- MEJOR OPCIÓN
	FROM Products AS p -- Tabla 1 que queremos observar = Tabla Protagonista
		RIGHT JOIN Categories AS c -- Tabla 2 que queremos extraer información
		ON p.CategoryID = c.CategoryID; -- FK 

-- Ejercicio 3: Una lista de todos los pedidos junto con los datos de las empresas clientes. Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado --> LEFT JOIN

SELECT o.OrderID, c.CompanyName -- Columnas que queremos sacar + Alias de las Tablas (antes con '.')
	FROM Orders AS o -- Tabla 1 que queremos observar = Tabla Protagonista
		LEFT JOIN Customers as c -- Tabla 2 que queremos extraer información
		ON o.CustomerID = c.CustomerID; -- FK

-- Ejercicio 4: Una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido --> LEFT JOIN

SELECT e.FirstName, e.LastName, o.OrderID -- Columnas que queremos sacar + Alias de las Tablas (antes con '.')
	FROM Employees AS e -- Tabla 1 que queremos observar = Tabla Protagonista
		LEFT JOIN Orders as o -- Tabla 2 que queremos extraer información
		ON e.EmployeeID = o.EmployeeID; -- FK

-- Ejercicio 5: Una lista de todos los transportistas (Shippers) y los pedidos que han enviado --> LEFT JOIN

SELECT s.CompanyName, o.OrderID -- Columnas que queremos sacar + Alias de las Tablas (antes con '.')
	FROM Shippers AS s -- Tabla 1 que queremos observar = Tabla Protagonista
		LEFT JOIN Orders as o -- Tabla 2 que queremos extraer información
		ON s.ShipperID = o.ShipVIA; -- FK 

-- Le pregunté a la IA cómo saber cuál es la FK exacta de ambas Tablas y me sacó 'ShipVIA', como quería saber cómo puedo sacarlo sin recurrir a él, me explicó lo siguiente:
-- ESTO se puede ver mediante el DIAGRAMA del Schema --> 'Database'

DESCRIBE Orders; -- Esto es para sacar la infromación de las columnas, nos fijamos en 'Key' para saber la PK ('PRI') y posibles FK ('MUL') de la tabla
-- FK = MUL: CustomerID ❌, EmployeeID ❌, OrderDate ❌, ShippedDate ✅ , ShipVIA ✅ y ShipPostalCode ✅ 
-- Filtramos por lógica: ShippedDate ❌ , ShipVIA ✅ y ShipPostalCode ❌ 

DESCRIBE Shippers; -- PK = 'ShipperID'

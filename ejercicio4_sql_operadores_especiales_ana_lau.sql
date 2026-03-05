USE northwind;

-- Ejercicio 1: Ciudades que empiezan con "A" o "B"

SELECT City, CompanyName, ContactName -- Columnas que queremos que aparezcan
	FROM Customers -- Tabla 'Clientes'
    WHERE City LIKE "A%" OR City LIKE "B%"; -- Letra + '%' (lo que sea) o Letra + '%' (lo que sea) --> Coge cualquiera de las 2 opciones ('o')
    -- Resultado: ✅

-- Ejercicio 2: Número de pedidos que han hecho en las ciudades que empiezan con L

SELECT c.City AS ciudad, c.CompanyName AS empresa, c.ContactName AS persona_contacto, COUNT(o.OrderID) AS numero_pedidos -- Columnas que queremos que aparezcan + Alias de las Tablas (antes con '.')
	FROM Customers AS c -- Tabla 1 que queremos observar = Tabla Protagonista
		INNER JOIN Orders AS o -- Tabla 2 que queremos extraer información
			ON c.CustomerID = o.CustomerID -- FK
	WHERE c.City LIKE "L%" -- Dónde Letra + '%' (lo que sea)
    GROUP BY c.City, c.CompanyName, c.ContactName; -- Agrupamos
    -- Resultado: ✅

-- Según a IA respecto al 'GROUP BY': Para que SQL no se bloquee, la regla es: "Toda columna que pongas en el SELECT que no tenga una función de cálculo (como COUNT, SUM, AVG) debe estar en el GROUP BY"
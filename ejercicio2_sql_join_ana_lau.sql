CREATE SCHEMA joins;

USE joins;
 
-- Crear la tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);
 
-- Crear la tabla productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    producto_similar INT,
    FOREIGN KEY (producto_similar) REFERENCES productos(id_producto)
);
 
-- Crear la tabla pedidos 
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    importe DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Insertar clientes
INSERT INTO clientes (nombre, ciudad) 
VALUES
	('Juan Pérez', 'Madrid'),
	('Ana Gómez', 'Barcelona'),
	('Luis Martínez', 'Valencia'),
	('Marta Sánchez', 'Sevilla'),        
	('Carlos Ruiz', 'Zaragoza'),
	('Sofía López', 'Málaga'),
	('Javier Díaz', 'Murcia'),
	('Elena Torres', 'Palma'),            
	('Miguel García', 'Bilbao'),
('Lucía Hernández', 'Alicante');
 
-- Insertar productos
INSERT INTO productos (nombre, precio, producto_similar) 
VALUES
	('Laptop HP', 1200.00, NULL),           
	('Laptop Dell', 1100.00, 1),            
	('Smartphone Samsung', 800.00, NULL),   
	('Smartphone Xiaomi', 600.00, 3),       
	('Tablet Apple', 900.00, NULL),         
	('Tablet Samsung', 700.00, 5),          
	('Auriculares Sony', 150.00, NULL),     
	('Auriculares Bose', 200.00, 7),        
	('Teclado Logitech', 50.00, NULL),      
	('Teclado Microsoft', 60.00, 9);        
	 
-- Insertar pedidos (ahora con id_producto)
INSERT INTO pedidos (id_cliente, id_producto, importe) 
VALUES
	(1, 1, 1200.00),  
	(1, 7, 150.00),   
	(2, 3, 800.00),   
	(3, 2, 1100.00),  
	(3, 8, 200.00),   
	(3, 4, 600.00),   
	(5, 1, 1200.00),  
	(5, 7, 150.00),   
	(6, 3, 800.00),   
	(6, 4, 600.00),   
	(7, 2, 1100.00),  
	(7, 8, 200.00),   
	(9, 1, 1200.00),  
	(9, 3, 800.00),   
	(10, 4, 600.00),  
	(10, 7, 150.00),  
	(10, 8, 200.00),  
	(1, 4, 600.00),   
	(5, 3, 800.00),   
	(7, 1, 1200.00);  

-- CONSULTAS --

SELECT *
	FROM pedidos;
    
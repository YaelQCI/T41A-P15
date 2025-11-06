INSERT INTO productos(nombre,precio,stock) VALUES 
('Teclado', 100.00, 50),
('Raton', 40.00, 80),
('Pantalla', 1000.00, 10),
('Mouse', 200.00, 80),
('Alfombra', 40.00, 25),
('HUB', 90.00, 45);

INSERT INTO departamento (nombre) VALUES
('Ventas'),
('Ingeniería'),
('Recursos Humanos'),
('Marketing');

INSERT INTO empleados (nombre) VALUES
('Ana García'),
('Luis Martínez'),
('Sofía Hernández'),
('Carlos Rodríguez'),
('Elena Gómez'),
('Miguel Torres');

INSERT INTO empleados_departamento (id_empleado, id_departamento) VALUES
(1, 2),
(2, 1),
(3, 2),
(4, 3),
(5, 1),
(6, 4),
(1, 4);

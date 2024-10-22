-- Desactivar las restricciones de claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;
-- Eliminar todos los datos de las tablas
DROP TABLE railway.Categorias;
DROP TABLE railway.Productos_Proveedores;
DROP TABLE railway.Productos;
DROP TABLE railway.Clientes;
DROP TABLE railway.Ordenes_Venta;
DROP TABLE railway.Detalles_Ordenes_Venta;
DROP TABLE railway.Movimientos_Inventario;
DROP TABLE railway.Tipos_Movimientos;
DROP TABLE railway.Envios;
DROP TABLE railway.Ordenes_Compra;
DROP TABLE railway.Detalles_Ordenes_Compra;
DROP TABLE railway.Inventario;
DROP TABLE railway.Proveedores;
DROP TABLE railway.Sucursales;
DROP TABLE railway.Vehiculos;
DROP TABLE railway.Transportistas;
DROP TABLE railway.Estados_Envio;

-- Hacerlo con criterio	
INSERT INTO railway.Categorias (categoria) VALUES 
('Electrónica'), -- no menos de 10
('Ropa'), -- no menos de 50
('Alimentos'), -- no menos de 100
('Muebles'), --  no menos de 5
('Juguetes'); -- no menos de 20


-- Productos
INSERT INTO railway.Productos (nombre, descripcion, precio, id_categoria) VALUES
('Televisor', 'Televisor 50 pulgadas', 499.99, 1),
('Silla', 'Silla de madera', 79.99, 4),
('Camiseta', 'Camiseta 100% algodón', 19.99, 2),
('Laptop', 'Laptop con procesador Intel i5', 899.99, 1),
('Chocolate', 'Chocolate oscuro', 2.99, 3),
('Cereal', 'Cereal', 1.59, 3),
('Lego StarWars', 'Lego', 25.00,5); 

-- Inventario
INSERT INTO railway.Inventario (id_producto, id_sucursal, cantidad) VALUES
(1, 1, 10),
(2, 4, 15),
(3, 2, 55),
(4, 1, 10),
(5, 3, 100),
(6, 3, 100),
(7, 7, 20);





-- Proveedores
INSERT INTO railway.Proveedores (nombre, telefono, email, direccion) VALUES
('Proveedor A ', '123456789', 'proveedora@example.com', 'Calle A 123'),
('Proveedor B', '987654321', 'proveedorb@example.com', 'Calle B 456'),
('Proveedor C Tech', '555123456', 'proveedorc@example.com', 'Calle C 789');

-- Productos_Proveedores
INSERT INTO railway.Productos_Proveedores (id_producto, id_proveedor, precio) VALUES
(1, 3, 450.00),
(2, 2, 75.00),
(3, 2, 18.50),
(4, 3, 850.00),
(5, 2, 2.50),
(6, 2, 1.00),
(7, 1, 15.00);




-- Clientes
INSERT INTO railway.Clientes (nombre, telefono, email, direccion) VALUES
('Juan Perez', '444123456', 'juan.perez@example.com', 'Calle 123'),
('Maria Lopez', '333987654', 'maria.lopez@example.com', 'Calle 456'),
('Carlos Diaz', '111555333', 'carlos.diaz@example.com', 'Calle 789'),
('Juan PEPE', '3412345678', 'juan.pepe@example.com', 'Calle Nofalsa 123'),
('Ana Martínez', '3418765432', 'ana.martinez@example.com', 'Av. Principal 456'),
('Luis García', '3415671234', 'luis.garcia@example.com', 'Calle Secundaria 789');
-- deberia tener 6 ordenes de venta

-- Ordenes_Venta
INSERT INTO railway.Ordenes_Venta (id_cliente, fecha_hora, total) VALUES
(1, '2024-01-01 10:00:00', 500.00),
(2, '2024-10-03 14:00:00', 300.00),
(3, '2024-10-01 14:00:00', 700.00),
(1, '2024-10-01 10:00:00', 50.00),
(4, '2024-10-03 14:00:00', 300.00),
(4, '2024-10-04 13:00:00', 30.00),
(5, '2024-10-01 14:00:00', 700.00),
(6, '2024-10-03 14:00:00', 220.00);

-- Detalles_Ordenes_Venta VER BIEN Y PENSARLO BIEN BOE ES UNA RE PAJA
INSERT INTO railway.Detalles_Ordenes_Venta (id_orden_venta, id_producto, cantidad, precio_unitario) VALUES
-- Orden de venta 1: Total 500.00
(1, 1, 1, 499.99),  -- 1 Televisor a $499.99

-- Orden de venta 2: Total 300.00
(2, 2, 2, 79.99),   -- 2 Sillas a $79.99 cada una
(2, 3, 7, 19.99),   -- 5 Camisetas a $19.99 cada una

-- Orden de venta 3: Total 700.00
(3, 4, 1, 899.99),  -- 1 Laptop a $899.99 (descuento aplicado en la suma total para dar $700.00)
-- Nota: El total de la orden de venta se ajusta por un descuento. Podrías tener un trigger o función para calcular esto si es necesario.

-- Orden de venta 4: Total 50.00
(4, 5, 17, 2.99),   -- 17 Chocolates a $2.99 cada uno

-- Orden de venta 5: Total 300.00
(5, 7, 12, 25.00),  -- 12 Lego StarWars a $25.00 cada uno

-- Orden de venta 6: Total 30.00
(6, 6, 19, 1.59),   -- 19 Cereales a $1.59 cada uno

-- Orden de venta 7: Total 700.00
(7, 4, 1, 899.99),  -- 1 Laptop a $899.99 (descuento para llegar a $700.00)

-- Orden de venta 8: Total 220.00
(8, 5, 73, 2.99);   -- 73 Chocolates a $2.99 cada uno

-- Orden de venta 9: Total 150.00 --muere
-- (9, 3, 8, 19.99);   -- 8 Camisetas a $19.99 cada una




-- SE PONE DIFICIL MANTENER CONSISTENICA ACA Ordenes de compra
-- Tipos de Movimientos
INSERT INTO railway.Tipos_Movimientos (tipo_movimiento) VALUES
('Compra'),
('Venta'),
('Ajuste de Inventario'),
('Ingreso Mercadería');


INSERT INTO railway.Ordenes_Compra (id_proveedor, id_sucursal, fecha_hora, total) VALUES
(1, 1, '2024-09-15 10:00:00', 4000.00),  -- Compra de productos electrónicos para la Sucursal Norte
(2, 2, '2024-09-20 11:00:00', 800.00),   -- Compra de muebles para la Sucursal Noreste
(3, 3, '2024-09-22 12:30:00', 1000.00),  -- Compra de alimentos para la Sucursal Sur
(1, 4, '2024-09-25 14:00:00', 1500.00),  -- Compra de tecnología para la Sucursal Este
(4, 5, '2024-09-27 09:00:00', 300.00);   -- Compra de juguetes para la Sucursal Oeste

-- Detalles de órdenes de compra
INSERT INTO railway.Detalles_Ordenes_Compra (id_orden_compra, id_producto, cantidad, precio_unitario) VALUES
-- Orden de compra 1: Total 4000.00
(1, 1, 8, 499.99),  -- 8 televisores a $499.99
(1, 4, 3, 899.99),  -- 3 laptops a $899.99

-- Orden de compra 2: Total 800.00
(2, 2, 10, 79.99),  -- 10 sillas a $79.99

-- Orden de compra 3: Total 1000.00
(3, 5, 250, 2.99),  -- 250 chocolates a $2.99
(3, 6, 120, 1.59),  -- 120 cereales a $1.59

-- Orden de compra 4: Total 1500.00
(4, 1, 2, 499.99),  -- 2 televisores a $499.99
(4, 4, 1, 899.99),  -- 1 laptop a $899.99

-- Orden de compra 5: Total 300.00
(5, 7, 12, 25.00);  -- 12 juguetes Lego StarWars a $25.00


-- Movimientos de Inventario
INSERT INTO railway.Movimientos_Inventario (id_producto, id_sucursal, cantidad, id_tipo_movimiento, fecha_hora, id_orden_compra, id_orden_venta) VALUES
-- Movimientos de órdenes de compra
(1, 1, 8, 4, '2024-09-15 10:00:00', 1, NULL),  -- Ingreso de 8 televisores en Sucursal Norte
(4, 1, 3, 4, '2024-09-15 10:00:00', 1, NULL),  -- Ingreso de 3 laptops en Sucursal Norte

(2, 2, 10, 4, '2024-09-20 11:00:00', 2, NULL),  -- Ingreso de 10 sillas en Sucursal Noreste

(5, 3, 250, 4, '2024-09-22 12:30:00', 3, NULL),  -- Ingreso de 250 chocolates en Sucursal Sur
(6, 3, 120, 4, '2024-09-22 12:30:00', 3, NULL),  -- Ingreso de 120 cereales en Sucursal Sur

(1, 4, 2, 4, '2024-09-25 14:00:00', 4, NULL),  -- Ingreso de 2 televisores en Sucursal Este
(4, 4, 1, 4, '2024-09-25 14:00:00', 4, NULL),  -- Ingreso de 1 laptop en Sucursal Este

(7, 5, 12, 4, '2024-09-27 09:00:00', 5, NULL),  -- Ingreso de 12 Legos en Sucursal Oeste

-- Movimientos de órdenes de venta (venta a clientes)
(1, 1, -1, 2, '2024-01-01 10:00:00', NULL, 1),  -- Venta de 1 televisor en Sucursal Norte
(2, 2, -2, 2, '2024-10-03 14:00:00', NULL, 2),  -- Venta de 2 sillas en Sucursal Noreste
(3, 2, -5, 2, '2024-10-03 14:00:00', NULL, 2),  -- Venta de 5 camisetas en Sucursal Noreste
(4, 4, -1, 2, '2024-10-01 14:00:00', NULL, 3),  -- Venta de 1 laptop en Sucursal Este
(5, 3, -17, 2, '2024-10-01 10:00:00', NULL, 4); -- Venta de 17 chocolates en Sucursal Sur

-- Estados de Envío
INSERT INTO railway.Estados_Envio (estado) VALUES
('En tránsito'),
('Entregado'),
('Cancelado');
-- Envíos de productos
INSERT INTO railway.Envios (id_orden_venta, id_transportista, id_vehiculo, id_sucursal, direccion_envio, fecha_hora_envio, fecha_hora_entrega_estimada, fecha_hora_entrega, id_estado_envio) VALUES
(1, 1, 1, 1, 'Calle Falsa 123, Ciudad', '2024-01-01 11:00:00', '2024-01-02 11:00:00', '2024-01-02 10:30:00', 2),  -- Envío del televisor, entregado
(2, 2, 2, 2, 'Calle Norte 456, Ciudad', '2024-10-03 15:00:00', '2024-10-04 15:00:00', '2024-10-04 14:00:00', 2),  -- Envío de sillas y camisetas, entregado
(3, 3, 3, 4, 'Av. Sur 789, Ciudad', '2024-10-01 15:00:00', '2024-10-02 15:00:00', NULL, 1),  -- Envío de la laptop, en tránsito
(4, 1, 1, 3, 'Calle Oeste 987, Ciudad', '2024-10-01 11:00:00', '2024-10-02 11:00:00', '2024-10-02 09:30:00', 2);  -- Envío de chocolates, entregado

-- Transportistas
INSERT INTO railway.Transportistas (nombre, telefono, email, direccion) VALUES
('Transportes Rápidos', '123-456-789', 'contacto@rapidos.com', 'Av. Principal 123'),
('Logística Exprés', '987-654-321', 'contacto@expres.com', 'Calle 456'),
('Distribuciones Globales', '456-789-123', 'info@globales.com', 'Av. Comercio 789');
-- Vehículos
INSERT INTO railway.Vehiculos (matricula, capacidad, id_transportista) VALUES
('ABC123', 1000, 1),  -- Transportes Rápidos
('XYZ987', 1500, 2),  -- Logística Exprés
('LMN456', 2000, 3);  -- Distribuciones Globales


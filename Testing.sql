
USE railway;
SELECT * FROM Clientes;

-- TESTING TRIGGER Validacion_Clientes V1
-- DELETE FROM Detalles_Ordenes_Venta WHERE id_orden_venta = 9;
-- DELETE FROM Ordenes_Venta WHERE id_cliente = 7;
-- DELETE FROM Clientes WHERE id_cliente = 7;

-- INSERT INTO Clientes (nombre, telefono, email, direccion) VALUES ('pepe', '', 'email', 'direcionfalsa');

-- tESTING FUNCTION 
SELECT * FROM railway.Detalles_Ordenes_Venta;
SELECT costo_total_orden_venta(2);
-- 2 * 79.99 = 159.98 + 7*19.99 = 139.93 --> 159.98 + 139.93 = 299.99

-- testing funciton
USE railway;
-- SP Definir una variable para el valor de salida
SET @total = 0;
-- Llamar al procedimiento almacenado pasando el ID de la sucursal y la variable de salida
CALL total_ventas_sucursal(1, @total);
-- Mostrar el resultado
SELECT @total AS TotalVentasSucursal;


-- 1 ) partir de un dato contenido en A conseguir uno de C de un cliente conseguir la cantidad de numero art tanto

SELECT dv.cantidad
FROM railway.Detalles_Ordenes_Venta dv
JOIN railway.Ordenes_Venta ov ON dv.id_orden_venta = ov.id_orden_venta
WHERE ov.id_cliente = 1 AND dv.id_producto = 1;

-- 2 ) Ver en Qué Detalles de Venta se Realizaron Ventas del Artículo Tal
SELECT dv.id_detalle_venta, dv.cantidad, ov.fecha_hora
FROM railway.Detalles_Ordenes_Venta dv
JOIN railway.Ordenes_Venta ov ON dv.id_orden_venta = ov.id_orden_venta
WHERE dv.id_producto = 1;

-- 3) Ver los Clientes que Compran un Producto
SELECT DISTINCT c.id_cliente, c.nombre
FROM railway.Clientes c
JOIN railway.Ordenes_Venta ov ON c.id_cliente = ov.id_cliente
JOIN railway.Detalles_Ordenes_Venta dv ON ov.id_orden_venta = dv.id_orden_venta
WHERE dv.id_producto = 1;



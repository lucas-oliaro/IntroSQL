USE railway;
SELECT * FROM railway.Categorias;
-- Correcion porque inserte tres veces la misma data je
SELECT * FROM railway.Productos;
SELECT * FROM Clientes;

-- TESTING TRIGGER Validacion_Clientes V1
DELETE FROM Detalles_Ordenes_Venta WHERE id_orden_venta = 9;
DELETE FROM Ordenes_Venta WHERE id_cliente = 7;
DELETE FROM Clientes WHERE id_cliente = 7;

INSERT INTO Clientes (nombre, telefono, email, direccion) VALUES ('pepe', '', 'email', 'direcionfalsa');

-- tESTING FUNCTION 
SELECT * FROM railway.Detalles_Ordenes_Venta;
SELECT costo_total_orden_venta(2);


-- SP Definir una variable para el valor de salida
SET @total = 0;
-- Llamar al procedimiento almacenado pasando el ID de la sucursal y la variable de salida
CALL total_ventas_sucursal(1, @total);
-- Mostrar el resultado
SELECT @total AS TotalVentasSucursal;
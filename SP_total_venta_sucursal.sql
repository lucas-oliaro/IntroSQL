CREATE PROCEDURE total_ventas_sucursal(IN id_sucursal_param INT, OUT total_ventas DECIMAL(10,2))
BEGIN
    -- Declaramos una variable para almacenar el total temporal
    DECLARE total DECIMAL(10,2) DEFAULT 0;
    
    -- Calculamos el total de ventas de una sucursal
    SELECT SUM(dov.cantidad * dov.precio_unitario) INTO total
    FROM Detalles_Ordenes_Venta dov
    JOIN Ordenes_Venta ov ON dov.id_orden_venta = ov.id_orden_venta
    JOIN Envios e ON ov.id_orden_venta = e.id_orden_venta
    WHERE e.id_sucursal = id_sucursal_param;
    
    -- Asignamos el valor del total calculado a la variable de salida
    SET total_ventas = IFNULL(total, 0);
END
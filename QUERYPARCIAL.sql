
-- categoria de producto con ventas más canceladas ¿?
SELECT c.categoria, COUNT(*) AS total_ventas_canceladas
FROM Categorias c
JOIN Productos p ON c.id_categoria = p.id_categoria
JOIN Detalles_Ordenes_Venta dov ON p.id_producto = dov.id_producto
JOIN Ordenes_Venta ov ON dov.id_orden_venta = ov.id_orden_venta
JOIN Envios e ON ov.id_orden_venta = e.id_orden_venta
JOIN Estados_Envio ee ON e.id_estado_envio = ee.id_estado_envio
WHERE 
    ee.estado = 'Cancelado'
GROUP BY 
    c.categoria
ORDER BY 
    total_ventas_canceladas DESC
LIMIT 1;

-- Fix del momento jejej (no teniamos ningun envio con estado 3)

-- UPDATE Envios SET id_estado_envio=3 WHERE id_envio = 1;
SELECT * FROM Envios;
SELECT * FROM Detalles_Ordenes_Venta;
SELECT * FROM Ordenes_Venta;
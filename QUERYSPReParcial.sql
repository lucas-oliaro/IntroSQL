SELECT 
    ov.id_orden_venta,
    ov.fecha_hora,
    ov.total,
    e.estado AS estado_envio
FROM 
    railway.Ordenes_Venta ov
JOIN 
    railway.Detalles_Ordenes_Venta dov ON ov.id_orden_venta = dov.id_orden_venta
JOIN 
    railway.Envios en ON ov.id_orden_venta = en.id_orden_venta
JOIN 
    railway.Estados_Envio e ON en.id_estado_envio = e.id_estado_envio
WHERE 
    dov.id_producto = 5;

--
SELECT 
    p.id_producto,
    p.nombre,
    SUM(dov.cantidad) AS total_vendido
FROM 
    railway.Detalles_Ordenes_Venta dov
JOIN 
    railway.Productos p ON dov.id_producto = p.id_producto
GROUP BY 
    p.id_producto, p.nombre
ORDER BY 
    total_vendido DESC
LIMIT 4;

-- Cliente con m´´as ordenes de compras 
SELECT 
    c.id_cliente,
    c.nombre,
    COUNT(ov.id_orden_venta) AS total_compras
FROM 
    railway.Clientes c
JOIN 
    railway.Ordenes_Venta ov ON c.id_cliente = ov.id_cliente
GROUP BY 
    c.id_cliente, c.nombre
ORDER BY 
    total_compras DESC;



-- Testing 
SELECT * FROM railway.Productos;
SELECT * FROM railway.Detalles_Ordenes_Venta;
SELECT * FROM railway.Ordenes_Venta ORDER BY 
    id_cliente DESC;

UPDATE railway.Productos SET id_producto = 6 WHERE id_producto = 20;
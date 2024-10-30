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

--
SELECT 
    s.id_sucursal,
    s.nombre,
    COUNT(oc.id_orden_compra) AS total_ordenes_compra
FROM 
    railway.Ordenes_Compra oc
JOIN 
    railway.Sucursales s ON oc.id_sucursal = s.id_sucursal
GROUP BY 
    s.id_sucursal, s.nombre
ORDER BY 
    total_ordenes_compra DESC
LIMIT 5;



-- Testing 
SELECT * FROM railway.Productos;
SELECT * FROM railway.Detalles_Ordenes_Venta;
SELECT * FROM railway.Ordenes_Venta ORDER BY 
    id_cliente DESC;
    
 
-- INSERT INTO railway.Ordenes_Compra (id_proveedor, id_sucursal, fecha_hora, total) VALUES (1, 1, '2024-09-25 11:00:00', 400.00);


UPDATE railway.Productos SET id_producto = 6 WHERE id_producto = 20;
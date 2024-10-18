
-- CLIENTES
SELECT * FROM railway.Clientes;
-- Al crear un nuevo cliente se debera preparar la carga de una orden de venta ya que solo por eso tendriamos un nuevl cliente
-- no puede generarse un neuvo cliente sin nombre y mail (para madnar factura)

SELECT * FROM railway.Ordenes_Venta;
-- el total de la orden sera la suma realizada en una funcion llamada costo total de orden_venta la cual buscada en Detalles_Ordenes_Venta el id_orden_venta 
-- y sumara los precios unitraios correspondientes a ese valor
SELECT * FROM railway.Detalles_Ordenes_Venta;

# Luego el circuito es 
SELECT * FROM railway.Movimientos_Inventario; -- ! no asustarse si dice null ya que es ingreso de mercaderia 
SELECT * FROM railway.Tipos_Movimientos;
-- ajustessaldos/ingreso mercaderia/ venta

SELECT * FROM railway.Envios;
-- caso que sea venta surcursal  el tipo de envio sera entrega sucursal



-- SECTOR STOCK
-- da inicio la orden de compra
SELECT * FROM railway.Ordenes_Compra;
-- aplica la siguiente logica, el total de la orden de compra sera la suma del precio unitario por la cantidad que se encuentra en Detalles_Ordenes_Compra

SELECT * FROM railway.Detalles_Ordenes_Compra;

SELECT * FROM railway.Movimientos_Inventario;

SELECT * FROM railway.Tipos_Movimientos;
-- ajustessaldos/ingreso mercaderia/ venta

SELECT * FROM railway.Inventario;
-- crear un trigger que no permita que haya menos de x cantidad segun la categoria en la que estan los productos
-- no puedo tener menos de 5 de un producto electronico, ni menos de 100 de productos pertenecientes a alimentos






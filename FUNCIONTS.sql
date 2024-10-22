-- FUNCIONES
DROP FUNCTION IF EXISTS costo_total_orden_venta;
USE railway;


DELIMITER //

CREATE FUNCTION costo_total_orden_venta(p_id_orden_venta INT) 
	RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(cantidad * precio_unitario) INTO total
    FROM Detalles_Ordenes_Venta
    WHERE id_orden_venta = p_id_orden_venta; -- importante no llamar las variables iguales !
    
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    
    RETURN total;
END//

DELIMITER ;
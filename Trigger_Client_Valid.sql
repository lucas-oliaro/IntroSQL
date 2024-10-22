-- Trigger Validacion de cliente
USE railway

DELIMITER //

CREATE TRIGGER Validacion_Cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN 
	IF NEW.nombre IS NULL OR NEW.nombre = '' THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Campo nulo no aceptado';
	END IF;
	IF NEW.telefono IS NULL OR NEW.telefono = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Campo nulo no aceptado';
	END IF;
	IF NEW.email IS NULL OR NEW.email = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Campo nulo no aceptado';
	END IF;
	IF NEW.direccion IS NULL OR NEW.direccion = '' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Campo nulo no aceptado';
	END IF;
END;
DELIMITER ;
CREATE TABLE Categorias (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(100)
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Proveedores (
	id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE Productos_Proveedores (
	id_producto_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_proveedor INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Sucursales (
    id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    ubicacion VARCHAR(150),
    capacidad INT
);

CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_sucursal INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(200)
);


CREATE TABLE Tipos_Movimientos (
	id_tipo_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_movimiento VARCHAR(20)
);

CREATE TABLE Ordenes_Compra (
    id_orden_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT,
    id_sucursal INT, 
    fecha_hora DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal)
);

CREATE TABLE Detalles_Ordenes_Compra (
    id_detalle_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_orden_compra INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),  
    FOREIGN KEY (id_orden_compra) REFERENCES Ordenes_Compra(id_orden_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Ordenes_Venta (
    id_orden_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_hora DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_Ordenes_Venta (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_orden_venta INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_orden_venta) REFERENCES Ordenes_Venta(id_orden_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Movimientos_Inventario (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_sucursal INT,
    cantidad INT,
    id_tipo_movimiento INT,
    fecha_hora DATETIME,
    id_orden_compra INT,  
    id_orden_venta INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES Tipos_Movimientos(id_tipo_movimiento),
    FOREIGN KEY (id_orden_compra) REFERENCES Ordenes_Compra(id_orden_compra),
    FOREIGN KEY (id_orden_venta) REFERENCES Ordenes_Venta(id_orden_venta)
);

CREATE TABLE Transportistas (
    id_transportista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE Vehiculos (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20),
    capacidad DECIMAL(10, 2),
    id_transportista INT,
    FOREIGN KEY (id_transportista) REFERENCES Transportistas(id_transportista)
);

CREATE TABLE Envios (
    id_envio INT PRIMARY KEY AUTO_INCREMENT,
    id_orden_venta INT,
    id_transportista INT,
    id_vehiculo INT,
    id_sucursal INT,
    direccion_envio VARCHAR(200),
    fecha_hora_envio DATETIME,
    fecha_hora_entrega_estimada DATETIME,
    fecha_hora_entrega DATETIME,
    id_estado_envio INT,
    FOREIGN KEY (id_estado_envio) REFERENCES Estados_Envio(id_estado_envio),
    FOREIGN KEY (id_orden_venta) REFERENCES Ordenes_Venta(id_orden_venta),
    FOREIGN KEY (id_transportista) REFERENCES Transportistas(id_transportista),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal)
);

CREATE TABLE Estados_Envio (
	id_estado_envio INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50)
);
























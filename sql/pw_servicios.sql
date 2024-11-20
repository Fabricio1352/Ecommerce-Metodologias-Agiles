-- Creación de BD
CREATE DATABASE IF NOT EXISTS `pw_servicios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pw_servicios;

  DROP DATABASE pw_servicios;

-- Tabla Productos. Tabla para almacenar los productos disponibles/existentes en la pagina
CREATE TABLE productos (
    Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,  -- Cantidad en inventario
    Categoria_id INT,  -- Relación para las categorías
    Imagen_url VARCHAR(255),  -- Enlace a la imagen del producto 
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',  --  Para la disponibilidad de la venta
    Fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Categoria_id) REFERENCES categorias(Id_Categoria)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Tabla Categorias. Tabla para las diferentes categorias existentes
CREATE TABLE categorias (
    Id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Tabla Promociones. Tabla para las promociones existentes.
CREATE TABLE promociones (
    Id_Promocion INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Porcentaje_descuento DECIMAL(5, 2) NOT NULL,  -- El porcentaje de descuento
    Fecha_inicio TIMESTAMP,
    Fecha_fin TIMESTAMP,
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Tabla Productos_Promocion. Tabla que relaciona las promociones con los productos que cuenten con una.
CREATE TABLE productos_promocion (
    Id_ProdProm INT AUTO_INCREMENT PRIMARY KEY,
    Promocion_id INT,
    Producto_id INT,
    FOREIGN KEY (Promocion_id) REFERENCES promociones(Id_Promocion),
    FOREIGN KEY (Producto_id) REFERENCES productos(Id_Producto)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Tabla Ventas. Ventas/Orden de compra realizadas por los usuarios. Relación con la tabla de usuarios.
CREATE TABLE ventas (
    Id_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Usuario_id INT,  -- Id del cliente que hizo la compra (BD PostgreSQL)
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,  -- El total de la compra
    Estado ENUM('Pendiente', 'Pagado', 'Enviado', 'Cancelado') DEFAULT 'Pendiente',
    Metodo_pago ENUM('Paypal') NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(Id_Usuario) -- Tabla Usuarios PostgreSQL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Tabla Productos_Orden. Tabla para realizar compras de varios productos en una sola orden.
CREATE TABLE productos_orden (
    Id_ProductoVenta INT AUTO_INCREMENT PRIMARY KEY,
    Orden_id INT,
    Producto_id INT,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Ventas_id) REFERENCES ventas(Id_Venta),
    FOREIGN KEY (Producto_id) REFERENCES productos(Id_Producto)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- 
-- Tabla Pagos. Registra los pagos realizados por los usuarios.
CREATE TABLE pagos (
    Id_Pagos INT AUTO_INCREMENT PRIMARY KEY,
    Orden_id INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Monto DECIMAL(10, 2) NOT NULL,
    Metodo_Pago ENUM('Paypal') NOT NULL,
    Estado ENUM('Pendiente', 'Fallido', 'Completado') DEFAULT 'Pendiente',
    FOREIGN KEY (Orden_id) REFERENCES ventas(Id_Venta)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

SELECT * FROM productos;
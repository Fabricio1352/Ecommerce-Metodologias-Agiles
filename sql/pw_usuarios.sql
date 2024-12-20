-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS pw_usuarios;
USE pw_usuarios;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol TINYINT(1) NOT NULL DEFAULT 0,  -- 0 = usuario normal, 1 = administrador
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar un usuario por defecto 
INSERT INTO usuarios (nombre, email, contrasena, rol)
VALUES ('admin', 'admin@example.com', 'admin', 1); 


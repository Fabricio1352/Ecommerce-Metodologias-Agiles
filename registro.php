<?php

// Habilitar la visualización de errores en PHP
ini_set('display_errors', 1);  // Muestra los errores
error_reporting(E_ALL);        // Reporta todos los errores

// Datos de conexión a la base de datos
$host = "localhost";   // O la IP de tu servidor
$port = "5432";        // Puerto por defecto de PostgreSQL
$dbname = "Pw__usuarios";  // Nombre de tu base de datos
$user = "postgres";   // Tu nombre de usuario en PostgreSQL
$password = "Alejandra16."; // Tu contraseña de PostgreSQL

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Error de conexión a la base de datos.");
}

// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

    // Validar los datos (por ejemplo, que no estén vacíos)
    if (empty($usuario) || empty($contrasena)) {
        echo "Por favor, complete todos los campos.";
    } else {
        // Hashear la contraseña (esto es importante para seguridad)
        $hashed_password = password_hash($contrasena, PASSWORD_DEFAULT);

        // Comprobar si el nombre de usuario ya existe en la base de datos
        $check_user_query = "SELECT * FROM usuarios WHERE usuario = '$usuario'";
        $result = pg_query($conn, $check_user_query);

        if (pg_num_rows($result) > 0) {
            echo "El nombre de usuario ya existe. Elige otro.";
        } else {
            // Insertar el nuevo usuario en la base de datos
            $insert_query = "INSERT INTO usuarios (usuario, contrasena) VALUES ('$usuario', '$hashed_password')";
            $insert_result = pg_query($conn, $insert_query);

            if ($insert_result) {
                echo "Usuario registrado exitosamente.";
            } else {
                echo "Error al registrar el usuario.";
            }
        }
    }
}

// Cerrar la conexión
pg_close($conn);
?>

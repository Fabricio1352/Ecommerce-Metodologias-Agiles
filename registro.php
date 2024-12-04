<?php

// Habilita la visualización de errores en PHP
ini_set('display_errors', 1);  // Muestra los errores
error_reporting(E_ALL);        // Reporta todos los errores

// Datos de conexión a la base de datos
$host = "localhost";   
$port = "5432";        // Puerto  de PostgreSQL
$dbname = "Pw_usuarios";  // Nombre de tu base de datos
$user = "postgres";   // Nombre de usuario en PostgreSQL
$password = "Alejandra16."; // Contraseña de PostgreSQL

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Error de conexión en la base de datos.");
}

// Verifica si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

    // Valida los datos
    if (empty($usuario) || empty($contrasena)) {
        echo "Por favor, complete todos los campos.";
    } else {
        // Hashea la contraseña
        $hashed_password = password_hash($contrasena, PASSWORD_DEFAULT);

        // Comprueba si el nombre de usuario ya existe en la base de datos
        $check_user_query = "SELECT * FROM usuarios WHERE usuario = '$usuario'";
        $result = pg_query($conn, $check_user_query);

        if (pg_num_rows($result) > 0) {
            echo "El nombre de usuario ya existe. Ingrese otro.";
        } else {
            // Inserta el nuevo usuario 
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

// Cierra la conexión
pg_close($conn);
?>

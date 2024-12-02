<?php
// Habilitar la visualización de errores en PHP (para depuración)
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Datos de conexión a la base de datos
$host = "localhost";
$port = "5432";
$dbname = "Pw__usuarios";
$user = "postgres";
$password = "Alejandra16.";

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Error de conexión a la base de datos.");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

    if (empty($usuario) || empty($contrasena)) {
        echo "Por favor, complete todos los campos.";
    } else {
        // Consultar la base de datos para obtener el hash de la contraseña
        $query = "SELECT contrasena FROM usuarios WHERE usuario = '$usuario'";
        $result = pg_query($conn, $query);

        if (pg_num_rows($result) > 0) {
            // Obtener el hash almacenado en la base de datos
            $row = pg_fetch_assoc($result);
            $hashed_password = $row['contrasena'];

            // Verificar si la contraseña ingresada coincide con el hash
            if (password_verify($contrasena, $hashed_password)) {
                echo "Inicio de sesión exitoso.";
                // Aquí puedes redirigir al usuario a su panel o página interna
                // header('Location: dashboard.php');
                exit;
            } else {
                echo "Credenciales incorrectas.";
            }
        } else {
            echo "El usuario no existe.";
        }
    }
}

pg_close($conn);
?>

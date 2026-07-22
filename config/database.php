<?php

$serverName = "localhost";
$database = "SistemaEmpleados";
$user = "daylin";
$password = "yol";

try {
    $conn = new PDO(
        "sqlsrv:Server=$serverName;Database=$database",
        $user,
        $password
    );


    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "La conexion fue exitosa";
} catch (PDOException $e) {
    die("Ocurrio un error en la conexion: " . $e->getMessage());
}

<?php

require_once __DIR__ . '/../models/PuestoModel.php';
$model = new PuestoModel();

$nombrePuesto = $_POST['nombre_puesto'];
$idDepartamento = $_POST['id_departamento'];

if (empty($nombrePuesto) || empty($idDepartamento)) {
    header("Location: index.php");
    exit;
}
$model->create($nombrePuesto, $idDepartamento);
header("Location: index.php");
exit;

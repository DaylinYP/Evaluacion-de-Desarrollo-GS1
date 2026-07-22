<?php

require_once __DIR__ . '/../models/PuestoModel.php';
$model = new PuestoModel();

if($_SERVER['REQUEST_METHOD'] === 'POST'){

    $id = $_POST['id_puesto'];
    $nombrePuesto = $_POST['nombre_puesto'];
    $idDepartamento = $_POST['id_departamento'];

    if(!empty($nombrePuesto) && !empty($idDepartamento)){
        $model->update($id,$nombrePuesto,$idDepartamento);
    }
    header("Location:index.php");
    exit;

}
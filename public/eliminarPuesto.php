<?php

require_once __DIR__ . '/../models/PuestoModel.php';
$model = new PuestoModel();

$id=$_GET['id'];
if(!empty($id)){
    $model->delete($id);
}
header("Location:index.php");
exit;
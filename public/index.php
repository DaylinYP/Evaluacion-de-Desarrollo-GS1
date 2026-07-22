<?php


require_once __DIR__ . '/../controllers/PuestoController.php';

$controller = new PuestoController();
$datos = $controller->index();

include __DIR__ . '/../views/puesto/index.php';
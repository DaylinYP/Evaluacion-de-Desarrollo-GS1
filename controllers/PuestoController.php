<?php

/*
*********************************************************************************
    CONTROLADOR: PuestoController 
    DESCRIPCION: Recibe las soliciudes del mantenimiento y coordina la comunicacion
    entre el modelo y vistas.
    
    HECHO POR DAYLIN YOL
    FECHA: 21/07/2026
*********************************************************************************

*/


require_once __DIR__ . '/../models/PuestoModel.php';

class PuestoController
{
    private $puesto;
    public function __construct()
    {
        $this->puesto = new PuestoModel();
    }
    public function index()
    {
        $datos = [];
        $datos['titulo'] = 'Puestos';
        $datos['puestos'] = $this->puesto->findAll();
        $datos['departamentos'] = $this->puesto->getDepartamentos();
        return $datos;
    }
}

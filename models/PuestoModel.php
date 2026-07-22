<?php


/*
*********************************************************************************
    MODELO: PuestoModel 
    DESCRIPCION: Gestiona las operaciones de la tabla Puesto y las consultas
    relacionadas con los departaemntos para el mantenimiento de puestos.
    HECHO POR DAYLIN YOL
    FECHA: 21/07/2026
*********************************************************************************

*/

require_once __DIR__ . '/../config/database.php';

class PuestoModel
{
    //Conexion a la bd
    private $conn;
    private $table = "Puesto"; //tabla que administra el modelo

    public function __construct()
    {
        //reutiliza la conn creada en database
        global $conn;
        $this->conn = $conn;
    }

    //METODO ENCONTRAR TODOS LOS PUESTOS
    public function findAll()
    {
        $sql = "SELECT
                        P.id_puesto,
                        P.nombre_puesto,
                        D.id_departamento,
                        D.nombre_departamento
                        FROM Puesto P
                        INNER JOIN Departamento D
                        ON P.id_departamento = D.id_departamento
                        WHERE P.estado = 1
                        ORDER BY P.id_puesto";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    //METODO ENCONTRAR PUESTO POR ID
    public function findById($id)
    {
        $sql = "SELECT
                        P.id_puesto,
                        P.nombre_puesto,
                        D.id_departamento,
                        D.nombre_departamento
                        FROM Puesto P
                        INNER JOIN Departamento D
                        ON P.id_departamento = D.id_departamento
                        WHERE P.id_puesto = :id";

        $stmt = $this->conn->prepare($sql);

        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    //METODO CREAR (ALTA)
    public function create($nombrePuesto, $idDepartamento)
    {
        $sql = "INSERT INTO Puesto(nombre_puesto, id_departamento, estado)
                VALUES(:nombre, :id_departamento, 1)";

        $stmt = $this->conn->prepare($sql);

        $stmt->bindParam(':nombre', $nombrePuesto, PDO::PARAM_STR);
        $stmt->bindParam(':id_departamento', $idDepartamento, PDO::PARAM_INT);

        return $stmt->execute();
    }
    //METODO PARA ACTUALIZAR ALGUN PUESTO EXISTENTE
    public function update($id, $nombrePuesto, $idDepartamento)
    {
        $sql = "UPDATE Puesto
                SET nombre_puesto = :nombre, id_departamento = :id_departamento
                WHERE id_puesto = :id";

        $stmt = $this->conn->prepare($sql);

        $stmt->bindParam(':nombre', $nombrePuesto, PDO::PARAM_STR);
        $stmt->bindParam(':id_departamento', $idDepartamento, PDO::PARAM_INT);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        return $stmt->execute();
    }

    //METODO PARA ELIMINAR NO FISICAMENTE (BAJA) OSEA CAMBIAMOS EL ESTADO 1 A 0
    public function delete($id){
        $sql = "UPDATE Puesto
                SET estado = 0
                WHERE id_puesto = :id";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }
    //METODO PARA SELECT DE DEPTOS EN FORM PARA AGREGAR EMPLEADO
    public function getDepartamentos(){
        $sql = "SELECT id_departamento, nombre_departamento
                FROM Departamento WHERE estado = 1
                ORDER BY nombre_departamento
        ";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }
}

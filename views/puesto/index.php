<!DOCTYPE html>
<html lang="es">

<head>
    <!--*********************************************************************************
    VISTA: Mantenimiento de Puestos 
    DESCRIPCION: Muestra el listado de puestos y permite realizar acciones de alta,
    modificacion y baja de puestos.

    HECHO POR DAYLIN YOL
    FECHA: 21/07/2026
*********************************************************************************-->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $datos['titulo']; ?></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"> <!--LINK DE BOOTSTRAP-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"> <!--LINK DE BOOTSTRAPICON-->
    <link rel="stylesheet" href="css/estilos.css?v=<?= time(); ?>"> <!--ESTILOS CSS-->

</head>

<body>


    <div class="container mt-5">
        <h2><?= $datos['titulo']; ?></h2>

        <div class="text-end mb-3">
            <button type="button"
                class="btn botonNuevo mb-3"
                data-bs-toggle="modal"
                data-bs-target="#modalNuevoPuesto">
                <i class="bi bi-person-plus"></i> Nuevo Puesto
            </button>
        </div>

        <table class="table table-striped table-dark">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>PUESTO</th>
                    <th>DEPARTAMENTO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>


            <tbody>
                <?php foreach ($datos['puestos']  as $puesto): ?>
                    <tr>
                        <td><?= $puesto['id_puesto']; ?></td>
                        <td><?= $puesto['nombre_puesto']; ?></td>
                        <td><?= $puesto['nombre_departamento']; ?></td>
                        <td>
                            <a href="#"
                                class="btn btn-sm botonEditar"
                                data-bs-toggle="modal" data-bs-target="#modalEditar<?= $puesto['id_puesto']; ?>">
                                <i class="bi bi-pencil-square"></i></a>

                            <a href="eliminarPuesto.php?id=<?= $puesto['id_puesto']; ?>"
                                class="btn btn-sm botonEliminar" onclick="return confirm('¿Está seguro de dar de baja este puesto?')"><i class="bi bi-trash"></i></a>
                        </td>
                    </tr>

                <?php endforeach; ?>

            </tbody>
        </table>
    </div>

    <!--MODAL PARA AGREGAR NUEVO PUESTO-->
    <div class="modal fade" id="modalNuevoPuesto" tabindex="-1" aria-labelledby="modalNuevoPuestoLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border border-secondary rounded-4 shadow-lg">

                <!--ENCABEZADO DE MODAL-->
                <div class="modal-header border-secondary">
                    <h5 class="modal-title text-info fw-bold" id="modalNuevoPuestoLabel">
                        <i class="bi bi-briefcase-fill me-2"></i>Nuevo Puesto
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <form action="guardarPuesto.php" method="POST">
                        <div class="modal-body p-4">
                            <label for="nombre_puesto" class="form-label text-secondary small fw-semibold text-white">Nombre del puesto</label>
                            <input type="text" name="nombre_puesto" class="form-control bg-dark text-white border-secondary shadow-none" required
                                id="nombre_puesto" value="<?= htmlspecialchars($_POST['nombre_puesto'] ?? '') ?>">

                            <div class="mb-3">
                                <label for="id_departamento" class="form-label text-secondary small fw-semibold text-white">Departamento</label>
                                <select name="id_departamento" id="id_departamento" class="form-select bg-dark text-white border-secondary shadow-none" required>
                                    <option value="">Seleccione un departamento</option>
                                    <?php foreach ($datos['departamentos'] as $departamento): ?>
                                        <option value="<?= $departamento['id_departamento'] ?>"><?= htmlspecialchars($departamento['nombre_departamento']) ?></option>
                                    <?php endforeach; ?>

                                </select>
                            </div>

                            <!--BOTONES DE ACCION DEL FORMULARIO-->
                            <div class="modal-footer border-secondary">
                                <button type="submit" class="btn btn-success btn-sm fw-bold rounded-3 px-3 text-white">Guardar</button>
                                <button type="button" class="btn btn-outline-danger btn-sm rounded-3 px-3" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!--MODAL PARA EDITAR PUESTOS-->

    <?php foreach ($datos['puestos'] as $puesto): ?>
        <div class="modal fade" id="modalEditar<?= $puesto['id_puesto']; ?>" tabindex="1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content bg-dark text-white border border-secondary rounded-4 shadow-lg">
                    <div class="modal-header border-secondary">

                        <h5 class="modal-title text-info fw-bold"><i class="bi bi-pencil-square me-2"></i>Editar Puesto</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form action="editarPuesto.php" method="POST">
                            <input type="hidden" name="id_puesto" value="<?= $puesto['id_puesto']; ?>">

                            <input type="text" name="nombre_puesto" class="form-control bg-dark text-white border-secondary shadow-none" value="<?= htmlspecialchars($puesto['nombre_puesto']); ?>" required>
                            <div class="mb-3 mt-3">
                                <label for="" class="form-label text-white small fw-semibold">Departamento</label>
                                <select name="id_departamento" id="id_departamento" class="form-select bg-dark text-white border-secondary shadow-none" required>
                                    <?php foreach ($datos['departamentos'] as $departamento): ?>
                                        <option value="<?= $departamento['id_departamento'] ?>"
                                            <?= ($departamento['id_departamento'] == $puesto['id_departamento']) ? 'selected' : ''; ?>>
                                            <?= htmlspecialchars($departamento['nombre_departamento']) ?>
                                        </option>
                                    <?php endforeach; ?>

                                </select>
                            </div>

                            <div class="modal-footer border-secondary">
                                <button type="submit" class="btn btn-success btn-sm fw-bold rounded-3 px-3 text-white">Guardar Cambios</button>
                                <button type="button" class="btn btn-danger btn-sm rounded-3 px-3 text-white" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    <?php endforeach; ?>



    <footer>Hecho por Daylin Yol 2026</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
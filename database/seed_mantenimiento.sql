/*
*************************************************************************
SECCION 5 - DATOS DUMMY PARA SISTEMAEMPLEADOS
Esta bd es la que utiliza el mantenimiento Seccion 6, implementado en PHP
Ejecutar despues de schema_mantenimiento.sql 

---NOTA: Este es un esquema simplificado, derivado de las entidades nucleo
del modelo normalizado de la seccion 3, priorizando el alcance del CRUD 
solicitado.
HECHO POR DAYLIN YOL
20/07/2026
*************************************************************************
*/

USE SistemaEmpleados;
GO

--DEPARTAMENTOS
INSERT INTO Departamento(nombre_departamento) VALUES
('Ventas'),
('Servicio al Cliente'),
('Bodega'),
('Contabilidad'),
('Recursos Humanos');

--PUESTO
INSERT INTO Puesto(nombre_puesto, id_departamento)VALUES
('Vendedor',1),
('Supervisor',1),
('Caja',2),
('Agente de Servicio al Cliente',2),
('Auxiliar de Bodega',3),
('Jefe de Bodega',3),
('Auxiliar Contable',4),
('Conciliaciones',4),
('Talento Humano',5),
('Gerente de Recursos Humanos',5);

--EMPLEADO
INSERT INTO Empleado (nombres, apellidos, dpi, fecha_nacimiento, fecha_ingreso, fecha_baja, id_puesto, id_departamento, estado) VALUES
('Ana', 'Garcia', '2950000000001', '1999-09-28', '2024-08-17', NULL, 1, 1, 1),
('Luis', 'Lopez', '2950000000002', '1991-03-26', '2025-08-21', NULL, 2, 1, 1),
('Maria', 'Martinez', '2950000000003', '1990-02-15', '2023-03-03', NULL, 1, 1, 1),
('Carlos', 'Hernandez', '2950000000004', '1986-10-13', '2024-11-24', NULL, 2, 1, 1),
('Sofia', 'Perez', '2950000000005', '1990-10-01', '2025-02-02', NULL, 3, 2, 1),
('Jose', 'Gonzalez', '2950000000006', '1986-04-08', '2025-01-25', NULL, 4, 2, 1),
('Andrea', 'Ramirez', '2950000000007', '1999-06-15', '2025-04-17', NULL, 3, 2, 1),
('Miguel', 'Torres', '2950000000008', '1992-11-10', '2024-01-22', NULL, 4, 2, 1),
('Paola', 'Flores', '2950000000009', '1987-08-21', '2023-07-18', NULL, 5, 3, 1),
('Diego', 'Rivera', '2950000000010', '1987-12-09', '2023-04-17', NULL, 6, 3, 1),
('Karla', 'Gomez', '2950000000011', '1994-01-03', '2025-02-13', NULL, 5, 3, 1),
('Fernando', 'Diaz', '2950000000012', '1988-05-13', '2021-01-28', NULL, 6, 3, 1),
('Daniela', 'Reyes', '2950000000013', '1985-04-07', '2021-08-13', NULL, 7, 4, 1),
('Ricardo', 'Morales', '2950000000014', '1997-07-03', '2025-11-07', NULL, 8, 4, 1),
('Gabriela', 'Castillo', '2950000000015', '1993-06-03', '2023-06-01', NULL, 7, 4, 1),
('Oscar', 'Ortiz', '2950000000016', '1998-02-05', '2022-12-04', NULL, 8, 4, 1),
('Lucia', 'Cruz', '2950000000017', '1985-01-15', '2024-03-22', NULL, 9, 5, 1),
('Sergio', 'Ramos', '2950000000018', '1991-08-17', '2022-12-25', NULL, 10, 5, 1),
('Monica', 'Vargas', '2950000000019', '1989-07-21', '2024-02-13', '2026-04-30', 9, 5, 0),
('Pablo', 'Chavez', '2950000000020', '1998-04-01', '2023-10-10', '2026-04-30', 10, 5, 0);


--ASIGNAR GENERENTE POR DEPTO
UPDATE Departamento SET id_gerente_encargado = 1 Where id_departamento = 1;
UPDATE Departamento SET id_gerente_encargado = 5 Where id_departamento = 2;
UPDATE Departamento SET id_gerente_encargado = 9 Where id_departamento = 3;
UPDATE Departamento SET id_gerente_encargado = 13 Where id_departamento = 4;
UPDATE Departamento SET id_gerente_encargado = 1 Where id_departamento = 5;

--CONTRATOS 
INSERT INTO Contrato (id_empleado, tipo_contrato, fecha_inicio, fecha_fin, estado) VALUES
(1, 'Temporal', '2024-08-17', NULL, 1),
(2, 'Por Servicios Profesionales', '2025-08-21', NULL, 1),
(3, 'Indefinido', '2023-03-03', NULL, 1),
(4, 'Temporal', '2024-11-24', NULL, 1),
(5, 'Por Servicios Profesionales', '2025-02-02', NULL, 1),
(6, 'Indefinido', '2025-01-25', NULL, 1),
(7, 'Temporal', '2025-04-17', NULL, 1),
(8, 'Por Servicios Profesionales', '2024-01-22', NULL, 1),
(9, 'Indefinido', '2023-07-18', NULL, 1),
(10, 'Temporal', '2023-04-17', NULL, 1),
(11, 'Por Servicios Profesionales', '2025-02-13', NULL, 1),
(12, 'Indefinido', '2021-01-28', NULL, 1),
(13, 'Temporal', '2021-08-13', NULL, 1),
(14, 'Por Servicios Profesionales', '2025-11-07', NULL, 1),
(15, 'Indefinido', '2023-06-01', NULL, 1),
(16, 'Temporal', '2022-12-04', NULL, 1),
(17, 'Por Servicios Profesionales', '2024-03-22', NULL, 1),
(18, 'Indefinido', '2022-12-25', NULL, 1),
(19, 'Temporal', '2024-02-13', '2026-04-30', 0),
(20, 'Por Servicios Profesionales', '2023-10-10', '2026-04-30', 0);

--SALARIOS
INSERT INTO Salarios(id_empleado, monto, fecha_inicio, fecha_fin, estado)VALUES
(1, 4000.00, '2025-08-10', NULL, 1),
(2, 7250.00, '2025-08-21', NULL, 1),
(3, 4250.00, '2023-03-03', NULL, 1),
(4, 7250.00, '2024-11-24', NULL, 1),
(5, 3975.00, '2025-02-02', NULL, 1),
(6, 6200.00, '2025-01-25', NULL, 1),
(7, 4000.00, '2025-04-17', NULL, 1),
(8, 6200.00, '2024-01-22', NULL, 1),
(9, 3900.00, '2023-07-18', NULL, 1),
(10, 6000.00, '2023-04-17', NULL, 1),
(11, 3500.00, '2025-02-13', NULL, 1),
(12, 6000.00, '2021-01-28', NULL, 1),
(13, 4500.00, '2021-08-13', NULL, 1),
(14, 9700.00, '2025-11-07', NULL, 1),
(15, 4250.00, '2023-06-01', NULL, 1),
(16, 9040.00, '2022-12-04', NULL, 1),
(17, 4555.00, '2024-03-22', NULL, 1),
(18, 7870.00, '2022-12-25', NULL, 1),
(19, 4585.00, '2024-02-13', '2026-04-30', 0),
(20, 7900.00, '2023-10-10', '2026-04-30', 0);

--HISTORIAL DE SALARIOS
INSERT INTO HistorialSalarios(id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo)VALUES
(1, 3800.0, 4200.0, '2025-08-01 09:10:19', 'Ajuste anual'),
(5, 3600.0, 3900.0, '2025-06-10 12:10:00', 'Evaluacion de desempeno'),
(9, 3500.0, 3800.0, '2025-09-10 13:19:01', 'Ajuste anual'),
(13, 4300.0, 4600.0, '2025-07-01 16:18:04', 'Evaluacion de desempeno'),
(17, 4000.0, 4300.0, '2025-10-05 09:00:00', 'Ajuste anual'),
(11, 5000.00, 5500.00, '2025-11-15 09:00:00', 'Ajuste anual');

--HISTORIAL DE PUESTOS
INSERT INTO HistorialPuestos(id_empleado, id_puesto_anterior, id_puesto_nuevo, fecha_cambio, motivo)VALUES
(2,1,2, '2025-03-01 10:11:09', 'Promocion a Supervisor'),
(6,3,4, '2024-02-10 17:01:18', 'Promocion a Agente de servicio al cliente');

--HISTORIAL DE DEPARTAMENTOS
INSERT INTO HistorialDepartamento(id_empleado, id_departamento_anterior, id_departamento_nuevo, fecha_cambio, motivo) VALUES
(3,2,1, '2024-11-01 11:00:00', 'Reasignacion a ventas');

--BITACORA DE AUDITORIA
INSERT INTO BitacoraAuditoria(nombre_tabla_afectada, id_registro_afectado, accion, id_empleado, fecha, detalle)VALUES
('Empleado', 19, 'UPDATE', 1, '2026-04-30 08:30:00', 'Baja logica por finalizacion de contrato'),
('Empleado', 20, 'UPDATE', 1, '2026-04-30 08:35:00', 'Baja logica por finalizacion de contrato'),
('Salarios', 1, 'UPDATE', 5, '2025-08-01 09:00:00', 'Actualizacion de salario por ajuste anual');
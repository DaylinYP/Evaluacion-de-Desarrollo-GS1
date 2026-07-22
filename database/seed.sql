
/*

****************************************************************************
SECCION 3.3 DATOS DUMMY PARA LAS CONSULTAS
HECHO POR DAYLIN YOL 
19/07/2026
****************************************************************************
*/
USE AdminEmpleados;
GO

--SUBDIRECCION
INSERT INTO Subdireccion(nombre) VALUES
('Subdireccion Administrativa'),
('Subdireccion Comercial');

--UNIDAD FUNCIONAL
INSERT INTO UnidadFuncional(nombre_unidad_funcional, id_subdireccion) VALUES
('Unidad de Servicio al Cliente', 1),
('Unidad de Bodega y Recursos', 1),
('Unidad Financiera', 2);

--UNIDAD OPERATIVA
INSERT INTO UnidadOperativa(nombre_unidad_operativa, id_unidad_funcional)VALUES
('Operativa de Atencion', 1),
('Operativa de Bodega', 2),
('Operativa de Personal', 2),
('Operativa de Gestiones', 3),
('Operativa de Contable', 3);

-- DEPARTAMENTO
INSERT INTO Departamento(nombre_departamento, id_unidad_operativa, descripcion) VALUES
('Servicio al Cliente', 1, 'Soporte y atenci�n'),
('Bodega', 2, 'Control de paqueteria e inventario'),
('Recursos Humanos', 3, 'Encargado de gesti�n de personal y nomina'),
('Gestiones', 4, 'Revision de recibos y documentos'),
('Contabilidad', 5, 'Control de depositos y gestion financiera');

-- PUESTO
INSERT INTO Puesto(nombre_puesto, id_departamento, salario) VALUES
('Agente de Servicio al Cliente', 1, 5000.00),
('Auxiliar de Servicio al Cliente', 1, 4500.00),
('Auxiliar de Bodega', 2, 4000.00),
('Jefe de Bodega', 2, 8000.00),
('Gerente de Recursos Humanos', 3, 8000.00),
('Talento Humano', 3, 5000.00),
('Gerente de Gestiones', 4, 8500.00),
('Asistente de Gestiones', 4, 6500.00),
('Contador', 5, 7000.00),
('Auxiliar Contable', 5, 6000.00);

USE AdminEmpleados;
GO


-- EMPLEADO
INSERT INTO Empleado(nombres, apellidos, dpi, fecha_nacimiento, fecha_ingreso, fecha_baja, id_puesto, id_departamento, estado) VALUES
('Karla Gabriela','Gonzalez Hernandez', '385567890202', '2000-12-23', '2023-05-23', '2026-02-02', 1, 1, 0),
('Yurim Graciela','Ramirez Lopez', '385543210202', '1978-10-15', '2008-03-22', '2024-01-05', 1, 1, 0),
('Andrea Rafaela','Perez Lopez', '347843210221', '1990-03-02', '2010-04-03', NULL, 1, 1, 1),
('Fredy Gerardo','Morales Amaya', '345673210201', '2003-10-15', '2025-04-09', NULL, 1, 1, 1),
('Amelia Alejandra','Recinos Hernandez', '390673214301', '2000-01-28', '2025-04-09', NULL, 2, 1, 1),
('Ofelia Odilia','Herrera Herrarte', '30000000001', '2003-07-12', '2024-09-12', NULL, 3, 2, 1),
('Ingrid Suceli','Santos Real', '30000000021', '2002-07-12', '2026-02-06', NULL, 3, 2, 1),
('Manuel Jesus', 'Orantes Solares', '30000000031', '1992-04-11', '2026-04-10', NULL, 4, 2, 1),
('Emerson Misael', 'Ramirez Ronquillo', '30000000041', '1990-12-12', '2020-02-01', NULL, 3, 2, 1),
('Diana Beatriz','Chacon Solis', '30000000051', '1995-05-20', '2022-08-15', NULL, 2, 1, 1),
('Josue David','Marroquin Tzul', '30000000061', '1994-02-18', '2023-01-10', NULL, 3, 2, 1),
('Silvia Patricia','Coy Xitumul', '30000000071', '1988-09-30', '2019-11-05', NULL, 4, 2, 1),
('Estuardo Rene','Barrios Cabrera', '30000000081', '1985-06-14', '2015-03-01', NULL, 5, 3, 1),
('Lourdes Marisol','Ical Ba', '30000000091', '1993-11-22', '2021-07-19', NULL, 6, 3, 1),
('Byron Alexander','Cua Sic', '30000000101', '1991-01-05', '2022-02-14', NULL, 5, 3, 1),
('Heidy Rocio','Tzoc Ixcoy', '30000000111', '1996-08-08', '2023-09-01', NULL, 6, 3, 1),
('Marvin Estuardo','Choc Pop', '30000000121', '1989-04-27', '2020-06-10', NULL, 5, 3, 1),
('Alba Nineth','Sub Chub', '30000000131', '1997-03-15', '2024-03-01', NULL, 6, 3, 1),
('Walter Danilo','Camposeco Ajanel', '30000000141', '1986-12-01', '2016-05-05', NULL, 7, 4, 1),
('Vilma Yolanda','Ramirez Tuc', '30000000151', '1994-06-19', '2022-10-10', NULL, 8, 4, 1),
('Erick Fernando','Garcia Ochoa', '30000000161', '1990-09-09', '2018-01-20', NULL, 7, 4, 1),
('Rosa Idalia','Quiroz Caal', '30000000171', '1999-02-25', '2023-04-15', '2025-12-01', 8, 4, 0),
('Cristian Omar','Torres Sian', '30000000181', '1992-07-30', '2019-08-08', NULL, 7, 4, 1),
('Nancy Elizabeth','Yol Pastor', '30000000191', '1995-10-10', '2021-01-01', NULL, 8, 4, 1),
('Julio Cesar','Batz Gonzalez', '30000000201', '1987-03-03', '2017-06-06', NULL, 9, 5, 1),
('Brenda Lucia','Morales Pu', '30000000211', '1993-05-05', '2020-09-09', NULL, 10, 5, 1),
('Kevin Josue','Chic Tum', '30000000221', '1996-11-11', '2022-12-12', NULL, 9, 5, 1),
('Ana Gabriela','Torres Morales', '30000000231', '1998-01-01', '2023-03-03', NULL, 10, 5, 1),
('Pedro Antonio','Arrivillaga Castro', '30000000241', '1984-08-08', '2014-04-04', NULL, 9, 5, 1),
('Melissa Andrea','Santos Ba', '30000000251', '1997-09-09', '2024-05-05', NULL, 10, 5, 1);

--TIPO DE CONTRATO
INSERT INTO TipoContrato(nombre_contrato, descripcion)VALUES
('Indefinido', 'Contrato sin fecha de fin'),
('Temporal', 'Contrato con fecha de inicio y fecha fin'),
('Por servicios', 'Contrato facturado para freelancers, etc');

--CONTRATO
INSERT INTO Contrato(id_tipo_contrato, id_empleado, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, '2023-05-23', '2026-02-02', 0),
(1, 2, '2008-03-22', '2024-01-05', 0),
(1, 3, '2010-04-03', NULL, 1),
(2, 4, '2025-04-09', NULL, 1),
(2, 5, '2025-04-09', NULL, 1),
(3, 6, '2024-09-12', NULL, 1),
(1, 7, '2026-02-06', NULL, 1),
(2, 8, '2026-04-10', NULL, 1),
(1, 9, '2020-02-01', NULL, 1),
(3, 10, '2022-08-15', NULL, 1),
(1, 11, '2023-01-10', NULL, 1),
(2, 12, '2019-11-05', NULL, 1),
(1, 13, '2015-03-01', NULL, 1),
(3, 14, '2021-07-19', NULL, 1),
(1, 15, '2022-02-14', NULL, 1),
(2, 16, '2023-09-01', NULL, 1),
(1, 17, '2020-06-10', NULL, 1),
(3, 18, '2024-03-01', NULL, 1),
(1, 19, '2016-05-05', NULL, 1),
(2, 20, '2022-10-10', NULL, 1),
(1, 21, '2018-01-20', NULL, 1),
(1, 22, '2023-04-15', '2025-12-01', 0),
(2, 23, '2019-08-08', NULL, 1),
(3, 24, '2021-01-01', NULL, 1),
(1, 25, '2017-06-06', NULL, 1),
(2, 26, '2020-09-09', NULL, 1),
(1, 27, '2022-12-12', NULL, 1),
(3, 28, '2023-03-03', NULL, 1),
(1, 29, '2014-04-04', NULL, 1),
(2, 30, '2024-05-05', NULL, 1);

--HISTORIAL DE SALARIOS
INSERT INTO HistorialSalarios(id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo) VALUES
(3, 4000.00, 4500.00, '2022-06-02', 'Evaluacion de desempenio'),
(9, 4500.00, 4900.00, '2023-01-15', 'Ajuste anual'),
(13, 7000.00, 7500.00, '2024-03-01', 'Aumento por antiguedad'),
(19, 8000.00, 9000.00, '2023-12-02', 'Ajuste de mercado'),
(25, 6500.00, 7500.00, '2022-11-03', 'Evaluacion de desempenio'),
(30, 4000.00, 4500.00, '2023-06-02', 'Evaluacion de desempenio');

--HISTORIAL DE PUESTOS
INSERT INTO HistorialPuestos(id_empleado, id_puesto_anterior, id_puesto_nuevo, fecha_cambio, motivo)VALUES
(3, 2, 1, '2022-06-2', 'Promocion a Agente de Servicio al Cliente'),
(9, 4, 3, '2021-03-10', 'Reasignacion a Auxiliar de Bodega'),
(13, 6, 5, '2023-08-01', 'Promocion a Gerente de Recursos Humanos'),
(19, 8, 7, '2022-01-15', 'Promocion a Gerente de Gestiones');

--HISTORIAL DE DEPARTAMENTOS
INSERT INTO HistorialDepartamento(id_empleado, id_departamento_anterior, id_departamento_nuevo, fecha_cambio, motivo) VALUES
(6,1,2, '2023-05-01', 'Reasignacion a bodega'),
(11,3,2, '2022-09-15', 'Reasignacion a bodega'),
(17,2,3, '2021-12-01', 'Reasignacion a Recursos Humanos');

--BITACORA DE AUDITORIA
INSERT INTO BitacoraAuditoria(nombre_tabla_afectada, id_registro_afectado, accion, id_empleado, fecha, detalle)VALUES
('Empleado', 1, 'UPDATE', 13, '2026-02-02 09:00:01', 'Baja logica por finalizacion de contrato'),
('Empleado', 2, 'UPDATE', 13, '2024-01-12 11:22:12', 'Baja logica por finalizacion de contrato'),
('Empleado',22, 'UPDATE', 19, '2025-12-14 08:56:09', 'Baja logica por finalizacion de contrato'),
('Puesto', 5, 'INSERT', 13, '2020-06-10 09:10:19', 'Creacion de puesto Gerente de Recursos Humanos'),
('Depatamento', 3, 'INSERT', 13, '2015-03-01 16:49:10', 'Creacion de departamento Recursos Humanos');
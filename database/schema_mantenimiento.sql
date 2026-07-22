/*
**********************************************************************************
SECCION 5 CREACION DE BD Y TABLAS - SistemaEmpleados
HECHO POR: DAYLIN YOL
20/07/2026
**********************************************************************************
*/

CREATE DATABASE SistemaEmpleados;
USE SistemaEmpleados;
GO

CREATE TABLE Departamento (
	id_departamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre_departamento VARCHAR(100) NOT NULL,
	id_gerente_encargado INT,
	estado BIT DEFAULT 1 NOT NULL,
);

CREATE TABLE Puesto(
	id_puesto INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre_puesto VARCHAR(100) NOT NULL,
	id_departamento INT NOT NULL,
		CONSTRAINT FK_Puesto_Departamento FOREIGN KEY(id_departamento)
		REFERENCES Departamento(id_departamento)
);
ALTER TABLE Puesto
ADD estado BIT NOT NULL DEFAULT 1;

--Nunca se elimina un registro, se preserva el historial con estado 1 o 0
CREATE TABLE Empleado(
	id_empleado INT PRIMARY KEY IDENTITY(1,1),
	nombres VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL,
	dpi VARCHAR(20) NOT NULL UNIQUE,
	fecha_nacimiento DATE,
	fecha_ingreso DATE,
	fecha_baja DATE,
	fecha_creacion DATETIME DEFAULT GETDATE(),
	id_puesto INT,
	id_departamento INT,
	estado BIT DEFAULT 1 NOT NULL,

		CONSTRAINT FK_Empleado_Puesto FOREIGN KEY(id_puesto)
		REFERENCES Puesto(id_puesto),
		CONSTRAINT FK_Empleado_Departamento FOREIGN KEY(id_departamento)
		REFERENCES Departamento(id_departamento)
);
--Se vincula por alter table porque la tabla Empleado requiere previamente la 
--existencia de la tabla Departamento creando una dependencia
ALTER TABLE Departamento
	ADD CONSTRAINT FK_Departamento_Empleado FOREIGN KEY(id_gerente_encargado)
	REFERENCES Empleado(id_empleado);

CREATE TABLE Contrato(
	id_contrato INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_empleado INT NOT NULL,
	tipo_contrato VARCHAR(50) NOT NULL,
	fecha_inicio DATETIME NOT NULL,
	fecha_fin DATETIME NULL,
	estado BIT DEFAULT 1 NOT NULL,
		CONSTRAINT FK_Contrato_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado)
);

CREATE TABLE Salarios(
	id_salario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_empleado INT NOT NULL,
	monto DECIMAL(10,2) NOT NULL,
	fecha_inicio DATETIME NOT NULL DEFAULT GETDATE(),
	fecha_fin DATETIME NULL,
	estado BIT DEFAULT 1 NOT NULL,
		CONSTRAINT FK_Salarios_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado)
);

CREATE TABLE HistorialSalarios(
	id_historial_salarios INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_empleado INT NOT NULL,
	salario_anterior DECIMAL(10,2) NOT NULL,
	salario_nuevo DECIMAL(10,2) NOT NULL,
	fecha_cambio DATETIME NOT NULL DEFAULT GETDATE(),
	motivo VARCHAR(100) NULL,

		CONSTRAINT FK_HistorialSalarios_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado)
);

-- Cada cambio genera un registro nuevo evita redundancia en Empleado y persistencia historica
CREATE TABLE HistorialPuestos(
	id_historial_puestos INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_empleado INT NOT NULL,
	id_puesto_anterior INT NOT NULL,
	id_puesto_nuevo INT NOT NULL,
	fecha_cambio DATETIME NOT NULL,
	motivo VARCHAR(100) NULL,

		CONSTRAINT FK_HistorialPuestos_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado),
		CONSTRAINT FK_HistorialPuestos_PuestoAnterior FOREIGN KEY(id_puesto_anterior)
		REFERENCES Puesto(id_puesto),
		CONSTRAINT FK_HistorialPuestos_PuestoNuevo FOREIGN KEY(id_puesto_nuevo)
		REFERENCES Puesto(id_puesto)
	
);

-- Cada cambio genera un registro nuevo evita redundancia en Empleado y persistencia historica
CREATE TABLE HistorialDepartamento(
	id_historial_departamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_empleado INT NOT NULL,
	id_departamento_anterior INT NOT NULL,
	id_departamento_nuevo INT NOT NULL,
	fecha_cambio DATETIME NOT NULL,
	motivo VARCHAR(100) NULL,

		CONSTRAINT FK_HistorialDepartamento_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado),
		CONSTRAINT FK_HistorialDepartamento_DepartamentoAnterior FOREIGN KEY(id_departamento_anterior)
		REFERENCES Departamento(id_departamento),
		CONSTRAINT FK_HistorialDepartamento_DepartamentoNuevo FOREIGN KEY(id_departamento_nuevo) 
		REFERENCES Departamento(id_departamento)
);

-- id_empleado es NULL para permitir acciones por procesos automaticos de parte del sistema
CREATE TABLE BitacoraAuditoria(
	id_bitacora INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre_tabla_afectada VARCHAR(100) NOT NULL,
	id_registro_afectado INT NOT NULL,
	accion VARCHAR(50) NOT NULL,
	id_empleado INT NULL, 
	fecha DATETIME DEFAULT GETDATE() NOT NULL,
	detalle VARCHAR(MAX) NULL,

		CONSTRAINT FK_BitacoraAuditoria_Empleado FOREIGN KEY(id_empleado)
		REFERENCES Empleado(id_empleado)
);




/*
****************************************************************
	QUERIES.SQL
	Archivo con todas las consultas solicitadas, tanto seccion 4
	como seccion 5.
	
	HECHO POR DAYLIN YOL
	20/07/2026
****************************************************************

****************************************************************
	SECCION 4 CONSULTAS
	Tabla independiente para practica de consutlas
****************************************************************
*/
CREATE TABLE movimientos_empleados(
	id_movimiento INT IDENTITY(1,1) PRIMARY KEY,
	id_empleado INT NOT NULL,
	fecha_movimiento DATE NOT NULL,
	tipo_movimiento VARCHAR(50) NOT NULL,
	salario DECIMAL(10,2) NULL,
	id_departamento INT NOT NULL
);
INSERT INTO movimientos_empleados(id_empleado, fecha_movimiento, tipo_movimiento, salario, id_departamento)VALUES
(1, '2022-01-10', 'cambio_salario', 4500,1),
(1, '2023-01-11', 'alta', 5500.00,1),
(1, '2023-10-01', 'cambio_departamento', NULL,2),
(2, '2021-05-19', 'alta', NULL,2),
(2, '2022-05-10', 'cambio_salario', 7000.00, 2),
(2, '2023-05-09', 'cambio_salario', 9900.00, 2),
(2, '2024-05-15', 'cambio_salario', 12000.00, 2),
(3, '2020-04-01', 'alta', NULL, 3),
(3, '2020-08-05', 'baja', NULL, 3),
(2, '2026-02-01', 'cambio_departamento', NULL, 1),
(2, '2026-04-03', 'cambio_departamento', NULL, 2),
(2, '2026-05-19', 'cambio_departamento', NULL, 3),
(2, '2026-07-29', 'cambio_departamento', NULL, 2);




SELECT * FROM movimientos_empleados

-- EJERCICIO 1: OBTENER SALARIO ACTUAL DE CADA EMPLEADO
/*
	Buscamos las fechas mas altas y luego se une para que coincida fecha
	del ultimo movimiento y id de la tabla completa, extrayendo el salario
	ademas que se excluye lo que es NUll, NOT NULL aplica dentro y fuera del join
*/
SELECT M.id_empleado, M.salario, M.fecha_movimiento FROM movimientos_empleados M
INNER JOIN (
	SELECT id_empleado, MAX(fecha_movimiento) AS ultima_fecha
	FROM movimientos_empleados
	WHERE salario IS NOT NULL
	GROUP BY id_empleado
) x ON M.id_empleado = x.id_empleado AND M.fecha_movimiento = x.ultima_fecha
WHERE M.salario IS NOT NULL;

-- EJERCICIO 2: OBTENER EL HISTORICO DE SALARIO DE X EMPLEADO
SELECT id_empleado, fecha_movimiento, tipo_movimiento, salario 
FROM movimientos_empleados
WHERE id_empleado = 1 ORDER BY fecha_movimiento ASC

--EJERCICIO 3: PROMEDIO SALARIAL POR DEPTO Y MES CONSIDERANDO EMPLEADO ESTADO=1
SELECT M.id_departamento, YEAR(M.fecha_movimiento) AS anio,
	MONTH(M.fecha_movimiento) AS mes,
	AVG(M.salario) AS promedio_salarial
	FROM movimientos_empleados M
	WHERE M.salario is not null
	AND M.id_empleado IN(

	SELECT M.id_empleado
	FROM movimientos_empleados M
	INNER JOIN(
		SELECT id_empleado, MAX(fecha_movimiento) AS ultima_fecha
		FROM movimientos_empleados
		GROUP BY id_empleado 
	) X ON M.id_empleado = X.id_empleado
		AND M.fecha_movimiento = X.ultima_fecha WHERE M.tipo_movimiento <> 'baja'
)
GROUP BY M.id_departamento, YEAR(M.fecha_movimiento), MONTH(fecha_movimiento);


-- EJERCICIO 4: DETECTAR EMPLEADOS > 3 CAMBIOS DE DEPTOS EN LOS ULTIMOS 2 MESES
	SELECT id_empleado, COUNT(*) AS total_cambios_empleado
	FROM movimientos_empleados
	WHERE tipo_movimiento = 'cambio_departamento' AND fecha_movimiento >= DATEADD(month, -24, GETDATE())
	GROUP BY id_empleado
	HAVING COUNT(*) > 3 --deja pasar a los que tengan mas de 3 cambios

-- EJERCICIO 5: IMPLEMENTAR FUNCION QUE REALICE UN FORWARD FILL DEL SALARIO
-- UTILIZANDO EL ULTIMO SALARIO CONOCIDO CUANDO EXISTAN VALORES NULOS
SELECT M.id_movimiento, M.id_empleado, M.fecha_movimiento, M.tipo_movimiento, M.salario AS salario_original,
		coalesce(M.salario, x.salario) AS salario_relleno
FROM movimientos_empleados M
OUTER APPLY(
	SELECT TOP 1 A.salario
	FROM movimientos_empleados A
	WHERE A.id_empleado = M.id_empleado
	AND A.salario IS NOT NULL AND A.fecha_movimiento <= M.fecha_movimiento
	ORDER BY A.fecha_movimiento DESC, A.id_movimiento DESC
)x 
ORDER BY M.id_empleado, M.fecha_movimiento



/*
*************************************************************************
SECCION 5 - CONSULTAS SOBRE SistemaEmpleados
(esquema de mantenimiento operativo, ver schema_mantenimiento.sql)
HECHO POR DAYLIN YOL
20/07/2026
*************************************************************************
*/

USE SistemaEmpleados;
GO

--EJERCICIO 1: EMPLEADOS ACTIVOS CON LOS SALARIOS MAS ALTOS
Select TOP 10
	E.nombres,
	E.apellidos,
	D.nombre_departamento,
	P.nombre_puesto,
	S.monto AS salario_actual 
	FROM Empleado E
	INNER JOIN Salarios S ON E.id_empleado = S.id_empleado
	INNER JOIN Departamento D ON E.id_departamento = D.id_departamento
	INNER JOIN Puesto P ON E.id_puesto = P.id_puesto
	WHERE E.estado = 1 AND S.estado = 1 ORDER BY S.monto DESC

-- EJERCICIO 2: LISTADO DE EMPLEADOS APELLIDOS DESC Y NOMBRES ASC
SELECT E.nombres, E.apellidos, D.nombre_departamento, P.nombre_puesto, E.estado
FROM Empleado E 
INNER JOIN Departamento D ON E.id_departamento = D.id_departamento
INNER JOIN Puesto P ON E.id_puesto = P.id_puesto 
ORDER BY apellidos DESC, nombres ASC;

--EJERCICIO 3: LISTADO DE EMPLEADOS POR DEPARTAMENTO
SELECT E.nombres, E.apellidos, D.nombre_departamento, P.nombre_puesto
FROM Empleado E
INNER JOIN Puesto P ON E.id_puesto = P.id_puesto
INNER JOIN Departamento D ON E.id_departamento = D.id_departamento
WHERE E.estado = 1 ORDER BY D.nombre_departamento ASC, E.apellidos ASC;

--EJERCICIO 4: PROMEDIO SALARIAL DE LOS ULTIMOS DOCE MESES PARA EMPLEADOS
-- CON MENOR SALARIO ACTUAL

SELECT E.id_empleado, E.nombres, E.apellidos, AVG(X.monto) AS promedio_salarial
FROM Empleado E
INNER JOIN 
	(
	SELECT id_empleado, salario_nuevo AS monto, fecha_Cambio
	FROM HistorialSalarios HS
	WHERE fecha_cambio >= DATEADD(MONTH, -12, GETDATE())
	UNION ALL
	SELECT id_empleado, monto, fecha_inicio
	FROM Salarios WHERE estado = 1 AND fecha_inicio >= DATEADD(MONTH, -12, GETDATE())	
	) X ON E.id_empleado = X.id_empleado
	WHERE E.id_empleado in(
		SELECT S.id_empleado
		FROM Salarios S
		INNER JOIN Empleado EE ON S.id_empleado = EE.id_empleado
		WHERE S.estado = 1 AND EE.estado = 1
		AND S.monto = (SELECT MIN(monto) FROM Salarios WHERE estado = 1)
	)GROUP BY E.id_empleado, E.nombres, E.apellidos;



--EJERCICIO 5: MOSTRAR DEPARTAMENTO, JEFE DE DEPTO Y EMPLEADOS PERTENECIENTES
SELECT E.nombres, E.apellidos, D.nombre_departamento, J.nombres + ' ' + J.apellidos AS jefe_departamento, P.nombre_puesto
FROM Empleado E
INNER JOIN Departamento D ON E.id_departamento = D.id_departamento 
INNER JOIN Puesto P ON E.id_puesto = P.id_puesto
LEFT JOIN Empleado J ON D.id_gerente_encargado = J.id_empleado
WHERE E.estado = 1 ORDER BY D.nombre_departamento ASC




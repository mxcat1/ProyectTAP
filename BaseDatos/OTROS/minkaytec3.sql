-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-12-2022 a las 16:53:42
-- Versión del servidor: 10.10.2-MariaDB-log
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minkaytec3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `idActividades` int(11) NOT NULL,
  `idCompendio` int(11) NOT NULL,
  `detalleactividad` longtext DEFAULT NULL,
  `tiempo` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compendiosactividades`
--

CREATE TABLE `compendiosactividades` (
  `idCompendiosActividades` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `detalle_compendio` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantespagos`
--

CREATE TABLE `comprobantespagos` (
  `idComprobantesPagos` int(11) NOT NULL,
  `idsolicitudes` int(11) NOT NULL,
  `tipo_comprobante` enum('Boleta','Factura','Recibo Honorario') NOT NULL,
  `serie_comprobante` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nro_comprobante` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `igv` decimal(10,0) NOT NULL,
  `monto_total` decimal(10,0) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_solicitud_repuesto`
--

CREATE TABLE `detalle_solicitud_repuesto` (
  `idRepuestos` int(11) NOT NULL,
  `idSolicitudes` int(11) NOT NULL,
  `precio_real` decimal(10,0) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `idDevoluciones` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `idDispositivos` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `idEntradas` int(11) NOT NULL,
  `idproveedores` int(11) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `monto` decimal(16,2) NOT NULL,
  `serie_factura` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nro_factura` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `idHorarios` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado') NOT NULL,
  `hora_inicio` time NOT NULL,
  `Hora_fin` time NOT NULL,
  `turno` enum('Dia','Tarde') NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horastecnico`
--

CREATE TABLE `horastecnico` (
  `idHoraTec` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estadoHora` bit(1) NOT NULL DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horastecnico_solicitudes`
--

CREATE TABLE `horastecnico_solicitudes` (
  `idHorasTec` int(11) NOT NULL,
  `idSolicitudes` int(11) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `idimagenes` int(11) NOT NULL,
  `idActividad` int(11) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL,
  `nro_ruc` varchar(13) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `telefono` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `idRepuestos` int(11) NOT NULL,
  `numero_serie` varchar(45) NOT NULL,
  `modelo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `stock` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos_entradas`
--

CREATE TABLE `repuestos_entradas` (
  `idRepuestos` int(11) NOT NULL,
  `idEntradas` int(11) NOT NULL,
  `precio` decimal(16,2) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `subtotal` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos_entradas_devoluciones`
--

CREATE TABLE `repuestos_entradas_devoluciones` (
  `idRepuestos` int(11) NOT NULL,
  `idEntradas` int(11) NOT NULL,
  `idDevoluciones` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicios` int(11) NOT NULL,
  `idDispositivos` int(11) NOT NULL,
  `nombre_servicio` varchar(250) NOT NULL,
  `detalle_servicio` varchar(250) NOT NULL,
  `tiempo_aprox` int(11) DEFAULT NULL,
  `precio_servicio` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idSolicitudes` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `modo_servicio` enum('Precensial','Virtual') NOT NULL,
  `estado` enum('Aceptado','En Proceso','Reprogramado','Completado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_servicios`
--

CREATE TABLE `solicitudes_servicios` (
  `idSolicitudes` int(11) NOT NULL,
  `idServicios` int(11) NOT NULL,
  `precio_real` decimal(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioespecialidad`
--

CREATE TABLE `usuarioespecialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `tipo_documento` enum('DNI','RUC','OTROS') NOT NULL,
  `numero_documento` varchar(12) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `estado` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`idActividades`),
  ADD KEY `fk_Actividades_CompendiosActividades1_idx` (`idCompendio`);

--
-- Indices de la tabla `compendiosactividades`
--
ALTER TABLE `compendiosactividades`
  ADD PRIMARY KEY (`idCompendiosActividades`);

--
-- Indices de la tabla `comprobantespagos`
--
ALTER TABLE `comprobantespagos`
  ADD PRIMARY KEY (`idComprobantesPagos`),
  ADD KEY `fk_ComprobantesPagos_solicitudes1_idx` (`idsolicitudes`);

--
-- Indices de la tabla `detalle_solicitud_repuesto`
--
ALTER TABLE `detalle_solicitud_repuesto`
  ADD KEY `fk_Repuestos_has_solicitudes_solicitudes1_idx` (`idSolicitudes`),
  ADD KEY `fk_Repuestos_has_solicitudes_Repuestos1_idx` (`idRepuestos`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`idDevoluciones`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`idDispositivos`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`idEntradas`),
  ADD UNIQUE KEY `serie_factura_UNIQUE` (`serie_factura`),
  ADD UNIQUE KEY `nro_factura_UNIQUE` (`nro_factura`),
  ADD KEY `fk_entradas_proveedores1_idx` (`idproveedores`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idHorarios`);

--
-- Indices de la tabla `horastecnico`
--
ALTER TABLE `horastecnico`
  ADD PRIMARY KEY (`idHoraTec`),
  ADD KEY `fk_Citas_has_Horario_idx` (`idHorario`),
  ADD KEY `fk_Agenda_has_UsrRol_idx` (`idUser`,`idRol`);

--
-- Indices de la tabla `horastecnico_solicitudes`
--
ALTER TABLE `horastecnico_solicitudes`
  ADD KEY `fk_Citas_has_solicitudes_solicitudes1_idx` (`idSolicitudes`),
  ADD KEY `fk_HoraTec_solicitudes_has_Citas1_idx` (`idHorasTec`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`idimagenes`),
  ADD KEY `fk_Imagenes_Actividades1_idx` (`idActividad`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedores`),
  ADD UNIQUE KEY `nro_ruc_UNIQUE` (`nro_ruc`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`idRepuestos`),
  ADD UNIQUE KEY `numero_serie_UNIQUE` (`numero_serie`);

--
-- Indices de la tabla `repuestos_entradas`
--
ALTER TABLE `repuestos_entradas`
  ADD PRIMARY KEY (`idRepuestos`,`idEntradas`),
  ADD KEY `fk_Repuestos_has_entradas_entradas1_idx` (`idEntradas`),
  ADD KEY `fk_Repuestos_has_entradas_Repuestos1_idx` (`idRepuestos`);

--
-- Indices de la tabla `repuestos_entradas_devoluciones`
--
ALTER TABLE `repuestos_entradas_devoluciones`
  ADD PRIMARY KEY (`idRepuestos`,`idEntradas`,`idDevoluciones`),
  ADD KEY `fk_Repuestos_entradas_has_devoluciones_devoluciones1_idx` (`idDevoluciones`),
  ADD KEY `fk_Repuestos_entradas_has_devoluciones_Repuestos_entradas1_idx` (`idRepuestos`,`idEntradas`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicios`),
  ADD KEY `fk_Servicios_Dispositivos1_idx` (`idDispositivos`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`idSolicitudes`);

--
-- Indices de la tabla `solicitudes_servicios`
--
ALTER TABLE `solicitudes_servicios`
  ADD KEY `fk_solicitudes_has_Servicios_Servicios1_idx` (`idServicios`),
  ADD KEY `fk_solicitudes_has_Servicios_solicitudes1_idx` (`idSolicitudes`);

--
-- Indices de la tabla `usuarioespecialidad`
--
ALTER TABLE `usuarioespecialidad`
  ADD KEY `fk_Especialidad_has_Usuario_Usuario1_idx` (`idUsuario`),
  ADD KEY `fk_Especialidad_has_Usuario_Especialidad_idx` (`idEspecialidad`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`idUsuario`,`idRol`),
  ADD KEY `fk_Usuario_has_Rol_Rol1_idx` (`idRol`),
  ADD KEY `fk_Usuario_has_Rol_Usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `idActividades` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compendiosactividades`
--
ALTER TABLE `compendiosactividades`
  MODIFY `idCompendiosActividades` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobantespagos`
--
ALTER TABLE `comprobantespagos`
  MODIFY `idComprobantesPagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `idDevoluciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `idDispositivos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `idEntradas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `idHorarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horastecnico`
--
ALTER TABLE `horastecnico`
  MODIFY `idHoraTec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `idimagenes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `idRepuestos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idSolicitudes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `fk_Actividades_CompendiosActividades1` FOREIGN KEY (`idCompendio`) REFERENCES `compendiosactividades` (`idCompendiosActividades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compendiosactividades`
--
ALTER TABLE `compendiosactividades`
  ADD CONSTRAINT `fk_Compendio_has_HorasTecnico1` FOREIGN KEY (`idCompendiosActividades`) REFERENCES `horastecnico` (`idHoraTec`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobantespagos`
--
ALTER TABLE `comprobantespagos`
  ADD CONSTRAINT `fk_ComprobantesPagos_solicitudes1` FOREIGN KEY (`idsolicitudes`) REFERENCES `solicitudes` (`idSolicitudes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_solicitud_repuesto`
--
ALTER TABLE `detalle_solicitud_repuesto`
  ADD CONSTRAINT `fk_Repuestos_has_solicitudes_Repuestos1` FOREIGN KEY (`idRepuestos`) REFERENCES `repuestos` (`idRepuestos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Repuestos_has_solicitudes_solicitudes1` FOREIGN KEY (`idSolicitudes`) REFERENCES `solicitudes` (`idSolicitudes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entradas_proveedores1` FOREIGN KEY (`idproveedores`) REFERENCES `proveedores` (`idProveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_Imagenes_Actividades1` FOREIGN KEY (`idActividad`) REFERENCES `actividades` (`idActividades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `repuestos_entradas`
--
ALTER TABLE `repuestos_entradas`
  ADD CONSTRAINT `fk_Repuestos_has_entradas_Repuestos1` FOREIGN KEY (`idRepuestos`) REFERENCES `repuestos` (`idRepuestos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Repuestos_has_entradas_entradas1` FOREIGN KEY (`idEntradas`) REFERENCES `entradas` (`idEntradas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `repuestos_entradas_devoluciones`
--
ALTER TABLE `repuestos_entradas_devoluciones`
  ADD CONSTRAINT `fk_Repuestos_entradas_has_devoluciones_Repuestos_entradas1` FOREIGN KEY (`idRepuestos`,`idEntradas`) REFERENCES `repuestos_entradas` (`idRepuestos`, `idEntradas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Repuestos_entradas_has_devoluciones_devoluciones1` FOREIGN KEY (`idDevoluciones`) REFERENCES `devoluciones` (`idDevoluciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_Servicios_Dispositivos1` FOREIGN KEY (`idDispositivos`) REFERENCES `dispositivos` (`idDispositivos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes_servicios`
--
ALTER TABLE `solicitudes_servicios`
  ADD CONSTRAINT `fk_solicitudes_has_Servicios_Servicios1` FOREIGN KEY (`idServicios`) REFERENCES `servicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_solicitudes_has_Servicios_solicitudes1` FOREIGN KEY (`idSolicitudes`) REFERENCES `solicitudes` (`idSolicitudes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioespecialidad`
--
ALTER TABLE `usuarioespecialidad`
  ADD CONSTRAINT `fk_Especialidad_has_Usuario_Especialidad` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Especialidad_has_Usuario_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `fk_Usuario_has_Rol_Rol1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_has_Rol_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

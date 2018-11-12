-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2018 a las 00:38:35
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `teibol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ultimavisita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_cuentas`
--

CREATE TABLE `detalles_cuentas` (
  `id` int(11) NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `salario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistabaile`
--

CREATE TABLE `pistabaile` (
  `id` int(11) NOT NULL,
  `no.tubos` int(11) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `productoservicio_id` int(11) NOT NULL,
  `tipo` enum('comida','bebida','especiales','') NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosyservicios`
--

CREATE TABLE `productosyservicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `productoservicio_id` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_habitaciones`
--

CREATE TABLE `servicios_habitaciones` (
  `id` int(11) NOT NULL,
  `productoservicio_id` int(11) NOT NULL,
  `no_habitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_ofrecidos`
--

CREATE TABLE `servicios_ofrecidos` (
  `id` int(11) NOT NULL,
  `talento_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `serviciohabitacion_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talentos`
--

CREATE TABLE `talentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `sueldo` double NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `talentos`
--

INSERT INTO `talentos` (`id`, `nombre`, `alias`, `sueldo`, `costo`) VALUES
(8, 'Editada', 'asd', 123, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talentos_pistas`
--

CREATE TABLE `talentos_pistas` (
  `id` int(11) NOT NULL,
  `talento_id` int(11) NOT NULL,
  `pistabaile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuentas_usuario` (`cliente_id`),
  ADD KEY `fk_cuentas_trabajador` (`trabajador_id`);

--
-- Indices de la tabla `detalles_cuentas`
--
ALTER TABLE `detalles_cuentas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_cuenta` (`cuenta_id`),
  ADD KEY `fk_detalle_producto` (`producto_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pistabaile`
--
ALTER TABLE `pistabaile`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productoservicio` (`productoservicio_id`);

--
-- Indices de la tabla `productosyservicios`
--
ALTER TABLE `productosyservicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productoservicio_servicio` (`productoservicio_id`);

--
-- Indices de la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productoservicio_servicio_habitaciones` (`productoservicio_id`);

--
-- Indices de la tabla `servicios_ofrecidos`
--
ALTER TABLE `servicios_ofrecidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicioofrecido_talento` (`talento_id`),
  ADD KEY `fk_servicioofrecido_cliente` (`cliente_id`),
  ADD KEY `fk_servicioofrecido_serviciohabitacion` (`serviciohabitacion_id`),
  ADD KEY `fk_serviciosofrecidos_servicio` (`servicio_id`);

--
-- Indices de la tabla `talentos`
--
ALTER TABLE `talentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `talentos_pistas`
--
ALTER TABLE `talentos_pistas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_talento` (`talento_id`),
  ADD KEY `fk_pistabaile` (`pistabaile_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_cuentas`
--
ALTER TABLE `detalles_cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pistabaile`
--
ALTER TABLE `pistabaile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productosyservicios`
--
ALTER TABLE `productosyservicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios_ofrecidos`
--
ALTER TABLE `servicios_ofrecidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `talentos`
--
ALTER TABLE `talentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `talentos_pistas`
--
ALTER TABLE `talentos_pistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `fk_cuentas_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `fk_cuentas_usuario` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `detalles_cuentas`
--
ALTER TABLE `detalles_cuentas`
  ADD CONSTRAINT `fk_detalle_cuenta` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`),
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productosyservicios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productoservicio` FOREIGN KEY (`productoservicio_id`) REFERENCES `productosyservicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_productoservicio_servicio` FOREIGN KEY (`productoservicio_id`) REFERENCES `productosyservicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_habitaciones`
--
ALTER TABLE `servicios_habitaciones`
  ADD CONSTRAINT `fk_productoservicio_servicio_habitaciones` FOREIGN KEY (`productoservicio_id`) REFERENCES `productosyservicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_ofrecidos`
--
ALTER TABLE `servicios_ofrecidos`
  ADD CONSTRAINT `fk_servicioofrecido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicioofrecido_serviciohabitacion` FOREIGN KEY (`serviciohabitacion_id`) REFERENCES `servicios_habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicioofrecido_talento` FOREIGN KEY (`talento_id`) REFERENCES `talentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_serviciosofrecidos_servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `talentos_pistas`
--
ALTER TABLE `talentos_pistas`
  ADD CONSTRAINT `fk_pistabaile` FOREIGN KEY (`pistabaile_id`) REFERENCES `pistabaile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_talento` FOREIGN KEY (`talento_id`) REFERENCES `talentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

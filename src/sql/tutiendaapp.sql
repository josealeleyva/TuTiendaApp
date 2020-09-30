-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2020 a las 02:36:51
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutiendaapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `codigoCatalogo` int(11) NOT NULL,
  `precioVenta` float NOT NULL,
  `codigoTienda` int(11) NOT NULL,
  `codigoProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`codigoCatalogo`, `precioVenta`, `codigoTienda`, `codigoProducto`) VALUES
(1, 18, 1, 4),
(2, 60, 1, 2),
(3, 64.5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `codigoNovedad` int(11) NOT NULL,
  `nombreNovedad` varchar(100) NOT NULL,
  `descripcionNovedad` varchar(250) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `fotoNovedad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `novedad`
--

INSERT INTO `novedad` (`codigoNovedad`, `nombreNovedad`, `descripcionNovedad`, `fechaInicio`, `fechaFin`, `fotoNovedad`) VALUES
(1, 'Super Promocion! Descuento en todos los productos LUCCETTI ', 'Descuento de 50% en: Arroz largo, integral y todas las variedades de fideos de LUCCETTI', '2020-08-27', '2020-09-10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigoProducto` int(11) NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `descripcionProducto` varchar(150) NOT NULL,
  `marcaProducto` varchar(100) NOT NULL,
  `capacidadProducto` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigoProducto`, `nombreProducto`, `descripcionProducto`, `marcaProducto`, `capacidadProducto`) VALUES
(1, 'YOGUR YOGURIS x190gms', 'YOGUR YOGURISIMO FIRME FRUTILLA x190 gramos', 'YOGURISIMO', '190 GRAMOS'),
(2, 'ARROZ LUCC x500gms', 'ARROZ LARGO FINO LUCCETTI x500gms', 'LUCCETTI', '500 GRAMOS'),
(4, 'JUGO POLV TANG x8.3gms', 'JUGO EN POLVO SABOR MANZANA TANG x8.3gms', 'TANG', '8.3 GRAMOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productopromocion`
--

CREATE TABLE `productopromocion` (
  `codigoProductoNoveda` int(11) NOT NULL,
  `precioPromocion` float NOT NULL,
  `descuentoPromocion` int(11) NOT NULL,
  `codigoNovedad` int(11) NOT NULL,
  `codigoCatalogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productopromocion`
--

INSERT INTO `productopromocion` (`codigoProductoNoveda`, `precioPromocion`, `descuentoPromocion`, `codigoNovedad`, `codigoCatalogo`) VALUES
(1, 30, 50, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `codigoTienda` int(11) NOT NULL,
  `nombreTienda` varchar(100) NOT NULL,
  `descripcionTienda` varchar(150) DEFAULT NULL,
  `telefonoTienda` int(13) NOT NULL,
  `direccionTienda` varchar(150) NOT NULL,
  `mailTineda` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `constrasena` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`codigoTienda`, `nombreTienda`, `descripcionTienda`, `telefonoTienda`, `direccionTienda`, `mailTineda`, `usuario`, `constrasena`) VALUES
(1, 'Supermercado Mitre', 'Supermercado con los mejores precios de la localidad de Bandera', 421373, 'Mitre 264', 'mitre264@gmail.com', 'mitre264', 'mitre264');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`codigoCatalogo`),
  ADD KEY `codigoTienda` (`codigoTienda`),
  ADD KEY `codigoProducto` (`codigoProducto`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`codigoNovedad`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigoProducto`);

--
-- Indices de la tabla `productopromocion`
--
ALTER TABLE `productopromocion`
  ADD PRIMARY KEY (`codigoProductoNoveda`),
  ADD KEY `codigoNovedad` (`codigoNovedad`),
  ADD KEY `codigoCatalogo` (`codigoCatalogo`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`codigoTienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `codigoCatalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `novedad`
--
ALTER TABLE `novedad`
  MODIFY `codigoNovedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productopromocion`
--
ALTER TABLE `productopromocion`
  MODIFY `codigoProductoNoveda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `codigoTienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`codigoTienda`) REFERENCES `tienda` (`codigoTienda`),
  ADD CONSTRAINT `catalogo_ibfk_2` FOREIGN KEY (`codigoProducto`) REFERENCES `producto` (`codigoProducto`);

--
-- Filtros para la tabla `productopromocion`
--
ALTER TABLE `productopromocion`
  ADD CONSTRAINT `productopromocion_ibfk_1` FOREIGN KEY (`codigoNovedad`) REFERENCES `novedad` (`codigoNovedad`),
  ADD CONSTRAINT `productopromocion_ibfk_2` FOREIGN KEY (`codigoCatalogo`) REFERENCES `catalogo` (`codigoCatalogo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

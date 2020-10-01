-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2020 a las 21:53:35
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
(3, 64.5, 1, 1),
(4, 74.8, 2, 6),
(5, 130, 2, 5),
(6, 58.5, 2, 2);

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
  `imageNovedad` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `novedad`
--

INSERT INTO `novedad` (`codigoNovedad`, `nombreNovedad`, `descripcionNovedad`, `fechaInicio`, `fechaFin`, `imageNovedad`) VALUES
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
  `capacidadProducto` varchar(100) DEFAULT NULL,
  `imageURL` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigoProducto`, `nombreProducto`, `descripcionProducto`, `marcaProducto`, `capacidadProducto`, `imageURL`) VALUES
(1, 'YOGUR YOGURIS x190gms', 'YOGUR YOGURISIMO FIRME FRUTILLA x190 gramos', 'YOGURISIMO', '190 GRAMOS', 'https://walmartar.vteximg.com.br/arquivos/ids/860584-292-292/Yogur-Bebible-Entero-Sachet-Fortificado-Yogurisimo-1000gr-1-49955.jpg?v=637219658670900000'),
(2, 'ARROZ LUCC x500gms', 'ARROZ LARGO FINO LUCCETTI x500gms', 'LUCCETTI', '500 GRAMOS', 'https://statics.dinoonline.com.ar/imagenes/full_600x600_ma/2290208_f.jpg'),
(4, 'JUGO POLV TANG x8.3gms', 'JUGO EN POLVO SABOR MANZANA TANG x8.3gms', 'TANG', '18.3 GRAMOS', 'https://jumboargentina.vteximg.com.br/arquivos/ids/569000-512-512/Jugo-En-Polvo-Tang-Naranja-18-Gr-2-15417.jpg?v=637152601003600000'),
(5, 'GASEOSA SPRITE LIMA LIMON', 'GASEOSA SPRITE LIMA LIMON x 2,25lt de COCA-COLA\r\n', 'COCA-COLA', '2,25 LITROS', 'https://ardiaprod.vteximg.com.br/arquivos/ids/172241-1000-1000/Gaseosa-Sprite-limalimon-225-Lts-_1.jpg?v=637348032407600000'),
(6, 'DULCE DE LECHE SANCOR', 'DULCE DE LECHE SANCOR x 1kg', 'SANCOR', '1000 GRAMOS', 'https://http2.mlstatic.com/D_NQ_NP_409425-MLA25455574026_032017-O.jpg');

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
  `puntosTienda` int(255) NOT NULL DEFAULT 0,
  `cantVotosTienda` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`codigoTienda`, `nombreTienda`, `descripcionTienda`, `telefonoTienda`, `direccionTienda`, `puntosTienda`, `cantVotosTienda`) VALUES
(1, 'Supermercado Mitre', 'Supermercado con los mejores precios de la localidad de Bandera', 421373, 'Mitre 264', 0, 0),
(2, 'MaxiKiosko Sur', 'MaxiKiosco SUR, los mejores precios las 24hs del dia', 426699, 'Av. Solis 573', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigoUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(150) DEFAULT NULL,
  `emailUsuario` varchar(150) DEFAULT NULL,
  `constrasenia` varchar(150) DEFAULT NULL,
  `codigoTienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigoUsuario`, `nombreUsuario`, `emailUsuario`, `constrasenia`, `codigoTienda`) VALUES
(1, 'supermitre', 'mitre2020@gmail.com', 'mitre2020', 1),
(2, 'kioskosur', 'kioskosur@gmail.com', 'kioskosur123', 2);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigoUsuario`),
  ADD KEY `codigoTienda` (`codigoTienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `codigoCatalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `novedad`
--
ALTER TABLE `novedad`
  MODIFY `codigoNovedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productopromocion`
--
ALTER TABLE `productopromocion`
  MODIFY `codigoProductoNoveda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `codigoTienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codigoTienda`) REFERENCES `tienda` (`codigoTienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

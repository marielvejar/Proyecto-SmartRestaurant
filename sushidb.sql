-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:8111
-- Tiempo de generación: 12-06-2022 a las 03:17:03
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sushidb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `boleta_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` date NOT NULL,
  `total_valor` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_rut` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apaterno` varchar(20) NOT NULL,
  `amaterno` varchar(20) NOT NULL,
  `mesa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocinero`
--

CREATE TABLE `cocinero` (
  `cocinero_id` int(11) NOT NULL,
  `rut` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apaterno` varchar(20) NOT NULL,
  `amaterno` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cocinero`
--

INSERT INTO `cocinero` (`cocinero_id`, `rut`, `nombre`, `apaterno`, `amaterno`, `email`, `telefono`) VALUES
(1, 131997445, 'Elton', 'Tito', 'De la Casa', 'et.tito@gmail.com', 1234656565);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `comanda_id` int(11) NOT NULL,
  `nompre_p` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `hora` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `mesa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `mesa_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `mesero_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesero`
--

CREATE TABLE `mesero` (
  `mesero_id` int(11) NOT NULL,
  `rut` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apaterno` varchar(20) NOT NULL,
  `amaterno` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesero`
--

INSERT INTO `mesero` (`mesero_id`, `rut`, `nombre`, `apaterno`, `amaterno`, `email`, `telefono`, `direccion`) VALUES
(1, 198887440, 'Pepito', 'Peréz', 'Rodríguez', 'pepito.perez@gmail.com', 999999333, 'Los Alamos 310');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `metodo_id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `boleta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `hora` varchar(5) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `valor` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `valor` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `valor`, `descripcion`, `stock`, `categoria`) VALUES
(1, 'hosomaki', 2990, 'Sushi sencillo, lleva un ingrediente en su interior', 500, 'comestible'),
(2, 'Gyosas de Pollo', 3990, 'Empanadillas japonesas, rellenada con pollo picado y verduras.', 1000, 'comestible'),
(3, 'Coca Cola Lata', 1500, 'Bebida Coca Cola en lata', 50, 'bebestible'),
(4, 'Arrollado primavera', 2990, 'Rollo de pasta con relleno de verduras', 80, 'comestible'),
(5, 'Nigiri salmón', 3990, 'Porción de arroz compactado, modelado con forma ovalada sobre que se le coloca el salmón', 100, 'comestible'),
(6, 'Sashimi', 4000, 'Láminas de pescado', 500, 'comestible'),
(7, 'Ceviche salmón', 5990, 'Plato de salmón marinado en jugo de limón', 50, 'comestible'),
(8, 'Camarón panko', 4990, 'Camarones empanizados con panko', 80, 'comestible'),
(9, 'Pollo Teriyaki', 4990, 'Pollo asado con aderezo de salsa dulce', 80, 'comestible'),
(10, 'Gyozas de camarón', 3990, 'Empanadillas japonesas rellenas de camarón picado', 80, 'comestible'),
(12, 'Fanta Lata', 1500, 'Bebida Fanta en lata', 80, 'bebestible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonio`
--

CREATE TABLE `testimonio` (
  `testimonio_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `telefono` int(9) NOT NULL,
  `mensaje` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`boleta_id`),
  ADD KEY `pedido_id_fk` (`pedido_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `mesa_id_fk` (`mesa_id`);

--
-- Indices de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD PRIMARY KEY (`cocinero_id`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`comanda_id`),
  ADD KEY `pedido_id_fk` (`pedido_id`),
  ADD KEY `mesa_id_fk` (`mesa_id`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`mesa_id`),
  ADD KEY `pedido_id_fk` (`pedido_id`),
  ADD KEY `mesero_id_fk` (`mesero_id`),
  ADD KEY `cliente_id_fk` (`cliente_id`);

--
-- Indices de la tabla `mesero`
--
ALTER TABLE `mesero`
  ADD PRIMARY KEY (`mesero_id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`metodo_id`),
  ADD KEY `boleta_id_fk` (`boleta_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comanda_id_fk` (`comanda_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  ADD PRIMARY KEY (`testimonio_id`),
  ADD KEY `cliente_id_fk` (`cliente_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `boleta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  MODIFY `cocinero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `comanda_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `mesa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mesero`
--
ALTER TABLE `mesero`
  MODIFY `mesero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `metodo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  MODIFY `testimonio_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`mesa_id`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`mesa_id`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `mesa_ibfk_2` FOREIGN KEY (`mesero_id`) REFERENCES `mesero` (`mesero_id`);

--
-- Filtros para la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD CONSTRAINT `metodo_pago_ibfk_1` FOREIGN KEY (`boleta_id`) REFERENCES `boleta` (`boleta_id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`comanda_id`) REFERENCES `comanda` (`comanda_id`);

--
-- Filtros para la tabla `testimonio`
--
ALTER TABLE `testimonio`
  ADD CONSTRAINT `testimonio_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 00:37:28
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_wine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id_Comment` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `qualification` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_Wine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id_Comment`, `content`, `qualification`, `id_user`, `id_Wine`) VALUES
(1, 'muy rico', 5, 1, 4),
(2, 'horrible', 1, 1, 4),
(4, 'mediocre', 3, 1, 4),
(5, 'Riquito', 2, 1, 5),
(6, 'me encanto!', 5, 1, 5),
(8, 'que delicia', 5, 1, 8),
(9, 'muy barato', 4, 1, 8),
(10, 'el mejor', 5, 1, 8),
(11, 'un asco', 2, 1, 8),
(12, 'demasiado dulce', 2, 1, 9),
(13, 'agrio', 1, 1, 9),
(14, 'pura delicia', 5, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `id_store` int(11) NOT NULL,
  `NameStore` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`id_store`, `NameStore`) VALUES
(4, 'Rutini'),
(5, 'Luigi Bosca'),
(6, 'Familia Lopez'),
(17, 'Estancia Mendoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `NameUser` varchar(100) NOT NULL,
  `Password` varchar(400) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `NameUser`, `Password`, `admin`) VALUES
(1, 'bernardo', '$2y$10$W3DyGBIBvluZ6z6TgzzTeep84h/PFkm0ttjyJiJkgsIe3ZZ..fiWy', 1),
(3, 'juan', '$2y$10$UP./J3dizoEOzYJgMyFW8uYWg/HDOcBeF2L9AdZKVEPtvjU7keMEG', 1),
(7, 'Malbec', '$2y$10$pHjjE/VcUVmonvt4DaeSEeUclK/xgmXzW8AHsszwH3gyH9pD2nnji', 0),
(9, 'prueba', '$2y$10$RCYa7B1BO7M3ZhgC..m3lOWX90C4KB7BrH4V/vxlXUR3VqS0jCMIa', 0),
(10, 'ariel', '$2y$10$n3ormX217wh6U400IPdj7ObYTdDQQvbCYxj3/R07Et8ggjy5QXnzK', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wines`
--

CREATE TABLE `wines` (
  `id_Wine` int(11) NOT NULL,
  `NameWine` varchar(100) NOT NULL,
  `Style` varchar(100) NOT NULL,
  `id_store` int(11) NOT NULL,
  `Price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wines`
--

INSERT INTO `wines` (`id_Wine`, `NameWine`, `Style`, `id_store`, `Price`) VALUES
(4, 'Malbec', 'Tinto', 5, '400'),
(5, 'Cabernet-Malbec', 'Tinto', 4, '250'),
(8, 'Vasco Viejo Blend', 'Tinto', 6, '150'),
(9, 'Chardonay', 'Blanco', 5, '300');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_Comment`),
  ADD KEY `id_user` (`id_user`,`id_Wine`),
  ADD KEY `id_Wine` (`id_Wine`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id_store`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `Rol` (`admin`);

--
-- Indices de la tabla `wines`
--
ALTER TABLE `wines`
  ADD PRIMARY KEY (`id_Wine`),
  ADD KEY `id_store` (`id_store`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_Comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `id_store` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `wines`
--
ALTER TABLE `wines`
  MODIFY `id_Wine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_Wine`) REFERENCES `wines` (`id_Wine`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `wines`
--
ALTER TABLE `wines`
  ADD CONSTRAINT `wines_ibfk_1` FOREIGN KEY (`id_store`) REFERENCES `stores` (`id_store`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

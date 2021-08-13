-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2021 a las 13:13:00
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delilahrestoemilio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_pedidos`
--

CREATE TABLE `info_pedidos` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `info_pedidos`
--

INSERT INTO `info_pedidos` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 4, 3),
(3, 2, 3, 1),
(4, 2, 7, 1),
(5, 3, 5, 1),
(6, 3, 8, 2),
(7, 3, 4, 4),
(10, 5, 6, 3),
(11, 5, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `update_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `user_id`, `status`, `payment_method`, `update_time`) VALUES
(1, 5, 'Entregado', 'tarjeta', '10:30:00'),
(2, 2, 'En preparación', 'Efectivo', '10:35:00'),
(3, 4, 'Enviado', 'Transferencia', '10:42:00'),
(5, 5, 'nuevo', 'Tarjeta de Crédito', '11:33:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT 1,
  `img_url` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `product_name`, `price`, `stock`, `img_url`, `category`) VALUES
(1, 'Lomito Completo', 400, 1, 'https://betos.com.ar/wp-content/uploads/2019/08/Chimi.png', 'Sandwichs'),
(2, 'Milanga', 360, 1, 'https://http2.mlstatic.com/D_NQ_NP_761177-MLA30760348184_052019-O.jpg', 'Sandwichs'),
(3, 'Sorrentinos', 350, 1, 'https://sorrentinos.com', 'pastas'),
(4, 'Canelones', 380, 1, 'https://okdiario.com/img/2019/07/01/canelones-a-la-italiana.jpg', 'Pastas'),
(5, 'Pizza Roque', 450, 1, 'https://www.geckofood.com.ar/s/s35/fotos/producto-38-0-s.jpg', 'Pizzas'),
(6, 'Pizza Especial', 420, 1, 'https://guladeverano.com/wp-content/uploads/2020/11/pizza-especial-1.jpeg', 'Pizzas'),
(7, 'Bife de Chorizo', 600, 1, 'https://parrilleria.top/multimedia/bife-de-chorizo-a-la-parrilla.jpg', 'Carnes'),
(8, 'Picaña Rellena', 580, 1, 'https://img-global.cpcdn.com/recipes/37f235724d3796e4/751x532cq70/picanha-rellena-al-horno-picanha-recheada-no-forno-foto-principal.jpg', 'Carnes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `fullname`, `email`, `phone`, `address`, `password`, `is_admin`) VALUES
(2, 'Juan', 'Juan Marioli', 'juanm@gmail.com', '3515444222', 'Humahuaca 4235', 'eyJhbGciOiJIUzI1NiJ9.R2ltbmFzaW8zMw.fp9vpfuF43z-ubQMrAZhybx-QYhVgxo4c18cROokK4M', 0),
(3, 'Marce', 'Marcelo Kahns', 'marcek@gmail.com', '3513554488', 'Los Horneros 2244', 'eyJhbGciOiJIUzI1NiJ9.Q2FtYXJv.OP32rYymjUlF0PvgOl4YPNh6sSbcwDmuuO_dA4XUE-8', 0),
(4, 'Jose', 'Jose Luis Marino', 'masecor@hotmail.com', '3515566441', 'Consejal Cabiche 327', 'eyJhbGciOiJIUzI1NiJ9.TWVzYWRhcw.r8KIdGHjaZkaw893h-KT5U-D4wcy4G9vN-OkmM2Lt1c', 0),
(5, 'Emilio', 'Emilio Oscar Almeida', 'almeida.emiliooscar@gmail.com', '3516804386', 'Gral Bustos 217', 'eyJhbGciOiJIUzI1NiJ9.MjhBZ29zdG8.0CIrtCBDQhRoKZi5xACkpT6tNkL3pfeu9LLI-C77iMY', 1),
(6, 'Lucho', 'Lucio Grinspan', 'lucio@hotmail.com', '11155425698', 'Av. Libertador 5420', 'eyJhbGciOiJIUzI1NiJ9.THVjaG9H.vzaiyHqE3i1R18wOCCmeKvLhOmjzOoxz_tlL56rM-Ow', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `info_pedidos`
--
ALTER TABLE `info_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `info_pedidos`
--
ALTER TABLE `info_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

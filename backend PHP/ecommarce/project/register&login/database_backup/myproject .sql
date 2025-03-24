-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2023 at 10:58 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `images_produ`
--

CREATE TABLE `images_produ` (
  `id` int(11) NOT NULL,
  `img_name` text NOT NULL,
  `img_type` text NOT NULL,
  `img_position` text NOT NULL,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images_produ`
--

INSERT INTO `images_produ` (`id`, `img_name`, `img_type`, `img_position`, `pro_id`) VALUES
(2, '10926372.webp', 'image/webp', 'img/10926372.webp', 0),
(3, '10926372.webp', 'image/webp', 'img/10926372.webp', 0),
(4, '10926372.webp', 'image/webp', '10926372.webp', 0),
(5, '10926372.webp', 'image/webp', '10926372.webp', 0),
(6, 'Screenshot (2).png', 'image/png', 'Screenshot (2).png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `images_users`
--

CREATE TABLE `images_users` (
  `id` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `img_position` varchar(255) NOT NULL,
  `img_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images_users`
--

INSERT INTO `images_users` (`id`, `img_name`, `img_position`, `img_type`) VALUES
(1, '20230708_070814.jpg', '20230708_070814.jpg', 'image/jpeg'),
(2, 'حبيبي ي رجول ة copy.jpg', 'حبيبي ي رجول ة copy.jpg', 'image/jpeg'),
(3, 'حبيبي ي رجول ة.jpg', 'حبيبي ي رجول ة.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_descr` text NOT NULL,
  `pro_price` int(11) NOT NULL DEFAULT 0,
  `pro_coin` varchar(15) NOT NULL,
  `img_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_descr`, `pro_price`, `pro_coin`, `img_id`) VALUES
(2, 'laptop', 'sdfsdf', 100, '2', 2),
(3, 'laptop', 'laptop HP Z BOOK ', 100, '3', 2),
(4, 'pc', 'asdfasdf', 100, '2', 2),
(5, 'pc', 'asdfasdf', 100, '2', 2),
(6, 'حبيبي ي رجولة ', 'كلك رجولة ي صاحبي ', 100, 'دولار امريكي ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `Id` int(11) NOT NULL,
  `Role` varchar(25) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`Id`, `Role`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `phone` varchar(9) NOT NULL,
  `Id_role` int(11) NOT NULL,
  `user_img` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `Id_role`, `user_img`) VALUES
(3, 'hosaam', 'mohammed', 'e@gmail.com', '1234', '770107908', 1, 1),
(4, 'Abdalaziz', 'AL-MAWERI', 'asmailalmaori@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '770107908', 1, 2),
(5, 'hosam ', 'abdalluh', 'h@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '778899444', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images_produ`
--
ALTER TABLE `images_produ`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_users`
--
ALTER TABLE `images_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `FkImage` (`img_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_userrole` (`Id_role`),
  ADD KEY `fk_userimge` (`user_img`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images_produ`
--
ALTER TABLE `images_produ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `images_users`
--
ALTER TABLE `images_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FkImage` FOREIGN KEY (`img_id`) REFERENCES `images_produ` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_userrole` FOREIGN KEY (`Id_role`) REFERENCES `userrole` (`Id`),
  ADD CONSTRAINT `fk_userimge` FOREIGN KEY (`user_img`) REFERENCES `images_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

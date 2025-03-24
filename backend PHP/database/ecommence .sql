-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 08:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommence`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_usersId` int(11) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_itemsid`, `cart_usersid`, `cart_order`) VALUES
(24, 1, 32, 10),
(25, 4, 32, 10),
(26, 5, 32, 10),
(28, 1, 32, 10),
(69, 1, 32, 0),
(70, 1, 32, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`priceitems` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_itemsid` int(11)
,`cart_usersid` int(11)
,`cart_order` int(11)
,`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` int(11)
,`items_price` double
,`items_discount` smallint(6)
,`items_date` timestamp
,`cate_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `cateogreys`
--

CREATE TABLE `cateogreys` (
  `cateogrey_id` int(11) NOT NULL,
  `cateogrey_name` varchar(255) NOT NULL,
  `cateogrey_name_ar` varchar(255) NOT NULL,
  `cateogrey_images` varchar(255) NOT NULL,
  `cateogrey_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cateogreys`
--

INSERT INTO `cateogreys` (`cateogrey_id`, `cateogrey_name`, `cateogrey_name_ar`, `cateogrey_images`, `cateogrey_time`) VALUES
(1, 'camera', 'كآمرات', 'camera.svg', '2024-08-23 00:36:20'),
(2, 'phones', 'تلفونات', 'phone.svg', '2024-08-23 00:36:20'),
(3, 'laptop', 'لابتوب', 'laptop.svg', '2024-08-24 00:17:49'),
(4, 'Headphone', 'سماعة راس', 'headphone.svg', '2024-08-24 00:17:49'),
(5, 'Watch', 'ساعات', 'watch.svg', '2024-08-24 00:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usresid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(255) NOT NULL,
  `items_name_ar` varchar(255) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` int(11) NOT NULL DEFAULT 1,
  `items_price` double NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `cate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `cate_id`) VALUES
(1, 'cameras', 'كاميراتتيش', 'goood cameras', 'كيمرة جيدة الاستخدان', 'offer1.jpg', 3, 1, 330, 5, '2024-08-26 21:31:28', 1),
(2, 'camera tow', 'كامرة عالية الجودة', 'camera tow vary ', 'كاميراء جيدة الاستخدام', 'offer2.jpg', 5, 1, 550, 10, '2024-08-26 21:33:34', 1),
(3, 'phones', 'تلفون', 'yas vere phone', 'تلفون جيد جدا', 'offer3.jpg', 2, 1, 77, 2, '2024-08-28 20:48:11', 2),
(4, 'labtop', 'لابتوب', 'labtop ver good Ci7 rame16 labtop ver good Ci7 rame16 labtop ver good Ci7 rame16', 'لابتوب جيد جدا معالج قوي', 'labe3.jpg', 15, 1, 1500, 0, '2024-09-08 21:45:16', 3),
(5, 'samaong23', 'تلفون اس اربعتاش ', 'rame16 memory 512 ssd rame16 memory 512 ssd rame16 memory 512 ssd rame16 memory 512 ssd ', 'جيد جدا ', 'iphon16.jpg', 11, 1, 700, 20, '2024-09-08 21:45:16', 2),
(7, 'Premium AI Image Classic camera', 'كامراء كلااس', '\r\nA camera is an instrument used to capture and store images and videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film. As a pivotal technology in the', '\r\nA camera is an instrument used to capture and store images and videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film. As a pivotal technology in the', 'camera101.jpg', 2, 1, 1500, 0, '2024-11-21 18:33:08', 1),
(8, 'Random Photoshop Edits Kellie Harrison Photography', 'كامره', '\r\nA camera is an instrument used to capture and store images and videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film. As a pivotal technology in the', '\r\nA camera is an instrument used to capture and store images and videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film. As a pivotal technology in the', 'camera102.jpg', 3, 1, 1100, 30, '2024-11-21 18:33:08', 1),
(9, 'Camera  Wikipedia', 'Camera  Wikipedia', 'Random Photoshop Edits Kellie Harrison Photography', 'Random Photoshop Edits Kellie Harrison Photography', 'camera2.jpeg', 4, 1, 1000, 10, '2024-11-21 18:40:30', 1),
(10, 'Parts of a Camera', 'Parts of a Camera', 'These essential camera parts serve as the building blocks of photography, each with a distinct role in transforming light into images. Whether you’re a seasoned photographer or a beginner, gaining a solid understanding of these key camera ', 'These essential camera parts serve as the building blocks of photography, each with a distinct role in transforming light into images. Whether you’re a seasoned photographer or a beginner, gaining a solid understanding of these key camera ', 'camera1.jpeg', 1, 1, 800, 50, '2024-11-21 18:42:03', 1),
(11, 'iphone 12pro', 'iphone 12pro', 'Features 6.1″ display, Apple A14 Bionic chipset, 2815 mAh battery, 256 GB storage, 4 GB RAM, Ceramic Shield glass.', 'Features 6.1″ display, Apple A14 Bionic chipset, 2815 mAh battery, 256 GB storage, 4 GB RAM, Ceramic Shield glass.', 'iphone101.jpg', 2, 1, 400, 5, '2024-11-21 19:00:51', 2),
(12, 'GSMArena.com - mobile phone reviews, news, specifications and …', 'GSMArena.com - mobile phone reviews, news, specifications and …', 'All The Latest and Older Smartphones, Phablets, Tablets, Smart Watches & PDAs In One Place. Detailed Tech Specs, Comparison, In-Depth Parametric Search, Software Updates, Hi-Res Photos the latest specs additions', 'All The Latest and Older Smartphones, Phablets, Tablets, Smart Watches & PDAs In One Place. Detailed Tech Specs, Comparison, In-Depth Parametric Search, Software Updates, Hi-Res Photos the latest specs additions', 'phone103.jpg', 1, 1, 900, 0, '2024-11-21 19:00:51', 2),
(13, 'iPhone 13 - Technical Specifications - Apple Support', 'iPhone 13 - Technical Specifications - Apple Support', 'iPhone 15 Plus Super Retina XDR display; 6.7‑inch (diagonal) all‑screen OLED display; 2796‑by‑1290-pixel resolution at 460 ppi; The iPhone 15 Plus display has rounded corners that follow a beautiful curved design, and these corners are ', 'iPhone 15 Plus Super Retina XDR display; 6.7‑inch (diagonal) all‑screen OLED display; 2796‑by‑1290-pixel resolution at 460 ppi; The iPhone 15 Plus display has rounded corners that follow a beautiful curved design, and these corners are ', 'iphone102.jpg', 2, 1, 500, 0, '2024-11-21 19:02:29', 2),
(14, 'Laptop comparison ', 'Laptop comparison ', 'Shop Laptops at Jarir Bookstore and find premium brands including Apple MacBooks, Dell, HP, Acer, Lenovo, and more. Browse to find the laptop with the right specs for you.', 'Shop Laptops at Jarir Bookstore and find premium brands including Apple MacBooks, Dell, HP, Acer, Lenovo, and more. Browse to find the laptop with the right specs for you.', 'labe1.jpg', 2, 1, 700, 10, '2024-11-21 19:07:23', 3),
(15, 'Laptop Deals', 'Laptop Deals', 'Shop Laptops at Jarir Bookstore and find premium brands including Apple MacBooks, Dell, HP, Acer, Lenovo, and more. Browse to find the laptop with the right specs for you.', 'Shop Laptops at Jarir Bookstore and find premium brands including Apple MacBooks, Dell, HP, Acer, Lenovo, and more. Browse to find the laptop with the right specs for you.', 'labe4.jpg', 1, 1, 800, 5, '2024-11-21 19:08:37', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` int(11)
,`items_price` double
,`items_discount` smallint(6)
,`items_date` timestamp
,`cate_id` int(11)
,`cateogrey_id` int(11)
,`cateogrey_name` varchar(255)
,`cateogrey_name_ar` varchar(255)
,`cateogrey_images` varchar(255)
,`cateogrey_time` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notift_id` int(11) NOT NULL,
  `notifi_title` varchar(255) NOT NULL,
  `notifi_body` varchar(255) NOT NULL,
  `notifi_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notift_id`, `notifi_title`, `notifi_body`, `notifi_userid`) VALUES
(3, 'afcdfc', 'cfadcdaf', 32);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => delivery : 1 => drive',
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` int(11) NOT NULL,
  `orders_totalprice` double NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `orders_payments` int(11) NOT NULL DEFAULT 0 COMMENT '0 => cash : 1 => card',
  `orders_stutes` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`, `orders_datetime`, `orders_payments`, `orders_stutes`) VALUES
(1, 32, 25, 0, 20, 300, 0, '2024-10-14 01:24:43', 1, 1),
(2, 32, 25, 0, 2, 200, 0, '2024-10-14 01:44:07', 1, 1),
(3, 32, 25, 0, 2, 200, 0, '2024-10-14 01:44:10', 1, 1),
(4, 22, 25, 0, 2, 200, 0, '2024-10-14 01:44:19', 1, 0),
(5, 22, 25, 0, 2, 200, 0, '2024-10-14 01:44:24', 1, 0),
(6, 22, 25, 0, 2, 200, 0, '2024-10-14 01:48:13', 1, 0),
(7, 21, 25, 0, 2, 200, 0, '2024-10-14 01:48:29', 1, 0),
(8, 22, 25, 0, 2, 200, 0, '2024-10-14 01:48:41', 1, 0),
(9, 21, 25, 0, 100, 3124, 0, '2024-10-15 02:23:19', 0, 1),
(10, 22, 25, 0, 2, 200, 0, '2024-10-16 00:06:59', 1, 0),
(16, 21, 24, 0, 100, 330, 0, '2024-10-16 00:20:29', 1, 1),
(18, 21, 25, 0, 100, 330, 0, '2024-10-16 00:30:29', 0, 0),
(24, 22, 0, 0, 2, 200, 0, '2024-10-16 00:38:19', 1, 0),
(25, 21, 0, 1, 100, 700, 0, '2024-10-16 00:38:41', 0, 0),
(26, 21, 0, 1, 100, 550, 0, '2024-10-16 00:42:37', 0, 0),
(27, 21, 0, 1, 100, 330, 0, '2024-10-16 00:49:13', 0, 0),
(28, 21, 0, 0, 2, 200, 202, '2024-10-16 01:19:10', 1, 3),
(29, 21, 0, 1, 0, 200, 200, '2024-10-16 01:20:12', 1, 3),
(30, 21, 24, 0, 100, 330, 430, '2024-11-16 18:42:28', 0, 0),
(31, 21, 0, 1, 0, 154, 154, '2024-11-16 18:43:07', 0, 0),
(32, 21, 24, 0, 100, 3000, 3100, '2024-11-21 19:30:54', 1, 0),
(33, 21, 0, 1, 0, 330, 330, '2024-11-21 19:36:27', 1, 0),
(34, 21, 0, 1, 0, 550, 550, '2024-11-21 19:37:20', 0, 0),
(35, 21, 0, 1, 0, 1500, 1500, '2024-11-21 22:13:35', 0, 0),
(36, 21, 0, 1, 0, 1500, 1500, '2024-11-21 22:24:22', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` int(100) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(22, 'ali', '55555555', 'ali@gmail.com', 772260669, 77777, 1, '2024-08-21 17:58:06'),
(30, 'amrosh', '8b4caec5342c190c124fd514a45d9912d089a54b', 'amrosh@gmail.com', 775151776, 77777, 0, '2024-12-02 15:52:06'),
(31, 'fatima', '70ac7629715e90478f1fbd0c6e97206ad2bacf39', 'amroe@gmail.com', 777999333, 77777, 0, '2025-02-03 09:08:52'),
(32, 'yyfatima', 'tttttttt', 'fatima@gmail.com', 777999336, 77777, 1, '2025-02-03 09:09:47'),
(33, 'sahar', '12345678', 'sahar@gmail.com', 777333999, 77777, 0, '2025-02-03 11:24:01'),
(34, 'ggggggg', '7777777777', 'gggg@gmail.com', 998699886, 77777, 0, '2025-02-03 11:26:20');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price`) AS `priceitems`, count(`items`.`items_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_order` AS `cart_order`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`cate_id` AS `cate_id` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_order` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid` ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`cate_id` AS `cate_id`, `cateogreys`.`cateogrey_id` AS `cateogrey_id`, `cateogreys`.`cateogrey_name` AS `cateogrey_name`, `cateogreys`.`cateogrey_name_ar` AS `cateogrey_name_ar`, `cateogreys`.`cateogrey_images` AS `cateogrey_images`, `cateogreys`.`cateogrey_time` AS `cateogrey_time` FROM (`items` join `cateogreys` on(`items`.`cate_id` = `cateogreys`.`cateogrey_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersId` (`address_usersId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemsid` (`cart_itemsid`),
  ADD KEY `cart_usersid` (`cart_usersid`);

--
-- Indexes for table `cateogreys`
--
ALTER TABLE `cateogreys`
  ADD PRIMARY KEY (`cateogrey_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_usresid` (`favorite_usresid`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notift_id`),
  ADD KEY `notifi_userid` (`notifi_userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `cateogreys`
--
ALTER TABLE `cateogreys`
  MODIFY `cateogrey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersId`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_usresid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `cateogreys` (`cateogrey_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`notifi_userid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

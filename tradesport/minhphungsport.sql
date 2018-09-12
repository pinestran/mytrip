-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2018 at 04:01 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minhphungsport`
--
CREATE DATABASE IF NOT EXISTS `minhphungsport` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `minhphungsport`;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`) VALUES
(1, 'Ngoai Hang Anh'),
(2, 'Chau A'),
(3, 'Chau Au'),
(4, 'Nam My'),
(5, 'La Liga');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `account_num` char(20) DEFAULT NULL,
  `card_num` char(20) DEFAULT NULL,
  `id_users` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`, `account_num`, `card_num`, `id_users`) VALUES
(1, 'Arigbank', '13214564675631', '00001564', 1),
(2, 'SacomBank', '65643231', '0000214531', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL,
  `day_of_bill` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_bill` double DEFAULT NULL,
  `id_user_send` bigint(20) DEFAULT NULL,
  `id_user_receive` bigint(20) DEFAULT NULL,
  `status_bill` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `day_of_bill`, `total_bill`, `id_user_send`, `id_user_receive`, `status_bill`) VALUES
(1, '2018-05-03 05:08:04', 500000, 1, 2, 'Chưa Thanh Toán'),
(2, '2018-05-02 17:00:00', 1000000, 1, 2, 'Ok');

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details` (
  `id` bigint(20) NOT NULL,
  `id_bill` bigint(20) DEFAULT NULL,
  `id_user_factory` bigint(20) DEFAULT NULL,
  `id_product_details` bigint(20) DEFAULT NULL,
  `amount_s` int(11) DEFAULT NULL,
  `amount_m` int(11) DEFAULT NULL,
  `amount_l` int(11) DEFAULT NULL,
  `amount_xl` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_details`
--

INSERT INTO `bill_details` (`id`, `id_bill`, `id_user_factory`, `id_product_details`, `amount_s`, `amount_m`, `amount_l`, `amount_xl`, `total_amount`, `price`) VALUES
(1, 1, 3, 1, 10, 10, 20, 10, 50, 250000),
(2, 1, 3, 2, 20, 10, 10, 10, 50, 250000),
(3, 2, 3, 3, 30, 30, 20, 20, 100, 500000),
(4, 2, 3, 4, 25, 25, 25, 25, 100, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL,
  `image` text,
  `id_users` bigint(20) DEFAULT NULL,
  `id_product_detail` bigint(20) DEFAULT NULL,
  `id_area` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `image`, `id_users`, `id_product_detail`, `id_area`) VALUES
(1, 'arsenalDo.jpg', 1, 1, NULL),
(2, 'arsenalXanh.jpg', 1, 2, NULL),
(3, 'nhatXanh.jpg', 2, 3, NULL),
(4, 'nhatTrang.jpg', 2, 4, NULL),
(5, 'NHA.jpg', NULL, NULL, 1),
(6, 'chauA.gif', NULL, NULL, 2),
(7, 'ChauAu.jpg', NULL, NULL, 3),
(8, 'namMy.gif', NULL, NULL, 4),
(13, 'brazilNha.jpg', 3, 5, NULL),
(14, 'anhNha.jpg', 3, 7, NULL),
(15, 'anhKhach.jpg', 3, 6, NULL),
(16, 'arsenalVang.jpg', 3, 8, NULL),
(17, 'chelseaXanh.jpg', 3, 9, NULL),
(18, 'chelseaTrang.jpg', 3, 10, NULL),
(19, 'liverDo.jpg', 3, 11, NULL),
(20, 'liverVang.jpg', 3, 12, NULL),
(21, 'laLiga.jpg', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `price_factory` double DEFAULT NULL,
  `price_distributor` double DEFAULT NULL,
  `price_customer` double DEFAULT NULL,
  `day_of_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_areas` bigint(20) DEFAULT NULL,
  `id_users` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `amount`, `price_factory`, `price_distributor`, `price_customer`, `day_of_entry`, `id_areas`, `id_users`) VALUES
(1, 'Arsenal', 300, 55, 60, 90, '2018-09-01 14:42:17', 1, 3),
(2, 'Nhật Bản', 300, 55, 60, 90, '2018-05-02 17:00:00', 2, 2),
(3, 'Brazil', 500, 55, 65, 90, '2018-07-08 05:23:47', 4, 3),
(4, 'Chelsea', 400, 54, 57, 90, '2018-09-01 14:47:22', 1, 3),
(5, 'Britain', 400, 55, 65, 90, '2018-07-08 05:25:02', 3, 3),
(6, 'Liverpool', 200, 54, 57, 90, '2018-09-01 14:47:22', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `amount_s` int(11) DEFAULT NULL,
  `amount_m` int(11) DEFAULT NULL,
  `amount_l` int(11) DEFAULT NULL,
  `amount_xl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `name`, `id_product`, `color`, `amount_s`, `amount_m`, `amount_l`, `amount_xl`) VALUES
(1, 'Arsenal Sân Nhà', 1, 'Red', 25, 25, 25, 25),
(2, 'Arsenal Sân Khách', 1, 'Xanh', 30, 30, 20, 20),
(3, 'Nhật Sân nhà', 2, 'Blue', 20, 20, 30, 30),
(4, 'Nhật Sân Khách', 2, 'Yellow', 60, 60, 40, 40),
(5, 'Brazil San Nha', 3, 'Vang', 100, 200, 100, 100),
(6, 'Britain San Khach', 5, 'Do', 50, 50, 50, 50),
(7, 'Britain San Nha', 5, 'Trang', 50, 50, 50, 50),
(8, 'Arsenal Sân Khách', 1, 'Vàng', 20, 20, 20, 40),
(9, 'Chelsea Sân Nhà', 4, 'Xanh Bích', 50, 50, 50, 50),
(10, 'Chelsea Sân Khách', 4, 'Trắng', 50, 50, 50, 50),
(11, 'Liver Sân Nhà', 6, 'Đỏ', 25, 25, 25, 25),
(12, 'Liver Sân Khach', 6, 'Vàng', 25, 35, 15, 25);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Factory'),
(3, 'Shop');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` char(14) DEFAULT '',
  `address` varchar(200) DEFAULT NULL,
  `date_of_account` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_role` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `address`, `date_of_account`, `id_role`) VALUES
(1, 'test 01', 'test', 'testtest@mail.com', NULL, NULL, '2018-05-03 04:11:36', 3),
(2, 'thongtv', 'FDNd1nXzNuJy', 'thongvan045@gmail.com', 'null', 'null', '2018-05-02 17:00:00', 1),
(3, 'factory', '123456', 'factory@mail.com', '', NULL, '2018-05-03 05:13:32', 2),
(4, 'Shop shop', '123', 'test1@mail.com', NULL, NULL, '2018-07-08 03:48:12', 3),
(5, 'pinestran', 'Vh1LTrCs0vEu', 'pines@mail.com', '0923123123', 'go vap', '2018-09-03 09:58:52', 3),
(6, 'testtest', 'GBMKYg0gjbsP', 'testtest@mail.com', '09876638483', 'HCM', '2018-09-03 10:00:37', 2),
(10, 'Minh Boss', 'iWw7sRV6awBF', 'tvminh1402@gmail.com', '0986565696', 'Nguyen Thái Sơn, Gò Vấp', '2018-09-03 11:02:17', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

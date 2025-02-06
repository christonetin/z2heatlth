-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 03:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `z2hhealthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(40) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `bg_color` varchar(10) DEFAULT NULL,
  `font_color` varchar(10) DEFAULT NULL,
  `fevicon` varchar(100) DEFAULT NULL,
  `shop_city` varchar(30) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `owner_name` varchar(20) DEFAULT NULL,
  `description_meta` text DEFAULT NULL,
  `shop_logo` varchar(100) NOT NULL,
  `about_us_status` int(11) NOT NULL DEFAULT 0,
  `terms_and_condtion_status` int(11) NOT NULL DEFAULT 0,
  `privacy_policy_status` int(11) NOT NULL DEFAULT 0,
  `refund_policy_status` int(11) NOT NULL DEFAULT 0,
  `contact_us_status` int(11) NOT NULL DEFAULT 0,
  `upi_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `shop_name`, `name`, `pass`, `bg_color`, `font_color`, `fevicon`, `shop_city`, `keywords`, `owner_name`, `description_meta`, `shop_logo`, `about_us_status`, `terms_and_condtion_status`, `privacy_policy_status`, `refund_policy_status`, `contact_us_status`, `upi_id`) VALUES
(1, NULL, 'admin@mail.com', 'admin', '#8B33FF', NULL, NULL, NULL, NULL, NULL, NULL, 'logo.jpg', 0, 0, 0, 0, 0, 'christonet@ybl');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `ban_id` int(11) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`ban_id`, `url`, `order_by`) VALUES
(1, '1738843567.jpg', 0),
(2, '1738843599.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_ai_id` int(11) NOT NULL,
  `cart_date` varchar(20) DEFAULT NULL,
  `cart_inv_no` varchar(20) DEFAULT NULL,
  `cart_pro_id` varchar(30) NOT NULL,
  `cart_pro_name` varchar(40) NOT NULL,
  `cart_mrp` int(11) DEFAULT 0,
  `cart_gst` float NOT NULL DEFAULT 0,
  `cart_discount` float NOT NULL DEFAULT 0,
  `cart_qty` int(11) NOT NULL,
  `cart_pro_selling_price` float NOT NULL,
  `cart_img` varchar(300) NOT NULL,
  `cart_pro_code` varchar(40) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` varchar(30) DEFAULT NULL,
  `cart_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_ai_id`, `cart_date`, `cart_inv_no`, `cart_pro_id`, `cart_pro_name`, `cart_mrp`, `cart_gst`, `cart_discount`, `cart_qty`, `cart_pro_selling_price`, `cart_img`, `cart_pro_code`, `order_status`, `user_id`, `cart_status`) VALUES
(1, '2025-01-10 13:37:58', '68310', '5', 'Stripes Kanchipuram Sarees', 7500, 0, 2000, 3, 5500, '1730732878.jpg', 'S02', 0, '9876543210', 1),
(2, '2025-01-10 13:38:32', '68310', '4', 'Traditional Kanchipuram Sarees', 8000, 0, 2500, 4, 5500, '1730873010.jpg', 'S01', 0, '9876543210', 1),
(3, '2025-01-10 13:57:00', '59471', '4', 'Traditional Kanchipuram Sarees', 8000, 0, 2500, 5, 5500, '1730873010.jpg', 'S01', 0, '9876543210', 1),
(4, '2025-01-16 21:17:13', '55262', '5', 'Stripes Kanchipuram Sarees', 7500, 0, 2000, 2, 5500, '1730732878.jpg', 'S02', 0, '9876543210', 1),
(5, '2025-01-16 21:37:54', '29123', '10', 'Mysore Crepe Silk Saree', 12000, 0, 2500, 2, 9500, '1730733756.jpg', 'S07', 0, '9876543210', 1),
(6, '2025-01-17 13:46:37', '88185', '5', 'Stripes Kanchipuram Sarees', 7500, 0, 2000, 2, 5500, '1730732878.jpg', 'S02', 0, '9876543210', 1),
(7, '2025-02-05 19:13:13', '48416', '26', 'Hair Serum', 1999, 0, 0, 1, 1999, '1737798998.jpg', 'C01', 0, 'Z2H123123', 1),
(8, '2025-02-05 19:13:20', '48416', '25', 'Moringa Soup', 499, 0, 0, 1, 499, '1737798984.jpg', 'HD02', 0, 'Z2H123123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `icon` varchar(300) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `icon`, `status`) VALUES
(18, 'Health Drink', '1737205966.jpg', 0),
(19, 'Cosmetic', '1737206004.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_sub`
--

CREATE TABLE `category_sub` (
  `subcat_ai` int(11) NOT NULL,
  `maincat` int(11) NOT NULL DEFAULT 0,
  `subcat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_sub`
--

INSERT INTO `category_sub` (`subcat_ai`, `maincat`, `subcat`) VALUES
(43, 18, 'Moringa Foods'),
(44, 19, 'Externals');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `ai` int(11) NOT NULL,
  `jdate` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `ref_id` varchar(50) DEFAULT NULL,
  `pic` varchar(150) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `down_line_insert`
--

CREATE TABLE `down_line_insert` (
  `down_ai` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `plan_amount` int(11) NOT NULL DEFAULT 0,
  `down_s_id` varchar(20) DEFAULT NULL,
  `down_ref_id` varchar(20) DEFAULT NULL,
  `down_level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `down_line_insert`
--

INSERT INTO `down_line_insert` (`down_ai`, `user_id`, `plan_amount`, `down_s_id`, `down_ref_id`, `down_level`) VALUES
(1, 'Z2H558271', 0, 'z2h123123', 'z2h123123', 'level_1');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `inv_ai` int(11) NOT NULL,
  `inv_jdate` varchar(20) DEFAULT NULL,
  `inv_user` varchar(15) DEFAULT NULL,
  `inv_number` varchar(15) DEFAULT NULL,
  `inv_price` float NOT NULL DEFAULT 0,
  `inv_tax` float NOT NULL DEFAULT 0,
  `inv_discount` float NOT NULL DEFAULT 0,
  `inv_total` float NOT NULL DEFAULT 0,
  `inv_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`inv_ai`, `inv_jdate`, `inv_user`, `inv_number`, `inv_price`, `inv_tax`, `inv_discount`, `inv_total`, `inv_status`) VALUES
(2, '2025-01-10 13:39:05', '9876543210', '68310', 15500, 0, 4500, 11000, 0),
(3, '2025-01-12 07:30:11', '9876543210', '59471', 8000, 0, 2500, 5500, 0),
(4, '2025-01-16 21:17:32', '9876543210', '55262', 7500, 0, 2000, 5500, 0),
(5, '2025-01-16 21:38:32', '9876543210', '29123', 12000, 0, 2500, 9500, 0),
(6, '2025-01-16 21:38:38', '9876543210', '36474', 0, 0, 0, 0, 0),
(7, '2025-01-17 13:46:49', '9876543210', '88185', 7500, 0, 2000, 5500, 0),
(8, '2025-02-05 19:13:30', 'Z2H123123', '48416', 2498, 0, 0, 2498, 0);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `level_1` int(11) NOT NULL DEFAULT 0,
  `level_2` int(11) NOT NULL DEFAULT 0,
  `level_3` int(11) NOT NULL DEFAULT 0,
  `level_4` int(11) NOT NULL DEFAULT 0,
  `level_5` int(11) NOT NULL DEFAULT 0,
  `level_6` int(11) NOT NULL DEFAULT 0,
  `level_7` int(11) NOT NULL DEFAULT 0,
  `level_8` int(11) NOT NULL DEFAULT 0,
  `level_9` int(11) NOT NULL DEFAULT 0,
  `level_10` int(11) NOT NULL DEFAULT 0,
  `level_11` int(11) DEFAULT 0,
  `level_12` int(11) NOT NULL DEFAULT 0,
  `level_1_income` float NOT NULL DEFAULT 0,
  `level_2_income` float NOT NULL DEFAULT 0,
  `level_3_income` float NOT NULL DEFAULT 0,
  `level_4_income` float NOT NULL DEFAULT 0,
  `level_5_income` float NOT NULL DEFAULT 0,
  `level_6_income` float NOT NULL DEFAULT 0,
  `level_7_income` float NOT NULL DEFAULT 0,
  `level_8_income` float NOT NULL DEFAULT 0,
  `level_9_income` float NOT NULL DEFAULT 0,
  `level_10_income` float NOT NULL DEFAULT 0,
  `level_11_income` float NOT NULL DEFAULT 0,
  `level_12_income` float NOT NULL DEFAULT 0,
  `level_1_income1` float NOT NULL DEFAULT 0,
  `level_2_income1` float NOT NULL DEFAULT 0,
  `level_3_income1` float NOT NULL DEFAULT 0,
  `level_4_income1` float NOT NULL DEFAULT 0,
  `level_5_income1` float NOT NULL DEFAULT 0,
  `level_6_income1` float NOT NULL DEFAULT 0,
  `level_7_income1` float NOT NULL DEFAULT 0,
  `level_8_income1` float NOT NULL DEFAULT 0,
  `level_9_income1` float NOT NULL DEFAULT 0,
  `level_10_income1` float NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `user_id`, `level_1`, `level_2`, `level_3`, `level_4`, `level_5`, `level_6`, `level_7`, `level_8`, `level_9`, `level_10`, `level_11`, `level_12`, `level_1_income`, `level_2_income`, `level_3_income`, `level_4_income`, `level_5_income`, `level_6_income`, `level_7_income`, `level_8_income`, `level_9_income`, `level_10_income`, `level_11_income`, `level_12_income`, `level_1_income1`, `level_2_income1`, `level_3_income1`, `level_4_income1`, `level_5_income1`, `level_6_income1`, `level_7_income1`, `level_8_income1`, `level_9_income1`, `level_10_income1`, `status`) VALUES
(1, 'Z2H123123', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Z2H558271', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msd_id` int(11) NOT NULL,
  `from_id` varchar(15) DEFAULT NULL,
  `to_id` varchar(15) DEFAULT NULL,
  `jdate` varchar(20) DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msd_id`, `from_id`, `to_id`, `jdate`, `type`, `subject`, `message`, `status`) VALUES
(1, 'admin', 'Z2H123123', '2025-02-06 19:19:19', '', '2w34', '234', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_ai` int(11) NOT NULL,
  `pro_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `pro_code` varchar(20) DEFAULT NULL,
  `pro_name` varchar(30) DEFAULT NULL,
  `pro_desc` text NOT NULL,
  `mrp` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `pro_qty` int(11) NOT NULL DEFAULT 0,
  `pro_gst` float NOT NULL DEFAULT 0,
  `pro_sgst` float NOT NULL DEFAULT 0,
  `pro_cgst` float NOT NULL DEFAULT 0,
  `pic` varchar(100) DEFAULT NULL,
  `maincat` int(11) NOT NULL DEFAULT 0,
  `subcat` int(11) NOT NULL DEFAULT 0,
  `youtube_link` varchar(100) DEFAULT NULL,
  `margin` float NOT NULL DEFAULT 0,
  `is_new` int(11) NOT NULL DEFAULT 0,
  `is_flash` int(11) NOT NULL DEFAULT 0,
  `is_today` int(11) NOT NULL DEFAULT 0,
  `is_best` int(11) NOT NULL DEFAULT 0,
  `is_offer` int(11) NOT NULL DEFAULT 0,
  `pro_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_ai`, `pro_date`, `pro_code`, `pro_name`, `pro_desc`, `mrp`, `discount`, `price`, `pro_qty`, `pro_gst`, `pro_sgst`, `pro_cgst`, `pic`, `maincat`, `subcat`, `youtube_link`, `margin`, `is_new`, `is_flash`, `is_today`, `is_best`, `is_offer`, `pro_status`) VALUES
(24, '2025-01-18 18:49:21', 'HD01', 'Moringa Pro', '<p>Immune Strength</p>', 999, 0, 999, 23, 0, 0, 0, NULL, 18, 43, '', 220, 1, 1, 0, 0, 1, 1),
(25, '2025-01-18 18:50:13', 'HD02', 'Moringa Soup', '<p>Energiser</p>', 499, 0, 499, 42, 0, 0, 0, NULL, 18, 43, '', 110, 1, 0, 1, 1, 1, 1),
(26, '2025-01-18 18:51:08', 'C01', 'Hair Serum', '<p>Hair Growth</p>', 1999, 0, 1999, 52, 0, 0, 0, NULL, 19, 44, '', 440, 1, 1, 0, 0, 0, 1),
(27, '2025-01-18 18:51:37', 'C02', 'Face Serum', '', 4999, 0, 4999, 45, 0, 0, 0, NULL, 19, 44, '', 440, 1, 1, 1, 1, 1, 1),
(28, '2025-01-18 19:23:26', 'C03', 'Facial Cream', '', 1499, 0, 1499, 56, 0, 0, 0, NULL, 19, 44, '', 275, 0, 0, 1, 0, 1, 1),
(29, '2025-01-18 19:40:28', 'C04', 'Face oil', '<p>zvs</p>', 1300, 0, 1300, 45, 0, 0, 0, NULL, 19, 44, '', 300, 0, 1, 0, 1, 0, 1),
(30, '2025-01-20 12:03:02', 'C06', 'Pen', '<p>Abc</p>', 300, 0, 300, 56, 0, 0, 0, NULL, 19, 44, '', 30, 0, 1, 1, 0, 1, 1),
(31, '2025-01-22 07:36:31', 'C07', 'Gun', '<p>Ff</p>', 450, 0, 450, 45, 0, 0, 0, NULL, 19, 44, '', 45, 0, 0, 0, 1, 1, 1),
(32, '2025-02-05 13:34:55', 'P002', 'Name2', '', 400, 0, 400, 12, 0, 0, 0, NULL, 18, 43, '', 10, 0, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pro_images`
--

CREATE TABLE `pro_images` (
  `pi_ai` int(11) NOT NULL,
  `pro_code` varchar(20) DEFAULT NULL,
  `pi_pic` varchar(100) DEFAULT NULL,
  `pro_color` varchar(50) DEFAULT NULL,
  `pro_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pro_images`
--

INSERT INTO `pro_images` (`pi_ai`, `pro_code`, `pi_pic`, `pro_color`, `pro_qty`) VALUES
(80, 'HD01', '1737798970.jpg', NULL, 0),
(81, 'HD02', '1737798984.jpg', NULL, 0),
(82, 'C01', '1737798998.jpg', NULL, 0),
(83, 'C02', '1737799009.jpg', NULL, 0),
(84, 'C03', '1737799019.jpg', NULL, 0),
(85, 'C04', '1737799029.jpg', NULL, 0),
(86, 'C06', '1737799046.jpg', NULL, 0),
(87, 'C07', '1737799054.jpg', NULL, 0),
(89, 'P002', '1738762483.jpg', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reg`
--

CREATE TABLE `reg` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(70) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `profile_pic` varchar(150) DEFAULT NULL,
  `total_purchase` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `sponsor_id` varchar(20) DEFAULT NULL,
  `is_business` int(11) NOT NULL DEFAULT 0,
  `total_income` int(11) NOT NULL DEFAULT 0,
  `wallet` int(11) NOT NULL DEFAULT 0,
  `level_income` int(11) NOT NULL DEFAULT 0,
  `ref_count` int(11) NOT NULL DEFAULT 0,
  `level_count` int(11) NOT NULL DEFAULT 0,
  `acc_num` varchar(30) DEFAULT NULL,
  `acc_name` varchar(30) DEFAULT NULL,
  `ifsc` varchar(20) DEFAULT NULL,
  `bank` varchar(30) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `google_pay` varchar(20) DEFAULT NULL,
  `phone_pe` varchar(20) DEFAULT NULL,
  `upi` varchar(30) DEFAULT NULL,
  `purchase_wallet` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg`
--

INSERT INTO `reg` (`id`, `user_id`, `join_date`, `name`, `mail`, `mobile`, `password`, `profile_pic`, `total_purchase`, `status`, `sponsor_id`, `is_business`, `total_income`, `wallet`, `level_income`, `ref_count`, `level_count`, `acc_num`, `acc_name`, `ifsc`, `bank`, `branch`, `google_pay`, `phone_pe`, `upi`, `purchase_wallet`) VALUES
(1, 'Z2H123123', '2024-01-06 03:36:29', 'David33', 'david@mail.ccgg', '9876543210', '123', '173780277037.jpg', 47300, 1, 'Z2H123111', 1, 0, 0, 0, 0, 0, '234', '234234', '234', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transcation_history`
--

CREATE TABLE `transcation_history` (
  `trans_id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `trans_date` varchar(20) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `comment` text NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  `debit` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `ai` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `pro_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`ai`, `user_id`, `pro_code`) VALUES
(23, 'Z2H123123', 'HD02'),
(24, 'Z2H123123', 'C01'),
(25, 'Z2H123123', 'HD01');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_request`
--

CREATE TABLE `withdraw_request` (
  `wr_id` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `wr_date` varchar(30) NOT NULL,
  `wr_amount` float NOT NULL DEFAULT 0,
  `tds` float NOT NULL DEFAULT 0,
  `amount` float NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdraw_request`
--

INSERT INTO `withdraw_request` (`wr_id`, `user_id`, `wr_date`, `wr_amount`, `tds`, `amount`, `status`) VALUES
(1, 'GG591972', '2024-11-11 11:18:04', 120, 6, 114, 1),
(2, 'GG591972', '2024-11-11 11:18:45', 120, 6, 114, 1),
(3, 'GG591972', '2024-11-11 11:18:46', 120, 6, 114, 1),
(4, 'GG591972', '2024-11-11 11:18:47', 120, 6, 114, 1),
(5, 'GG591972', '2024-11-11 11:18:47', 120, 6, 114, 1),
(6, 'GG591972', '2024-11-11 11:18:47', 120, 6, 114, 1),
(7, 'GG591972', '2024-11-11 11:18:48', 120, 6, 114, 1),
(8, 'GG591972', '2024-11-11 11:18:48', 120, 6, 114, 1),
(9, 'GG591972', '2024-11-11 11:18:49', 120, 6, 114, 1),
(10, 'GG591972', '2024-11-11 11:18:49', 120, 6, 114, 1),
(11, 'GG591972', '2024-11-11 11:18:50', 120, 6, 114, 1),
(12, 'GG591972', '2024-11-11 11:18:50', 120, 6, 114, 1),
(13, 'GG591972', '2024-11-11 11:18:50', 120, 6, 114, 1),
(14, 'GG591972', '2024-11-11 11:18:51', 120, 6, 114, 1),
(15, 'GG591972', '2024-11-11 11:18:51', 120, 6, 114, 1),
(16, 'GG591972', '2024-11-11 11:18:51', 120, 6, 114, 1),
(17, 'GG591972', '2024-11-11 11:18:51', 120, 6, 114, 1),
(18, 'GG591972', '2024-11-11 11:18:52', 120, 6, 114, 1),
(19, 'GG591972', '2024-11-11 11:18:58', 120, 6, 114, 1),
(20, 'GG591972', '2024-11-11 11:19:00', 120, 6, 114, 1),
(21, 'GG591972', '2024-11-11 11:19:00', 120, 6, 114, 1),
(22, 'GG591972', '2024-11-11 11:19:00', 120, 6, 114, 1),
(23, 'GG591972', '2024-11-11 11:19:01', 120, 6, 114, 1),
(24, 'GG591972', '2024-11-11 11:19:01', 120, 6, 114, 1),
(25, 'GG591972', '2024-11-11 11:19:01', 120, 6, 114, 1),
(26, 'GG591972', '2024-11-11 11:19:12', 120, 6, 114, 1),
(27, 'GG591972', '2024-11-11 11:19:13', 120, 6, 114, 1),
(28, 'GG591972', '2024-11-11 11:19:13', 120, 6, 114, 1),
(29, 'GG123123', '2024-11-12 18:47:49', 50, 2.5, 47.5, 1),
(30, 'GG123123', '2024-11-12 18:47:56', 50, 2.5, 47.5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_ai_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_sub`
--
ALTER TABLE `category_sub`
  ADD PRIMARY KEY (`subcat_ai`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `down_line_insert`
--
ALTER TABLE `down_line_insert`
  ADD PRIMARY KEY (`down_ai`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`inv_ai`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msd_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_ai`);

--
-- Indexes for table `pro_images`
--
ALTER TABLE `pro_images`
  ADD PRIMARY KEY (`pi_ai`);

--
-- Indexes for table `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transcation_history`
--
ALTER TABLE `transcation_history`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  ADD PRIMARY KEY (`wr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `ban_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category_sub`
--
ALTER TABLE `category_sub`
  MODIFY `subcat_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `ai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `down_line_insert`
--
ALTER TABLE `down_line_insert`
  MODIFY `down_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `inv_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pro_images`
--
ALTER TABLE `pro_images`
  MODIFY `pi_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transcation_history`
--
ALTER TABLE `transcation_history`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  MODIFY `wr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

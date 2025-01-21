-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 10:26 AM
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
-- Table structure for table `banner_admin`
--

CREATE TABLE `banner_admin` (
  `ban_ai` int(11) NOT NULL,
  `url` varchar(30) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner_admin`
--

INSERT INTO `banner_admin` (`ban_ai`, `url`, `pic`) VALUES
(27, 'https://youtu.be/QJwv76lSmqQ', '1709132248.jpg'),
(28, 'https://youtu.be/KrAlnJtZHxQ', '1709132302.jpg'),
(29, 'https://youtu.be/zN8O5_cr998', '1709132330.jpg');

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
  `cart_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_ai_id`, `cart_date`, `cart_inv_no`, `cart_pro_id`, `cart_pro_name`, `cart_mrp`, `cart_gst`, `cart_discount`, `cart_qty`, `cart_pro_selling_price`, `cart_img`, `cart_pro_code`, `order_status`, `user_id`, `cart_status`) VALUES
(9, '2024-02-09 12:39:49', '53057', '1', '1m 89cm (75\") QN800C Neo QLED ', 70000, 12598.2, 10, 1, 69990, '1707204934.jpg', 'TV 001', 1, 'II169991', 1),
(10, '2024-02-09 12:39:53', '53057', '6', 'RICE COOKER', 2750, 275, 0, 1, 2750, '1707288179.jpg', 'RC001', 4, 'II169991', 1),
(11, '2024-02-09 12:53:20', NULL, '7', 'Anarkali ', 650, 126, 10, 1, 640, '1707296711.jpg', 'kU002', 0, 'II169991', 0),
(12, '2024-02-09 13:02:58', NULL, '2', 'bedsheet & Pillows', 700, 17.25, 10, 1, 690, '1707283005.jpg', 'be001', 0, 'II169991', 0),
(17, '2024-03-12 12:52:39', '80807', '13', 'Stead', 450, 0, 200, 1, 250, '1709528880.jpg', '1040', 3, 'AT854771', 1),
(18, '2024-03-12 17:55:54', '78438', '13', 'Stead', 450, 0, 200, 1, 250, '1709528880.jpg', '1040', 2, 'AT854771', 1),
(19, '2024-03-15 20:06:33', '848711', '14', '22', 50, 2, 10, 1, 40, '1709781929.jpg', '2', 3, 'AT854771', 1),
(22, '2024-03-28 09:19:48', NULL, '22', 'text', 10, 0.5, 0, 3, 10, '1711597736.jpg', 'kk', 0, 'AT854771', 0),
(56, '2024-08-28 09:04:41', NULL, '14', '22', 50, 2, 10, 1, 40, '1709781929.jpg', '2', 0, 'II123123', 0),
(57, '2024-08-28 09:06:11', NULL, '19', 'STEAD', 500, 0, 300, 1, 200, '1709881803.jpg', '1024', 0, 'II123123', 0),
(87, '2024-10-15 12:17:10', NULL, '16', 'CHAIN', 1800, 65, 500, 1, 1300, '1709881383.jpg', '5678', 0, 'AT440153', 0),
(88, '2024-10-23 19:41:19', NULL, '22', 'text', 10, 0.5, 0, 1, 10, '1711597736.jpg', 'kk', 0, 'AT440153', 0),
(89, '2024-10-23 19:41:40', NULL, '19', 'STEAD', 500, 0, 300, 1, 200, '1709881803.jpg', '1024', 0, 'AT440153', 0),
(90, '2024-10-23 19:41:53', NULL, '19', 'STEAD', 500, 0, 300, 1, 200, '1709881803.jpg', '1024', 0, 'AT440153', 0);

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
(12, 'Kanjeevaram Pattu Sarees', '1730728638.jpg', 0),
(13, 'Banarasi Silk Sarees', '1730729438.jpg', 0),
(14, 'Mysore Silk Sarees', '1730729731.jpg', 0),
(15, 'Dharmavaram Pattu Sarees', '1730729938.jpg', 0),
(16, 'Uppada Pattu Sarees', '1730730017.jpg', 0),
(17, 'Patola Silk Sarees', '1730730111.jpg', 0);

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
(25, 12, 'Kanjeevaram1'),
(26, 12, 'Kanjeevaram2'),
(27, 12, 'Kanjeevaram3'),
(28, 13, 'Banarasi Silk 1'),
(29, 13, 'Banarasi Silk 2'),
(30, 13, 'Banarasi Silk 3'),
(31, 14, 'Mysore Silk 1'),
(32, 14, 'Mysore Silk 2'),
(33, 14, 'Mysore Silk 3'),
(34, 15, 'Dharmavaram Pattu 1'),
(35, 15, 'Dharmavaram Pattu 2'),
(36, 15, 'Dharmavaram Pattu 3'),
(37, 16, 'Uppada Pattu 1'),
(38, 16, 'Uppada Pattu 2'),
(39, 16, 'Uppada Pattu 3'),
(40, 17, 'Patola Silk 1'),
(41, 17, 'Patola Silk 2'),
(42, 17, 'Patola Silk 3');

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
(3, '2024-02-06 20:22:23', 'II556262', '17672', 0, 0, 0, 0, 0),
(4, '2024-02-06 20:23:12', 'II556262', '73053', 0, 0, 0, 0, 0),
(7, '2024-02-09 12:39:35', 'II169991', '37026', 0, 0, 0, 0, 0),
(8, '2024-02-09 12:49:42', 'II169991', '53057', 72750, 12873.2, 10, 72740, 0),
(10, '2024-02-15 18:23:57', 'II9818911', '57589', 0, 0, 0, 0, 0),
(11, '2024-02-16 02:32:26', 'II9818911', '842010', 0, 0, 0, 0, 0),
(13, '2024-02-28 19:22:14', 'AT854771', '790812', 0, 0, 0, 0, 0),
(14, '2024-03-12 12:53:11', 'AT854771', '80807', 450, 0, 200, 250, 0),
(15, '2024-03-12 17:56:06', 'AT854771', '78438', 450, 0, 200, 250, 0),
(16, '2024-03-14 18:15:56', 'AT854771', '11669', 0, 0, 0, 0, 0),
(17, '2024-03-15 12:58:33', 'AT854771', '387610', 0, 0, 0, 0, 0),
(18, '2024-03-15 20:06:47', 'AT854771', '848711', 50, 2, 10, 40, 0),
(19, '2024-03-16 20:46:25', 'AT854771', '787012', 0, 0, 0, 0, 0),
(20, '2024-03-17 13:52:08', 'AT854771', '908913', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msd_id` int(11) NOT NULL,
  `u_id` varchar(20) NOT NULL,
  `msg_date` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `pro_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_ai`, `pro_date`, `pro_code`, `pro_name`, `pro_desc`, `mrp`, `discount`, `price`, `pro_qty`, `pro_gst`, `pro_sgst`, `pro_cgst`, `pic`, `maincat`, `subcat`, `youtube_link`, `pro_status`) VALUES
(4, '2024-11-04 20:33:27', 'S01', 'Traditional Kanchipuram Sarees', '<p>These sarees stick to classic patterns, such as temple borders, checks, stripes, and floral motifs, often inspired by ancient temples and natural elements. They usually come in vibrant colors with contrasting borders and heavy zari work, making them ideal for weddings and festivals.</p>', 8000, 2500, 5500, 18, 0, 0, 0, NULL, 12, 25, '', 1),
(5, '2024-11-04 20:38:03', 'S02', 'Stripes Kanchipuram Sarees', '<p>Characterized by grid patterns (checks) or horizontal and vertical lines (stripes), these sarees feature intricate detailing in the borders and pallus. The checks and stripes are woven with zari threads, giving them a classy yet traditional look.</p>', 7500, 2000, 5500, 12, 0, 0, 0, NULL, 12, 25, '', 1),
(6, '2024-11-04 20:41:44', 'S03', 'Korvai Kanchipuram Sarees', '<p>The Korvai technique involves weaving the body and the border of the saree separately and then interlocking them together. This gives a sharp contrast between the body and the border, enhancing the saree’s visual appeal.</p>', 8500, 2500, 6000, 1, 0, 0, 0, NULL, 12, 27, '', 1),
(7, '2024-11-04 20:43:25', 'S04', 'Pure Banarasi Silk Saree', '<p>These sarees are made from high-quality silk and are known for their luxurious feel and fine craftsmanship. The designs typically include elaborate floral motifs, traditional patterns, and intricate zari work, making them ideal for weddings and grand events.</p>', 7000, 1900, 5100, 9, 0, 0, 0, NULL, 13, 28, '', 1),
(8, '2024-11-04 20:48:00', 'S05', 'Jangla Banarasi Saree', '<p>Named after their \"Jungle\" theme, Jangla sarees have vibrant, heavy designs featuring floral and leafy patterns that cover the entire saree. These are often woven with colorful silk threads and zari, creating a rich and festive look.</p>', 7800, 1500, 6300, 1, 0, 0, 0, NULL, 13, 29, '', 1),
(9, '2024-11-04 20:49:10', 'S06', 'Resham Banarasi Saree', '<p>Resham sarees use fine silk threads, often without any metallic zari, creating a subtle and delicate appearance. The motifs are woven with colored silk threads, making these sarees lightweight and comfortable yet elegant for semi-formal occasions.</p>', 8000, 1500, 6500, 10, 0, 0, 0, NULL, 13, 28, '', 1),
(10, '2024-11-04 20:52:40', 'S07', 'Mysore Crepe Silk Saree', '<p>Mysore Crepe Silk sarees have a soft, crinkled texture achieved through the crepe weaving technique. They are lightweight and drape beautifully, giving a modern look while retaining traditional charm. These sarees are popular among younger wearers and ideal for semi-formal events.</p>', 12000, 2500, 9500, 21, 0, 0, 0, NULL, 14, 31, '', 1),
(11, '2024-11-04 20:54:52', 'S08', 'Two-Tone Mysore Silk Sarees', '<p>Made with silk threads of different colors, these sarees have an iridescent effect, changing hues under different lighting. The subtle color play makes these sarees visually captivating and ideal for evening functions or festive occasions.</p>', 6000, 1200, 4800, 25, 0, 0, 0, NULL, 14, 32, '', 1),
(12, '2024-11-04 20:58:22', 'S09', 'Printed Mysore Silk Sarees', '<p>In these sarees, traditional motifs like floral patterns, leaves, and abstract designs are printed onto the silk fabric. Printed Mysore silk sarees come in a range of vibrant colors and designs, adding a contemporary touch to the classic Mysore silk style.</p>', 13000, 3000, 10000, 13, 0, 0, 0, NULL, 14, 33, '', 1),
(13, '2024-11-04 21:00:06', 'S10', 'Traditional Dharmavaram Sarees', '<p>These sarees are known for their classic patterns, featuring traditional motifs like peacocks, lotus flowers, and paisleys. They usually come with contrasting double-shaded colors and intricate zari borders, making them ideal for grand occasions.</p>', 15000, 3500, 11500, 19, 0, 0, 0, NULL, 15, 34, '', 1),
(14, '2024-11-04 21:01:12', 'S11', 'Double Shade Dharmavaram Saree', '<p>Known for their unique double-toned or dual-shaded effect, these sarees use two colors to create a mesmerizing gradient or shifting color effect. This dual-tone look enhances the saree’s beauty and makes it appear different from various angles.</p>', 12000, 2000, 10000, 17, 0, 0, 0, NULL, 15, 35, '', 1),
(15, '2024-11-04 21:02:19', 'S12', 'Designer Dharmavaram Sarees', '<p>Designer Dharmavaram sarees incorporate modern patterns, unique color combinations, and minimalistic zari work. These sarees are popular among younger generations who appreciate traditional fabric with a contemporary twist.</p>', 14000, 4000, 10000, 13, 0, 0, 0, NULL, 15, 36, '', 1),
(16, '2024-11-04 21:04:05', 'S13', 'Jamdani Weave Uppada Sarees', '<p>The Jamdani weaving technique is a hallmark of Uppada sarees. It involves the interweaving of patterns directly into the fabric, creating elaborate and detailed designs. These sarees showcase intricate floral and geometric motifs and are highly prized for their artistry.</p>', 16000, 5000, 11000, 30, 0, 0, 0, NULL, 16, 37, '', 1),
(17, '2024-11-04 21:04:59', 'S14', 'Kaddi Border Uppada Sarees', '<p>Kaddi borders are wide strips of zari along the edges, creating a bold and luxurious look. The plain, wide zari borders provide a striking contrast to the delicate fabric, making these sarees perfect for weddings and grand celebrations.</p>', 14000, 2000, 12000, 40, 0, 0, 0, NULL, 16, 38, '', 1),
(18, '2024-11-04 21:05:55', 'S15', 'Floral Uppada Pattu Sarees', '<p>These sarees feature large floral motifs, either spread across the saree or concentrated on the pallu and border. The floral designs, often created using zari, give the saree a fresh and graceful appearance, suitable for various formal events.</p>', 17000, 4500, 12500, 35, 0, 0, 0, NULL, 16, 39, '', 1),
(19, '2024-11-04 23:21:04', 'S16', 'Rajkot Patola Sarees', '<p>Rajkot Patola sarees are single ikat sarees where only the warp or the weft threads are dyed before weaving. They are easier to make compared to double ikat and come in vibrant colors and designs. They have a similar look to traditional Patola but are more affordable and lighter, making them popular for casual and festive wear.</p>', 15600, 2300, 13300, 38, 0, 0, 0, NULL, 17, 40, '', 1),
(20, '2024-11-04 23:22:12', 'S17', 'Rath Patola Sarees', '<p>Rath Patola sarees depict chariots, representing royal and historical themes. The motifs are woven intricately with vibrant colors, giving the saree a grand, timeless look. These sarees are ideal for cultural events, rituals, and weddings.</p>', 16000, 2500, 13500, 100, 0, 0, 0, NULL, 17, 41, '', 1),
(21, '2024-11-04 23:23:09', 'S18', 'Floral Patola Sarees', '<p>Floral motifs are widely popular in Patola sarees. These sarees showcase flowers arranged in geometric patterns, adding a touch of elegance and femininity. Floral Patola sarees are versatile and can be worn at both formal and festive events.</p>', 16000, 2300, 13700, 170, 0, 0, 0, NULL, 17, 42, '', 1),
(22, '2024-11-04 23:25:58', 'S19', 'Mysore Silk Cotton Blend Saree', '<p>For those who prefer a lighter, breathable option, Mysore silk-cotton blends offer a mix of silk and cotton fibers. These sarees retain the sheen of silk with the comfort of cotton, making them ideal for daily wear or semi-formal events.</p>', 20000, 4000, 16000, 50, 0, 0, 0, NULL, 14, 32, '', 1),
(23, '2024-11-04 23:27:11', 'S20', 'Cutwork Banarasi Sarees', '<p>Cutwork sarees are made by using a cutwork weaving technique on plain silk, where certain parts of the motif are left without threads, giving a lace-like effect. The designs often include floral or leaf patterns and are an affordable alternative to more elaborate styles.</p>', 18000, 2900, 15100, 80, 0, 0, 0, NULL, 13, 29, '', 1);

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
(11, 'S02', '1730732878.jpg', '#000000', 12),
(13, 'S01', '1730732938.jpg', '#000000', 18),
(15, 'S03', '1730733098.jpg', '#000000', 1),
(16, 'S04', '1730733202.jpg', '#000000', 9),
(17, 'S05', '1730733475.jpg', '#000000', 1),
(18, 'S06', '1730733576.jpg', '#000000', 10),
(20, 'S07', '1730733756.jpg', '#000000', 21),
(21, 'S08', '1730733890.jpg', '#000000', 25),
(22, 'S09', '1730734100.jpg', '#000000', 13),
(23, 'S10', '1730734205.jpg', '#000000', 19),
(24, 'S11', '1730734271.jpg', '#000000', 17),
(25, 'S12', '1730734337.jpg', '#000000', 13),
(26, 'S13', '1730734444.jpg', '#000000', 30),
(27, 'S14', '1730734498.jpg', '#000000', 40),
(28, 'S15', '1730734554.jpg', '#000000', 35),
(29, 'S16', '1730742662.jpg', '#000000', 38),
(30, 'S17', '1730742730.jpg', '#000000', 100),
(31, 'S18', '1730742787.jpg', '#000000', 170),
(32, 'S19', '1730742955.jpg', '#000000', 50),
(33, 'S20', '1730743030.jpg', '#000000', 80),
(37, 'S01', '1730873010.jpg', '#da4e4e', 18),
(38, 'S01', '1730873369.jpg', '#f94eb1', 15),
(39, 'S02', '1730876372.jpg', '#48d1db', 12),
(40, 'S02', '1730876411.jpg', '#4ecac8', 1),
(41, 'S03', '1730876438.jpg', '#000000', 19),
(42, 'S03', '1730876455.jpg', '#8c3636', 10),
(43, 'S04', '1730876483.jpg', '#cb5757', 11),
(44, 'S04', '1730876495.jpg', '#cb5757', 20),
(45, 'S05', '1730876528.jpg', '#d058b6', 25),
(46, 'S05', '1730876540.jpg', '#d0cb49', 25),
(47, 'S06', '1730876573.jpg', '#417836', 35),
(48, 'S06', '1730876591.jpg', '#6d3687', 12),
(49, 'S07', '1730876620.jpg', '#926fd3', 35),
(50, 'S07', '1730876634.jpg', '#d968c1', 26),
(51, 'S08', '1730876668.jpg', '#d19eb9', 25),
(52, 'S08', '1730876681.jpg', '#c6627b', 30),
(53, 'S09', '1730876719.jpg', '#479a6f', 30),
(54, 'S09', '1730876742.jpg', '#d29783', 30),
(55, 'S10', '1730876786.jpg', '#b4bc4e', 41),
(56, 'S10', '1730876798.jpg', '#4c734a', 20),
(57, 'S11', '1730876826.jpg', '#d05353', 34),
(58, 'S11', '1730876838.jpg', '#def278', 40),
(59, 'S12', '1730876859.jpg', '#6649d0', 32),
(60, 'S12', '1730876869.jpg', '#d076cd', 22),
(61, 'S13', '1730876893.jpg', '#be83a0', 22),
(62, 'S13', '1730876905.jpg', '#9641c3', 22),
(63, 'S14', '1730876937.jpg', '#e85e9a', 18),
(64, 'S14', '1730876950.jpg', '#9957ea', 10),
(65, 'S15', '1730876988.jpg', '#ef0119', 12),
(66, 'S15', '1730876998.jpg', '#6c50b9', 34),
(67, 'S16', '1730877023.jpg', '#387a4f', 18),
(68, 'S16', '1730877036.jpg', '#b95070', 35),
(69, 'S20', '1730877068.jpg', '#d251b0', 10),
(70, 'S20', '1730877079.jpg', '#51a0d2', 10),
(71, 'S19', '1730877097.jpg', '#b95050', 35),
(72, 'S19', '1730877106.jpg', '#5c1f1f', 35),
(73, 'S18', '1730877126.jpg', '#b04f4f', 10),
(74, 'S18', '1730877133.jpg', '#c15c5c', 10),
(75, 'S17', '1730877164.jpg', '#8b75bd', 19),
(76, 'S17', '1730877174.jpg', '#c2bd38', 19);

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
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg`
--

INSERT INTO `reg` (`id`, `user_id`, `join_date`, `name`, `mail`, `mobile`, `password`, `profile_pic`, `status`) VALUES
(1, 'II123123', '2024-01-06 03:36:29', 'David', 'david@mail.ccgg', '9876543210', '123', '173080025732.jpg', 1),
(2, 'AT854771', '2024-02-28 19:21:26', 'Sathiyavarman', 'sakthivn1982@gmail.com', '9976261024', 'Karuna@#1024', NULL, 0),
(3, 'AT432882', '2024-03-08 12:34:39', 'Karunambikai ', 'N.karna311@gmail.com', '9865666554', 'Jaihinth', NULL, 0);

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_admin`
--
ALTER TABLE `banner_admin`
  ADD PRIMARY KEY (`ban_ai`);

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
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`inv_ai`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner_admin`
--
ALTER TABLE `banner_admin`
  MODIFY `ban_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_sub`
--
ALTER TABLE `category_sub`
  MODIFY `subcat_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `inv_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pro_images`
--
ALTER TABLE `pro_images`
  MODIFY `pi_ai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transcation_history`
--
ALTER TABLE `transcation_history`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

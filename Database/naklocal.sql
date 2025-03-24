-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 05:06 PM
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
-- Database: `naklocal`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(30) DEFAULT NULL,
  `quantity` int(30) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `created_by` int(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `quantity`, `amount`, `created_by`, `created_at`) VALUES
(4, 12, 2, 338.00, 1, '2025-03-18 12:37:06'),
(5, 10, 1, 339.00, 1, '2025-03-18 13:48:19'),
(8, 12, 8, 1352.00, 3, '2025-03-23 15:04:27'),
(9, 6, 1, 479.00, 3, '2025-03-23 15:12:07'),
(10, 11, 1, 149.00, 3, '2025-03-23 15:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Sweatshirt', '2025-03-13 14:17:49', '2025-03-14 14:16:59'),
(2, 'Jersey', '2025-03-14 14:17:49', '2023-03-17 14:16:59'),
(3, 'Sweater', '2025-03-12 14:18:12', '2025-03-14 14:17:50'),
(4, 'T-Shirt', '2025-03-14 14:18:12', '2025-03-15 14:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders_dt`
--

CREATE TABLE `orders_dt` (
  `order_dt_id` int(11) NOT NULL,
  `order_id` int(30) DEFAULT NULL,
  `product_id` int(30) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `quantity` int(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders_dt`
--

INSERT INTO `orders_dt` (`order_dt_id`, `order_id`, `product_id`, `amount`, `quantity`, `created_at`, `created_by`) VALUES
(1, 1, 11, 249.00, 1, '2025-03-15 18:34:56', 3),
(2, 2, 10, 439.00, 1, '2025-03-15 18:36:11', 3),
(3, 3, 11, 298.00, 2, '2025-03-18 13:55:16', 3),
(4, 3, 10, 339.00, 1, '2025-03-18 13:55:16', 3),
(5, 4, 12, 169.00, 1, '2025-03-18 14:08:54', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders_hdr`
--

CREATE TABLE `orders_hdr` (
  `order_id` int(11) NOT NULL,
  `order_ref_id` varchar(200) DEFAULT NULL,
  `total_amount` decimal(11,2) DEFAULT NULL,
  `payment_status` varchar(200) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `created_by` int(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders_hdr`
--

INSERT INTO `orders_hdr` (`order_id`, `order_ref_id`, `total_amount`, `payment_status`, `order_status`, `fullname`, `address`, `email`, `phone`, `payment_method`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'XpibcAUThC', 249.00, 'Paid', 'Active', 'Boruto ', '30, hidup ', 'uzumaki@gmail.com', '1123123123123213', 'Online Banking', 3, '2025-03-15 18:34:56', 3, '2025-03-16 02:34:56'),
(2, 'BedwrWDzK1', 439.00, 'Paid', 'Active', 'Boruto', '30, hidup', 'uzumaki@gmail.com', '655656565665', 'Online Banking', 3, '2025-03-15 18:36:11', 3, '2025-03-16 02:36:11'),
(3, 'gC48QGXdDY', 637.00, 'Paid', 'Active', 'Boruto', '30, hidup', 'uzumaki@gmail.com', '0123123231', 'Online Banking', 3, '2025-03-18 13:55:16', 3, '2025-03-18 21:55:16'),
(4, 'E0WCTevUVh', 169.00, 'Paid', 'Active', 'Boruto', '30, hidup', 'uzumaki@gmail.com', '45465476547', 'Online Banking', 3, '2025-03-18 14:08:54', 3, '2025-03-18 22:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(30) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_cat` int(30) DEFAULT NULL,
  `product_desc` text DEFAULT NULL,
  `product_stock` int(30) DEFAULT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_price` decimal(11,2) DEFAULT NULL,
  `created_by` int(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_cat`, `product_desc`, `product_stock`, `product_img`, `product_price`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(5, 'SHINKO - BANGER', 1, 'This is a stylish varsity-style sherpa jacket with a retro sports club aesthetic.', 3, '5-download (3).jpg', 669.00, 1, '2024-11-17 11:53:58', 1, '2025-03-18 20:59:48'),
(6, 'Nike Sweater - Camo ', 3, 'This Nike hoodie features a bold abstract design with a brown and white pattern resembling a fluid or organic shape.', 6, '6-download (2).jpg', 479.00, 1, '2024-11-17 12:02:07', 1, '2025-03-18 20:55:41'),
(7, 'Multiple Panel Sweatshirt ', 1, '– Modern Streetwear Essential  Upgrade your streetwear game with this Multiple Panel Sweatshirt, designed for both comfort and style.', 8, '7-Multiple panel sweatshirt.jpg', 229.00, 1, '2024-11-17 12:13:17', 1, '2025-03-18 20:53:34'),
(8, 'PALACE SKATEBOARDS ', 4, 'Upgrade your wardrobe with this Palace Skateboards Tech Jersey, blending athletic performance with streetwear aesthetics.', 6, '8-PALACE SKATEBOARDS 2023年秋コレクション発売アイテム一覧.jpg', 599.00, 1, '2024-11-17 12:15:47', 1, '2025-03-18 20:52:28'),
(10, 'Nike - Fire Black & White ', 3, 'Elevate your streetwear game with this bold and stylish nike hoodie! Perfect for casual wear, hip-hop fashion, and statement outfits.', 5, '10-download (1).jpg', 339.00, 1, '2024-11-17 17:00:51', 1, '2025-03-18 20:50:42'),
(11, 'Men\'s Retro Zip-Up Short Sleeve Shirt', 4, 'Add a bold touch to your wardrobe with this stylish short-sleeve zip-up shirt, perfect for urban and streetwear enthusiasts.', 0, '11-download.jpg', 149.00, 1, '2024-11-17 17:16:58', 1, '2025-03-18 20:47:30'),
(12, 'Adidas Retro-Inspired Button-Up Polo Shirt', 4, 'This Adidas short-sleeve button-up polo seamlessly blends vintage athletic style with modern casual wear. The navy blue body contrasts with the off-white collar and shoulder stripes, creating a clean and timeless look. It’s a sophisticated take on sportswear, perfect for both casual and semi-formal streetwear styles.', 8, '12-download (5).jpg', 169.00, 1, '2024-11-17 17:19:21', 1, '2025-03-18 21:03:08'),
(16, 'Test Shirt', 1, 'Testing product', 10, 'test.jpg', 99.99, NULL, '2025-03-24 09:34:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'A',
  `role` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fullname`, `address`, `status`, `role`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator', '-', 'A', 'Admin', '123', 'admin@gmail.com', '2023-03-29 13:03:29', '2023-03-29 13:03:05'),
(2, 'asydhmd', 'AHMAD ARSYAD HAMIDI BIN ZULRAIMI', 'AMPANG JAYA, SELANGOR', 'A', 'Customer', '123', 'arsyad@gmail.com', '2024-11-17 08:40:48', '2024-11-17 16:40:48'),
(3, 'UzumakiNamikaze01', 'Boruto', '30, hidup', 'A', 'Customer', 'salamkenal', 'uzumaki@gmail.com', '2025-03-15 18:21:38', '2025-03-16 02:21:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_product` (`product_id`),
  ADD KEY `fk_cart_user` (`created_by`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders_dt`
--
ALTER TABLE `orders_dt`
  ADD PRIMARY KEY (`order_dt_id`),
  ADD KEY `fk_ordersdt_ordershdr` (`order_id`),
  ADD KEY `fk_ordersdt_product` (`product_id`),
  ADD KEY `fk_ordersdt_user` (`created_by`);

--
-- Indexes for table `orders_hdr`
--
ALTER TABLE `orders_hdr`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_ordershdr_user` (`created_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_category` (`product_cat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_dt`
--
ALTER TABLE `orders_dt`
  MODIFY `order_dt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_hdr`
--
ALTER TABLE `orders_hdr`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_dt`
--
ALTER TABLE `orders_dt`
  ADD CONSTRAINT `fk_ordersdt_ordershdr` FOREIGN KEY (`order_id`) REFERENCES `orders_hdr` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ordersdt_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ordersdt_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_hdr`
--
ALTER TABLE `orders_hdr`
  ADD CONSTRAINT `fk_ordershdr_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`product_cat`) REFERENCES `category` (`category_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

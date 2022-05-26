-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 04:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donut_shack`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(6, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin@gmail.com', '', '2022-03-20 09:36:18'),
(17, 'pines22', 'b6d767d2f8ed5d21a44b0e5886680cb9', 'pinesjohnbernard@gmail.com', '0012', '2022-04-30 08:41:10'),
(18, 'verdel01', '363d21cddcccf7e066629857a5a0ab56', 'manzanoverdel@gmail.com', 'verdel01', '2022-04-30 09:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `codes`) VALUES
(1, 'QX5ZMN'),
(2, 'QFE6ZM'),
(3, 'QMZR92'),
(4, 'QPGIOV'),
(5, 'QSTE52'),
(6, 'QMTZ2J');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(62, 66, 'Blue Berry', 'Donuts', '25.00', '626b9b2678806.png'),
(63, 66, 'Choco Candy Marble Sprinkle', 'Donut', '20.00', '626b8c687372a.png'),
(64, 66, 'Choco Coconut ', 'Donut', '20.00', '626b908e365af.png'),
(65, 66, 'Choco French Crueller ', 'Donut', '22.00', '626b90c6d900f.png'),
(66, 66, 'Choco Frosted ', 'Donut', '20.00', '626b917e2c295.png'),
(67, 66, 'Choco Marble Frosted', 'Donut', '20.00', '626b929fd36d7.png'),
(68, 66, 'Choco Sprinkle', 'Donut', '20.00', '626b92b5c4507.png'),
(83, 66, 'Coconut ', 'Donut', '25.00', '626b9abe93b90.png'),
(84, 66, 'Coconut Frosted', 'Donut', '28.00', '626b9ae427132.png'),
(85, 66, 'Double Choco', 'Donut', '25.00', '626b9bb987101.png'),
(86, 66, 'French Crueller', 'Donut', '30.00', '626b9c1e9189d.png'),
(87, 66, 'Glazed Cake', 'Donut', '30.00', '626b9c68063f7.png'),
(88, 66, 'Glazed Choco', 'Donut', '25.00', '626b9c8976473.png'),
(89, 66, 'Glazed French Crueller', 'Donut', '30.00', '628f8ca2e5403.png');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remarkDate`) VALUES
(95, 85, 'closed', '2022-05-21 07:33:07'),
(96, 85, 'closed', '2022-05-21 07:34:20'),
(97, 85, 'in process', '2022-05-21 07:49:10'),
(98, 85, 'in process', '2022-05-21 07:54:07'),
(99, 85, 'in process', '2022-05-21 07:55:04'),
(100, 85, 'in process', '2022-05-21 07:55:55'),
(101, 87, 'closed', '2022-05-21 08:22:33'),
(102, 87, 'in process', '2022-05-21 08:22:59'),
(103, 87, 'rejected', '2022-05-21 08:24:13'),
(104, 112, 'closed', '2022-05-21 10:32:00'),
(105, 112, 'in process', '2022-05-26 13:18:44'),
(106, 112, 'closed', '2022-05-26 13:55:34'),
(107, 113, 'closed', '2022-05-26 14:02:36'),
(108, 112, 'in process', '2022-05-26 14:20:42'),
(109, 115, 'rejected', '2022-05-26 14:30:45'),
(110, 117, 'in process', '2022-05-26 14:39:49'),
(111, 117, 'closed', '2022-05-26 14:40:10'),
(112, 118, 'in process', '2022-05-26 14:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(66, 0, 'Donut Shack(caloocan)', 'donutshack@gmail.com', '0907-417-653 ', 'donutshack.com', '6am', '10pm', '24hr-x7', '    2nd Avenue, West Grace Park, Caloocan City    ', '628f8c37a1aa5.jpg', '2022-05-26 14:18:31'),
(79, 0, 'Donut Shack(manila city)', 'donutshack@gmail.com', '0907-417-653 ', 'donutshack.com', '6am', '10pm', 'mon-sat', '  Hermosa St. Tondo Manila City  ', '6280802d3f63e.jpg', '2022-05-15 04:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`c_id`, `c_name`, `date`) VALUES
(28, 'Donut Shop(Manila City)', '2022-05-15 04:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(48, 'Allyson04', 'Allyson', 'Peyton', 'allysonpeyton@gmail.com', '01234567891', '12a78a93409164a0014c7174938bb013', 'Caloocan City', 1, '2022-05-26 14:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(118, 48, 'Blue Berry', 1, '25.00', 'in process', '2022-05-26 14:52:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

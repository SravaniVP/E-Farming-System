-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 06:14 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farming`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'AGRICULTURAL OFFICER'),
(3, 'SELLER'),
(4, 'BUYER');

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`id`, `name`, `user_id`) VALUES
(18, 'wheat', 2),
(20, 'rose', 2),
(21, 'rice', 6),
(22, 'lotus', 6),
(23, 'corn', 2),
(24, 'paddy', 2),
(26, 'jowar', 5),
(27, 'af', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fertilizers`
--

CREATE TABLE `fertilizers` (
  `id` int(11) NOT NULL,
  `fer_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fertilizers`
--

INSERT INTO `fertilizers` (`id`, `fer_name`) VALUES
(7, 'f1'),
(8, 'f2'),
(9, 'f3');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `buyer_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(255) NOT NULL,
  `expmonth` int(11) NOT NULL,
  `expyear` year(4) NOT NULL,
  `cvv` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`buyer_id`, `payment_id`, `cardname`, `cardnumber`, `expmonth`, `expyear`, `cvv`, `product_id`) VALUES
(4, 2, '', '', 0, 0000, 0, 11),
(4, 3, '', '', 0, 0000, 0, 10),
(4, 4, 'Sravani', '456', 456, 2056, 456, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pesticides`
--

CREATE TABLE `pesticides` (
  `id` int(11) NOT NULL,
  `pest_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesticides`
--

INSERT INTO `pesticides` (`id`, `pest_name`) VALUES
(1, 'pest1'),
(2, 'pest2'),
(3, 'pest3'),
(4, 'pest4');

-- --------------------------------------------------------

--
-- Table structure for table `placeorder`
--

CREATE TABLE `placeorder` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `quantity_selected` int(11) NOT NULL,
  `mode` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `Local_add` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `contact` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placeorder`
--

INSERT INTO `placeorder` (`order_id`, `product_id`, `buyer_id`, `quantity_selected`, `mode`, `date`, `fullname`, `state`, `country`, `Local_add`, `pincode`, `contact`) VALUES
(1, 5, 4, 500, 0, '2018-10-29 12:54:30', 'Jamithra', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 6789012345),
(7, 11, 4, 45, 1, '2018-11-03 09:00:22', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(8, 10, 4, 45, 1, '2018-11-03 09:01:15', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(9, 7, 4, 12, 0, '2018-11-03 09:38:13', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(10, 7, 4, 50, 1, '2018-11-04 06:05:30', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(11, 7, 4, 12, 0, '2018-11-04 06:06:26', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(12, 8, 4, 338, 0, '2018-11-05 09:15:34', 'Padma Mothe', 'TELANGANA', 'India', '1/436-1A,Maruthi Nagar,Banjara Hills,Hyderabad', '509382', 9482291601),
(13, 5, 4, 2000, 0, '2018-11-05 09:47:42', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(14, 8, 4, 26, 0, '2018-11-05 09:50:47', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(15, 10, 4, 1954, 0, '2018-11-05 09:51:47', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135),
(16, 7, 4, 326, 0, '2018-11-05 09:55:13', 'Sravani Mothe', 'Andhra Pradesh', 'India', '4-2/4, Ramana Photo studio,, Bhoothpur, Mahabubnagar', '509382', 8466911135);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `p_id` int(11) NOT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `soil` varchar(255) NOT NULL,
  `climate` text NOT NULL,
  `fertilizer` text NOT NULL,
  `pesticide` text NOT NULL,
  `new_tech` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`p_id`, `crop_id`, `soil`, `climate`, `fertilizer`, `pesticide`, `new_tech`) VALUES
(85, 20, 'soil', 'climate', 'fertilizer', 'pesticide', 'newtech'),
(86, 19, 'try', 'try', 'try', 'try', 'try');

-- --------------------------------------------------------

--
-- Table structure for table `process_fer`
--

CREATE TABLE `process_fer` (
  `id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `fer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_fer`
--

INSERT INTO `process_fer` (`id`, `crop_id`, `fer_id`) VALUES
(59, 18, 7),
(60, 18, 8),
(61, 18, 9),
(62, 20, 8),
(63, 20, 9);

-- --------------------------------------------------------

--
-- Table structure for table `process_new_tech`
--

CREATE TABLE `process_new_tech` (
  `id` int(11) NOT NULL,
  `process_id` int(11) NOT NULL,
  `proc_new_tech` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process_pest`
--

CREATE TABLE `process_pest` (
  `id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `pest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_pest`
--

INSERT INTO `process_pest` (`id`, `crop_id`, `pest_id`) VALUES
(9, 18, 1),
(10, 18, 2),
(11, 18, 3),
(12, 18, 4),
(13, 20, 2),
(14, 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL,
  `quantity_selected_by_all_users` int(11) NOT NULL,
  `price` float NOT NULL,
  `product_desc` text NOT NULL,
  `crop_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `seller_id`, `product_name`, `quantity`, `quantity_selected_by_all_users`, `price`, `product_desc`, `crop_image`) VALUES
(5, 2, 'rose', 1813, 2500, 5, '<br>is 5 rupees as mentioned above.<br>The crop is cultivated under the guidance of the agricultural officer.<br>Organic matter is added to the soil during the preparation of a garden bed</br>', 'rose.jpg'),
(7, 6, 'rice', 400, 400, 3, '<br>Rice Per kg is 3 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.<br>Fertile riverine alluvial soil is used for cultivation.<br> Pesticide used is <b>Carbaryl</b><br>fertilizer used is Urea', 'rice.jpg'),
(8, 2, 'corn', 365, 364, 50, '<br>Corn Per kg is 50 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.<br>sweet corn is also available', 'corn.jpg'),
(9, 2, 'wheat', 1000, 125, 20, '<br>Wheat Per kg is 20 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.<br>Discount is 5%', 'wheat.jpg'),
(10, 5, 'jowar', 2001, 1999, 15, '<br>jowar Per kg is 15 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.<br>There is no discount', 'jowar.jpg'),
(11, 6, 'lotus', 100, 45, 50, '<br>Lotus Per flower is 55 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.', 'lotus.jpg'),
(12, 2, 'cereal', 950, 0, 50, '<br>Cereal Per kg is 50 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.', 'cereal.jpg'),
(13, 5, 'Cotton', 5000, 0, 10, '<blockquote><p><strong>Price per quantity</strong> means per kg</p></blockquote><p>There is no discount&nbsp;</p>', 'cotton.jpg'),
(14, 5, 'Groundnut', 5000, 0, 100, '<br>Groundnut Per kg is 100 rupees as mentioned above.<br>The crop is cultivated with the guidance of the agricultural officer.', 'groundnut.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `contact` bigint(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `localAddress` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `registered_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `contact`, `email`, `localAddress`, `state`, `country`, `pincode`, `username`, `password`, `category_id`, `registered_date`) VALUES
(1, 'Sravani', 'Balupri', 8466911135, 'vpsravanitm909@gmail.com', '4-2/4, Ramana Photo studio, Bhoothpur, Mahabubnagar', 'Telanagana', 'India', '509382', 'sravani', '757660a9df57c03359acdc5b3b0dbec7', 1, '2018-10-17 17:01:31'),
(2, 'Madhu', 'Chappa', 8466911135, 'pavanikolluru22@gmail.com', 'Banjara Hills, Hyderbad', 'Telanagana', 'India', '509123', 'madhu', '84811fed582a9c7b8cb41f68f0ed6147', 3, '2018-10-17 17:14:33'),
(3, 'Ramana', 'Mothe', 9401278630, 'ramanamothe22@gmail.com', '1/8, Bhoothpur, Guntur', 'Andhra Pradesh', 'India', '509001', 'ramana', '426e8345d74098dbf8af7f227d955512', 2, '2018-10-18 08:35:32'),
(4, 'padma', 'sharma', 8466911135, 'padmasharma909@gmail.com', 'pune', 'Maharastra', 'India', '506145', 'padma', 'da6be0c9bc66af9b0f68835c8fcc44c0', 4, '2018-10-18 08:39:32'),
(5, 'ramulu', 'Butta', 954701238, 'ramulu22@gmail.com', '6-8,Ahmadabad', 'Gujarat', 'India', '507412', 'ramulu', 'da9943588c221682f796cb3c791f6d89', 3, '2018-10-20 03:20:21'),
(6, 'Ambika', 'Agarwal', 8794561230, 'ambika@gmail.com', 'Bubaneshwar', 'Orissa', 'India', '505412', 'ambika', '8b75b9bcacb8c318be58b24092ef50a5', 3, '2018-10-21 13:37:13'),
(7, 'Druva', 'singh', 7540121389, 'druvasingh94@gmail.com', '1-56,Amritsar', 'punjab', 'India', '509256', 'papa', '0ac6cd34e2fac333bf0ee3cd06bdcf96', 2, '2018-10-24 05:14:39'),
(8, 'Tulasi', '', 6897012345, 'tulasi@gmail.com', 'Surathkal, Dakshin Kannada', 'karnataka', 'India', '509382', 'tulasi', '98059a8aacb19cdc52dd14199b124512', 4, '2018-10-24 07:11:53'),
(10, 'vaishnavi', 'jerri', 7894560123, 'vaishnavi6799@gmail.com', '2/8,Kadappa', 'Karnataka', 'India', '504001', 'jerri', '0f1282e37956dcc3a7ff4644266a0bfa', 4, '2018-10-28 19:18:54'),
(11, 'pavani', 'kolluru', 8466911135, 'pavanikolluru22@gmail.com', '5-6/7,Gajapathinagaram,Vizag', 'Andhra Pradesh', 'India', '504123', 'pavani', 'd9ef180a5dd59a3582dde63e6531dad8', 4, '2018-10-28 19:20:21'),
(12, 'likki', 'banda', 8466911153, 'vpsravanitm909@gmail.com', 'NITK SURATHKAL', 'Karnataka', 'jkjl', '575025', 'likki', 'cd7e512fa061f39435b2f240c4b1f617', 2, '2019-04-08 13:10:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pesticides`
--
ALTER TABLE `pesticides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placeorder`
--
ALTER TABLE `placeorder`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `process_fer`
--
ALTER TABLE `process_fer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_new_tech`
--
ALTER TABLE `process_new_tech`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_pest`
--
ALTER TABLE `process_pest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `crop`
--
ALTER TABLE `crop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fertilizers`
--
ALTER TABLE `fertilizers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pesticides`
--
ALTER TABLE `pesticides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `placeorder`
--
ALTER TABLE `placeorder`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `process_fer`
--
ALTER TABLE `process_fer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `process_new_tech`
--
ALTER TABLE `process_new_tech`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process_pest`
--
ALTER TABLE `process_pest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

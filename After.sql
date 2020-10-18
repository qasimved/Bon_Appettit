-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2018 at 04:25 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bonappetit`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner_ad`
--

CREATE TABLE `tbl_banner_ad` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(255) NOT NULL,
  `banner_desc` text NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_qty` int(2) NOT NULL,
  `menu_price` float(11,2) NOT NULL,
  `desired_recieval_time` varchar(20) NOT NULL,
  `OrderOption` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`) VALUES
(2, 'Chinese', '70220_Chinese.jpg'),
(3, 'Pakistani', '47372_Indian.jpg'),
(4, 'Mexican', '4350_Mexican.jpg'),
(5, 'Italian', '7438_Thai.jpg'),
(6, 'American', '75757_corndog.jpg'),
(7, 'Japanese Food', '88764_japanese-food-625_625x406_81461928658.jpg'),
(8, 'Thai Food', '57255_Thai_Food_at_Manthana_Cuisine1.png'),
(9, 'African Food', '94866_download.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `fb_id` varchar(255) DEFAULT '',
  `gplus_id` varchar(255) DEFAULT '',
  `CustomerFirstName` varchar(255) NOT NULL,
  `CustomerMiddleName` varchar(255) NOT NULL,
  `CustomerLastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `customer_image` text,
  `paypal_payment_id` varchar(255) DEFAULT '',
  `confirm_code` varchar(255) DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `user_type`, `fb_id`, `gplus_id`, `CustomerFirstName`, `CustomerMiddleName`, `CustomerLastName`, `email`, `password`, `phone`, `address`, `customer_image`, `paypal_payment_id`, `confirm_code`, `status`) VALUES
(3, NULL, '', '', 'Junaid', 'efefdefe', NULL, 'junaidjavaid971@gmail.com', 'Junaid@586243', '03329766923', NULL, 'internet Config.JPG', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_intro`
--

CREATE TABLE `tbl_intro` (
  `id` int(11) NOT NULL,
  `intro_title` varchar(255) NOT NULL,
  `intro_description` text NOT NULL,
  `intro_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_intro`
--

INSERT INTO `tbl_intro` (`id`, `intro_title`, `intro_description`, `intro_image`) VALUES
(1, 'Intro Title 1', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', '79925_Screen_Sort1.png'),
(2, 'Intro 2', 'It is a long established fact that a reader will be distracted by the readable', '76296_Screen_Sort2.png'),
(3, 'Intro Title 3', 'will be distracted by the readable content of a page when looking at its layout', '53607_Screen_Sort3.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_category`
--

CREATE TABLE `tbl_menu_category` (
  `cid` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_menu_category`
--

INSERT INTO `tbl_menu_category` (`cid`, `restaurant_id`, `category_name`) VALUES
(5, 4, 'Pakistani'),
(6, 4, 'Chinese'),
(9, 6, 'Italian'),
(10, 6, 'Mexican'),
(12, 2, 'Chinese'),
(13, 9, 'African');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_list`
--

CREATE TABLE `tbl_menu_list` (
  `mid` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `menu_cat` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_info` text,
  `menu_image` varchar(255) DEFAULT NULL,
  `menu_price` float(11,2) NOT NULL,
  `servings` int(5) NOT NULL,
  `calories` int(5) NOT NULL,
  `menu_quantity` int(5) NOT NULL,
  `MenuPreparationTime` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_menu_list`
--

INSERT INTO `tbl_menu_list` (`mid`, `rest_id`, `menu_cat`, `menu_name`, `menu_info`, `menu_image`, `menu_price`, `servings`, `calories`, `menu_quantity`, `MenuPreparationTime`) VALUES
(1, 1, 6, 'Chicken Steak', 'Chicken fried steak is an American breaded cutlet dish consisting of a piece of beefsteak coated with seasoned flour and pan-fried. It is sometimes associated with the Southern cuisine of the United States. Despite the name, the dish contains no chicken, but is so-named because the cooking method is similar to that of pan-fried chicken breast cutlets. Chicken fried steak resembles the Austrian dish wiener schnitzel and the Italian-South American dish milanesa, which is a tenderized veal or porkvffdbdfbdgfbgd', 'Chicken-Steak.jpg', 650.00, 1, 300, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `rest_id` int(6) NOT NULL,
  `order_unique_id` varchar(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_comment` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`id`, `user_id`, `cart_id`, `rest_id`, `order_unique_id`, `order_date`, `order_comment`, `status`) VALUES
(1, 3, 7, 1, 'gkEgEVbxU2', '2018-11-17 17:02:52', '', 'Confirmed'),
(2, 3, 7, 1, 'dtzTaLr9cg', '2018-11-17 05:28:44', '', 'Pending'),
(3, 3, 7, 1, '062VfwDB00', '2018-11-17 05:32:12', '', 'Pending'),
(4, 3, 7, 1, '0UCjCxhkzj', '2018-11-17 05:36:02', '', 'Pending'),
(5, 3, 7, 1, '6HvZ3g9gso', '2018-11-17 05:37:24', '', 'Pending'),
(6, 3, 7, 1, 'y9lYsP43N9', '2018-11-17 05:39:44', '', 'Pending'),
(7, 3, 7, 1, 'yLkq7wEgij', '2018-11-17 06:18:54', '', 'Pending'),
(8, 3, 7, 1, 'Me4pKgLN05', '2018-11-17 06:21:44', '', 'Pending'),
(9, 3, 7, 1, 'nmkR9KlZqP', '2018-11-17 06:24:17', '', 'Pending'),
(10, 3, 8, 1, 'TDpZ4H4tfQ', '2018-11-17 06:51:56', '', 'Pending'),
(11, 3, 9, 1, '3D7EQVC5q1', '2018-11-17 17:02:35', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_items`
--

CREATE TABLE `tbl_order_items` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_qty` int(2) NOT NULL,
  `OrderOption` varchar(10) NOT NULL,
  `menu_price` float(11,2) NOT NULL,
  `menu_total_price` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order_items`
--

INSERT INTO `tbl_order_items` (`id`, `order_id`, `user_id`, `rest_id`, `menu_id`, `menu_name`, `menu_qty`, `OrderOption`, `menu_price`, `menu_total_price`) VALUES
(1, 'gkEgEVbxU2', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(2, 'dtzTaLr9cg', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(3, '062VfwDB00', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(4, '0UCjCxhkzj', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(5, '6HvZ3g9gso', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(6, 'y9lYsP43N9', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(7, 'yLkq7wEgij', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(8, 'Me4pKgLN05', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(9, 'nmkR9KlZqP', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(10, 'TDpZ4H4tfQ', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00),
(11, '3D7EQVC5q1', 3, 1, 1, 'Chicken Steak', 1, 'Dine In', 650.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `r_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `rate` int(11) NOT NULL,
  `msg` text,
  `dt_rate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurants`
--

CREATE TABLE `tbl_restaurants` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL,
  `restaurant_email` varchar(50) NOT NULL,
  `restaurant_password` varchar(20) NOT NULL,
  `restaurant_image` varchar(255) NOT NULL,
  `restaurant_address` varchar(500) NOT NULL,
  `restaurant_phone_number` int(13) NOT NULL,
  `restaurant_city` varchar(25) NOT NULL,
  `Takeaway` varchar(3) NOT NULL,
  `DineIn` varchar(3) NOT NULL,
  `restaurant_open_mon` varchar(255) DEFAULT NULL,
  `restaurant_open_tues` varchar(255) DEFAULT NULL,
  `restaurant_open_wed` varchar(255) DEFAULT NULL,
  `restaurant_open_thur` varchar(255) DEFAULT NULL,
  `restaurant_open_fri` varchar(255) DEFAULT NULL,
  `restaurant_open_sat` varchar(255) DEFAULT NULL,
  `restaurant_open_sun` varchar(255) DEFAULT NULL,
  `featured_restaurant` int(1) NOT NULL DEFAULT '0',
  `total_rate` int(11) NOT NULL DEFAULT '0',
  `rate_avg` varchar(255) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_restaurants`
--

INSERT INTO `tbl_restaurants` (`id`, `cat_id`, `restaurant_name`, `restaurant_email`, `restaurant_password`, `restaurant_image`, `restaurant_address`, `restaurant_phone_number`, `restaurant_city`, `Takeaway`, `DineIn`, `restaurant_open_mon`, `restaurant_open_tues`, `restaurant_open_wed`, `restaurant_open_thur`, `restaurant_open_fri`, `restaurant_open_sat`, `restaurant_open_sun`, `featured_restaurant`, `total_rate`, `rate_avg`, `status`) VALUES
(1, 0, 'ChaeKhana', 'zainabamin@gmail.com', 'Chae.khana123', 'logo2-1.png', 'F-11 Markaz', 7730750, 'Islamabad', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '5', 1),
(2, 0, 'KFc', 'zainabamin48@gmail.com', 'Malaysia123@', 'coffee.JPG', 'house8, 21', 2147483647, 'Islamabad', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 1),
(3, 0, 'KFc', 'zainabamin48@gmail.com', 'Malaysia123@', 'coffee.JPG', '324', 2147483647, 'Islamabad', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `app_terms_conditions` text NOT NULL,
  `app_from_email` varchar(255) DEFAULT NULL,
  `app_admin_email` varchar(255) DEFAULT NULL,
  `api_all_order_by` varchar(255) NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `app_terms_conditions`, `app_from_email`, `app_admin_email`, `api_all_order_by`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`) VALUES
(1, 'Bon Apettit', '95296_caprese-salad_625x350_51506417724.jpg', 'sadia@gmail.com', '1.0.0', 'Sadia', '+9230312302', 'sadia.com', '<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n', 'Sadia', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>Information Collected</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n\r\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\r\n\r\n<p><strong>Changes to this Policy</strong></p>\r\n\r\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\r\n\r\n<p><strong>Contacting Us</strong></p>\r\n\r\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at hd@sadia.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\r\n', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>Information Collected</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n', 'sadia@gmail.com', 'sadia@gmail.com', '', 10, 'category_name', 'ASC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner_ad`
--
ALTER TABLE `tbl_banner_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_intro`
--
ALTER TABLE `tbl_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu_category`
--
ALTER TABLE `tbl_menu_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_menu_list`
--
ALTER TABLE `tbl_menu_list`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_items`
--
ALTER TABLE `tbl_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `tbl_restaurants`
--
ALTER TABLE `tbl_restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_banner_ad`
--
ALTER TABLE `tbl_banner_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_intro`
--
ALTER TABLE `tbl_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_menu_category`
--
ALTER TABLE `tbl_menu_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_menu_list`
--
ALTER TABLE `tbl_menu_list`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_order_items`
--
ALTER TABLE `tbl_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_restaurants`
--
ALTER TABLE `tbl_restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

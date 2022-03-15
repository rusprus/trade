-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 15, 2022 at 12:01 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1-log
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trade`
--

-- --------------------------------------------------------

--
-- Table structure for table `Contact`
--

CREATE TABLE `Contact` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `del` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Deal`
--

CREATE TABLE `Deal` (
  `id` int(10) NOT NULL,
  `stock_id` int(10) NOT NULL,
  `date_start` datetime NOT NULL,
  `total_sum` int(10) NOT NULL,
  `start_sum` int(10) NOT NULL,
  `threshold_sum` int(10) NOT NULL,
  `avalible` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Deal_log`
--

CREATE TABLE `Deal_log` (
  `id` int(10) NOT NULL,
  `deal_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `telegram` tinyint(1) NOT NULL,
  `email` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LevelRule`
--

CREATE TABLE `LevelRule` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cretarion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Login_log`
--

CREATE TABLE `Login_log` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `SERVER` varchar(255) DEFAULT NULL,
  `info` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `telegram` tinyint(1) NOT NULL,
  `email` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `deal_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Order_log`
--

CREATE TABLE `Order_log` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Portfolio`
--

CREATE TABLE `Portfolio` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `id` int(10) NOT NULL,
  `category` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `data` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(10) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Profile`
--

CREATE TABLE `Profile` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mibbdle_name` varchar(255) NOT NULL,
  `surename` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `Pasport` varchar(255) NOT NULL,
  `agremant` tinyint(1) NOT NULL,
  `status_id` int(1) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Stock`
--

CREATE TABLE `Stock` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` int(10) NOT NULL,
  `risk` int(10) NOT NULL,
  `best` tinyint(1) NOT NULL,
  `prospect` int(10) NOT NULL,
  `report` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Stock_log`
--

CREATE TABLE `Stock_log` (
  `id` int(10) NOT NULL,
  `stock_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(10) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `in_email` tinyint(1) NOT NULL,
  `in_google` tinyint(1) NOT NULL,
  `in_sms` tinyint(1) NOT NULL,
  `out_email` tinyint(1) NOT NULL,
  `out_google` tinyint(1) NOT NULL,
  `out_sms` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `del` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Wallet`
--

CREATE TABLE `Wallet` (
  `id` int(10) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `sum` int(10) NOT NULL,
  `expect` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Wallet_log`
--

CREATE TABLE `Wallet_log` (
  `id` int(10) NOT NULL,
  `wallet_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `sum` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Contact`
--
ALTER TABLE `Contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Contact_fk0` (`user_id`);

--
-- Indexes for table `Deal`
--
ALTER TABLE `Deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Deal_fk0` (`stock_id`);

--
-- Indexes for table `Deal_log`
--
ALTER TABLE `Deal_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Deal_log_fk0` (`deal_id`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LevelRule`
--
ALTER TABLE `LevelRule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Login_log`
--
ALTER TABLE `Login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Login_log_fk0` (`user_id`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Notifications_fk0` (`user_id`),
  ADD KEY `Notifications_fk1` (`event_id`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_fk0` (`deal_id`);

--
-- Indexes for table `Order_log`
--
ALTER TABLE `Order_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_log_fk0` (`order_id`);

--
-- Indexes for table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Portfolio_fk0` (`order_id`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Profile`
--
ALTER TABLE `Profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Profile_fk0` (`user_id`),
  ADD KEY `Profile_fk1` (`status_id`);

--
-- Indexes for table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Stock_fk0` (`prospect`),
  ADD KEY `Stock_fk1` (`report`);

--
-- Indexes for table `Stock_log`
--
ALTER TABLE `Stock_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Stock_log_fk0` (`stock_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Wallet`
--
ALTER TABLE `Wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Wallet_fk0` (`profile_id`);

--
-- Indexes for table `Wallet_log`
--
ALTER TABLE `Wallet_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Wallet_log_fk0` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contact`
--
ALTER TABLE `Contact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Deal`
--
ALTER TABLE `Deal`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Deal_log`
--
ALTER TABLE `Deal_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Login_log`
--
ALTER TABLE `Login_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Order_log`
--
ALTER TABLE `Order_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Portfolio`
--
ALTER TABLE `Portfolio`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Profile`
--
ALTER TABLE `Profile`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Stock`
--
ALTER TABLE `Stock`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Stock_log`
--
ALTER TABLE `Stock_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Wallet`
--
ALTER TABLE `Wallet`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Contact`
--
ALTER TABLE `Contact`
  ADD CONSTRAINT `Contact_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `Deal`
--
ALTER TABLE `Deal`
  ADD CONSTRAINT `Deal_fk0` FOREIGN KEY (`stock_id`) REFERENCES `Stock` (`id`);

--
-- Constraints for table `Deal_log`
--
ALTER TABLE `Deal_log`
  ADD CONSTRAINT `Deal_log_fk0` FOREIGN KEY (`deal_id`) REFERENCES `Deal` (`id`);

--
-- Constraints for table `Login_log`
--
ALTER TABLE `Login_log`
  ADD CONSTRAINT `Login_log_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Constraints for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD CONSTRAINT `Notifications_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `Notifications_fk1` FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`);

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`deal_id`) REFERENCES `Deal` (`id`);

--
-- Constraints for table `Order_log`
--
ALTER TABLE `Order_log`
  ADD CONSTRAINT `Order_log_fk0` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`);

--
-- Constraints for table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD CONSTRAINT `Portfolio_fk0` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`);

--
-- Constraints for table `Profile`
--
ALTER TABLE `Profile`
  ADD CONSTRAINT `Profile_fk0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `Profile_fk1` FOREIGN KEY (`status_id`) REFERENCES `LevelRule` (`id`);

--
-- Constraints for table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `Stock_fk0` FOREIGN KEY (`prospect`) REFERENCES `Posts` (`id`),
  ADD CONSTRAINT `Stock_fk1` FOREIGN KEY (`report`) REFERENCES `Posts` (`id`);

--
-- Constraints for table `Stock_log`
--
ALTER TABLE `Stock_log`
  ADD CONSTRAINT `Stock_log_fk0` FOREIGN KEY (`stock_id`) REFERENCES `Stock` (`id`);

--
-- Constraints for table `Wallet`
--
ALTER TABLE `Wallet`
  ADD CONSTRAINT `Wallet_fk0` FOREIGN KEY (`profile_id`) REFERENCES `Profile` (`id`);

--
-- Constraints for table `Wallet_log`
--
ALTER TABLE `Wallet_log`
  ADD CONSTRAINT `Wallet_log_fk0` FOREIGN KEY (`wallet_id`) REFERENCES `Wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

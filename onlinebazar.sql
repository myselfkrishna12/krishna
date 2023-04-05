-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 02:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinebazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `roleid` varchar(2) NOT NULL,
  `rolename` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`roleid`, `rolename`) VALUES
('r4', 'Account'),
('r1', 'admin'),
('r5', 'Clerk'),
('r3', 'HR'),
('r2', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `uid` varchar(20) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL CHECK (`gender` in ('m','f')),
  `address_line1` varchar(20) NOT NULL,
  `address_landmark` varchar(20) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pincode` char(6) NOT NULL,
  `aadhar` char(12) DEFAULT NULL,
  `profile_photo` varchar(50) DEFAULT NULL,
  `aadhar_photo` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_role`
--

CREATE TABLE `admin_users_role` (
  `uid` varchar(20) NOT NULL,
  `roleid` varchar(2) NOT NULL,
  `roleassignon` datetime DEFAULT sysdate(),
  `roleupdatedon` datetime DEFAULT sysdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_login`
--

CREATE TABLE `admin_user_login` (
  `uid` varchar(20) NOT NULL,
  `pssword` varchar(100) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `registero` datetime DEFAULT sysdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_user_login`
--

INSERT INTO `admin_user_login` (`uid`, `pssword`, `status`, `registero`) VALUES
('hari@gmail.com', '12345', NULL, '2023-02-13 14:16:01'),
('krishna@gmail.com', '12345', NULL, '2023-02-13 14:15:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`roleid`),
  ADD UNIQUE KEY `rolename` (`rolename`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `aadhar` (`aadhar`);

--
-- Indexes for table `admin_users_role`
--
ALTER TABLE `admin_users_role`
  ADD PRIMARY KEY (`uid`,`roleid`),
  ADD KEY `fkrole` (`roleid`);

--
-- Indexes for table `admin_user_login`
--
ALTER TABLE `admin_user_login`
  ADD PRIMARY KEY (`uid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `fkadminuid` FOREIGN KEY (`uid`) REFERENCES `admin_user_login` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `admin_users_role`
--
ALTER TABLE `admin_users_role`
  ADD CONSTRAINT `fkrole` FOREIGN KEY (`roleid`) REFERENCES `admin_role` (`roleid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fkroleuid` FOREIGN KEY (`uid`) REFERENCES `admin_users` (`uid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

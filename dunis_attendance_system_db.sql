-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2024 at 09:25 AM
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
-- Database: `dunis_attendance_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('3fb5bfde4dd2');

-- --------------------------------------------------------

--
-- Table structure for table `assigned__task`
--

CREATE TABLE `assigned__task` (
  `id` int(11) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `duration` time DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assigned__task`
--

INSERT INTO `assigned__task` (`id`, `detail`, `duration`, `user_id`, `created`, `updated`, `deleted`) VALUES
(13, 'Building our Workforce Management System', '15:22:00', 1, '2024-06-19 10:30:12', '2024-06-20 15:16:40', 0),
(15, 'Profile update for all users | students | instructors | admin | visitors | clients', '00:00:00', 1, '2024-06-19 10:31:11', '2024-06-19 10:32:44', 0),
(16, 'Authorization integration, where only staffs can do work reports, refferee details & etc', NULL, 1, '2024-06-19 10:33:58', '2024-06-19 10:33:58', 0),
(17, 'Calculation of age from DOB', NULL, 1, '2024-06-19 10:34:16', '2024-06-19 10:34:16', 0),
(18, 'Admin can update other profiles and assign tasks | set registration numbers etc.', '15:03:00', 1, '2024-06-19 10:35:16', '2024-06-21 09:57:37', 0),
(19, 'Profile image update | done', '00:00:00', 1, '2024-06-19 10:35:47', '2024-06-21 13:51:46', 0),
(20, 'clocking in and out for all users', NULL, 1, '2024-06-19 10:36:18', '2024-06-19 10:36:18', 0),
(21, 'Display clockings/attendance for all', '10:34:00', 1, '2024-06-19 10:36:36', '2024-06-21 10:33:12', 0),
(22, 'Disable/restrict student ability to update usernames, passwords and registration numbers.', '09:47:00', 1, '2024-06-19 10:37:40', '2024-06-21 09:41:53', 0),
(23, '.Taking favor\'s class on algorithm, and gold', '13:04:00', 1, '2024-06-19 10:38:20', '2024-06-22 09:47:22', 0),
(24, 'Debugging of profile uploads for all users | staffs | students | visitors', '12:59:00', 1, '2024-06-20 12:03:03', '2024-06-20 12:04:52', 0),
(26, 'Create proposals', '09:16:00', 4, '2024-06-22 17:58:45', '2024-06-24 09:14:57', 0),
(27, 'Coding and when awake, drink thick hot tea', '00:00:00', 4, '2024-06-24 09:14:41', '2024-06-24 09:15:21', 0),
(28, 'Building ecomerce application', '04:58:00', 4, '2024-06-24 09:18:05', '2024-06-25 17:23:54', 0),
(29, 'Building mobile applications', '10:57:00', 1, '2024-06-26 11:53:56', '2024-06-26 11:53:56', 0),
(30, 'Creating  Apis for ecommerce apps', NULL, 1, '2024-06-26 11:54:25', '2024-06-26 11:54:25', 0),
(31, 'Computer programming lesson 5 of python advanced', '03:00:00', 5, '2024-06-26 12:05:01', '2024-06-26 12:05:01', 0),
(32, 'Coding fundamentals', NULL, 5, '2024-06-26 18:40:24', '2024-06-26 18:40:24', 0),
(33, 'Taking kid\'s coding class', NULL, 1, '2024-06-28 16:03:03', '2024-06-28 16:03:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `sign_in_time` datetime DEFAULT NULL,
  `sign_out_time` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `timestamp`, `status`, `created`, `updated`, `deleted`, `sign_in_time`, `sign_out_time`, `comment`) VALUES
(80, 1, '2024-05-27', 'p', '2024-05-27 15:39:55', '2024-05-27 15:39:55', 1, '2024-05-27 14:39:55', '2024-05-27 14:40:41', NULL),
(81, 1, '2024-05-27', 'p', '2024-05-27 15:40:44', '2024-05-27 15:40:44', 1, '2024-05-27 14:40:44', '2024-05-27 14:40:45', NULL),
(82, 1, '2024-05-27', 'p', '2024-05-27 15:40:46', '2024-05-27 15:40:46', 1, '2024-05-27 14:40:46', '2024-05-27 14:43:38', NULL),
(83, 1, '2024-05-27', 'p', '2024-05-27 15:43:47', '2024-05-27 15:43:47', 1, '2024-05-27 14:43:47', '2024-05-27 14:43:49', NULL),
(84, 1, '2024-05-27', 'p', '2024-05-27 15:43:50', '2024-05-27 15:43:50', 1, '2024-05-27 14:43:50', '2024-05-27 14:43:50', NULL),
(85, 1, '2024-05-27', 'p', '2024-05-27 15:45:16', '2024-05-27 15:45:16', 0, '2024-05-27 14:45:16', '2024-05-27 14:45:24', NULL),
(86, 1, '2024-05-27', 'p', '2024-05-27 15:45:28', '2024-05-27 15:45:28', 0, '2024-05-27 14:45:28', '2024-05-27 14:45:30', NULL),
(87, 1, '2024-05-27', 'p', '2024-05-27 15:45:34', '2024-05-27 15:45:34', 0, '2024-05-27 14:45:34', '2024-05-27 14:45:35', NULL),
(88, 1, '2024-05-27', 'p', '2024-05-27 15:45:36', '2024-05-27 15:45:36', 0, '2024-05-27 14:45:36', '2024-05-27 14:45:36', NULL),
(89, 1, '2024-05-27', 'p', '2024-05-27 15:45:38', '2024-05-27 15:45:38', 0, '2024-05-27 14:45:38', '2024-05-27 14:45:40', NULL),
(90, 1, '2024-05-27', 'p', '2024-05-27 15:45:50', '2024-05-27 15:45:50', 0, '2024-05-27 14:45:50', '2024-05-27 14:46:05', NULL),
(91, 1, '2024-05-27', 'p', '2024-05-27 15:47:28', '2024-05-27 15:47:28', 0, '2024-05-27 14:47:28', '2024-05-27 14:48:01', NULL),
(92, 1, '2024-05-27', 'p', '2024-05-27 15:48:09', '2024-05-27 15:48:09', 0, '2024-05-27 14:48:09', '2024-05-27 14:48:10', NULL),
(93, 1, '2024-05-27', 'p', '2024-05-27 15:52:07', '2024-05-27 15:52:07', 0, '2024-05-27 14:52:07', '2024-05-27 14:52:33', 'closed for the day'),
(94, 1, '2024-05-27', 'p', '2024-05-27 15:52:34', '2024-05-27 15:52:34', 0, '2024-05-27 14:52:34', '2024-05-27 14:56:19', 'closed for the day'),
(95, 1, '2024-05-27', 'p', '2024-05-27 15:56:20', '2024-05-27 15:56:20', 0, '2024-05-27 14:56:20', '2024-05-27 15:00:49', 'closed for the day'),
(96, 1, '2024-05-27', 'p', '2024-05-27 17:52:32', '2024-05-27 17:52:32', 0, '2024-05-27 16:52:32', NULL, 'resumed for the day'),
(97, 1, '2024-05-28', 'p', '2024-05-28 10:55:37', '2024-05-28 10:55:37', 0, '2024-05-28 09:55:37', NULL, 'resumed for the day'),
(98, 1, '2024-05-31', 'p', '2024-05-31 17:47:03', '2024-05-31 17:47:03', 0, '2024-05-31 16:47:03', '2024-05-31 16:48:34', 'closed for the day'),
(99, 1, '2024-05-31', 'p', '2024-05-31 17:48:41', '2024-05-31 17:48:41', 0, '2024-05-31 16:48:41', NULL, 'resumed for the day'),
(100, 1, '2024-06-04', 'p', '2024-06-04 08:07:57', '2024-06-04 08:07:57', 0, '2024-06-04 07:07:57', '2024-06-04 07:08:35', 'closed for the day'),
(101, 1, '2024-06-04', 'p', '2024-06-04 08:08:36', '2024-06-04 08:08:36', 0, '2024-06-04 07:08:36', '2024-06-04 07:08:37', 'closed for the day'),
(102, 1, '2024-06-04', 'p', '2024-06-04 08:08:38', '2024-06-04 08:08:38', 0, '2024-06-04 07:08:38', '2024-06-04 07:25:13', 'closed for the day'),
(103, 1, '2024-06-04', 'p', '2024-06-04 08:25:14', '2024-06-04 08:25:14', 0, '2024-06-04 07:25:14', '2024-06-04 07:30:38', 'closed for the day'),
(104, 1, '2024-06-04', 'p', '2024-06-04 08:30:39', '2024-06-04 08:30:39', 0, '2024-06-04 07:30:39', '2024-06-04 07:30:40', 'closed for the day'),
(105, 1, '2024-06-04', 'p', '2024-06-04 08:30:44', '2024-06-04 08:30:44', 0, '2024-06-04 07:30:44', '2024-06-04 07:30:44', 'closed for the day'),
(106, 1, '2024-06-04', 'p', '2024-06-04 08:30:45', '2024-06-04 08:30:45', 0, '2024-06-04 07:30:45', '2024-06-04 07:30:46', 'closed for the day'),
(107, 1, '2024-06-04', 'p', '2024-06-04 08:30:47', '2024-06-04 08:30:47', 0, '2024-06-04 07:30:47', NULL, 'resumed for the day'),
(108, 1, '2024-06-06', 'p', '2024-06-06 07:45:55', '2024-06-06 07:45:55', 0, '2024-06-06 06:45:55', '2024-06-06 06:47:16', 'closed for the day'),
(109, 1, '2024-06-06', 'p', '2024-06-06 07:47:17', '2024-06-06 07:47:17', 0, '2024-06-06 06:47:17', NULL, 'resumed for the day'),
(110, 1, '2024-06-10', 'p', '2024-06-10 16:01:03', '2024-06-10 16:01:03', 0, '2024-06-10 15:01:03', '2024-06-10 17:40:38', 'closed for the day'),
(111, 1, '2024-06-10', 'p', '2024-06-10 18:40:50', '2024-06-10 18:40:50', 0, '2024-06-10 17:40:50', NULL, 'resumed for the day'),
(112, 1, '2024-06-11', 'p', '2024-06-11 14:09:22', '2024-06-11 14:09:22', 0, '2024-06-11 13:09:22', '2024-06-11 17:06:17', 'closed for the day'),
(113, 1, '2024-06-11', 'p', '2024-06-11 18:06:18', '2024-06-11 18:06:18', 0, '2024-06-11 17:06:18', '2024-06-11 17:37:14', 'closed for the day'),
(114, 1, '2024-06-11', 'p', '2024-06-11 18:37:15', '2024-06-11 18:37:15', 0, '2024-06-11 17:37:15', NULL, 'resumed for the day'),
(115, 1, '2024-06-12', 'p', '2024-06-12 08:30:20', '2024-06-12 08:30:20', 0, '2024-06-12 07:30:19', '2024-06-12 07:30:25', 'closed for the day'),
(116, 1, '2024-06-12', 'p', '2024-06-12 08:30:26', '2024-06-12 08:30:26', 0, '2024-06-12 07:30:26', '2024-06-12 07:30:32', 'closed for the day'),
(117, 1, '2024-06-12', 'p', '2024-06-12 08:30:32', '2024-06-12 08:30:32', 0, '2024-06-12 07:30:32', NULL, 'resumed for the day'),
(118, 1, '2024-06-13', 'p', '2024-06-13 08:11:03', '2024-06-13 08:11:03', 0, '2024-06-13 07:11:03', '2024-06-13 15:55:22', 'closed for the day'),
(119, 1, '2024-06-13', 'p', '2024-06-13 16:55:23', '2024-06-13 16:55:23', 0, '2024-06-13 15:55:23', '2024-06-13 17:13:43', 'closed for the day'),
(120, 1, '2024-06-13', 'p', '2024-06-13 18:13:44', '2024-06-13 18:13:44', 0, '2024-06-13 17:13:44', NULL, 'resumed for the day'),
(121, 1, '2024-06-17', 'p', '2024-06-17 10:46:53', '2024-06-17 10:46:53', 0, '2024-06-17 09:46:53', '2024-06-17 15:17:07', 'closed for the day'),
(122, 1, '2024-06-17', 'p', '2024-06-17 16:17:09', '2024-06-17 16:17:09', 0, '2024-06-17 15:17:09', '2024-06-17 16:23:12', 'closed for the day'),
(123, 1, '2024-06-17', 'p', '2024-06-17 17:23:14', '2024-06-17 17:23:14', 1, '2024-06-17 16:23:14', '2024-06-17 16:32:33', 'closed for the day'),
(124, 1, '2024-06-17', 'p', '2024-06-17 18:37:57', '2024-06-17 18:37:57', 1, '2024-06-17 17:37:57', '2024-06-17 18:53:50', 'closed for the day'),
(125, 1, '2024-06-17', 'p', '2024-06-17 19:53:52', '2024-06-17 19:53:52', 0, '2024-06-17 18:53:52', NULL, 'resumed for the day'),
(126, 1, '2024-06-18', 'p', '2024-06-18 08:42:28', '2024-06-18 08:42:28', 0, '2024-06-18 07:42:28', '2024-06-18 13:16:40', 'closed for the day'),
(127, 1, '2024-06-18', 'p', '2024-06-18 14:16:43', '2024-06-18 14:16:43', 0, '2024-06-18 13:16:43', '2024-06-18 14:28:35', 'closed for the day'),
(128, 1, '2024-06-18', 'p', '2024-06-18 19:13:43', '2024-06-18 19:13:43', 0, '2024-06-18 18:13:43', NULL, 'resumed for the day'),
(129, 1, '2024-06-19', 'p', '2024-06-19 08:03:32', '2024-06-19 08:03:32', 1, '2024-06-19 07:03:32', '2024-06-19 07:03:34', 'closed for the day'),
(130, 1, '2024-06-19', 'p', '2024-06-19 08:03:36', '2024-06-19 08:03:36', 0, '2024-06-19 07:03:36', NULL, 'resumed for the day'),
(131, 1, '2024-06-20', 'p', '2024-06-20 12:01:48', '2024-06-20 12:01:48', 0, '2024-06-20 11:01:48', '2024-06-20 11:01:50', 'closed for the day'),
(132, 1, '2024-06-20', 'p', '2024-06-20 12:01:51', '2024-06-20 12:01:51', 0, '2024-06-20 11:01:51', '2024-06-20 18:20:31', 'closed for the day'),
(133, 1, '2024-06-20', 'p', '2024-06-20 19:20:32', '2024-06-20 19:20:32', 0, '2024-06-20 18:20:32', NULL, 'resumed for the day'),
(134, 1, '2024-06-21', 'p', '2024-06-21 08:07:59', '2024-06-21 08:07:59', 0, '2024-06-21 07:07:59', '2024-06-21 09:34:49', 'closed for the day'),
(135, 1, '2024-06-21', 'p', '2024-06-21 10:34:51', '2024-06-21 10:34:51', 1, '2024-06-21 09:34:51', '2024-06-21 09:38:36', 'closed for the day'),
(136, 1, '2024-06-21', 'p', '2024-06-21 10:38:37', '2024-06-21 10:38:37', 1, '2024-06-21 09:38:37', '2024-06-21 14:55:42', 'closed for the day'),
(137, 1, '2024-06-21', 'p', '2024-06-21 15:55:43', '2024-06-21 15:55:43', 0, '2024-06-21 14:55:43', NULL, 'resumed for the day'),
(138, 1, '2024-06-21', 'p', '2024-06-21 15:55:43', '2024-06-21 15:55:43', 0, '2024-06-21 14:55:43', NULL, 'resumed for the day'),
(139, 1, '2024-06-22', 'p', '2024-06-22 09:09:02', '2024-06-22 09:09:02', 0, '2024-06-22 08:09:02', '2024-06-22 11:17:16', 'closed for the day'),
(140, 1, '2024-06-22', 'p', '2024-06-22 09:09:02', '2024-06-22 09:09:02', 0, '2024-06-22 08:09:01', NULL, 'resumed for the day'),
(141, 1, '2024-06-22', 'p', '2024-06-22 12:17:22', '2024-06-22 12:17:22', 0, '2024-06-22 11:17:22', NULL, 'resumed for the day'),
(142, 1, '2024-06-22', 'p', '2024-06-22 12:17:22', '2024-06-22 12:17:22', 0, '2024-06-22 11:17:22', NULL, 'resumed for the day'),
(143, 4, '2024-06-22', 'p', '2024-06-22 17:59:27', '2024-06-22 17:59:27', 0, '2024-06-22 16:59:27', '2024-06-22 17:02:17', 'closed for the day'),
(144, 4, '2024-06-22', 'p', '2024-06-22 17:59:27', '2024-06-22 17:59:27', 0, '2024-06-22 16:59:27', '2024-06-22 17:02:17', 'closed for the day'),
(145, 4, '2024-06-22', 'p', '2024-06-22 18:02:18', '2024-06-22 18:02:18', 0, '2024-06-22 17:02:18', NULL, 'resumed for the day'),
(146, 4, '2024-06-22', 'p', '2024-06-22 18:02:18', '2024-06-22 18:02:18', 0, '2024-06-22 17:02:18', NULL, 'resumed for the day'),
(147, 4, '2024-06-24', 'p', '2024-06-24 08:59:22', '2024-06-24 08:59:22', 1, '2024-06-24 07:59:22', '2024-06-24 08:16:34', 'closed for the day'),
(148, 4, '2024-06-24', 'p', '2024-06-24 08:59:22', '2024-06-24 08:59:22', 1, '2024-06-24 07:59:22', '2024-06-24 08:16:38', 'closed for the day'),
(149, 4, '2024-06-24', 'p', '2024-06-24 09:16:37', '2024-06-24 09:16:37', 1, '2024-06-24 08:16:37', '2024-06-24 11:53:36', 'closed for the day'),
(150, 4, '2024-06-24', 'p', '2024-06-24 09:16:38', '2024-06-24 09:16:38', 1, '2024-06-24 08:16:38', '2024-06-24 14:48:56', 'closed for the day'),
(151, 4, '2024-06-24', 'p', '2024-06-24 09:16:51', '2024-06-24 09:16:51', 0, '2024-06-24 08:16:51', '2024-06-24 14:48:56', 'closed for the day'),
(152, 4, '2024-06-24', 'p', '2024-06-24 09:16:51', '2024-06-24 09:16:51', 1, '2024-06-24 08:16:51', NULL, 'resumed for the day'),
(153, 1, '2024-06-24', 'p', '2024-06-24 11:30:45', '2024-06-24 11:30:45', 0, '2024-06-24 10:30:45', NULL, 'resumed for the day'),
(154, 1, '2024-06-24', 'p', '2024-06-24 11:30:45', '2024-06-24 11:30:45', 0, '2024-06-24 10:30:45', NULL, 'resumed for the day'),
(155, 4, '2024-06-24', 'p', '2024-06-24 12:53:36', '2024-06-24 12:53:36', 0, '2024-06-24 11:53:36', NULL, 'resumed for the day'),
(156, 4, '2024-06-24', 'p', '2024-06-24 12:53:37', '2024-06-24 12:53:37', 0, '2024-06-24 11:53:37', NULL, 'resumed for the day'),
(157, 4, '2024-06-24', 'p', '2024-06-24 15:48:57', '2024-06-24 15:48:57', 0, '2024-06-24 14:48:57', NULL, 'resumed for the day'),
(158, 4, '2024-06-24', 'p', '2024-06-24 15:48:57', '2024-06-24 15:48:57', 0, '2024-06-24 14:48:57', NULL, 'resumed for the day'),
(159, 4, '2024-06-25', 'p', '2024-06-25 08:08:38', '2024-06-25 08:08:38', 0, '2024-06-25 07:08:38', '2024-06-25 07:18:59', 'closed for the day'),
(160, 4, '2024-06-25', 'p', '2024-06-25 08:08:38', '2024-06-25 08:08:38', 0, '2024-06-25 07:08:38', '2024-06-25 07:18:59', 'closed for the day'),
(161, 4, '2024-06-25', 'p', '2024-06-25 08:19:00', '2024-06-25 08:19:00', 0, '2024-06-25 07:19:00', '2024-06-25 07:25:24', 'closed for the day'),
(162, 4, '2024-06-25', 'p', '2024-06-25 08:19:00', '2024-06-25 08:19:00', 0, '2024-06-25 07:19:00', '2024-06-25 07:25:24', 'closed for the day'),
(163, 4, '2024-06-25', 'p', '2024-06-25 08:25:39', '2024-06-25 08:25:39', 0, '2024-06-25 07:25:39', '2024-06-25 16:23:46', 'closed for the day'),
(164, 4, '2024-06-25', 'p', '2024-06-25 08:25:39', '2024-06-25 08:25:39', 0, '2024-06-25 07:25:39', NULL, 'resumed for the day'),
(165, 1, '2024-06-25', 'p', '2024-06-25 15:43:04', '2024-06-25 15:43:04', 0, '2024-06-25 14:43:04', '2024-06-25 16:25:13', 'closed for the day'),
(166, 1, '2024-06-25', 'p', '2024-06-25 15:43:04', '2024-06-25 15:43:04', 0, '2024-06-25 14:43:04', NULL, 'resumed for the day'),
(167, 4, '2024-06-25', 'p', '2024-06-25 17:23:46', '2024-06-25 17:23:46', 0, '2024-06-25 16:23:46', NULL, 'resumed for the day'),
(168, 4, '2024-06-25', 'p', '2024-06-25 17:23:47', '2024-06-25 17:23:47', 0, '2024-06-25 16:23:47', NULL, 'resumed for the day'),
(169, 1, '2024-06-25', 'p', '2024-06-25 17:25:14', '2024-06-25 17:25:14', 0, '2024-06-25 16:25:14', NULL, 'resumed for the day'),
(170, 1, '2024-06-25', 'p', '2024-06-25 17:25:14', '2024-06-25 17:25:14', 0, '2024-06-25 16:25:14', NULL, 'resumed for the day'),
(171, 5, '2024-06-25', 'p', '2024-06-25 17:29:50', '2024-06-25 17:29:50', 0, '2024-06-25 16:29:50', NULL, 'resumed for the day'),
(172, 5, '2024-06-25', 'p', '2024-06-25 17:29:50', '2024-06-25 17:29:50', 0, '2024-06-25 16:29:50', NULL, 'resumed for the day'),
(173, 1, '2024-06-26', 'p', '2024-06-26 11:15:00', '2024-06-26 11:15:00', 0, '2024-06-26 10:15:00', NULL, 'resumed for the day'),
(174, 1, '2024-06-26', 'p', '2024-06-26 11:15:00', '2024-06-26 11:15:00', 0, '2024-06-26 10:15:00', NULL, 'resumed for the day'),
(175, 5, '2024-06-26', 'p', '2024-06-26 11:17:01', '2024-06-26 11:17:01', 1, '2024-06-26 10:17:01', '2024-06-26 10:30:16', 'closed for the day'),
(176, 5, '2024-06-26', 'p', '2024-06-26 11:17:01', '2024-06-26 11:17:01', 0, '2024-06-26 10:17:01', '2024-06-26 10:46:40', 'closed for the day'),
(177, 5, '2024-06-26', 'p', '2024-06-26 11:30:17', '2024-06-26 11:30:17', 0, '2024-06-26 10:30:17', '2024-06-26 10:46:40', 'closed for the day'),
(178, 5, '2024-06-26', 'p', '2024-06-26 11:30:17', '2024-06-26 11:30:17', 1, '2024-06-26 10:30:17', '2024-06-26 17:40:04', 'closed for the day'),
(179, 5, '2024-06-26', 'p', '2024-06-26 11:46:41', '2024-06-26 11:46:41', 0, '2024-06-26 10:46:41', '2024-06-26 17:40:04', 'closed for the day'),
(180, 5, '2024-06-26', 'p', '2024-06-26 11:46:41', '2024-06-26 11:46:41', 0, '2024-06-26 10:46:41', NULL, 'resumed for the day'),
(181, 4, '2024-06-26', 'p', '2024-06-26 12:08:11', '2024-06-26 12:08:11', 1, '2024-06-26 11:08:11', '2024-06-26 11:08:34', 'closed for the day'),
(182, 4, '2024-06-26', 'p', '2024-06-26 12:08:11', '2024-06-26 12:08:11', 0, '2024-06-26 11:08:11', NULL, 'resumed for the day'),
(183, 4, '2024-06-26', 'p', '2024-06-26 12:08:38', '2024-06-26 12:08:38', 0, '2024-06-26 11:08:38', NULL, 'resumed for the day'),
(184, 4, '2024-06-26', 'p', '2024-06-26 12:08:39', '2024-06-26 12:08:39', 0, '2024-06-26 11:08:39', NULL, 'resumed for the day'),
(185, 5, '2024-06-26', 'p', '2024-06-26 18:40:05', '2024-06-26 18:40:05', 0, '2024-06-26 17:40:05', NULL, 'resumed for the day'),
(186, 5, '2024-06-26', 'p', '2024-06-26 18:40:05', '2024-06-26 18:40:05', 0, '2024-06-26 17:40:05', NULL, 'resumed for the day'),
(187, 5, '2024-06-27', 'p', '2024-06-27 09:09:28', '2024-06-27 09:09:28', 0, '2024-06-27 08:09:28', NULL, 'resumed for the day'),
(188, 5, '2024-06-27', 'p', '2024-06-27 09:09:28', '2024-06-27 09:09:28', 0, '2024-06-27 08:09:28', NULL, 'resumed for the day'),
(189, 1, '2024-06-27', 'p', '2024-06-27 09:52:56', '2024-06-27 09:52:56', 0, '2024-06-27 08:52:56', NULL, 'resumed for the day'),
(190, 1, '2024-06-27', 'p', '2024-06-27 09:52:57', '2024-06-27 09:52:57', 0, '2024-06-27 08:52:57', NULL, 'resumed for the day'),
(191, 6, '2024-06-27', 'p', '2024-06-27 09:59:20', '2024-06-27 09:59:20', 0, '2024-06-27 08:59:20', '2024-06-27 09:21:41', 'closed for the day'),
(192, 6, '2024-06-27', 'p', '2024-06-27 09:59:20', '2024-06-27 09:59:20', 0, '2024-06-27 08:59:20', '2024-06-27 09:21:45', 'closed for the day'),
(193, 6, '2024-06-27', 'p', '2024-06-27 10:21:41', '2024-06-27 10:21:41', 0, '2024-06-27 09:21:41', '2024-06-27 09:27:19', 'closed for the day'),
(194, 6, '2024-06-27', 'p', '2024-06-27 10:21:42', '2024-06-27 10:21:42', 0, '2024-06-27 09:21:42', NULL, 'resumed for the day'),
(195, 6, '2024-06-27', 'p', '2024-06-27 10:21:46', '2024-06-27 10:21:46', 0, '2024-06-27 09:21:46', NULL, 'resumed for the day'),
(196, 6, '2024-06-27', 'p', '2024-06-27 10:21:47', '2024-06-27 10:21:47', 0, '2024-06-27 09:21:47', NULL, 'resumed for the day'),
(197, 6, '2024-06-27', 'p', '2024-06-27 10:27:19', '2024-06-27 10:27:19', 0, '2024-06-27 09:27:19', NULL, 'resumed for the day'),
(198, 6, '2024-06-27', 'p', '2024-06-27 10:27:20', '2024-06-27 10:27:20', 0, '2024-06-27 09:27:20', NULL, 'resumed for the day'),
(199, 7, '2024-06-28', 'p', '2024-06-28 15:38:30', '2024-06-28 15:38:30', 0, '2024-06-28 14:38:30', NULL, 'resumed for the day'),
(200, 7, '2024-06-28', 'p', '2024-06-28 15:38:30', '2024-06-28 15:38:30', 0, '2024-06-28 14:38:30', NULL, 'resumed for the day'),
(201, 1, '2024-06-28', 'p', '2024-06-28 16:07:08', '2024-06-28 16:07:08', 0, '2024-06-28 15:07:08', NULL, 'resumed for the day'),
(202, 1, '2024-06-28', 'p', '2024-06-28 16:07:08', '2024-06-28 16:07:08', 0, '2024-06-28 15:07:08', NULL, 'resumed for the day');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `title`, `message`, `user_id`, `is_read`, `deleted`, `created`, `updated`, `image`, `created_at`, `file_path`) VALUES
(1, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 11:33:56', '2024-06-24 11:33:56', NULL, '2024-06-24 11:33:56', ''),
(2, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 11:37:28', '2024-06-24 11:37:28', NULL, '2024-06-24 11:37:28', ''),
(3, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 11:39:21', '2024-06-24 11:39:21', NULL, '2024-06-24 11:39:21', ''),
(4, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 11:45:52', '2024-06-24 11:45:52', NULL, '2024-06-24 11:45:52', ''),
(5, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 11:52:20', '2024-06-24 11:52:20', NULL, '2024-06-24 11:52:20', ''),
(6, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:04:20', '2024-06-24 12:04:20', NULL, '2024-06-24 12:04:20', ''),
(7, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:04:35', '2024-06-24 12:04:35', NULL, '2024-06-24 12:04:35', ''),
(8, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:06:41', '2024-06-24 12:06:41', NULL, '2024-06-24 12:06:41', ''),
(9, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:07:14', '2024-06-24 12:07:14', NULL, '2024-06-24 12:07:14', ''),
(10, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:07:38', '2024-06-24 12:07:38', NULL, '2024-06-24 12:07:38', ''),
(11, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:07:44', '2024-06-24 12:07:44', NULL, '2024-06-24 12:07:44', ''),
(12, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:25:42', '2024-06-24 12:25:42', NULL, '2024-06-24 12:25:42', ''),
(13, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 12:26:42', '2024-06-24 12:26:42', NULL, '2024-06-24 12:26:42', ''),
(14, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 12:27:26', '2024-06-24 12:27:26', NULL, '2024-06-24 12:27:26', ''),
(15, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 12:59:40', '2024-06-24 12:59:40', NULL, '2024-06-24 12:59:40', ''),
(16, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 12:59:55', '2024-06-24 12:59:55', NULL, '2024-06-24 12:59:55', ''),
(17, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 13:00:45', '2024-06-24 13:00:45', NULL, '2024-06-24 13:00:45', ''),
(18, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 13:03:27', '2024-06-24 13:03:27', NULL, '2024-06-24 13:03:27', ''),
(19, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 13:04:24', '2024-06-24 13:04:24', NULL, '2024-06-24 13:04:24', ''),
(20, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 13:05:10', '2024-06-24 13:05:10', NULL, '2024-06-24 13:05:10', ''),
(21, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 13:05:23', '2024-06-24 13:05:23', NULL, '2024-06-24 13:05:23', ''),
(22, NULL, 'You have received a new query.', 5, 0, 0, '2024-06-24 13:10:23', '2024-06-24 13:10:23', NULL, '2024-06-24 13:10:23', ''),
(23, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-24 13:42:24', '2024-06-24 13:42:24', NULL, '2024-06-24 13:42:24', ''),
(24, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:05:59', '2024-06-24 14:05:59', NULL, '2024-06-24 14:05:59', './static/images/queries/testyahoo.comq_comp.fundamentals_practical_class_6_0ac35bd9f46b50f1.docx'),
(25, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:06:16', '2024-06-24 14:06:16', NULL, '2024-06-24 14:06:16', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_51cdd8cf15afa039.pdf'),
(26, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:19:14', '2024-06-24 14:19:14', NULL, '2024-06-24 14:19:14', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_9_851282ed0e43343c.pdf'),
(27, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:19:22', '2024-06-24 14:19:22', NULL, '2024-06-24 14:19:22', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_9543753fb29c73d6.pdf'),
(28, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:25:34', '2024-06-24 14:25:34', NULL, '2024-06-24 14:25:34', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_05c63907b786b104.pdf'),
(29, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:25:41', '2024-06-24 14:25:41', NULL, '2024-06-24 14:25:41', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_927a7185a5ea1fb3.pdf'),
(30, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:27:25', '2024-06-24 14:27:25', NULL, '2024-06-24 14:27:25', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_58b661ae742e2667.pdf'),
(31, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:29:19', '2024-06-24 14:29:19', NULL, '2024-06-24 14:29:19', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_568ef461b87f744d.pdf'),
(32, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:30:39', '2024-06-24 14:30:39', NULL, '2024-06-24 14:30:39', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_b1c5f27ffd09dafa.pdf'),
(33, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:30:47', '2024-06-24 14:30:47', NULL, '2024-06-24 14:30:47', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_4039f65ab439af7c.pdf'),
(34, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:32:54', '2024-06-24 14:32:54', NULL, '2024-06-24 14:32:54', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_b3c706bf7681dc63.pdf'),
(35, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:32:59', '2024-06-24 14:32:59', NULL, '2024-06-24 14:32:59', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_e4effa6c2d2de31f.pdf'),
(36, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:34:24', '2024-06-24 14:34:24', NULL, '2024-06-24 14:34:24', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_a5c5009f538062ba.pdf'),
(37, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:34:28', '2024-06-24 14:34:28', NULL, '2024-06-24 14:34:28', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_440be653cd45c940.pdf'),
(38, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:36:37', '2024-06-24 14:36:37', NULL, '2024-06-24 14:36:37', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_3b74536c1b56addc.pdf'),
(39, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:36:44', '2024-06-24 14:36:44', NULL, '2024-06-24 14:36:44', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_4ad424d3e338f12f.pdf'),
(40, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:37:45', '2024-06-24 14:37:45', NULL, '2024-06-24 14:37:45', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_5f019c9f615de58a.pdf'),
(41, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:40:07', '2024-06-24 14:40:07', NULL, '2024-06-24 14:40:07', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_129f54e57c481ad3.pdf'),
(42, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:40:11', '2024-06-24 14:40:11', NULL, '2024-06-24 14:40:11', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_58fb2f020150654d.pdf'),
(43, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:41:24', '2024-06-24 14:41:24', NULL, '2024-06-24 14:41:24', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_2d24ebb90f2a597d.pdf'),
(44, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:42:23', '2024-06-24 14:42:23', NULL, '2024-06-24 14:42:23', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_6_fd1db1b5f9f6243d.pdf'),
(45, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:42:26', '2024-06-24 14:42:26', NULL, '2024-06-24 14:42:26', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_06e168c830f09117.pdf'),
(46, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:43:23', '2024-06-24 14:43:23', NULL, '2024-06-24 14:43:23', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_9_9e692906ef91d758.pdf'),
(47, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:43:26', '2024-06-24 14:43:26', NULL, '2024-06-24 14:43:26', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1_65c1ff4e6d2e3fd1.pdf'),
(48, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 14:44:01', '2024-06-24 14:44:01', NULL, '2024-06-24 14:44:01', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_06b1ba146bed135b.pdf'),
(49, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 15:51:00', '2024-06-24 15:51:00', NULL, '2024-06-24 15:51:00', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_5ab8bd70b291ce8e.pdf'),
(50, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-24 15:52:04', '2024-06-24 15:52:04', NULL, '2024-06-24 15:52:04', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_c978b0bc606fb68d.pdf'),
(51, NULL, 'You have received a new query.', 4, 1, 0, '2024-06-25 17:22:36', '2024-06-25 17:22:36', NULL, '2024-06-25 17:22:36', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_1b_093c6bf7bf46bb92.pdf'),
(52, NULL, 'You have received a new query.', 4, 0, 0, '2024-06-25 17:22:51', '2024-06-25 17:22:51', NULL, '2024-06-25 17:22:51', './static/images/queries/testyahoo.comq_coding_fundamental_lesson_4_70b70f28e60bce87.pdf'),
(53, NULL, 'You have received a new query.', 5, 0, 0, '2024-06-25 18:45:41', '2024-06-25 18:45:41', NULL, '2024-06-25 18:45:41', './static/images/queries/dicksonyahoo.com_comp.fundamentals_practical_class_6_02925ce2dd82f2ec.docx'),
(54, NULL, 'You have received a new query.', 1, 1, 0, '2024-06-26 11:13:56', '2024-06-26 11:13:56', NULL, '2024-06-26 11:13:56', './static/images/queries/hacker_coding_fundamental_lesson_9_9c640c08d4c6c970.pdf'),
(55, NULL, 'You have received a new query.', 5, 0, 0, '2024-06-26 12:07:01', '2024-06-26 12:07:01', NULL, '2024-06-26 12:07:01', './static/images/queries/dicksonyahoo.com_comp.fundamentals_practical_class_6_92b862c04a1b8631.docx');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `txn_ref` varchar(100) DEFAULT NULL,
  `txn_amt` int(11) DEFAULT NULL,
  `txn_desc` varchar(100) DEFAULT NULL,
  `txn_status` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `query`
--

INSERT INTO `query` (`id`, `user_id`, `file_path`, `created_at`, `message`) VALUES
(1, 1, 'hacker_lesson_14_pseudo_selectors_web-02css_dunistech_academy_ea88fa758086ecec.pdf', '2024-06-24 11:33:56', 'Query alert for hacker'),
(2, 1, 'hacker_starting_css_assignments_376faeb751a3bcb5.pdf', '2024-06-24 11:37:28', 'Query alert for hacker'),
(3, 1, 'hacker_assessment_1_94267aa21cbf5abc.docx', '2024-06-24 11:39:21', 'Query alert for hacker'),
(4, 1, 'hacker_todays_prparation_4_60bedbcf62ffa581.pdf', '2024-06-24 11:45:52', 'Query alert for hacker'),
(5, 1, 'hacker_todays_prparation_4_30bd08df83a97441.pdf', '2024-06-24 11:52:20', 'Query alert for hacker'),
(6, 1, 'hacker_todays_prparation_8d7561462319f4d1.pdf', '2024-06-24 12:04:20', 'Query alert for hacker'),
(7, 1, 'hacker_assessment_1_89163b64e164ad87.docx', '2024-06-24 12:04:35', 'Query alert for hacker'),
(8, 1, 'hacker_c.4_bda472d8f99f12a2.jpg', '2024-06-24 12:06:41', 'Query alert for hacker'),
(9, 1, 'hacker_comp.fundamentals_practical_class_6_7cfcdf878f6117af.docx', '2024-06-24 12:07:14', 'Query alert for hacker'),
(10, 1, 'hacker_comp.fundamentals_practical_class_6_d33741a16822f35b.docx', '2024-06-24 12:07:38', 'Query alert for hacker'),
(11, 1, 'hacker_starting_css_assignments_03f67b8a951c51e7.pdf', '2024-06-24 12:07:44', 'Query alert for hacker'),
(12, 1, 'hacker_todays_prparation_1_8c0cdb859f515b7d.pdf', '2024-06-24 12:25:42', 'Query alert for hacker'),
(13, 4, 'testyahoo.comq_starting_css_assignments_46c7dbf939a1397a.pdf', '2024-06-24 12:26:42', 'Query alert for test@yahoo.comq'),
(14, 1, 'hacker_lesson_14_pseudo_selectors_web-02css_dunistech_academy_252e290c3a14f5fc.pdf', '2024-06-24 12:27:26', 'Query alert for hacker'),
(15, 4, 'testyahoo.comq_lesson_14_pseudo_selectors_web-02css_dunistech_academy_c298836f218eb71d.pdf', '2024-06-24 12:59:40', 'Query alert for test@yahoo.comq'),
(16, 4, 'testyahoo.comq_todays_prparation_c5597495fdc2c0a5.pdf', '2024-06-24 12:59:55', 'Query alert for test@yahoo.comq'),
(17, 4, 'testyahoo.comq_assessment_1_d85fc657132dbf85.docx', '2024-06-24 13:00:45', 'Query alert for test@yahoo.comq'),
(18, 4, 'testyahoo.comq_assessment_1_5d69a399ad189f46.docx', '2024-06-24 13:03:27', 'Query alert for test@yahoo.comq'),
(19, 4, 'testyahoo.comq_todays_prparation_3_3e9eb9ea8be04231.pdf', '2024-06-24 13:04:24', 'Query alert for test@yahoo.comq'),
(20, 1, 'hacker_css_assignments8910111213_fcbb536bd3171f33.pdf', '2024-06-24 13:05:10', 'Query alert for hacker'),
(21, 1, 'hacker_dunistech.ng_updates_1_632ac2983e334662.pdf', '2024-06-24 13:05:23', 'Query alert for hacker'),
(22, 5, 'dicksonyahoo.com_samuel-akpan-resume_434328fad0e96951.pdf', '2024-06-24 13:10:23', 'Query alert for dickson@yahoo.com'),
(23, 1, 'hacker_assessment_1_0eb42522b8829da2.docx', '2024-06-24 13:42:24', 'Query alert for hacker'),
(24, 4, 'testyahoo.comq_comp.fundamentals_practical_class_6_0ac35bd9f46b50f1.docx', '2024-06-24 14:05:59', 'Query alert for test@yahoo.comq'),
(25, 4, 'testyahoo.comq_coding_fundamental_lesson_6_51cdd8cf15afa039.pdf', '2024-06-24 14:06:16', 'Query alert for test@yahoo.comq'),
(26, 4, 'testyahoo.comq_coding_fundamental_lesson_9_851282ed0e43343c.pdf', '2024-06-24 14:19:14', 'Query alert for test@yahoo.comq'),
(27, 4, 'testyahoo.comq_coding_fundamental_lesson_4_9543753fb29c73d6.pdf', '2024-06-24 14:19:22', 'Query alert for test@yahoo.comq'),
(28, 4, 'testyahoo.comq_coding_fundamental_lesson_6_05c63907b786b104.pdf', '2024-06-24 14:25:34', 'Query alert for test@yahoo.comq'),
(29, 4, 'testyahoo.comq_coding_fundamental_lesson_1_927a7185a5ea1fb3.pdf', '2024-06-24 14:25:41', 'Query alert for test@yahoo.comq'),
(30, 4, 'testyahoo.comq_coding_fundamental_lesson_6_58b661ae742e2667.pdf', '2024-06-24 14:27:25', 'Query alert for test@yahoo.comq'),
(31, 4, 'testyahoo.comq_coding_fundamental_lesson_1_568ef461b87f744d.pdf', '2024-06-24 14:29:19', 'Query alert for test@yahoo.comq'),
(32, 4, 'testyahoo.comq_coding_fundamental_lesson_6_b1c5f27ffd09dafa.pdf', '2024-06-24 14:30:39', 'Query alert for test@yahoo.comq'),
(33, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_4039f65ab439af7c.pdf', '2024-06-24 14:30:47', 'Query alert for test@yahoo.comq'),
(34, 4, 'testyahoo.comq_coding_fundamental_lesson_6_b3c706bf7681dc63.pdf', '2024-06-24 14:32:54', 'Query alert for test@yahoo.comq'),
(35, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_e4effa6c2d2de31f.pdf', '2024-06-24 14:32:59', 'Query alert for test@yahoo.comq'),
(36, 4, 'testyahoo.comq_coding_fundamental_lesson_4_a5c5009f538062ba.pdf', '2024-06-24 14:34:24', 'Query alert for test@yahoo.comq'),
(37, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_440be653cd45c940.pdf', '2024-06-24 14:34:28', 'Query alert for test@yahoo.comq'),
(38, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_3b74536c1b56addc.pdf', '2024-06-24 14:36:37', 'Query alert for test@yahoo.comq'),
(39, 4, 'testyahoo.comq_coding_fundamental_lesson_1_4ad424d3e338f12f.pdf', '2024-06-24 14:36:44', 'Query alert for test@yahoo.comq'),
(40, 4, 'testyahoo.comq_coding_fundamental_lesson_1_5f019c9f615de58a.pdf', '2024-06-24 14:37:45', 'Query alert for test@yahoo.comq'),
(41, 4, 'testyahoo.comq_coding_fundamental_lesson_4_129f54e57c481ad3.pdf', '2024-06-24 14:40:07', 'Query alert for test@yahoo.comq'),
(42, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_58fb2f020150654d.pdf', '2024-06-24 14:40:11', 'Query alert for test@yahoo.comq'),
(43, 4, 'testyahoo.comq_coding_fundamental_lesson_4_2d24ebb90f2a597d.pdf', '2024-06-24 14:41:24', 'Query alert for test@yahoo.comq'),
(44, 4, 'testyahoo.comq_coding_fundamental_lesson_6_fd1db1b5f9f6243d.pdf', '2024-06-24 14:42:23', 'Query alert for test@yahoo.comq'),
(45, 4, 'testyahoo.comq_coding_fundamental_lesson_1_06e168c830f09117.pdf', '2024-06-24 14:42:26', 'Query alert for test@yahoo.comq'),
(46, 4, 'testyahoo.comq_coding_fundamental_lesson_9_9e692906ef91d758.pdf', '2024-06-24 14:43:23', 'Query alert for test@yahoo.comq'),
(47, 4, 'testyahoo.comq_coding_fundamental_lesson_1_65c1ff4e6d2e3fd1.pdf', '2024-06-24 14:43:26', 'Query alert for test@yahoo.comq'),
(48, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_06b1ba146bed135b.pdf', '2024-06-24 14:44:01', 'Query alert for test@yahoo.comq'),
(49, 4, 'testyahoo.comq_coding_fundamental_lesson_4_5ab8bd70b291ce8e.pdf', '2024-06-24 15:51:00', 'Query alert for test@yahoo.comq'),
(50, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_c978b0bc606fb68d.pdf', '2024-06-24 15:52:04', 'Query alert for test@yahoo.comq'),
(51, 4, 'testyahoo.comq_coding_fundamental_lesson_1b_093c6bf7bf46bb92.pdf', '2024-06-25 17:22:36', 'Query alert for test@yahoo.comq'),
(52, 4, 'testyahoo.comq_coding_fundamental_lesson_4_70b70f28e60bce87.pdf', '2024-06-25 17:22:51', 'Query alert for test@yahoo.comq'),
(53, 5, 'dicksonyahoo.com_comp.fundamentals_practical_class_6_02925ce2dd82f2ec.docx', '2024-06-25 18:45:41', 'Query alert for dickson@yahoo.com'),
(54, 1, 'hacker_coding_fundamental_lesson_9_9c640c08d4c6c970.pdf', '2024-06-26 11:13:56', 'Query alert for hacker'),
(55, 5, 'dicksonyahoo.com_comp.fundamentals_practical_class_6_92b862c04a1b8631.docx', '2024-06-26 12:07:01', 'Query alert for dickson@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `type`) VALUES
(1, 'admin'),
(5, 'developer'),
(3, 'front_desk'),
(7, 'instructor'),
(2, 'manager'),
(6, 'staff'),
(4, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `description`, `status`, `user_id`, `created`, `updated`, `deleted`, `timestamp`) VALUES
(31, 'I finished coding the backend', 'completed', 1, '2024-06-17 10:47:40', '2024-06-18 08:42:37', 0, '2024-06-18 08:42:37'),
(36, 'Building the User Management System', 'on-going', 1, '2024-06-19 10:38:56', '2024-06-21 18:11:17', 0, '2024-06-21 18:11:17'),
(37, 'Display clockings/attendance for all', 'stucked', 1, '2024-06-21 19:29:38', '2024-06-21 19:29:38', 0, '2024-06-21 19:29:38'),
(38, 'Debugging of profile uploads for all users | staffs | students | visitors', 'on-going', 1, '2024-06-22 17:43:30', '2024-06-25 18:18:30', 0, '2024-06-25 18:18:30'),
(39, 'Take computer fundamentals', 'on-going', 4, '2024-06-22 17:59:06', '2024-06-25 08:24:24', 0, '2024-06-25 08:24:24'),
(40, 'Coding and when awake, drink thick hot tea', 'completed', 4, '2024-06-24 09:19:34', '2024-06-24 09:19:34', 0, '2024-06-24 00:00:00'),
(41, 'Create proposals', 'completed', 4, '2024-06-24 09:19:50', '2024-06-25 08:23:31', 0, '2024-06-25 08:23:31'),
(42, '.Taking favor\'s class on algorithm, and gold', 'completed', 1, '2024-06-26 11:52:02', '2024-06-26 11:52:02', 0, '2024-06-26 11:52:02'),
(43, 'Profile image update | done', 'completed', 1, '2024-06-26 11:52:17', '2024-06-26 11:52:17', 0, '2024-06-26 11:52:17'),
(44, 'Authentication | sign-up | sign-in | sign-out', 'completed', 1, '2024-06-26 11:52:28', '2024-06-26 11:52:28', 0, '2024-06-26 11:52:28'),
(45, 'Building our Workforce Management System', 'on-going', 1, '2024-06-26 11:52:42', '2024-06-26 11:52:42', 0, '2024-06-26 11:52:42'),
(46, 'I learnt coding today!', 'completed', 5, '2024-06-26 12:03:13', '2024-06-26 12:03:13', 0, '2024-06-26 00:00:00'),
(47, 'React is open source and helps in responsive desgin and development', 'on-going', 5, '2024-06-26 12:03:55', '2024-06-26 12:03:55', 0, '2024-06-26 12:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `about` varchar(5000) DEFAULT NULL,
  `acct_no` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `socials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`socials`)),
  `src` varchar(50) DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `academic_qualification` varchar(50) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `experience_level` varchar(50) DEFAULT NULL,
  `refferee_type` varchar(50) DEFAULT NULL,
  `refferee_email` varchar(100) DEFAULT NULL,
  `refferee_phone` varchar(20) DEFAULT NULL,
  `refferee_address` varchar(200) DEFAULT NULL,
  `reg_num` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `cert_status` varchar(50) DEFAULT NULL,
  `completion_status` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `phone`, `password`, `photo`, `admin`, `gender`, `city`, `about`, `acct_no`, `bank`, `socials`, `src`, `online`, `status`, `verified`, `ip`, `created`, `updated`, `deleted`, `category`, `dob`, `designation`, `academic_qualification`, `experience_years`, `experience_level`, `refferee_type`, `refferee_email`, `refferee_phone`, `refferee_address`, `reg_num`, `course`, `cert_status`, `completion_status`, `address`) VALUES
(1, 'Chris James', 'hacker', 'hacker@yahoo.com', '08138958644', '$2b$12$ZcbLub/wk.zszHSCcjAby.YSlW93qBdP1B6BNxQZP51SzhSpyVsbC', 'hacker_c85ada.jpg', 0, 'm', 'Lagos', 'Elite software developer with special interest in artificial and business intelligence . data & hacking.', '5913408010', 'fcmb', '{\"facebook\": \"@hacker\", \"twitter\": \"chrisjsmez@twitter.space\", \"instagram\": null, \"linkedin\": \"\"}', NULL, 1, 0, 0, '127.0.0.1', '2024-05-23 13:26:10', '2024-05-23 13:26:10', 0, 'user', '2002-08-22', 'Softwares', 'Bsc', 0, 'professional-level', 'uncle', 'jameschristo962@gmail.com', '08138958645', 'Awoyay, councillor str.', 'C012344', 'software-enginnering', '', 'on-going', 'Awoyay, councillor str.'),
(2, NULL, 'hacker_2', 'hacker@yahoo.co', '081234561', '$2b$12$YJYqh2.BOs8qCjxjIRt09u4L8YiS9F2A4aRdWy9FHlan2fsHaDWxW', NULL, 0, NULL, NULL, NULL, NULL, NULL, '{}', NULL, 0, 0, 0, '127.0.0.1', '2024-05-23 13:27:24', '2024-05-23 13:27:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'test@yahoo.com', 'jameschristo962@gmail.com', '08138958645', '$2b$12$VOnUItrCzR7mFjp2q/kGY.swxVpLhrx7bLw03tcOmNCZS76N23fC2', NULL, 0, NULL, NULL, NULL, NULL, NULL, '{}', NULL, 0, 0, 0, '127.0.0.1', '2024-06-18 08:34:03', '2024-06-18 08:34:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Valentine Ezekwe', 'test@yahoo.comq', 'jameschristo962@gmail.comq', '08138958641', '$2b$12$Y3PdISQm2T6hcCoSdBLgP.stPSbKQA56veerCrAloDG6o5EB82dtm', 'testyahoo.comq_c.5d598.jpg', 0, 'm', 'Lagos', 'I too like dunis', '5913408010', 'fcmb', '{\"facebook\": \"\", \"twitter\": \"\", \"instagram\": null, \"linkedin\": \"\"}', NULL, 1, 0, 0, '127.0.0.1', '2024-06-18 08:36:39', '2024-06-18 08:36:39', 0, 'user', '2024-06-21', 'Cyber security', 'Msc', 0, '', '', '', '', '', 'C012344', 'fundamentals', '', 'on-going', 'Ologufe, awoyaya'),
(5, 'Dickson Emefiele', 'dickson@yahoo.com', 'dristo962@gmail.comq', '813895864522', '$2b$12$th5j96wRbtl5tHZrqGH0Cuxzf/CWYG7qGUWpO5G3ZdH.XOlBIzJq.', 'hacker_c8e231.jpg', 0, 'f', 'Portharcourt', 'Elite software engr with special interest in artificial intelligence . business intellegence . hacking and data', NULL, NULL, '{\"facebook\": \"\", \"twitter\": \"\", \"instagram\": null, \"linkedin\": \"\"}', NULL, 1, 0, 0, '127.0.0.1', '2024-06-18 08:40:27', '2024-06-18 08:40:27', 0, 'user', '2024-06-18', 'Django developer', NULL, NULL, NULL, '', '', '', '', 'D01234422d', '', '', '', 'Ologufe'),
(6, 'Favor Ezekwe', 'favor', 'favor@yahoo.com', '081234567', '$2b$12$UNyY5qdHnIFLZwlWH2NyIeFlSAsb8/gXzcBb2NiSZLQv8m00UNqNS', 'hacker_c.63828.jpg', 0, 'm', 'Lagos', '', '', '', '{\"facebook\": \"favor@facebook.com\", \"twitter\": \"\", \"instagram\": null, \"linkedin\": \"\"}', NULL, 1, 0, 0, '127.0.0.1', '2024-06-27 09:58:17', '2024-06-27 09:58:17', 0, 'user', '2024-06-23', '', '', 0, '', '', '', '', '', 'C-012344', '', '', '', 'Ibuju - epe'),
(7, 'Presentation Present', 'pressentation', 'pressentation@gmail.com', '08138958647', '$2b$12$FLHnPMG7/pykawPm4c7r4uS04X9x69j4QiV.4uQHSC0idcVProyEG', 'pressentation_c.42195.jpg', 0, 'm', 'Lagos', '', '', '', '{\"facebook\": \"\", \"twitter\": \"\", \"instagram\": null, \"linkedin\": \"\"}', NULL, 1, 0, 0, '127.0.0.1', '2024-06-28 15:26:34', '2024-06-28 15:26:34', 0, 'user', '2024-06-28', '', '', 0, '', '', '', '', '', 'C63737393', 'frontend', '', '', 'Awoyay, councillor str.');

-- --------------------------------------------------------

--
-- Table structure for table `usr_role`
--

CREATE TABLE `usr_role` (
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usr_role`
--

INSERT INTO `usr_role` (`uid`, `rid`) VALUES
(1, 1),
(5, 4),
(4, 7),
(6, 4),
(7, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `assigned__task`
--
ALTER TABLE `assigned__task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ix_notification_title` (`title`),
  ADD KEY `ix_notification_image` (`image`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_user_email` (`email`),
  ADD UNIQUE KEY `ix_user_username` (`username`),
  ADD UNIQUE KEY `ix_user_phone` (`phone`),
  ADD KEY `ix_user_name` (`name`);

--
-- Indexes for table `usr_role`
--
ALTER TABLE `usr_role`
  ADD KEY `rid` (`rid`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned__task`
--
ALTER TABLE `assigned__task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `query`
--
ALTER TABLE `query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned__task`
--
ALTER TABLE `assigned__task`
  ADD CONSTRAINT `assigned__task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `query`
--
ALTER TABLE `query`
  ADD CONSTRAINT `query_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `usr_role`
--
ALTER TABLE `usr_role`
  ADD CONSTRAINT `usr_role_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `usr_role_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 12:28 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hometheater`
--
CREATE DATABASE IF NOT EXISTS `hometheater` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hometheater`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Fantasy'),
(4, 'Romance'),
(5, 'Detective'),
(6, 'Thrilller'),
(7, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_released` smallint(6) NOT NULL,
  `runtime` smallint(6) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `metascore` smallint(6) NOT NULL,
  `content_types_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `title`, `description`, `year_released`, `runtime`, `rating`, `metascore`, `content_types_id`, `created`) VALUES
(171, 'Avenger Age of Ultronaaaaaaaaaaaa', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 18:04:11'),
(181, 'Deadpool', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 18:41:42'),
(182, 'Deadpool', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 18:41:56'),
(183, 'Deadpool', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 18:42:13'),
(184, 'Deadpool', NULL, 2019, 120, '3.3', 99, 2, '2020-03-13 18:42:32'),
(185, 'Deadpool', NULL, 2019, 120, '3.3', 99, 2, '2020-03-13 18:42:49'),
(186, 'Avengers Age of Ultron', NULL, 2019, 120, '5.0', 98, 1, '2020-03-13 20:43:27'),
(187, 'Deadpool', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 20:54:50'),
(188, 'Deadpool', NULL, 2019, 120, '3.3', 99, 1, '2020-03-13 20:55:18'),
(193, 'Deadpool', 'Desccc', 2019, 120, '3.3', 99, 1, '2020-03-13 23:42:26'),
(195, 'Black Widow', NULL, 2019, 120, '3.3', 99, 1, '2020-03-14 00:07:59'),
(196, 'Deadpool', 'ADSadasdasdasdasd', 2019, 120, '3.3', 99, 2, '2020-03-14 00:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE `content_categories` (
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_categories`
--

INSERT INTO `content_categories` (`content_id`, `category_id`) VALUES
(171, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(186, 2),
(187, 1),
(187, 2),
(188, 1),
(188, 2),
(193, 1),
(195, 1),
(195, 2),
(196, 1),
(196, 2),
(196, 3);

-- --------------------------------------------------------

--
-- Table structure for table `content_images`
--

CREATE TABLE `content_images` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isCover` tinyint(1) NOT NULL,
  `isThumbnail` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `content_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_images`
--

INSERT INTO `content_images` (`id`, `file_name`, `file_path`, `isCover`, `isThumbnail`, `created`, `content_id`) VALUES
(174, 'Avengers 2.jpg', '../images/thumb/174.jpg', 0, 1, '2020-03-13 18:04:11', 171),
(193, 'Deadpool.jpg', '../images/cover/193.jpg', 1, 0, '2020-03-13 18:41:42', 181),
(194, 'Deadpool.jpg', '../images/thumb/194.jpg', 0, 1, '2020-03-13 18:41:42', 181),
(195, 'Deadpool.jpg', '../images/cover/195.jpg', 1, 0, '2020-03-13 18:41:56', 182),
(196, 'Deadpool.jpg', '../images/thumb/196.jpg', 0, 1, '2020-03-13 18:41:56', 182),
(197, 'Deadpool.jpg', '../images/cover/197.jpg', 1, 0, '2020-03-13 18:42:13', 183),
(198, 'Deadpool.jpg', '../images/thumb/198.jpg', 0, 1, '2020-03-13 18:42:13', 183),
(199, 'Avengers.jpg', '../images/cover/199.jpg', 1, 0, '2020-03-13 18:42:32', 184),
(200, 'Avengers.jpg', '../images/thumb/200.jpg', 0, 1, '2020-03-13 18:42:33', 184),
(201, 'Avengers.jpg', '../images/cover/201.jpg', 1, 0, '2020-03-13 18:42:49', 185),
(202, 'Avengers.jpg', '../images/thumb/202.jpg', 0, 1, '2020-03-13 18:42:49', 185),
(203, 'Avengers.jpg', '../images/cover/203.jpg', 1, 0, '2020-03-13 20:43:27', 186),
(204, 'Avengers 2.jpg', '../images/thumb/204.jpg', 0, 1, '2020-03-13 20:43:27', 186),
(205, 'Avengers 2.jpg', '../images/cover/205.jpg', 1, 0, '2020-03-13 20:54:50', 187),
(206, 'Avengers.jpg', '../images/thumb/206.jpg', 0, 1, '2020-03-13 20:54:50', 187),
(207, 'Avengers.jpg', '../images/cover/207.jpg', 1, 0, '2020-03-13 20:55:19', 188),
(208, 'Deadpool.jpg', '../images/thumb/208.jpg', 0, 1, '2020-03-13 20:55:19', 188),
(220, 'Deadpool Alpha.png', '../images/cover/220.png', 1, 0, '2020-03-13 23:42:26', 193),
(221, 'Deadpool Alpha.png', '../images/thumb/221.png', 0, 1, '2020-03-13 23:42:26', 193),
(222, 'Avengers.jpg', '../images/wallpapers/222.jpg', 0, 0, '2020-03-13 23:42:26', 193),
(223, 'Batman 2.jpg', '../images/wallpapers/223.jpg', 0, 0, '2020-03-13 23:42:26', 193),
(224, 'Batman.jpg', '../images/wallpapers/224.jpg', 0, 0, '2020-03-13 23:42:26', 193),
(232, 'Black Widow alpha.png', '../images/cover/232.png', 1, 0, '2020-03-14 00:08:00', 195),
(233, 'Black Widow.jpg', '../images/thumb/233.jpg', 0, 1, '2020-03-14 00:08:00', 195),
(234, 'Avengers.jpg', '../images/wallpapers/234.jpg', 0, 0, '2020-03-14 00:08:00', 195),
(235, 'Batman 2.jpg', '../images/wallpapers/235.jpg', 0, 0, '2020-03-14 00:08:00', 195),
(236, 'Batman.jpg', '../images/wallpapers/236.jpg', 0, 0, '2020-03-14 00:08:00', 195),
(237, 'bloodshot-movie-2020-vin-diesel-movie_1572371048.jpg', '../images/wallpapers/237.jpg', 0, 0, '2020-03-14 00:08:00', 195),
(238, 'Deadpool 2.jpg', '../images/wallpapers/238.jpg', 0, 0, '2020-03-14 00:08:00', 195),
(239, 'Black Widow.jpg', '../images/cover/239.jpg', 1, 0, '2020-03-14 00:13:36', 196),
(240, 'Black Widow alpha.png', '../images/thumb/240.png', 0, 1, '2020-03-14 00:13:36', 196),
(241, 'Avengers.jpg', '../images/wallpapers/241.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(242, 'Batman 2.jpg', '../images/wallpapers/242.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(243, 'Batman.jpg', '../images/wallpapers/243.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(244, 'bloodshot-movie-2020-vin-diesel-movie_1572371048.jpg', '../images/wallpapers/244.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(245, 'Deadpool 2.jpg', '../images/wallpapers/245.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(246, 'Dracula.jpg', '../images/wallpapers/246.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(247, 'family-watching-netflix.jpg', '../images/wallpapers/247.jpg', 0, 0, '2020-03-14 00:13:36', 196),
(248, 'Game of Thrones.jpg', '../images/wallpapers/248.jpg', 0, 0, '2020-03-14 00:13:36', 196);

-- --------------------------------------------------------

--
-- Table structure for table `content_resolutions`
--

CREATE TABLE `content_resolutions` (
  `content_id` int(11) NOT NULL,
  `resolution_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_resolutions`
--

INSERT INTO `content_resolutions` (`content_id`, `resolution_id`) VALUES
(171, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(186, 2),
(187, 2),
(188, 1),
(188, 2),
(188, 3),
(193, 1),
(193, 2),
(193, 3),
(195, 1),
(195, 2),
(196, 1),
(196, 2),
(196, 3);

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_types`
--

INSERT INTO `content_types` (`id`, `name`) VALUES
(1, 'Movies'),
(2, 'TV Shows');

-- --------------------------------------------------------

--
-- Table structure for table `resolutions`
--

CREATE TABLE `resolutions` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resolutions`
--

INSERT INTO `resolutions` (`id`, `name`) VALUES
(1, '1080p'),
(2, '4k'),
(3, '1080p 60fps'),
(4, '720p');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `period` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscription_types`
--

INSERT INTO `subscription_types` (`id`, `name`, `price`, `period`) VALUES
(1, 'Free trial', '0.00', 7),
(2, 'Monthly', '4.99', 30),
(3, 'Yearly', '39.99', 365);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `subscription_types_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role_id`, `subscription_types_id`) VALUES
(2, 'admin@gmail.com', '$2y$10$OCXF1w8PlRxa0O4DieQzkObrpG3lqdd3PvUxOqBBik3PPTBRWslhG', 1, NULL),
(5, 'zarke998@gmail.com', '$2y$10$dQ0GMSxWvNya0Mg0QRrYd.A3lpTrfF8x1.R6Rk5s6fbmitF4oUDVK', 2, 1),
(9, 'andrewthezar@gmail.com', '$2y$10$7eRiKMLhnvpF/BozMgfaP.9F553x1RQMzb7VtWpFqS6uO78S.pRji', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_bookmarks`
--

CREATE TABLE `user_bookmarks` (
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_content_types` (`content_types_id`) USING BTREE;

--
-- Indexes for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`content_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `content_images`
--
ALTER TABLE `content_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_content_image` (`content_id`) USING BTREE;

--
-- Indexes for table `content_resolutions`
--
ALTER TABLE `content_resolutions`
  ADD PRIMARY KEY (`content_id`,`resolution_id`),
  ADD KEY `resolution_id` (`resolution_id`);

--
-- Indexes for table `content_types`
--
ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resolutions`
--
ALTER TABLE `resolutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Role` (`role_id`) USING BTREE,
  ADD KEY `FK_subscription_types` (`subscription_types_id`) USING BTREE;

--
-- Indexes for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  ADD PRIMARY KEY (`user_id`,`content_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `content_images`
--
ALTER TABLE `content_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resolutions`
--
ALTER TABLE `resolutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`content_types_id`) REFERENCES `content_types` (`id`);

--
-- Constraints for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD CONSTRAINT `content_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_categories_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_images`
--
ALTER TABLE `content_images`
  ADD CONSTRAINT `content_images_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_resolutions`
--
ALTER TABLE `content_resolutions`
  ADD CONSTRAINT `content_resolutions_ibfk_1` FOREIGN KEY (`resolution_id`) REFERENCES `resolutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_resolutions_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`subscription_types_id`) REFERENCES `subscription_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  ADD CONSTRAINT `user_bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

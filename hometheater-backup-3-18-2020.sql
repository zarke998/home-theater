-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2020 at 08:11 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id12855867_hometheater`
--

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
(214, 'Deadpool', 'ASDSA dA sa', 2019, 120, 3.3, 99, 2, '2020-03-18 20:02:32'),
(216, 'Deadpool', 'D SA sa DasD', 2019, 120, 3.3, 99, 2, '2020-03-18 20:07:28');

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
(214, 1),
(214, 2),
(216, 1),
(216, 2);

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
(295, 'Deadpool Alpha.png', '../images/cover/295.png', 1, 0, '2020-03-18 20:02:32', 214),
(296, 'Darth Vader 2.jpg', '../images/thumb/296.jpg', 0, 1, '2020-03-18 20:02:32', 214),
(297, 'Darth Vader 2.jpg', '../images/wallpapers/297.jpg', 0, 0, '2020-03-18 20:02:32', 214),
(301, 'Batman.jpg', '../images/cover/301.jpg', 1, 0, '2020-03-18 20:07:28', 216),
(302, 'Batman 2.jpg', '../images/thumb/302.jpg', 0, 1, '2020-03-18 20:07:28', 216),
(303, 'Batman.jpg', '../images/wallpapers/303.jpg', 0, 0, '2020-03-18 20:07:28', 216),
(304, 'Darth Vader.jpg', '../images/wallpapers/304.jpg', 0, 0, '2020-03-18 20:07:28', 216);

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
(214, 1),
(216, 1),
(216, 2);

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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`) VALUES
(4, 'account_footer_menu'),
(5, 'authorized_acc_menu'),
(3, 'legal_menu'),
(1, 'nav_menu'),
(2, 'socials_menu');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `href` varchar(255) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `href`, `menu_id`, `role_id`) VALUES
(1, 'Movies', '/movies.php', 1, NULL),
(2, 'TV Shows', '/tvshows.php', 1, NULL),
(3, 'Contact', '/contact.php', 1, NULL),
(4, 'About', '/about.php', 1, NULL),
(8, 'Facebook', 'https://facebook.com', 2, NULL),
(9, 'Twitter', 'https://twitter.com', 2, NULL),
(10, 'Instagram', 'https://instagram.com', 2, NULL),
(11, 'Privacy', '#', 3, NULL),
(12, 'Terms of Use', '#', 3, NULL),
(13, 'Disclaimer', '#', 3, NULL),
(14, 'DMCA', '#', 3, NULL),
(15, 'Report a Problem', '#', 4, NULL),
(16, 'Login', '/login.php', 4, NULL),
(17, 'Register', '/register.php', 4, NULL),
(27, 'Bookmark List', '/auth/bookmarks.php', 5, 2),
(28, 'Manage content library', '/auth/manage_content_library.php', 5, 1),
(29, 'Account settings', '#', 5, 2);

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
(1, 'Free trial', 0.00, 7),
(2, 'Monthly', 4.99, 30),
(3, 'Yearly', 39.99, 365);

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `name`, `isActive`) VALUES
(1, 'User experience', 1),
(2, 'Content quality', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `survey_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `name`, `survey_id`) VALUES
(1, 'How would you rate user expereince?', 1),
(2, 'Quality content is good, yes?', 2),
(3, 'Did you have fun?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question_answers`
--

CREATE TABLE `survey_question_answers` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `survey_question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_question_answers`
--

INSERT INTO `survey_question_answers` (`id`, `name`, `survey_question_id`) VALUES
(1, 'Awesome', 1),
(2, '4k BEST', 2),
(3, 'YEEEEEEES I DIIIIIIID', 3),
(4, 'N OMEGALUL', 3);

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
(12, 'zarke998@gmail.com', '$2y$10$uTW7y6vUuTmx4RXvSWzesOAoddVqwEG0hMF5jELjWkFeEQu9Yu1di', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_bookmarks`
--

CREATE TABLE `user_bookmarks` (
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_survey_answers`
--

CREATE TABLE `user_survey_answers` (
  `survey_question_answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_menu_name` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_menu_id` (`menu_id`),
  ADD KEY `FK_role_id` (`role_id`);

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
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_surveyId` (`survey_id`);

--
-- Indexes for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_survey_question_id` (`survey_question_id`);

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
  ADD PRIMARY KEY (`user_id`,`content_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indexes for table `user_survey_answers`
--
ALTER TABLE `user_survey_answers`
  ADD PRIMARY KEY (`survey_question_answer_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `content_images`
--
ALTER TABLE `content_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD CONSTRAINT `survey_questions_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  ADD CONSTRAINT `survey_question_answers_ibfk_1` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `user_bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_bookmarks_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_survey_answers`
--
ALTER TABLE `user_survey_answers`
  ADD CONSTRAINT `user_survey_answers_ibfk_1` FOREIGN KEY (`survey_question_answer_id`) REFERENCES `survey_question_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_survey_answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

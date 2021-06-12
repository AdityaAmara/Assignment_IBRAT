-- create database assignment;
use assignment;

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_price` float(10,2) NOT NULL DEFAULT '0.00',
  `class_name` text NOT NULL,
  `class_short_description` text NOT NULL,
  `class_date` date NOT NULL,
  `class_duration` varchar(10) NOT NULL,
  `class_member_limit` int(11) NOT NULL,
  `class_level` enum('Beginner','Intermediate','Advance') NOT NULL,
  `class_description` text NOT NULL,
  `class_benefits` text NOT NULL,
  `class_cover` text NOT NULL,
  `class_trainer` text NOT NULL,
  `class_status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_price`, `class_name`, `class_short_description`, `class_date`, `class_duration`, `class_member_limit`, `class_level`, `class_description`, `class_benefits`, `class_cover`, `class_trainer`, `class_status`, `deleted_at`, `updated_at`, `created_at`) VALUES
(1, 1.00, 'Strengthening', 'This will cover your Chest, Back and Legs very intensively', '2021-05-05', '45 mins', 10, 'Intermediate', 'Test', 'Test', 'https://care.hellofitness.in/laravel/resources/uploads/images/sub-categories/16172735631617099922img.jpg', 'Ishan', '1', NULL, '2021-03-20 14:05:24', '2020-12-28 08:09:25'),
(2, 1.00, 'CORE', 'CrossFit workouts are different every day and can be modified to help each athlete achieve their goals. The workouts may be adapted for people at any age and level of fitness.', '2021-03-02', '30 Mins', 10, 'Beginner', 'Test1Test', 'Test1', 'https://care.hellofitness.in/laravel/resources/uploads/images/sub-categories/16172735631617099922img.jpg', 'Ishan', '0', NULL, '2021-03-02 21:13:03', '2020-12-28 08:10:02'),
(9, 1.00, 'Mobility', '<p>Mobility</p>', '2021-03-03', '30 Mins', 10, 'Beginner', '<p>Mobility</p>', '<p>Mobility</p>', 'https://care.hellofitness.in/laravel/resources/uploads/images/sub-categories/16172735631617099922img.jpg', 'Ishan', '1', NULL, '2021-03-03 21:05:37', '2021-02-10 15:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

CREATE TABLE `master` (
  `id` int(11) NOT NULL,
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'plan or class',
  `key_id` int(11) NOT NULL COMMENT 'plan_id or class_id',
  `membership_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master`
--

INSERT INTO `master` (`id`, `type`, `key_id`, `membership_id`, `deleted_at`, `updated_at`, `created_at`) VALUES
(2, 'class', 1, 1, NULL, '2021-04-02 05:05:58', '2021-04-02 05:05:58'),
(6, 'plan', 1, 1, NULL, '2021-04-30 12:32:36', '2021-04-30 12:32:36'),
(7, 'class', 2, 1, NULL, '2021-04-02 05:05:58', '2021-04-02 05:05:58'),
(8, 'class', 9, 1, NULL, '2021-04-02 05:05:58', '2021-04-02 05:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(12) NOT NULL,
  `membership_name` text NOT NULL,
  `membership_duration` int(11) NOT NULL,
  `membership_classes` text NOT NULL,
  `membership_price` float(11,2) NOT NULL,
  `membership_discount_percentage` int(3) DEFAULT '0',
  `membership_offer_name` text,
  `membership_status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `membership_name`, `membership_duration`, `membership_classes`, `membership_price`, `membership_discount_percentage`, `membership_offer_name`, `membership_status`, `deleted_at`, `updated_at`, `created_at`) VALUES
(1, 'BEGINNER', 3, '', 1999.00, 0, NULL, '1', NULL, '2021-02-25 11:55:00', '2020-12-28 08:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `plan_subcat_id` int(11) NOT NULL,
  `plan_name` text NOT NULL,
  `plan_description` text NOT NULL,
  `plan_total_workouts` int(12) DEFAULT NULL,
  `plan_workouts_description` text NOT NULL,
  `plan_avg_duration` int(11) NOT NULL,
  `duration_unit` enum('Hrs','Mins') NOT NULL DEFAULT 'Hrs',
  `plan_total_weeks` int(11) NOT NULL,
  `plan_image` text NOT NULL,
  `plan_level` enum('Beginner','Intermediate','Advance') NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_subcat_id`, `plan_name`, `plan_description`, `plan_total_workouts`, `plan_workouts_description`, `plan_avg_duration`, `duration_unit`, `plan_total_weeks`, `plan_image`, `plan_level`, `status`, `deleted_at`, `updated_at`, `created_at`) VALUES
(1, 1, 'TESTING AGAIN', '<p><em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', 7, 
'<p><em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em> is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>'
, 5, 'Hrs', 2, 'https://care.hellofitness.in/laravel/resources/uploads/images/sub-categories/16172735631617099922img.jpg', 'Beginner', '1', NULL, '2021-04-30 12:32:35', '2021-04-02 05:05:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_membership` (`membership_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `master`
--

ALTER TABLE `master`
  ADD CONSTRAINT `master_membership` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



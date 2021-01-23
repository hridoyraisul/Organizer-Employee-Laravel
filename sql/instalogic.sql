-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 04:06 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instalogic`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ceo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coo`)),
  `general_manager` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`general_manager`)),
  `manager` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manager`)),
  `supervisor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`supervisor`)),
  `staff` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`staff`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `ceo`, `coo`, `general_manager`, `manager`, `supervisor`, `staff`, `created_at`, `updated_at`) VALUES
(1, 'Department 1', 'ramos@gmail.com', '[\"CindaKManley@dayrep.com\"]', '[\"NicholasBNovello@armyspy.com\"]', '[\"NicholasBNovello@armyspy.com\"]', '[\"YvetteJMcRae@jourrapide.com\"]', '[\"alex@live.com\",\"messi@gmail.com\",\"neymar@gmail.com\",\"raisulhridoy@hotmail.com\"]', NULL, NULL),
(2, 'Department 2', 'AlanPBlane@jourrapide.com', '[\"alex@live.com\",\"NicholasBNovello@armyspy.com\"]', '[\"CindaKManley@dayrep.com\"]', '[\"CindaKManley@dayrep.com\"]', '[\"NicholasBNovello@armyspy.com\",\"raisulhridoy@hotmail.com\"]', '[\"YvetteJMcRae@jourrapide.com\",\"ramos@gmail.com\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dept_id`)),
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`role`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `dept_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Alan P. Blane', 'AlanPBlane@jourrapide.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"Staff\",\"CEO\"]', NULL, NULL),
(2, 'Cinda K. Manley', 'CindaKManley@dayrep.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"COO\",\"General Manager\"]', NULL, NULL),
(3, 'Nicholas B. Novello', 'NicholasBNovello@armyspy.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"General Manager\",\"Supervisor\"]', NULL, NULL),
(4, 'Yvette J. McRae', 'YvetteJMcRae@jourrapide.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"Supervisor\",\"Staff\"]', NULL, NULL),
(5, 'Alex Rock', 'alex@live.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"Staff\",\"COO\"]', NULL, NULL),
(6, 'Leonel Messi', 'messi@gmail.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1]', '[\"Staff\"]', NULL, NULL),
(7, 'Neymar Jr', 'neymar@gmail.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1]', '[\"Staff\"]', NULL, NULL),
(8, 'Sergio Ramos', 'ramos@gmail.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"CEO\",\"Staff\"]', NULL, NULL),
(9, 'Raisul Hridoy', 'raisulhridoy@hotmail.com', '$2y$10$4BDocuh0wv5Y9PplVb5C/OX331Ojcs8fICnBAMtAML51nu38A4HRq', '[1,2]', '[\"Staff\",\"Supervisor\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_22_143432_create_employees_table', 1),
(5, '2021_01_22_143503_create_departments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

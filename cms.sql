-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 10:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `status`) VALUES
(3, 'app', 'Active'),
(65, 'Webss', 'Active'),
(68, 'web', 'Active'),
(73, 'Web_Development', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 483610639, 766773941, 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_department_id` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `assigh_date` date NOT NULL,
  `views` int(11) NOT NULL,
  `post_author_id` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_author`, `post_image`, `post_content`, `post_department_id`, `post_status`, `assigh_date`, `views`, `post_author_id`, `tags`) VALUES
(38, 'First Post', 'willy', 'download.jpg', ' Web development is the work involved in developing a website for the Internet or an intranet. Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.', 73, 'Publish', '2024-12-22', 0, 176, 'web');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_status` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `assigh_date` date NOT NULL,
  `due_date` date NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_image` text NOT NULL,
  `departments_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_name`, `project_status`, `created_by`, `assigh_date`, `due_date`, `priority`, `project_image`, `departments_id`) VALUES
(40, 'firstAPP', 'In Progress', 176, '2024-12-22', '0000-00-00', 'Low', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_hr`
--

CREATE TABLE `project_hr` (
  `id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `authorities` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT 'empty',
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project_hr`
--

INSERT INTO `project_hr` (`id`, `task_name`, `project_id`, `user_id`, `due_date`, `authorities`, `created_by`, `status`, `priority`, `note`, `time`) VALUES
(43, 'HHH', 23, 105, '2021-12-25', '', 1, '', 'Mid', '', '2017-12-21'),
(44, '', 23, 1, '0000-00-00', '', 1, '', 'Low', 'empty', '2017-12-21'),
(45, '', 23, 114, '0000-00-00', '', 1, '', 'Low', 'empty', '2017-12-21'),
(46, '42', 23, 105, '0000-00-00', '', 1, '', 'Low', 'empty', '2017-12-21'),
(47, '42', 23, 105, '2022-01-07', '', 1, '', 'Low', 'empty', '2017-12-21'),
(51, 'HHH', 24, 1, '0000-00-00', '', 1, '', 'Mid', 'empty', '2017-12-21'),
(58, 'HHH', 25, 105, '2021-12-04', '', 1, 'In Progress', 'Mid', 'empty', '2017-12-21'),
(59, 'HHH', 25, 106, '0000-00-00', '', 1, 'In Progress', 'Low', 'empty', '2017-12-21'),
(61, '', 26, 1, '0000-00-00', '', 1, 'In Progress', 'Low', 'empty', '2017-12-21'),
(62, '', 26, 105, '0000-00-00', '', 1, 'In Progress', 'Low', 'empty', '2017-12-21'),
(63, '', 26, 102, '0000-00-00', '', 1, 'In Progress', 'Low', 'empty', '2017-12-21'),
(64, '', 26, 105, '0000-00-00', '', 1, 'In Progress', 'Low', 'empty', '2017-12-21'),
(65, '', 27, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21'),
(66, '', 27, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21'),
(67, '', 27, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21'),
(68, '', 27, 134, '0000-00-00', '', 127, 'hold', 'Higth', 'empty', '2026-12-21'),
(69, '', 27, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `system_activity`
--

CREATE TABLE `system_activity` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `details` varchar(255) NOT NULL,
  `action_id` int(11) NOT NULL,
  `action_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_activity`
--

INSERT INTO `system_activity` (`id`, `date`, `created_by`, `details`, `action_id`, `action_name`) VALUES
(40, '2024-12-22', 176, 'Delete User ID: 175 ', 175, 'Delete'),
(41, '2024-12-22', 176, 'Update successfully User ID: 176 ', 176, 'update'),
(42, '2024-12-22', 176, 'Delete Project ID:  ', 35, 'Delete'),
(43, '2024-12-22', 176, 'Delete Project ID:  ', 34, 'Delete'),
(44, '2024-12-22', 176, 'Delete Project ID:  ', 27, 'Delete'),
(45, '2024-12-22', 176, 'Add New Project ID: 40 ', 40, 'Create'),
(46, '2024-12-22', 176, 'Add New Task ID: 41 ', 41, 'Create'),
(47, '2024-12-22', 176, 'Delete post ID: 37 ', 37, 'delete'),
(48, '2024-12-22', 176, 'Delete Departments ID: 72 ', 72, 'delete'),
(49, '2024-12-22', 176, 'Delete Departments ID: 71 ', 71, 'delete'),
(50, '2024-12-22', 176, 'Delete Departments ID: 67 ', 67, 'delete'),
(51, '2024-12-22', 176, 'Add New Post ID: 38 ', 38, 'create'),
(52, '2024-12-22', 176, 'Add New User ID: 177 ', 177, 'create');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `authorities` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `assigh_date` date NOT NULL,
  `task_file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `task_name`, `project_id`, `user_id`, `due_date`, `authorities`, `created_by`, `status`, `priority`, `note`, `assigh_date`, `task_file`) VALUES
(31, '', 31, 127, '0000-00-00', '', 127, 'In Process', 'Low', 'empty', '2026-12-21', ''),
(32, '', 32, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21', ''),
(34, 'HHH', 27, 151, '2021-12-09', '', 127, 'In Progress', 'Low', 'empty', '2026-12-21', ''),
(38, 'HHH', 35, 127, '2022-01-19', '', 127, 'In Progress', 'Low', 'empty', '2002-01-22', ''),
(39, 'zzz', 27, 127, '0000-00-00', '', 127, 'In Progress', 'Low', 'empty', '2002-01-22', ''),
(40, 'HHH', 38, 166, '2022-01-21', '', 127, 'In Progress', 'Low', 'empty', '2003-01-22', ''),
(41, '42', 40, 176, '2022-12-10', '', 176, 'hold', 'Mid', 'empty', '2024-12-22', '');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_status` varchar(255) NOT NULL,
  `assigh_date` date NOT NULL,
  `due_date` date NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_image` text NOT NULL,
  `departments_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_name`, `project_status`, `assigh_date`, `due_date`, `priority`, `project_image`, `departments_id`) VALUES
(12, 'first_project', 'In Progress', '2001-12-21', '2021-11-19', 'Higth', 'user-7.png', 10),
(13, 'new', 'Waitting', '2001-12-21', '2021-12-25', 'Low', 'user-8.png', 3),
(14, '', 'In Progress', '2001-12-21', '0000-00-00', 'Low', '', 3),
(15, 'sss', 'In Progress', '2001-12-21', '2021-12-10', 'Mid', 'user-7.png', 52);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `user_roles` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'offline',
  `email` varchar(255) NOT NULL,
  `personal_info` text NOT NULL,
  `phone` text NOT NULL,
  `birthday` date NOT NULL,
  `created_at` date NOT NULL,
  `access` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `username`, `password`, `fname`, `lname`, `img`, `user_roles`, `status`, `email`, `personal_info`, `phone`, `birthday`, `created_at`, `access`) VALUES
(176, 766773941, 'willy', '202cb962ac59075b964b07152d234b70', 'willy', 'nilly', 'testimonials-4.jpg', 'Admin', 'Active now', 'willy@gmail.com', ' ', '', '0000-00-00', '2024-12-22', 'enable'),
(177, 483610639, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', 'online', 'testimonials-1.jpg', 'Admin', 'Offline now', 'user@gmail.com', '', '', '0000-00-00', '0000-00-00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_hr`
--
ALTER TABLE `project_hr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_activity`
--
ALTER TABLE `system_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `project_hr`
--
ALTER TABLE `project_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `system_activity`
--
ALTER TABLE `system_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

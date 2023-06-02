-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2023 at 04:59 AM
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
-- Database: `newattendance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_app_attendance`
--

CREATE TABLE `attendance_app_attendance` (
  `attendanceid` int(11) NOT NULL,
  `timein_am` date DEFAULT NULL,
  `timeout_am` date DEFAULT NULL,
  `timein_pm` date DEFAULT NULL,
  `timeout_pm` date DEFAULT NULL,
  `eventid_id` int(11) NOT NULL,
  `student_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_app_attendance`
--

INSERT INTO `attendance_app_attendance` (`attendanceid`, `timein_am`, `timeout_am`, `timein_pm`, `timeout_pm`, `eventid_id`, `student_id_id`) VALUES
(1, NULL, NULL, '2023-06-02', NULL, 1, 202030050),
(2, '2023-06-02', '2023-06-02', NULL, NULL, 6, 202030050);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add student', 7, 'add_student'),
(26, 'Can change student', 7, 'change_student'),
(27, 'Can delete student', 7, 'delete_student'),
(28, 'Can view student', 7, 'view_student'),
(29, 'Can add event', 8, 'add_event'),
(30, 'Can change event', 8, 'change_event'),
(31, 'Can delete event', 8, 'delete_event'),
(32, 'Can view event', 8, 'view_event'),
(33, 'Can add notification', 9, 'add_notification'),
(34, 'Can change notification', 9, 'change_notification'),
(35, 'Can delete notification', 9, 'delete_notification'),
(36, 'Can view notification', 9, 'view_notification'),
(37, 'Can add attendance', 10, 'add_attendance'),
(38, 'Can change attendance', 10, 'change_attendance'),
(39, 'Can delete attendance', 10, 'delete_attendance'),
(40, 'Can view attendance', 10, 'view_attendance'),
(41, 'Can add event attendance', 11, 'add_eventattendance'),
(42, 'Can change event attendance', 11, 'change_eventattendance'),
(43, 'Can delete event attendance', 11, 'delete_eventattendance'),
(44, 'Can view event attendance', 11, 'view_eventattendance'),
(45, 'Can add notif students', 12, 'add_notifstudents'),
(46, 'Can change notif students', 12, 'change_notifstudents'),
(47, 'Can delete notif students', 12, 'delete_notifstudents'),
(48, 'Can view notif students', 12, 'view_notifstudents');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$0jgMoLuQnwDzdpyn4y1HW5$fYb8lpebuU9UHZL3aXo3iutr7oczdGX4R4u5Okj1ZPw=', '2023-06-01 06:21:25.718394', 1, 'admin', '', '', '202080028@psu.palawan.edu.ph', 1, 1, '2023-06-01 06:21:01.839066');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'attendance_app', 'attendance'),
(8, 'attendance_app', 'event'),
(11, 'attendance_app', 'eventattendance'),
(9, 'attendance_app', 'notification'),
(12, 'attendance_app', 'notifstudents'),
(7, 'attendance_app', 'student'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-01 03:53:29.018493'),
(2, 'auth', '0001_initial', '2023-06-01 03:53:29.500884'),
(3, 'admin', '0001_initial', '2023-06-01 03:53:29.645905'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-01 03:53:29.665925'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-01 03:53:29.685909'),
(6, 'attendance_app', '0001_initial', '2023-06-01 03:53:29.709924'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-06-01 03:53:29.785932'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-06-01 03:53:29.857946'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-06-01 03:53:29.881958'),
(10, 'auth', '0004_alter_user_username_opts', '2023-06-01 03:53:29.897989'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-06-01 03:53:29.961974'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-06-01 03:53:29.969974'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-06-01 03:53:29.989979'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-06-01 03:53:30.021986'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-06-01 03:53:30.049990'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-06-01 03:53:30.078018'),
(17, 'auth', '0011_update_proxy_permissions', '2023-06-01 03:53:30.098005'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-06-01 03:53:30.118256'),
(19, 'sessions', '0001_initial', '2023-06-01 03:53:30.162318'),
(20, 'attendance_app', '0002_event', '2023-06-01 04:06:58.056343'),
(21, 'attendance_app', '0003_notification', '2023-06-01 04:17:32.277053'),
(22, 'attendance_app', '0004_attendance', '2023-06-01 04:26:59.775668'),
(23, 'attendance_app', '0005_eventattendance', '2023-06-01 04:39:35.543522'),
(24, 'attendance_app', '0006_alter_eventattendance_event_total_absents_and_more', '2023-06-01 04:39:35.563523'),
(25, 'attendance_app', '0007_notifstudents', '2023-06-01 04:48:02.018740'),
(26, 'attendance_app', '0008_alter_attendance_attendanceid_and_more', '2023-06-01 04:54:06.340513'),
(27, 'attendance_app', '0009_alter_event_event_id', '2023-06-01 13:20:03.845682'),
(28, 'attendance_app', '0010_alter_attendance_timein_am_and_more', '2023-06-01 19:01:50.590396'),
(30, 'attendance_app', '0011_alter_attendance_timein_am_and_more', '2023-06-02 00:25:29.344633'),
(31, 'attendance_app', '0002_eventattendance', '2023-06-02 01:04:12.311436');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('w1mg3hn6e2unnsi7o2c3qd22fu8zb9gu', '.eJxVjEEOwiAQRe_C2hDGIgMu3fcMBGZGqRpISrsy3l2bdKHb_977LxXTupS4dpnjxOqsQB1-t5zoIXUDfE_11jS1usxT1puid9r12Fiel939Oyipl29NnjENBlmMzx7Rss9GIDtIISCS84OEDNYaQGJ0J8PEYI7gA4BcSb0_2n83dw:1q4bgb:Slm42NeL87qK6alMdtUyzdt6NPcpZSHgWS5TiSL8nUs', '2023-06-15 06:21:25.720394');

-- --------------------------------------------------------

--
-- Table structure for table `eventattendance`
--

CREATE TABLE `eventattendance` (
  `eventattendanceid` int(11) NOT NULL,
  `timein_no` int(11) NOT NULL,
  `timeout_no` int(11) NOT NULL,
  `event_total_timein` int(11) NOT NULL,
  `event_total_timeout` int(11) NOT NULL,
  `event_total_absents` int(11) NOT NULL,
  `eventid_id` int(11) NOT NULL,
  `studentid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventattendance`
--

INSERT INTO `eventattendance` (`eventattendanceid`, `timein_no`, `timeout_no`, `event_total_timein`, `event_total_timeout`, `event_total_absents`, `eventid_id`, `studentid_id`) VALUES
(12, 1, 1, 1, 1, 2, 6, 202030050);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `type` varchar(15) NOT NULL,
  `half_day_type` varchar(15) NOT NULL,
  `eventdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `type`, `half_day_type`, `eventdate`) VALUES
(1, 'Hackaton', 'Half Day', 'Afternoon', '2023-06-15'),
(6, 'Ligo Dagat', 'Half Day', 'Afternoon', '2023-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `idnotification` int(11) NOT NULL,
  `notification` varchar(50) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`idnotification`, `notification`, `created_at`) VALUES
(1, 'Student 202030050 logged in this afternoon.', '2023-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `notifstudents`
--

CREATE TABLE `notifstudents` (
  `notifstudents_id` int(11) NOT NULL,
  `notif_id_id` int(11) NOT NULL,
  `students_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `extname` varchar(10) NOT NULL,
  `course` varchar(10) NOT NULL,
  `year` varchar(15) NOT NULL,
  `block` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `lastname`, `firstname`, `middlename`, `extname`, `course`, `year`, `block`) VALUES
(202030050, 'Haha', 'admin', 'B', '', 'BSIT', 'Second Year', 'Block 2'),
(202080045, 'Doe', 'John', 'C', '', 'BSCS', 'Second Year', 'Block 5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_app_attendance`
--
ALTER TABLE `attendance_app_attendance`
  ADD PRIMARY KEY (`attendanceid`),
  ADD KEY `attendance_app_attendance_student_id_id_0de91ea6_fk_student_id` (`student_id_id`),
  ADD KEY `attendance_app_attendance_eventid_id_e160853c_fk` (`eventid_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `eventattendance`
--
ALTER TABLE `eventattendance`
  ADD PRIMARY KEY (`eventattendanceid`),
  ADD KEY `eventattendance_eventid_id_de1a47ec_fk_events_event_id` (`eventid_id`),
  ADD KEY `eventattendance_studentid_id_86579772_fk_student_id` (`studentid_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`idnotification`);

--
-- Indexes for table `notifstudents`
--
ALTER TABLE `notifstudents`
  ADD PRIMARY KEY (`notifstudents_id`),
  ADD KEY `attendance_app_notif_students_id_id_b7524803_fk_student_i` (`students_id_id`),
  ADD KEY `attendance_app_notifstudents_notif_id_id_f2b53c5c_fk` (`notif_id_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_app_attendance`
--
ALTER TABLE `attendance_app_attendance`
  MODIFY `attendanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `eventattendance`
--
ALTER TABLE `eventattendance`
  MODIFY `eventattendanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `idnotification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifstudents`
--
ALTER TABLE `notifstudents`
  MODIFY `notifstudents_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_app_attendance`
--
ALTER TABLE `attendance_app_attendance`
  ADD CONSTRAINT `attendance_app_attendance_student_id_id_0de91ea6_fk_student_id` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `eventattendance`
--
ALTER TABLE `eventattendance`
  ADD CONSTRAINT `eventattendance_eventid_id_de1a47ec_fk_events_event_id` FOREIGN KEY (`eventid_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `eventattendance_studentid_id_86579772_fk_student_id` FOREIGN KEY (`studentid_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `notifstudents`
--
ALTER TABLE `notifstudents`
  ADD CONSTRAINT `attendance_app_notif_students_id_id_b7524803_fk_student_i` FOREIGN KEY (`students_id_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `attendance_app_notifstudents_notif_id_id_f2b53c5c_fk` FOREIGN KEY (`notif_id_id`) REFERENCES `notification` (`idnotification`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 08, 2026 lúc 03:06 PM
-- Phiên bản máy phục vụ: 10.11.18-MariaDB-log
-- Phiên bản PHP: 8.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ntnvncom_erp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_budgets`
--

CREATE TABLE `admin_budgets` (
  `id` int(11) NOT NULL,
  `budget_year` int(11) NOT NULL,
  `budget_month` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `budget_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `asset_assignments`
--

CREATE TABLE `asset_assignments` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_date` date NOT NULL,
  `returned_date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance_audit_logs`
--

CREATE TABLE `attendance_audit_logs` (
  `id` int(11) NOT NULL,
  `attendance_log_id` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `change_type` varchar(50) DEFAULT 'manual_edit',
  `old_check_in` datetime DEFAULT NULL,
  `old_check_out` datetime DEFAULT NULL,
  `new_check_in` datetime DEFAULT NULL,
  `new_check_out` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance_audit_logs`
--

INSERT INTO `attendance_audit_logs` (`id`, `attendance_log_id`, `changed_by`, `change_type`, `old_check_in`, `old_check_out`, `new_check_in`, `new_check_out`, `note`, `created_at`) VALUES
(56, 1538, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-02 08:52:19'),
(57, 1538, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-02 08:52:25'),
(58, 1951, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-03 14:02:49'),
(59, 1754, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-03 14:03:06'),
(60, 1952, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-03 14:06:16'),
(61, 1953, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-03 14:06:37'),
(62, 1846, 1, 'manual_edit', NULL, NULL, '2026-05-16 07:00:00', '2026-05-16 14:00:00', '', '2026-06-03 14:37:14'),
(63, 1753, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 09:03:09'),
(64, 1753, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 09:15:06'),
(65, 3400, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 14:04:50'),
(66, 3400, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 14:05:03'),
(67, 1932, 1, 'manual_edit', NULL, NULL, '2026-05-29 07:00:00', '2026-05-29 16:00:00', '', '2026-06-04 14:06:57'),
(68, 3400, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 14:09:27'),
(69, 1797, 1, 'manual_edit', NULL, NULL, '2026-05-09 07:00:00', '2026-05-09 16:00:00', '', '2026-06-04 14:12:51'),
(70, 1797, 1, 'manual_edit', NULL, NULL, '2026-05-09 07:00:00', '2026-05-09 16:00:00', '', '2026-06-04 14:12:52'),
(71, 1752, 1, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-04 14:48:57'),
(74, 3438, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-06-29 23:04:57'),
(75, 1, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 12:13:01'),
(76, 1, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 12:19:57'),
(77, 1, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 12:35:50'),
(78, 1, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 12:41:18'),
(79, 2, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 12:45:43'),
(80, 2, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 13:00:12'),
(81, 3, 18, 'manual_edit', NULL, NULL, '2026-07-03 09:00:00', '2026-07-03 17:00:00', '', '2026-07-04 13:01:54'),
(82, 2, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 13:09:50'),
(83, 2, 18, 'manual_edit', NULL, NULL, '2026-07-04 13:10:00', '2026-07-04 17:10:00', '', '2026-07-04 13:11:10'),
(84, 2, 18, 'manual_edit', NULL, NULL, '2026-07-04 13:10:00', '2026-07-04 16:10:00', '', '2026-07-04 13:11:17'),
(85, 4, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-04 13:19:01'),
(86, 5, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-06 09:45:30'),
(87, 7, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-06 19:34:15'),
(88, 10, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-07 08:27:27'),
(89, 17, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-07 08:27:37'),
(90, 14, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-07 08:27:43'),
(91, 25, 18, 'manual_edit', NULL, NULL, '2026-07-02 08:00:00', '2026-07-02 16:30:00', '', '2026-07-07 18:33:15'),
(92, 25, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-07 18:33:22'),
(93, 20, 18, 'manual_edit', NULL, NULL, '2026-07-07 08:49:00', '2026-07-07 16:30:00', '', '2026-07-07 18:33:29'),
(94, 11, 18, 'manual_edit', NULL, NULL, '2026-07-06 17:07:00', '2026-07-06 00:02:00', '', '2026-07-07 18:33:37'),
(95, 8, 18, 'manual_edit', NULL, NULL, '2026-07-06 17:03:00', '2026-07-06 00:11:00', '', '2026-07-07 18:33:44'),
(96, 9, 18, 'manual_edit', NULL, NULL, '2026-07-06 17:03:00', '2026-07-06 00:11:00', '', '2026-07-07 18:33:48'),
(97, 15, 18, 'manual_edit', NULL, NULL, '2026-07-06 17:19:00', '2026-07-06 19:37:00', '', '2026-07-07 18:33:53'),
(98, 16, 18, 'manual_edit', NULL, NULL, '2026-07-06 17:45:00', '2026-07-06 00:08:00', '', '2026-07-07 18:33:57'),
(99, 19, 18, 'manual_edit', NULL, NULL, '2026-07-07 08:01:00', '2026-07-07 16:30:00', '', '2026-07-07 18:34:00'),
(100, 26, 18, 'manual_edit', NULL, NULL, '2026-07-02 07:30:00', '2026-07-02 16:30:00', '', '2026-07-07 18:34:55'),
(101, 26, 18, 'manual_edit', NULL, NULL, NULL, NULL, 'Xóa bản ghi', '2026-07-07 18:34:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance_department_policies`
--

CREATE TABLE `attendance_department_policies` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `policy_name` varchar(100) NOT NULL DEFAULT '',
  `location_mode` enum('strict','flexible') NOT NULL DEFAULT 'flexible' COMMENT 'strict=bắt buộc trong bán kính; flexible=cho phép ngoài phạm vi',
  `latitude` decimal(10,8) DEFAULT NULL COMMENT 'NULL = dùng tọa độ toàn công ty',
  `longitude` decimal(11,8) DEFAULT NULL,
  `radius_meters` int(11) DEFAULT NULL COMMENT 'NULL = dùng radius toàn công ty',
  `gps_required` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Policy vị trí chấm công theo phòng ban';

--
-- Đang đổ dữ liệu cho bảng `attendance_department_policies`
--

INSERT INTO `attendance_department_policies` (`id`, `department_id`, `policy_name`, `location_mode`, `latitude`, `longitude`, `radius_meters`, `gps_required`, `is_active`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 4, '', 'flexible', NULL, NULL, NULL, 1, 1, 18, '2026-07-07 02:14:58', '2026-07-07 02:16:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance_location_settings`
--

CREATE TABLE `attendance_location_settings` (
  `id` int(11) NOT NULL,
  `location_name` varchar(100) NOT NULL DEFAULT 'Công ty',
  `latitude` decimal(10,8) NOT NULL DEFAULT 0.00000000,
  `longitude` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `radius_meters` int(11) NOT NULL DEFAULT 200,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance_location_settings`
--

INSERT INTO `attendance_location_settings` (`id`, `location_name`, `latitude`, `longitude`, `radius_meters`, `is_enabled`, `updated_by`, `updated_at`) VALUES
(1, 'Công ty', 21.17112611, 105.83522553, 450, 0, 18, '2026-07-06 08:40:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `work_date` date NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `work_hours` decimal(5,2) DEFAULT 0.00,
  `source` enum('machine','manual','system') DEFAULT 'manual',
  `check_in_ip` varchar(45) DEFAULT NULL,
  `check_in_lat` decimal(10,7) DEFAULT NULL,
  `check_in_lng` decimal(10,7) DEFAULT NULL,
  `check_in_location_flag` enum('verified','outside','no_gps','unknown') DEFAULT 'unknown',
  `device_id` varchar(64) DEFAULT NULL COMMENT 'SHA-256 fingerprint của thiết bị chấm công',
  `same_device_alert` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = cùng thiết bị với NV khác trong ngày',
  `check_in_photo` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn ảnh chụp lúc vào ca',
  `check_out_photo` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn ảnh chụp lúc ra ca',
  `check_out_ip` varchar(45) DEFAULT NULL,
  `check_out_lat` decimal(10,7) DEFAULT NULL,
  `check_out_lng` decimal(10,7) DEFAULT NULL,
  `check_out_location_flag` enum('verified','outside','no_gps','unknown') DEFAULT 'unknown',
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_late` tinyint(1) DEFAULT 0,
  `late_minutes` int(11) DEFAULT 0,
  `early_leave` tinyint(1) DEFAULT 0,
  `early_leave_minutes` int(11) DEFAULT 0,
  `missing_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `missing_checkout_note` varchar(255) DEFAULT NULL,
  `auto_closed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance_logs`
--

INSERT INTO `attendance_logs` (`id`, `user_id`, `check_in`, `check_out`, `work_date`, `shift_id`, `work_hours`, `source`, `check_in_ip`, `check_in_lat`, `check_in_lng`, `check_in_location_flag`, `device_id`, `same_device_alert`, `check_in_photo`, `check_out_photo`, `check_out_ip`, `check_out_lat`, `check_out_lng`, `check_out_location_flag`, `note`, `created_at`, `updated_at`, `is_late`, `late_minutes`, `early_leave`, `early_leave_minutes`, `missing_checkout`, `missing_checkout_note`, `auto_closed_at`) VALUES
(7, 57, NULL, NULL, '2026-07-06', NULL, 0.00, 'manual', '42.117.48.131', 21.4138734, 105.8824065, 'outside', '8e1ba80f52a492ed8ae9f909b69cd9d298a199e993c926ab9ef03c5ac7eb9a69', 0, '/erp/uploads/attendance/2026-07-06/57_in_20260706_170010.jpg', '/erp/uploads/attendance/2026-07-06/57_out_20260706_170246.jpg', '42.117.48.131', 21.4137738, 105.8824025, 'outside', 'Xóa bản ghi', '2026-07-06 10:00:10', '2026-07-06 12:34:15', 0, 0, 0, 0, 0, NULL, NULL),
(8, 67, '2026-07-06 17:03:00', '2026-07-06 00:11:00', '2026-07-06', NULL, 7.13, 'manual', '171.255.57.200', 21.3379600, 105.6781520, 'outside', '665552a0022381172454efe9b89f390ca78a952e7ecc97a9e66a348870772192', 0, '/erp/uploads/attendance/2026-07-06/67_in_20260706_170305.jpg', '/erp/uploads/attendance/2026-07-07/67_out_20260707_001117.jpg', '171.255.57.200', 21.4579225, 105.8875658, 'outside', '', '2026-07-06 10:03:05', '2026-07-07 11:33:44', 0, 0, 1, 289, 0, NULL, NULL),
(9, 76, '2026-07-06 17:03:00', '2026-07-06 00:11:00', '2026-07-06', NULL, 7.13, 'manual', '171.253.242.177', 21.3382428, 105.6782748, 'outside', 'baa8988308c898b6467c096ea6d8e5b3666b3f9c8d3d2eb2bb0bdcc55a5d41ca', 0, '/erp/uploads/attendance/2026-07-06/76_in_20260706_170306.jpg', '/erp/uploads/attendance/2026-07-07/76_out_20260707_001135.jpg', '116.105.155.200', 21.4573692, 105.8876675, 'outside', '', '2026-07-06 10:03:06', '2026-07-07 11:33:48', 0, 0, 1, 289, 0, NULL, NULL),
(10, 62, NULL, NULL, '2026-07-06', NULL, 0.00, 'manual', '27.67.100.165', 21.3380576, 105.6768411, 'outside', '060ec2a5e3b6e6c3b9e823253af52eeb001128dcc4c63eaaf7536c7a0bc120a7', 0, '/erp/uploads/attendance/2026-07-06/62_in_20260706_170520.jpg', NULL, NULL, NULL, NULL, 'unknown', 'Xóa bản ghi', '2026-07-06 10:05:20', '2026-07-07 01:27:27', 0, 0, 0, 0, 1, 'Quên chấm công ra (tự động đánh dấu)', '2026-07-07 00:11:08'),
(11, 80, '2026-07-06 17:07:00', '2026-07-06 00:02:00', '2026-07-06', NULL, 6.92, 'manual', '27.67.211.72', 21.4569970, 105.8881341, 'outside', '205b3f843a1412bd3291310ba19e760456e601fa7a1811f6b3010b5a5ac42981', 0, '/erp/uploads/attendance/2026-07-06/80_in_20260706_170709.jpg', '/erp/uploads/attendance/2026-07-07/80_out_20260707_000234.jpg', '27.67.211.98', 21.4574036, 105.8877481, 'outside', '', '2026-07-06 10:07:09', '2026-07-07 11:33:37', 0, 0, 1, 298, 0, NULL, NULL),
(12, 70, '2026-07-06 17:07:35', NULL, '2026-07-06', NULL, 0.00, 'manual', '27.67.211.72', 21.4573726, 105.8880214, 'outside', '77ee195e72f01848bf8859ea440eabf6670fa205a3848a2363acdbd846a9bbc9', 0, '/erp/uploads/attendance/2026-07-06/70_in_20260706_170735.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-06 10:07:35', '2026-07-06 10:07:35', 0, 0, 0, 0, 0, NULL, NULL),
(13, 75, '2026-07-06 17:11:51', NULL, '2026-07-06', NULL, 0.00, 'manual', '27.67.211.72', 21.4577709, 105.8877689, 'outside', '9b8682734ff74db7f8d4dce9459a579487be66aa5f6e58a9eee4228de36776f8', 1, '/erp/uploads/attendance/2026-07-06/75_in_20260706_171152.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-06 10:11:52', '2026-07-07 10:37:09', 0, 0, 0, 0, 1, 'Quên chấm công ra (tự động đánh dấu)', '2026-07-07 17:37:09'),
(14, 79, NULL, NULL, '2026-07-06', NULL, 0.00, 'manual', '42.112.150.166', 21.5406180, 105.9210568, 'outside', 'ec32db3d17b4b8ac85d7566cdbfd094fc77b65316ac87c103dde6af839a7cadf', 0, '/erp/uploads/attendance/2026-07-06/79_in_20260706_171717.jpg', NULL, NULL, NULL, NULL, 'unknown', 'Xóa bản ghi', '2026-07-06 10:17:17', '2026-07-07 01:27:43', 0, 0, 0, 0, 0, NULL, NULL),
(15, 68, '2026-07-06 17:19:00', '2026-07-06 19:37:00', '2026-07-06', NULL, 2.30, 'manual', '27.67.211.72', 21.4574259, 105.8875473, 'outside', '9b8682734ff74db7f8d4dce9459a579487be66aa5f6e58a9eee4228de36776f8', 1, '/erp/uploads/attendance/2026-07-06/68_in_20260706_171939.jpg', '/erp/uploads/attendance/2026-07-06/68_out_20260706_193753.jpg', '171.255.118.45', 21.1711712, 105.8274403, 'outside', '', '2026-07-06 10:19:39', '2026-07-07 11:33:53', 0, 0, 1, 563, 0, NULL, NULL),
(16, 78, '2026-07-06 17:45:00', '2026-07-06 00:08:00', '2026-07-06', NULL, 6.38, 'manual', '27.67.212.240', 21.3177427, 105.8776935, 'outside', 'ad5a429e8f6dd5953f4ccb09901ae1734d7b67267cdce6a2d27d7914b515dd68', 0, '/erp/uploads/attendance/2026-07-06/78_in_20260706_174528.jpg', '/erp/uploads/attendance/2026-07-07/78_out_20260707_000822.jpg', '58.187.51.131', 21.4193248, 105.8983100, 'outside', '', '2026-07-06 10:45:28', '2026-07-07 11:33:57', 0, 0, 1, 292, 0, NULL, NULL),
(17, 91, NULL, NULL, '2026-07-06', NULL, 0.00, 'manual', '1.55.254.233', 21.4401187, 105.8341764, 'outside', 'ae892da5813c4a1686a4406c35416990af09321996cfbc6f8e8a156a73f1db20', 0, '/erp/uploads/attendance/2026-07-06/91_in_20260706_201106.jpg', NULL, NULL, NULL, NULL, 'unknown', 'Xóa bản ghi', '2026-07-06 13:11:06', '2026-07-07 01:27:37', 0, 0, 0, 0, 0, NULL, NULL),
(18, 63, '2026-07-07 07:22:53', '2026-07-07 22:34:12', '2026-07-07', NULL, 15.18, 'manual', '113.185.45.80', 21.1739300, 106.0560890, 'outside', 'bb0143e6c39f5ed88f4a8c4bd342a0e1e7a22c184126d9c1eb9d9d133d146caa', 0, '/erp/uploads/attendance/2026-07-07/63_in_20260707_072253.jpg', '/erp/uploads/attendance/2026-07-07/63_out_20260707_223412.jpg', '113.185.46.226', 21.1420212, 106.0960814, 'outside', NULL, '2026-07-07 00:22:53', '2026-07-07 15:34:12', 0, 0, 0, 0, 0, NULL, NULL),
(19, 86, '2026-07-07 08:01:00', '2026-07-07 16:30:00', '2026-07-07', NULL, 8.48, 'manual', '116.98.220.237', 21.4573383, 105.8872343, 'outside', 'bf9867506fa475df4b3ade851d75fe0ca6e68d9f4b92b90dc8c35c05396447f2', 0, '/erp/uploads/attendance/2026-07-07/86_in_20260707_080138.jpg', '/erp/uploads/attendance/2026-07-07/86_out_20260707_163012.jpg', '116.98.220.33', 21.4580759, 105.8878753, 'outside', '', '2026-07-07 01:01:38', '2026-07-07 11:34:00', 0, 0, 1, 30, 0, NULL, NULL),
(20, 79, '2026-07-07 08:49:00', '2026-07-07 16:30:00', '2026-07-07', NULL, 7.68, 'manual', '27.67.103.74', 21.4582114, 105.8878450, 'outside', 'ec57364dc327830aa7a09a9334a9f8a2e19d35cd58eb66824b5cfc41458d051f', 1, '/erp/uploads/attendance/2026-07-07/79_in_20260707_084900.jpg', '/erp/uploads/attendance/2026-07-07/79_out_20260707_163015.jpg', '27.67.103.48', 21.4575736, 105.8879213, 'outside', '', '2026-07-07 01:49:00', '2026-07-07 11:33:29', 1, 49, 1, 30, 0, NULL, NULL),
(21, 59, '2026-07-07 09:18:07', NULL, '2026-07-07', NULL, 0.00, 'manual', '171.251.152.173', 21.4139876, 105.8824133, 'outside', 'b1a410ebd355e76ac7d04d72407a483df786c59aabdeca5de3c71d41f9d9fc6e', 0, '/erp/uploads/attendance/2026-07-07/59_in_20260707_091807.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-07 02:18:07', '2026-07-07 02:18:07', 0, 0, 0, 0, 0, NULL, NULL),
(22, 62, '2026-07-07 14:52:12', NULL, '2026-07-07', NULL, 0.00, 'manual', '27.67.210.24', 21.4574345, 105.8864512, 'outside', '060ec2a5e3b6e6c3b9e823253af52eeb001128dcc4c63eaaf7536c7a0bc120a7', 0, '/erp/uploads/attendance/2026-07-07/62_in_20260707_145212.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-07 07:52:12', '2026-07-08 07:55:44', 0, 0, 0, 0, 1, 'Quên chấm công ra (tự động đánh dấu)', '2026-07-08 14:55:44'),
(23, 72, '2026-07-07 15:01:14', NULL, '2026-07-07', NULL, 0.00, 'manual', '27.65.160.249', 21.4579940, 105.8874298, 'outside', '1f23ae225b16755dc98e0e550f5459bab62f3eb0d0f786c61130438a7a8e216b', 0, '/erp/uploads/attendance/2026-07-07/72_in_20260707_150114.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-07 08:01:14', '2026-07-07 18:15:02', 0, 0, 0, 0, 1, 'Quên chấm công ra (tự động đánh dấu)', '2026-07-08 01:15:02'),
(24, 87, '2026-07-07 16:43:26', NULL, '2026-07-07', NULL, 0.00, 'manual', '171.253.234.15', 21.4581355, 105.8879396, 'outside', 'ec57364dc327830aa7a09a9334a9f8a2e19d35cd58eb66824b5cfc41458d051f', 1, '/erp/uploads/attendance/2026-07-07/87_in_20260707_164326.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-07 09:43:26', '2026-07-07 19:01:50', 0, 0, 0, 0, 1, 'Quên chấm công ra (tự động đánh dấu)', '2026-07-08 02:01:50'),
(25, 84, NULL, NULL, '2026-07-02', NULL, 0.00, 'manual', NULL, NULL, NULL, 'unknown', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'unknown', 'Xóa bản ghi', '2026-07-07 11:33:15', '2026-07-07 11:33:22', 0, 0, 0, 0, 0, NULL, NULL),
(26, 63, NULL, NULL, '2026-07-02', NULL, 0.00, 'manual', NULL, NULL, NULL, 'unknown', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'unknown', 'Xóa bản ghi', '2026-07-07 11:34:55', '2026-07-07 11:34:59', 0, 0, 0, 0, 0, NULL, NULL),
(27, 63, '2026-07-08 06:59:19', NULL, '2026-07-08', NULL, 0.00, 'manual', '113.185.42.12', 21.1419743, 106.0961499, 'outside', 'bb0143e6c39f5ed88f4a8c4bd342a0e1e7a22c184126d9c1eb9d9d133d146caa', 0, '/erp/uploads/attendance/2026-07-08/63_in_20260708_065919.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-07 23:59:19', '2026-07-07 23:59:19', 0, 0, 0, 0, 0, NULL, NULL),
(28, 57, '2026-07-08 09:09:18', NULL, '2026-07-08', NULL, 0.00, 'manual', '42.117.48.131', 21.4136838, 105.8824510, 'outside', '8e1ba80f52a492ed8ae9f909b69cd9d298a199e993c926ab9ef03c5ac7eb9a69', 0, '/erp/uploads/attendance/2026-07-08/57_in_20260708_090918.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-08 02:09:18', '2026-07-08 02:09:18', 1, 69, 0, 0, 0, NULL, NULL),
(29, 67, '2026-07-08 14:53:36', NULL, '2026-07-08', NULL, 0.00, 'manual', '116.106.97.94', 21.4573586, 105.8877283, 'outside', 'cbd98526ab1576c7daa1705b29f17ac3050ddd9d9d0e082e97be1dde5c638ea9', 0, '/erp/uploads/attendance/2026-07-08/67_in_20260708_145336.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-08 07:53:36', '2026-07-08 07:53:36', 0, 0, 0, 0, 0, NULL, NULL),
(30, 72, '2026-07-08 14:56:38', NULL, '2026-07-08', NULL, 0.00, 'manual', '171.253.240.24', 21.4579947, 105.8874307, 'outside', '1f23ae225b16755dc98e0e550f5459bab62f3eb0d0f786c61130438a7a8e216b', 0, '/erp/uploads/attendance/2026-07-08/72_in_20260708_145638.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-08 07:56:38', '2026-07-08 07:56:38', 0, 0, 0, 0, 0, NULL, NULL),
(31, 62, '2026-07-08 14:57:16', NULL, '2026-07-08', NULL, 0.00, 'manual', '27.67.212.210', 21.4573342, 105.8872268, 'outside', '060ec2a5e3b6e6c3b9e823253af52eeb001128dcc4c63eaaf7536c7a0bc120a7', 0, '/erp/uploads/attendance/2026-07-08/62_in_20260708_145716.jpg', NULL, NULL, NULL, NULL, 'unknown', NULL, '2026-07-08 07:57:16', '2026-07-08 07:57:16', 1, 417, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int(11) NOT NULL,
  `action` enum('create','update','delete') NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Dữ liệu trước khi sửa' CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Dữ liệu sau khi sửa' CHECK (json_valid(`new_data`)),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Lịch sử sửa/xóa toàn hệ thống';

--
-- Đang đổ dữ liệu cho bảng `audit_log`
--

INSERT INTO `audit_log` (`id`, `table_name`, `record_id`, `action`, `changed_by`, `changed_at`, `old_data`, `new_data`, `note`) VALUES
(1, 'delivery_notes', 6, 'delete', 1, '2026-03-11 14:44:41', '{\"id\":6,\"delivery_no\":\"DN-20260311-0001\",\"delivery_date\":\"2026-03-11\",\"sender_name\":null,\"sender_phone\":null,\"vehicle_plate\":null,\"driver_name\":null,\"driver_phone\":null,\"customer_id\":1,\"total_amount\":\"0\",\"status\":\"confirmed\",\"note\":\"\",\"created_by\":1,\"created_at\":\"2026-03-11 21:10:53\",\"updated_at\":\"2026-03-11 21:10:53\",\"items\":[{\"id\":6,\"delivery_note_id\":6,\"production_output_id\":4,\"product_code_id\":1,\"description\":\"hàng ốc vít\",\"unit\":\"cái\",\"quantity\":\"2500.00\",\"unit_price\":\"0\",\"total_price\":\"0\",\"note\":null}]}', NULL, 'Xóa biên bản DN-20260311-0001'),
(2, 'delivery_notes', 5, 'delete', 1, '2026-03-11 14:44:44', '{\"id\":5,\"delivery_no\":\"GH-20260311-001\",\"delivery_date\":\"2026-03-11\",\"sender_name\":null,\"sender_phone\":null,\"vehicle_plate\":null,\"driver_name\":null,\"driver_phone\":null,\"customer_id\":1,\"total_amount\":\"0\",\"status\":\"confirmed\",\"note\":null,\"created_by\":5,\"created_at\":\"2026-03-11 20:15:07\",\"updated_at\":\"2026-03-11 20:15:07\",\"items\":[{\"id\":5,\"delivery_note_id\":5,\"production_output_id\":4,\"product_code_id\":1,\"description\":\"hàng ốc vít\",\"unit\":\"cái\",\"quantity\":\"2000.00\",\"unit_price\":\"0\",\"total_price\":\"0\",\"note\":null}]}', NULL, 'Xóa biên bản GH-20260311-001'),
(3, 'delivery_notes', 4, 'delete', 1, '2026-03-11 14:44:48', '{\"id\":4,\"delivery_no\":\"GH-20260310-001\",\"delivery_date\":\"2026-03-10\",\"sender_name\":null,\"sender_phone\":null,\"vehicle_plate\":null,\"driver_name\":null,\"driver_phone\":null,\"customer_id\":1,\"total_amount\":\"0\",\"status\":\"confirmed\",\"note\":null,\"created_by\":1,\"created_at\":\"2026-03-11 00:38:22\",\"updated_at\":\"2026-03-11 00:38:22\",\"items\":[{\"id\":4,\"delivery_note_id\":4,\"production_output_id\":3,\"product_code_id\":1,\"description\":\"hàng ốc vít\",\"unit\":\"cái\",\"quantity\":\"100.00\",\"unit_price\":\"0\",\"total_price\":\"0\",\"note\":null}]}', NULL, 'Xóa biên bản GH-20260310-001'),
(4, 'production_outputs', 4, 'delete', 1, '2026-03-11 14:44:54', '{\"id\":4,\"output_no\":\"OUT-20260311-001\",\"output_date\":\"2026-03-11\",\"production_receipt_id\":3,\"product_code_id\":1,\"description\":null,\"quantity_completed\":\"5000.00\",\"quantity_defect\":\"1000.00\",\"quantity_delivered\":\"0.00\",\"note\":null,\"created_by\":5,\"created_at\":\"2026-03-11 20:13:23\",\"updated_at\":\"2026-03-11 21:44:44\"}', NULL, 'Xóa output OUT-20260311-001'),
(5, 'production_receipts', 4, 'delete', 1, '2026-03-11 14:44:59', '{\"id\":4,\"receipt_no\":\"PR-20260311-0001\",\"receipt_date\":\"2026-03-11\",\"warehouse_import_id\":2,\"product_code_id\":1,\"description\":null,\"quantity_received\":\"80000.00\",\"note\":\"\",\"created_by\":1,\"created_at\":\"2026-03-11 21:10:15\",\"updated_at\":\"2026-03-11 21:10:15\"}', NULL, 'Xóa phiếu nhận PR-20260311-0001'),
(6, 'production_receipts', 3, 'delete', 1, '2026-03-11 14:45:00', '{\"id\":3,\"receipt_no\":\"SX-20260311-001\",\"receipt_date\":\"2026-03-11\",\"warehouse_import_id\":1,\"product_code_id\":1,\"description\":null,\"quantity_received\":\"8000.00\",\"note\":null,\"created_by\":5,\"created_at\":\"2026-03-11 20:12:47\",\"updated_at\":\"2026-03-11 20:12:47\"}', NULL, 'Xóa phiếu nhận SX-20260311-001'),
(7, 'warehouse_imports', 2, 'delete', 1, '2026-03-11 14:45:22', '{\"id\":2,\"import_no\":\"WH-20260311-001\",\"import_date\":\"2026-03-11\",\"product_code_id\":1,\"description\":\"hàng ốc vít\",\"quantity\":\"100000.00\",\"quantity_sent\":\"0.00\",\"note\":null,\"status\":\"pending\",\"created_by\":2,\"created_at\":\"2026-03-11 20:30:01\",\"updated_at\":\"2026-03-11 21:44:59\",\"product_code\":\"SP-01\"}', NULL, 'Xóa phiếu nhập WH-20260311-001'),
(8, 'warehouse_imports', 3, 'delete', 1, '2026-03-11 15:02:44', '{\"id\":3,\"import_no\":\"WI-20260311-0001\",\"import_date\":\"2026-03-11\",\"product_code_id\":1,\"description\":null,\"quantity\":\"100000.00\",\"quantity_sent\":\"100000.00\",\"note\":\"\",\"status\":\"completed\",\"created_by\":1,\"created_at\":\"2026-03-11 21:57:14\",\"updated_at\":\"2026-03-11 21:57:30\",\"product_code\":\"SP-01\"}', NULL, 'Xóa phiếu nhập WI-20260311-0001'),
(9, 'production_outputs', 5, 'create', 1, '2026-03-11 15:07:17', NULL, '{\"output_no\":\"OUT-20260311-001\",\"output_date\":\"2026-03-11\",\"production_receipt_id\":6,\"quantity_completed\":50000,\"quantity_defect\":0}', 'Tao output OUT-20260311-001'),
(10, 'warehouse_imports', 5, 'delete', 1, '2026-04-29 07:31:44', '{\"id\":\"5\",\"import_no\":\"WI-20260429-0001\",\"import_date\":\"2026-04-29\",\"product_code_id\":\"1\",\"description\":null,\"quantity\":\"2000.00\",\"quantity_sent\":\"0.00\",\"note\":\"\",\"status\":\"pending\",\"created_by\":\"1\",\"created_at\":\"2026-04-29 14:31:26\",\"updated_at\":\"2026-04-29 14:31:26\",\"product_code\":\"123621\"}', NULL, 'Xóa phiếu nhập WI-20260429-0001');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `communes`
--

CREATE TABLE `communes` (
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `district_code` varchar(10) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_assets`
--

CREATE TABLE `company_assets` (
  `id` int(11) NOT NULL,
  `asset_code` varchar(50) NOT NULL,
  `asset_name` varchar(200) NOT NULL,
  `category` enum('computer','printer','furniture','machinery','vehicle','other') DEFAULT 'other',
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT 0.00,
  `supplier` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` enum('active','assigned','maintenance','disposed') DEFAULT 'active',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `depreciation_years` decimal(5,2) DEFAULT NULL COMMENT 'Thời gian khấu hao (năm). NULL = không khấu hao',
  `salvage_value` decimal(15,2) DEFAULT 0.00 COMMENT 'Giá trị còn lại sau khấu hao',
  `depreciation_start_date` date DEFAULT NULL COMMENT 'Ngày bắt đầu khấu hao (mặc định = purchase_date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_ip_whitelist`
--

CREATE TABLE `company_ip_whitelist` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `label` varchar(100) DEFAULT NULL COMMENT 'Mô tả: WiFi văn phòng, mạng LAN...',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_location_config`
--

CREATE TABLE `company_location_config` (
  `id` int(11) NOT NULL,
  `config_key` varchar(50) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `label` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `company_location_config`
--

INSERT INTO `company_location_config` (`id`, `config_key`, `config_value`, `label`) VALUES
(1, 'lat', '0.0', 'Vĩ độ công ty'),
(2, 'lng', '0.0', 'Kinh độ công ty'),
(3, 'radius_meters', '500', 'Bán kính cho phép (mét)'),
(4, 'gps_required', '0', 'Bắt buộc GPS (1=có, 0=không)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cost_entries`
--

CREATE TABLE `cost_entries` (
  `id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `cost_type` enum('material','supplies','machinery','transport','other') NOT NULL DEFAULT 'material',
  `supplier_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(15,2) DEFAULT 0.00,
  `unit` varchar(20) DEFAULT NULL,
  `unit_price` decimal(15,0) DEFAULT 0,
  `total_amount` decimal(15,0) DEFAULT 0,
  `invoice_no` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customer_code` varchar(30) DEFAULT NULL,
  `customer_name` varchar(200) NOT NULL,
  `address` text DEFAULT NULL,
  `tax_code` varchar(20) DEFAULT NULL COMMENT 'Mã số thuế',
  `vat_rate` tinyint(4) NOT NULL DEFAULT 8 COMMENT 'VAT mặc định (%)',
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `customer_code`, `customer_name`, `address`, `tax_code`, `vat_rate`, `contact_person`, `phone`, `email`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(4, NULL, 'CÔNG TY TNHH AMKOR TECHNOLOGY VIỆT NAM', 'Lô số CN5B, Khu công nghiệp Yên Phong II-C, Xã Yên Phong, Tỉnh Bắc Ninh, Việt Nam', '2301195652', 0, NULL, NULL, NULL, 1, 59, '2026-07-07 07:14:14', '2026-07-07 08:29:15'),
(5, NULL, 'CÔNG TY TNHH ECI VINA', 'Lô CN-6.5, KCN Gia Bình, Xã Đông Cứu , Tỉnh Bắc Ninh, Việt Nam.', NULL, 8, NULL, NULL, NULL, 1, 59, '2026-07-07 08:43:05', '2026-07-07 08:43:05'),
(6, NULL, 'CÔNG TY TNHH TOP RUN VIỆT NAM HẢI PHÒNG', 'Lô c5-3, KCN Tràng Duệ, thuộc khu kinh tế Đình Vũ- Cát Hải, phường An Phong, thành phố Hải Phòng, Việt Nam.', NULL, 0, NULL, NULL, NULL, 1, 59, '2026-07-07 08:50:41', '2026-07-07 08:50:41'),
(7, NULL, 'CÔNG TY TNHH FUTURECORE VIỆT NAM', 'Lô C9, Khu công nghiệp Bá Thiện II, xã Bình Xuyên, tỉnh Phú Thọ, Việt Nam', NULL, 0, NULL, NULL, NULL, 1, 59, '2026-07-07 09:18:05', '2026-07-07 09:20:40'),
(8, NULL, 'CÔNG TY TNHH JAEWOO VINA', 'Lô B8, Khu công nghiệp Thụy Vân, Phường Nông Trang, Tỉnh Phú Thọ, Việt Nam.', NULL, 8, NULL, NULL, NULL, 1, 59, '2026-07-08 05:05:05', '2026-07-08 05:05:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_prices`
--

CREATE TABLE `customer_prices` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `effective_date` date NOT NULL DEFAULT '2025-01-01',
  `expired_date` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer_prices`
--

INSERT INTO `customer_prices` (`id`, `customer_id`, `product_code_id`, `unit_price`, `effective_date`, `expired_date`, `note`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4, 8, 3880000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 15:02:09', '2026-07-07 15:23:52'),
(2, 4, 9, 3395000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 15:03:15', '2026-07-07 15:23:52'),
(3, 4, 8, 3880000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(4, 4, 9, 3395000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(5, 4, 10, 3686000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(6, 4, 11, 824500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(7, 4, 12, 1940000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(8, 4, 13, 1358000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(9, 4, 14, 3880000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(10, 4, 15, 3492000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(11, 4, 16, 3298000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(12, 4, 17, 3298000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(13, 4, 18, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(14, 4, 19, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(15, 4, 20, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(16, 4, 21, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(17, 4, 22, 2716000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(18, 4, 23, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(19, 4, 24, 3492000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(20, 4, 25, 2522000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(21, 4, 26, 630500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(22, 4, 27, 630500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(23, 4, 28, 310400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(24, 4, 29, 1746000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(25, 4, 30, 291000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(26, 4, 31, 291000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(27, 4, 32, 291000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(28, 4, 33, 514100.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(29, 4, 34, 504400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(30, 4, 35, 465600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(31, 4, 36, 465600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(32, 4, 37, 601400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(33, 4, 38, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(34, 4, 39, 446200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(35, 4, 40, 446200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(36, 4, 41, 2134000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(37, 4, 42, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(38, 4, 43, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(39, 4, 44, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(40, 4, 45, 3104000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(41, 4, 46, 291000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(42, 4, 47, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(43, 4, 48, 611100.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(44, 4, 49, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(45, 4, 50, 611100.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(46, 4, 51, 601400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(47, 4, 52, 601400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(48, 4, 53, 601400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(49, 4, 54, 446200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(50, 4, 55, 2522000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(51, 4, 56, 2134000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(52, 4, 57, 611100.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(53, 4, 58, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(54, 4, 59, 679000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(55, 4, 60, 436500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(56, 4, 61, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(57, 4, 62, 407400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(58, 4, 63, 2134000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(59, 4, 64, 504400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(60, 4, 65, 465600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(61, 4, 66, 504400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(62, 4, 67, 465600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(63, 4, 68, 552900.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(64, 4, 69, 601400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(65, 4, 70, 7275000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(66, 4, 71, 2425970.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(67, 4, 72, 2283962.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(68, 4, 73, 785700.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(69, 4, 74, 785700.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(70, 4, 75, 499647.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(71, 4, 76, 499647.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(72, 4, 77, 2097722.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(73, 4, 78, 1788680.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(74, 4, 79, 356087.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(75, 4, 80, 2279500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(76, 4, 81, 2444400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(77, 4, 82, 2279500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(78, 4, 83, 240754.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(79, 4, 84, 206610.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(80, 4, 85, 103305.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(81, 4, 86, 103305.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(82, 4, 87, 5066698.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(83, 4, 88, 1173700.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(84, 4, 89, 3162200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(85, 4, 90, 757570.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(86, 4, 91, 523800.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(87, 4, 92, 331740.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(88, 4, 93, 331740.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(89, 4, 94, 3414400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(90, 4, 95, 756600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(91, 4, 96, 1503500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:23:52', '2026-07-07 15:23:52'),
(92, 5, 97, 294000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(93, 5, 98, 4107000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(94, 5, 99, 2049000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(95, 5, 100, 677000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(96, 5, 101, 560000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(97, 5, 102, 356000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(98, 5, 103, 280000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(99, 5, 104, 280000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(100, 5, 105, 334000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(101, 5, 106, 758000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(102, 5, 107, 4892000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:43:18', '2026-07-07 15:43:18'),
(103, 6, 108, 14670.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(104, 6, 109, 12930.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(105, 6, 110, 13420.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(106, 6, 111, 13870.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(107, 6, 112, 1780.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(108, 6, 113, 1500.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(109, 6, 114, 4520.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(110, 6, 115, 3430.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(111, 6, 116, 4880.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(112, 6, 117, 4200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(113, 6, 118, 7510.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(114, 6, 119, 23290.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-07 15:50:56', '2026-07-07 15:50:56'),
(115, 7, 120, 2644236.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(116, 7, 121, 6527955.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(117, 7, 122, 4230778.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(118, 7, 123, 90666.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(119, 7, 124, 32246.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(120, 7, 125, 1078446.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(121, 7, 126, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(122, 7, 127, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(123, 7, 128, 2640000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(124, 7, 129, 8485000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(125, 7, 130, 5580000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(126, 7, 131, 343200.00, '2026-07-08', '2026-07-07', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(127, 7, 132, 343200.00, '2026-07-09', '2026-07-08', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(128, 7, 133, 3533904.00, '2026-07-10', '2026-07-09', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(129, 7, 134, 3300000.00, '2026-07-11', '2026-07-10', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(130, 7, 135, 140000.00, '2026-07-13', '2026-07-12', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(131, 7, 136, 6566000.00, '2026-07-14', '2026-07-13', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(132, 7, 137, 500000.00, '2026-07-15', '2026-07-14', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(133, 7, 138, 540000.00, '2026-07-16', '2026-07-15', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(134, 7, 139, 70000.00, '2026-07-17', '2026-07-16', NULL, 1, '2026-07-07 16:26:06', '2026-07-07 16:27:19'),
(135, 7, 120, 2644236.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(136, 7, 121, 6527955.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(137, 7, 122, 4230778.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(138, 7, 123, 90666.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(139, 7, 124, 32246.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(140, 7, 125, 1078446.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(141, 7, 126, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(142, 7, 127, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(143, 7, 128, 2640000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(144, 7, 129, 8485000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(145, 7, 130, 5580000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(146, 7, 131, 343200.00, '2026-07-08', '2026-07-07', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(147, 7, 132, 343200.00, '2026-07-09', '2026-07-08', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(148, 7, 133, 3533904.00, '2026-07-10', '2026-07-09', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(149, 7, 134, 3300000.00, '2026-07-11', '2026-07-10', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(150, 7, 140, 3300000.00, '2026-07-11', '2026-07-10', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(151, 7, 135, 140000.00, '2026-07-13', '2026-07-12', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(152, 7, 136, 6566000.00, '2026-07-14', '2026-07-13', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(153, 7, 137, 500000.00, '2026-07-15', '2026-07-14', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(154, 7, 138, 540000.00, '2026-07-16', '2026-07-15', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(155, 7, 139, 70000.00, '2026-07-17', '2026-07-16', NULL, 1, '2026-07-07 16:27:19', '2026-07-07 16:28:31'),
(156, 7, 120, 2644236.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(157, 7, 121, 6527955.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(158, 7, 122, 4230778.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(159, 7, 123, 90666.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(160, 7, 124, 32246.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(161, 7, 125, 1078446.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(162, 7, 126, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(163, 7, 127, 147000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(164, 7, 128, 2640000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(165, 7, 129, 8485000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(166, 7, 130, 5580000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-07 16:28:31', '2026-07-08 09:33:47'),
(167, 7, 131, 343200.00, '2026-07-08', '2027-05-02', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(168, 7, 132, 343200.00, '2026-07-09', '2027-05-03', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(169, 7, 133, 3533904.00, '2026-07-10', '2027-05-04', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(170, 7, 134, 3300000.00, '2026-07-11', '2027-05-05', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(171, 7, 140, 3300000.00, '2026-07-11', '2027-05-05', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(172, 7, 135, 140000.00, '2026-07-13', '2027-05-07', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(173, 7, 136, 6566000.00, '2026-07-14', '2027-05-08', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(174, 7, 137, 500000.00, '2026-07-15', '2027-05-09', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(175, 7, 138, 540000.00, '2026-07-16', '2027-05-10', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(176, 7, 139, 70000.00, '2026-07-17', '2027-05-11', NULL, 1, '2026-07-07 16:28:31', '2026-07-07 16:28:31'),
(177, 7, 120, 2644236.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(178, 7, 121, 6527955.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(179, 7, 122, 4230778.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(180, 7, 123, 90666.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(181, 7, 124, 32246.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(182, 7, 125, 1078446.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(183, 7, 126, 147000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(184, 7, 127, 147000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(185, 7, 128, 2640000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(186, 7, 129, 8485000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(187, 7, 130, 5580000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(188, 7, 131, 343200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(189, 7, 132, 343200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(190, 7, 133, 3533904.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(191, 7, 134, 3300000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(192, 7, 140, 3300000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(193, 7, 135, 140000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(194, 7, 136, 6566000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(195, 7, 137, 500000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(196, 7, 138, 540000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(197, 7, 139, 70000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 09:33:47', '2026-07-08 09:33:47'),
(198, 8, 141, 5448240.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(199, 8, 142, 155480.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(200, 8, 143, 172960.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(201, 8, 144, 172960.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(202, 8, 145, 293480.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(203, 8, 146, 621920.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(204, 8, 147, 30360.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(206, 8, 149, 1012000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(207, 8, 150, 196070.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(208, 8, 151, 515200.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(209, 8, 152, 644000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(210, 8, 153, 230000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(211, 8, 154, 138000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(212, 8, 155, 1472000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(213, 8, 156, 1656000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(215, 8, 158, 1196000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(216, 8, 159, 115920.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(217, 8, 160, 115920.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(218, 8, 161, 216200.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(219, 8, 162, 178480.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(220, 8, 163, 435160.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(221, 8, 164, 435160.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(222, 8, 165, 544640.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(223, 8, 166, 389160.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(224, 8, 167, 61640.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(225, 8, 168, 30360.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(226, 8, 169, 77280.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(227, 8, 170, 77280.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(228, 8, 171, 38640.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(229, 8, 172, 77280.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(230, 8, 173, 54280.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(231, 8, 174, 116840.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(232, 8, 175, 116840.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(233, 8, 176, 116840.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(234, 8, 177, 18400.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(235, 8, 178, 386400.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(236, 8, 179, 322000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(237, 8, 180, 1012000.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(238, 8, 181, 478400.00, '2026-07-07', '2026-07-06', NULL, 1, '2026-07-08 12:05:21', '2026-07-08 12:07:27'),
(239, 8, 141, 5448240.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(240, 8, 142, 155480.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(241, 8, 143, 172960.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(242, 8, 144, 172960.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(243, 8, 145, 293480.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(244, 8, 146, 621920.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(245, 8, 147, 30360.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(247, 8, 149, 1012000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(248, 8, 150, 196070.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(249, 8, 151, 515200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(250, 8, 152, 644000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(251, 8, 153, 230000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(252, 8, 154, 138000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(253, 8, 155, 1472000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(254, 8, 156, 1656000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(255, 8, 182, 809600.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(256, 8, 158, 1196000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(257, 8, 159, 115920.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(258, 8, 160, 115920.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(259, 8, 161, 216200.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(260, 8, 162, 178480.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(261, 8, 163, 435160.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(262, 8, 164, 435160.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(263, 8, 165, 544640.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(264, 8, 166, 389160.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(265, 8, 167, 61640.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(266, 8, 168, 30360.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(267, 8, 169, 77280.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(268, 8, 170, 77280.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(269, 8, 171, 38640.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(270, 8, 172, 77280.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(271, 8, 173, 54280.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(272, 8, 174, 116840.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(273, 8, 175, 116840.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(274, 8, 176, 116840.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(275, 8, 177, 18400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(276, 8, 178, 386400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(277, 8, 179, 322000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(278, 8, 180, 1012000.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27'),
(279, 8, 181, 478400.00, '2026-07-07', '2027-05-01', NULL, 1, '2026-07-08 12:07:27', '2026-07-08 12:07:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `day_close_log`
--

CREATE TABLE `day_close_log` (
  `id` int(11) NOT NULL,
  `close_date` date NOT NULL,
  `close_type` enum('manual','auto') NOT NULL DEFAULT 'manual',
  `qty_completed_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `qty_defect_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `qty_pending_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `closed_by` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `debt_payments`
--

CREATE TABLE `debt_payments` (
  `id` int(11) NOT NULL,
  `debt_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(15,0) NOT NULL DEFAULT 0,
  `payment_method` enum('cash','transfer','other') DEFAULT 'transfer',
  `reference_no` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `debt_tracking`
--

CREATE TABLE `debt_tracking` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `paid_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `remaining_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `due_date` date DEFAULT NULL,
  `status` enum('unpaid','partial','paid') DEFAULT 'unpaid',
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `delivery_no` varchar(50) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_out_id` int(11) DEFAULT NULL,
  `export_id` int(11) DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `status` enum('draft','confirmed','invoiced') DEFAULT 'draft',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_items`
--

CREATE TABLE `delivery_items` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `export_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000,
  `unit_price` decimal(15,2) DEFAULT 0.00,
  `total_price` decimal(15,2) DEFAULT 0.00,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_notes`
--

CREATE TABLE `delivery_notes` (
  `id` int(11) NOT NULL,
  `delivery_no` varchar(30) NOT NULL,
  `delivery_date` date NOT NULL,
  `sender_name` varchar(100) DEFAULT NULL,
  `sender_phone` varchar(20) DEFAULT NULL,
  `vehicle_plate` varchar(20) DEFAULT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `driver_phone` varchar(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `status` enum('draft','confirmed','invoiced') DEFAULT 'draft',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `receiver_name` varchar(100) DEFAULT NULL COMMENT 'Người nhận hàng',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT 'SĐT người nhận'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_note_items`
--

CREATE TABLE `delivery_note_items` (
  `id` int(11) NOT NULL,
  `delivery_note_id` int(11) NOT NULL,
  `production_output_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(15,0) NOT NULL DEFAULT 0,
  `total_price` decimal(15,0) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`) VALUES
(1, 'Ban Giám đốc', '2026-03-10 06:57:59'),
(2, 'Kế toán - Tài chính', '2026-03-10 06:57:59'),
(3, 'Kho vận', '2026-03-10 06:57:59'),
(4, 'Sản xuất', '2026-03-10 06:57:59'),
(5, 'Kinh doanh', '2026-03-10 06:57:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `districts`
--

CREATE TABLE `districts` (
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `province_code` varchar(10) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document_sequences`
--

CREATE TABLE `document_sequences` (
  `id` int(11) NOT NULL,
  `doc_type` varchar(10) NOT NULL,
  `doc_date` date NOT NULL,
  `last_seq` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `document_sequences`
--

INSERT INTO `document_sequences` (`id`, `doc_type`, `doc_date`, `last_seq`) VALUES
(1, 'IQC', '2026-07-08', 1),
(2, 'PO', '2026-07-08', 1),
(3, 'DEL', '2026-07-08', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_profiles`
--

CREATE TABLE `employee_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender` enum('male','female','other') NOT NULL DEFAULT 'male',
  `date_of_birth` date DEFAULT NULL,
  `ethnicity` varchar(50) DEFAULT 'Kinh',
  `marital_status` enum('single','married','divorced','widowed') DEFAULT 'single',
  `mobile_phone` varchar(20) DEFAULT NULL,
  `permanent_province` varchar(10) DEFAULT NULL,
  `permanent_district_text` varchar(150) DEFAULT NULL,
  `permanent_commune_text` varchar(150) DEFAULT NULL,
  `permanent_hamlet` varchar(200) DEFAULT NULL,
  `same_as_permanent` tinyint(1) DEFAULT 0,
  `temp_province` varchar(10) DEFAULT NULL,
  `temp_district_text` varchar(150) DEFAULT NULL,
  `temp_commune_text` varchar(150) DEFAULT NULL,
  `temp_hamlet` varchar(200) DEFAULT NULL,
  `identity_no` varchar(20) DEFAULT NULL,
  `identity_issue_date` date DEFAULT NULL,
  `identity_issue_place` varchar(200) DEFAULT NULL,
  `social_book_no` varchar(30) DEFAULT NULL,
  `personal_tax_code` varchar(20) DEFAULT NULL,
  `bank_account` varchar(30) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_branch` varchar(200) DEFAULT NULL,
  `dependants` tinyint(4) DEFAULT 0,
  `has_social_insurance` tinyint(1) NOT NULL DEFAULT 0,
  `insurance_from` date DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `annual_leave_total` tinyint(4) NOT NULL DEFAULT 9
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employee_profiles`
--

INSERT INTO `employee_profiles` (`id`, `user_id`, `gender`, `date_of_birth`, `ethnicity`, `marital_status`, `mobile_phone`, `permanent_province`, `permanent_district_text`, `permanent_commune_text`, `permanent_hamlet`, `same_as_permanent`, `temp_province`, `temp_district_text`, `temp_commune_text`, `temp_hamlet`, `identity_no`, `identity_issue_date`, `identity_issue_place`, `social_book_no`, `personal_tax_code`, `bank_account`, `bank_name`, `bank_branch`, `dependants`, `has_social_insurance`, `insurance_from`, `date_joined`, `created_at`, `updated_at`, `annual_leave_total`) VALUES
(2, 1, 'male', NULL, 'Kinh', 'single', '', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-03-10 14:16:19', '2026-03-10 14:16:19', 9),
(18, 58, 'male', NULL, 'Kinh', 'single', '971998863', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 06:12:37', '2026-07-06 06:12:37', 9),
(19, 69, 'male', NULL, 'Kinh', 'single', '969099903', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 06:17:25', '2026-07-06 06:17:25', 9),
(20, 67, 'male', NULL, 'Kinh', 'single', '962012921', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 06:17:39', '2026-07-06 06:17:39', 9),
(21, 61, 'male', NULL, 'Kinh', 'single', '948201189', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 06:35:29', '2026-07-06 06:35:29', 9),
(22, 63, 'male', NULL, 'Kinh', 'single', '', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 07:53:48', '2026-07-06 07:53:48', 9),
(23, 62, 'male', NULL, 'Kinh', 'single', '866687525', NULL, '', '', '', 0, NULL, '', '', '', '', NULL, '', '', '', '', '', '', 0, 0, NULL, NULL, '2026-07-06 08:14:47', '2026-07-06 08:14:47', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_salaries`
--

CREATE TABLE `employee_salaries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `component_id` int(11) DEFAULT NULL,
  `custom_name` varchar(200) DEFAULT NULL,
  `custom_name_en` varchar(200) DEFAULT NULL,
  `component_type` enum('earning','deduction','bonus') NOT NULL DEFAULT 'earning',
  `amount` decimal(15,0) DEFAULT 0,
  `insurance_amount` bigint(20) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `approval_status` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employee_salaries`
--

INSERT INTO `employee_salaries` (`id`, `user_id`, `component_id`, `custom_name`, `custom_name_en`, `component_type`, `amount`, `insurance_amount`, `sort_order`, `is_active`, `approval_status`, `approved_by`, `approved_at`, `note`, `effective_date`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(91, 57, 1, NULL, NULL, 'earning', 7092864, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(92, 57, 8, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(93, 57, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(94, 57, 4, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(95, 57, 7, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(96, 57, 5, NULL, NULL, 'earning', 1100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(97, 57, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:11:54', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:11:54'),
(98, 58, 1, NULL, NULL, 'earning', 8000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(99, 58, 8, NULL, NULL, 'earning', 2000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(100, 58, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(101, 58, 4, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(102, 58, 7, NULL, NULL, 'earning', 3000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(103, 58, 5, NULL, NULL, 'earning', 4900000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(104, 58, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:12:44'),
(105, 59, 1, NULL, NULL, 'earning', 14429760, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(106, 59, 8, NULL, NULL, 'earning', 3000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(107, 59, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(108, 59, 4, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(109, 59, 7, NULL, NULL, 'earning', 4000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(110, 59, 5, NULL, NULL, 'earning', 4900000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(111, 59, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:18', NULL, NULL, NULL, NULL, '2026-07-06 06:09:56', '2026-07-06 06:13:18'),
(112, 60, 1, NULL, NULL, 'earning', 8480000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(113, 60, 8, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(114, 60, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(115, 60, 4, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(116, 60, 7, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(117, 60, 5, NULL, NULL, 'earning', 1600000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(118, 60, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:12:24', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:12:24'),
(119, 61, 1, NULL, NULL, 'earning', 7000000, 0, 0, 0, 'approved', 18, '2026-07-06 13:21:57', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:26:39'),
(120, 61, 9, NULL, NULL, 'earning', 4860000, 0, 0, 0, 'approved', 18, '2026-07-06 13:21:57', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 06:26:36'),
(121, 62, 1, NULL, NULL, 'earning', 7000000, 0, 0, 0, 'approved', 18, '2026-07-06 13:18:41', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 08:11:46'),
(122, 62, 9, NULL, NULL, 'earning', 4860000, 0, 0, 0, 'approved', 18, '2026-07-06 13:18:41', NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 08:11:45'),
(123, 63, 1, NULL, NULL, 'earning', 6000000, 0, 0, 0, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 07:49:26'),
(124, 63, 9, NULL, NULL, 'earning', 4000000, 0, 0, 0, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:57', '2026-07-06 07:49:31'),
(125, 64, 1, NULL, NULL, 'earning', 7884960, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(126, 64, 8, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(127, 64, 9, NULL, NULL, 'earning', 800000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(128, 64, 4, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(129, 64, 7, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(130, 64, 5, NULL, NULL, 'earning', 2611000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(131, 64, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:50', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:50'),
(132, 65, 1, NULL, NULL, 'earning', 12720000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(133, 65, 8, NULL, NULL, 'earning', 3000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(134, 65, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(135, 65, 4, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(136, 65, 7, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(137, 65, 5, NULL, NULL, 'earning', 2400000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(138, 65, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:30', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:13:30'),
(139, 66, 1, NULL, NULL, 'earning', 8964200, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(140, 66, 8, NULL, NULL, 'earning', 3000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(141, 66, 9, NULL, NULL, 'earning', 4660000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(142, 66, 4, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(143, 66, 7, NULL, NULL, 'earning', 1880000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(144, 66, 5, NULL, NULL, 'earning', 2000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(145, 66, 11, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:23', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:20:23'),
(146, 67, 1, NULL, NULL, 'earning', 6793160, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(147, 67, 8, NULL, NULL, 'earning', 800000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(148, 67, 9, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(149, 67, 4, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(150, 67, 7, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(151, 67, 5, NULL, NULL, 'earning', 1580000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(152, 67, 11, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:17:44', NULL, NULL, NULL, NULL, '2026-07-06 06:09:58', '2026-07-06 06:17:44'),
(153, 68, 1, NULL, NULL, 'earning', 6568800, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(154, 68, 8, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(155, 68, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(156, 68, 4, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(157, 68, 7, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(158, 68, 5, NULL, NULL, 'earning', 1240000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(159, 68, 11, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:58', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:58'),
(160, 69, 1, NULL, NULL, 'earning', 6572000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(161, 69, 8, NULL, NULL, 'earning', 300000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(162, 69, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(163, 69, 4, NULL, NULL, 'earning', 300000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(164, 69, 7, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(165, 69, 5, NULL, NULL, 'earning', 2580000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(166, 69, 11, NULL, NULL, 'earning', 300000, 0, 0, 1, 'pending', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:09:59'),
(167, 70, 1, NULL, NULL, 'earning', 6136200, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:43', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:43'),
(168, 70, 9, NULL, NULL, 'earning', 600000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:43', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:43'),
(169, 70, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:43', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:43'),
(170, 70, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:43', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:43'),
(171, 70, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:43', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:24:43'),
(172, 71, 1, NULL, NULL, 'earning', 7333060, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:32', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:23:32'),
(173, 71, 9, NULL, NULL, 'earning', 600000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:32', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:23:32'),
(174, 71, 7, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:32', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:23:32'),
(175, 71, 5, NULL, NULL, 'earning', 2325000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:32', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:23:32'),
(176, 71, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:32', NULL, NULL, NULL, NULL, '2026-07-06 06:09:59', '2026-07-06 06:23:32'),
(177, 72, 1, NULL, NULL, 'earning', 5683000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:54', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:54'),
(178, 72, 9, NULL, NULL, 'earning', 600000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:54', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:54'),
(179, 72, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:54', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:54'),
(180, 72, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:54', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:54'),
(181, 72, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:54', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:54'),
(182, 73, 1, NULL, NULL, 'earning', 5500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:43'),
(183, 73, 9, NULL, NULL, 'earning', 600000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:43'),
(184, 73, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:43'),
(185, 73, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:43'),
(186, 73, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:22:43'),
(187, 74, 1, NULL, NULL, 'earning', 6509292, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:03', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:03'),
(188, 74, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:03', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:03'),
(189, 74, 7, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:03', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:03'),
(190, 74, 5, NULL, NULL, 'earning', 1000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:03', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:03'),
(191, 74, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:03', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:03'),
(192, 75, 1, NULL, NULL, 'earning', 5830000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(193, 75, 8, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(194, 75, 9, NULL, NULL, 'earning', 1800000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(195, 75, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(196, 75, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(197, 75, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:41', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:15:41'),
(198, 76, 1, NULL, NULL, 'earning', 5830000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:06', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:23:06'),
(199, 76, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:06', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:23:06'),
(200, 76, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:06', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:23:06'),
(201, 76, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:06', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:23:06'),
(202, 76, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:23:06', NULL, NULL, NULL, NULL, '2026-07-06 06:10:00', '2026-07-06 06:23:06'),
(203, 77, 1, NULL, NULL, 'earning', 6142200, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(204, 77, 8, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(205, 77, 9, NULL, NULL, 'earning', 1800000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(206, 77, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(207, 77, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(208, 77, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:43', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:19:43'),
(209, 78, 1, NULL, NULL, 'earning', 6142200, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:07', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:25:07'),
(210, 78, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:07', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:25:07'),
(211, 78, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:07', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:25:07'),
(212, 78, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:07', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:25:07'),
(213, 78, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:07', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:25:07'),
(214, 79, 1, NULL, NULL, 'earning', 5689000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:45', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:13:45'),
(215, 79, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:45', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:13:45'),
(216, 79, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:45', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:13:45'),
(217, 79, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:45', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:13:45'),
(218, 79, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:13:45', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:13:45'),
(219, 80, 1, NULL, NULL, 'earning', 5689000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:51', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:15:51'),
(220, 80, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:51', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:15:51'),
(221, 80, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:51', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:15:51'),
(222, 80, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:51', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:15:51'),
(223, 80, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:15:51', NULL, NULL, NULL, NULL, '2026-07-06 06:10:01', '2026-07-06 06:15:51'),
(224, 81, 1, NULL, NULL, 'earning', 5500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:22:30'),
(225, 81, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:22:30'),
(226, 81, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:22:30'),
(227, 81, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:22:30'),
(228, 81, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:22:30'),
(229, 82, 1, NULL, NULL, 'earning', 5500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:23', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:23'),
(230, 82, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:23', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:23'),
(231, 82, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:23', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:23'),
(232, 82, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:23', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:23'),
(233, 82, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:23', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:23'),
(234, 83, 1, NULL, NULL, 'earning', 5500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:38'),
(235, 83, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:38'),
(236, 83, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:38'),
(237, 83, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:38'),
(238, 83, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:25:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:25:38'),
(239, 84, 1, NULL, NULL, 'earning', 7011520, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:13', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:14:13'),
(240, 84, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:13', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:14:13'),
(241, 84, 7, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:13', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:14:13'),
(242, 84, 5, NULL, NULL, 'earning', 806000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:13', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:14:13'),
(243, 84, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:13', NULL, NULL, NULL, NULL, '2026-07-06 06:10:02', '2026-07-06 06:14:13'),
(244, 85, 1, NULL, NULL, 'earning', 7345060, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:19:11'),
(245, 85, 9, NULL, NULL, 'earning', 1500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:19:11'),
(246, 85, 7, NULL, NULL, 'earning', 500000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:19:11'),
(247, 85, 5, NULL, NULL, 'earning', 1020000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:19:11'),
(248, 85, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:19:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:19:11'),
(249, 86, 1, NULL, NULL, 'earning', 6142200, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:24:30'),
(250, 86, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:24:30'),
(251, 86, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:24:30'),
(252, 86, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:24:30'),
(253, 86, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:30', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:24:30'),
(254, 87, 1, NULL, NULL, 'earning', 6136200, 0, 0, 1, 'approved', 18, '2026-07-06 13:21:18', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:21:18'),
(255, 87, 9, NULL, NULL, 'earning', 1300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:21:18', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:21:18'),
(256, 87, 7, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:21:18', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:21:18'),
(257, 87, 5, NULL, NULL, 'earning', 100000, 0, 0, 1, 'approved', 18, '2026-07-06 13:21:18', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:21:18'),
(258, 87, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:21:18', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:21:18'),
(259, 88, 1, NULL, NULL, 'earning', 7000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:20:38'),
(260, 88, 9, NULL, NULL, 'earning', 4860000, 0, 0, 1, 'approved', 18, '2026-07-06 13:20:38', NULL, NULL, NULL, NULL, '2026-07-06 06:10:03', '2026-07-06 06:20:38'),
(261, 89, 1, NULL, NULL, 'earning', 7000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:05', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:24:05'),
(262, 89, 9, NULL, NULL, 'earning', 4860000, 0, 0, 1, 'approved', 18, '2026-07-06 13:24:05', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:24:05'),
(263, 90, 1, NULL, NULL, 'earning', 6000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:22:11'),
(264, 90, 9, NULL, NULL, 'earning', 4000000, 0, 0, 1, 'approved', 18, '2026-07-06 13:22:11', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:22:11'),
(265, 91, 1, NULL, NULL, 'earning', 4730000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:44', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:44'),
(266, 91, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:44', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:44'),
(267, 91, 7, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:44', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:44'),
(268, 91, 5, NULL, NULL, 'earning', 242800, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:44', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:44'),
(269, 91, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:44', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:44'),
(270, 92, 1, NULL, NULL, 'earning', 4730000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:31', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:31'),
(271, 92, 9, NULL, NULL, 'earning', 300000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:31', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:31'),
(272, 92, 5, NULL, NULL, 'earning', 90000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:31', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:31'),
(273, 92, 11, NULL, NULL, 'earning', 200000, 0, 0, 1, 'approved', 18, '2026-07-06 13:14:31', NULL, NULL, NULL, NULL, '2026-07-06 06:10:04', '2026-07-06 06:14:31'),
(274, 61, 8, 'Phụ cấp trách nhiệm', 'Responsibility allowance', 'earning', 5000000, 0, 1, 0, 'approved', 18, '2026-07-06 13:21:57', '', '2026-07-01', 57, NULL, '2026-07-06 06:21:30', '2026-07-06 06:26:33'),
(275, 61, 1, 'Lương cơ bản', 'Basic salary', 'earning', 7096700, 0, 2, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:27:05', '2026-07-06 06:33:42'),
(276, 61, 8, 'Phụ cấp trách nhiệm', 'Responsibility allowance', 'earning', 5000000, 0, 3, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:27:31', '2026-07-06 06:31:25'),
(277, 61, 4, 'Trợ cấp điện thoại', 'Mobile allowance', 'earning', 1000000, 0, 4, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:28:07', '2026-07-06 06:31:32'),
(278, 61, 7, 'Trợ cấp nhà ở', 'Housing allowance', 'earning', 1000000, 0, 5, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:28:44', '2026-07-06 06:31:38'),
(279, 61, 5, 'Trợ cấp xăng xe, đi lại', 'Gas - travelling allowance', 'earning', 1400000, 0, 6, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:30:00', '2026-07-06 06:31:45'),
(280, 61, 11, 'Chuyên Cần', 'Attendance Bonus', 'bonus', 300000, 0, 7, 1, 'pending', NULL, NULL, '', '2026-07-01', 57, NULL, '2026-07-06 06:31:15', '2026-07-06 06:31:52'),
(281, 63, 1, 'Lương cơ bản', 'Basic salary', 'earning', 6000000, 0, 1, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-01', 57, NULL, '2026-07-06 07:49:53', '2026-07-06 16:22:51'),
(282, 63, 8, 'Phụ cấp trách nhiệm', 'Responsibility allowance', 'earning', 2000000, 0, 2, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-01', 57, NULL, '2026-07-06 07:50:31', '2026-07-06 16:22:51'),
(283, 63, 9, 'Phụ cấp thâm niên', 'Seniority allowance', 'earning', 600000, 0, 3, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-06', 57, NULL, '2026-07-06 07:51:01', '2026-07-06 16:22:51'),
(284, 63, 7, 'Trợ cấp nhà ở', 'Housing allowance', 'earning', 100000, 0, 4, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-06', 57, NULL, '2026-07-06 07:51:19', '2026-07-06 16:22:51'),
(285, 63, 5, 'Trợ cấp xăng xe, đi lại', 'Gas - travelling allowance', 'earning', 100000, 0, 5, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-06', 57, NULL, '2026-07-06 07:51:44', '2026-07-06 16:22:51'),
(286, 63, 11, 'Chuyên Cần', 'Attendance Bonus', 'bonus', 200000, 0, 6, 1, 'approved', 18, '2026-07-06 23:22:51', '', '2026-07-01', 57, NULL, '2026-07-06 07:52:17', '2026-07-06 16:22:51'),
(287, 62, 1, 'Lương cơ bản', 'Basic salary', 'earning', 6198000, 0, 1, 1, 'approved', 18, '2026-07-06 23:21:54', '', '2026-07-01', 57, NULL, '2026-07-06 08:13:11', '2026-07-06 16:21:54'),
(288, 62, 9, 'Phụ cấp thâm niên', 'Seniority allowance', 'earning', 600000, 0, 2, 1, 'approved', 18, '2026-07-06 23:21:54', '', '2026-07-01', 57, NULL, '2026-07-06 08:13:36', '2026-07-06 16:21:54'),
(289, 62, 7, 'Trợ cấp nhà ở', 'Housing allowance', 'earning', 100000, 0, 3, 1, 'approved', 18, '2026-07-06 23:21:54', '', '2026-07-06', 57, NULL, '2026-07-06 08:14:00', '2026-07-06 16:21:54'),
(290, 62, 5, 'Trợ cấp xăng xe, đi lại', 'Gas - travelling allowance', 'earning', 100000, 0, 4, 1, 'approved', 18, '2026-07-06 23:21:54', '', '2026-07-01', 57, NULL, '2026-07-06 08:14:14', '2026-07-06 16:21:54'),
(291, 62, 11, 'Chuyên Cần', 'Attendance Bonus', 'bonus', 200000, 0, 5, 1, 'approved', 18, '2026-07-06 23:21:54', '', '2026-07-01', 57, NULL, '2026-07-06 08:14:33', '2026-07-06 16:21:54'),
(292, 81, 6, 'Thưởng hiệu quả công việc', 'Job effectiveness bonus', 'bonus', 500000, 0, 1, 0, 'pending', NULL, NULL, '', '2026-07-07', 1, NULL, '2026-07-07 05:36:50', '2026-07-07 05:37:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_shifts`
--

CREATE TABLE `employee_shifts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `effective_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employee_shifts`
--

INSERT INTO `employee_shifts` (`id`, `user_id`, `shift_id`, `effective_date`, `end_date`, `created_by`, `created_at`, `note`) VALUES
(5, 18, 1, '2026-07-01', NULL, 18, '2026-07-05 15:50:33', NULL),
(6, 1, 1, '2026-07-01', NULL, 18, '2026-07-05 15:50:33', NULL),
(10, 57, 1, '2026-07-01', NULL, 18, '2026-07-06 06:28:26', NULL),
(11, 60, 1, '2026-07-01', NULL, 18, '2026-07-06 06:28:26', NULL),
(12, 58, 1, '2026-07-01', NULL, 18, '2026-07-06 06:28:26', NULL),
(22, 80, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(23, 67, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(24, 77, 4, '2026-07-01', '2026-06-30', 57, '2026-07-06 09:40:34', NULL),
(25, 61, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(26, 81, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(27, 76, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(28, 68, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(29, 78, 4, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:40:34', NULL),
(30, 77, 1, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:53:02', NULL),
(31, 65, 1, '2026-07-01', '2026-07-05', 57, '2026-07-06 09:53:02', NULL),
(32, 75, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(33, 80, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(34, 67, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(35, 76, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(36, 70, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(37, 68, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(38, 78, 4, '2026-07-06', '2026-07-12', 57, '2026-07-06 09:56:28', NULL),
(39, 86, 1, '2026-07-07', NULL, 67, '2026-07-07 11:19:12', NULL),
(40, 62, 1, '2026-07-01', '2026-07-31', 57, '2026-07-08 02:17:40', NULL),
(41, 63, 1, '2026-07-01', '2026-07-31', 57, '2026-07-08 02:18:07', NULL),
(42, 59, 1, '2026-07-01', '2026-07-31', 57, '2026-07-08 02:18:37', NULL),
(45, 72, 4, '2026-07-07', '2026-07-12', 57, '2026-07-08 06:40:44', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ethnicities`
--

CREATE TABLE `ethnicities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ethnicities`
--

INSERT INTO `ethnicities` (`id`, `name`) VALUES
(12, 'Ba Na'),
(48, 'Bố Y'),
(53, 'Brâu'),
(24, 'Bru - Vân Kiều'),
(14, 'Chăm'),
(31, 'Chơ Ro'),
(34, 'Chu Ru'),
(44, 'Chứt'),
(29, 'Co'),
(15, 'Cơ Ho'),
(47, 'Cờ Lao'),
(25, 'Cơ Tu'),
(49, 'Cống'),
(9, 'Dao'),
(11, 'Ê Đê'),
(10, 'Gia Rai'),
(26, 'Giáy'),
(30, 'Giẻ Triêng'),
(33, 'Hà Nhì'),
(8, 'Hoa'),
(18, 'Hrê'),
(37, 'Kháng'),
(5, 'Khmer'),
(23, 'Khơ Mú'),
(1, 'Kinh'),
(36, 'La Chí'),
(40, 'La Ha'),
(39, 'La Hủ'),
(35, 'Lào'),
(45, 'Lô Lô'),
(42, 'Lự'),
(28, 'Mạ'),
(46, 'Mảng'),
(20, 'Mnông'),
(6, 'Mông'),
(4, 'Mường'),
(43, 'Ngái'),
(7, 'Nùng'),
(54, 'Ơ Đu'),
(41, 'Pà Thẻn'),
(38, 'Phù Lá'),
(51, 'Pu Péo'),
(19, 'Ra Glai'),
(52, 'Rơ Măm'),
(13, 'Sán Chay'),
(17, 'Sán Dìu'),
(50, 'Si La'),
(27, 'Tà Ôi'),
(2, 'Tày'),
(3, 'Thái'),
(21, 'Thổ'),
(32, 'Xinh Mun'),
(16, 'Xơ Đăng'),
(22, 'Xtiêng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `category_name`, `is_active`) VALUES
(1, 'Tiền điện', 1),
(2, 'Tiền nước', 1),
(3, 'Internet', 1),
(4, 'Điện thoại', 1),
(5, 'Thuê văn phòng', 1),
(6, 'Chuyển phát nhanh', 1),
(7, 'Văn phòng phẩm', 1),
(8, 'Vệ sinh', 1),
(9, 'Mua sắm máy móc / Thiết bị', 1),
(10, 'Mua sắm vật tư tiêu hao', 1),
(11, 'Khác', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expense_payments`
--

CREATE TABLE `expense_payments` (
  `id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` enum('cash','bank_transfer') DEFAULT 'cash',
  `paid_by` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expense_payments`
--

INSERT INTO `expense_payments` (`id`, `expense_id`, `payment_date`, `amount`, `payment_method`, `paid_by`, `note`, `created_at`) VALUES
(1, 1, '2026-07-07', 7176400.00, 'cash', 1, NULL, '2026-07-07 12:31:42'),
(2, 2, '2026-07-07', 400000.00, 'cash', 1, NULL, '2026-07-07 12:31:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expense_requests`
--

CREATE TABLE `expense_requests` (
  `id` int(11) NOT NULL,
  `request_no` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `expense_date` date NOT NULL,
  `purpose` text NOT NULL,
  `has_invoice` tinyint(1) DEFAULT 0,
  `invoice_no` varchar(100) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_company` varchar(200) DEFAULT NULL,
  `payment_method` enum('cash','bank_transfer') DEFAULT 'cash',
  `status` enum('draft','submitted','approved','rejected') DEFAULT 'draft',
  `requested_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expense_requests`
--

INSERT INTO `expense_requests` (`id`, `request_no`, `category_id`, `amount`, `expense_date`, `purpose`, `has_invoice`, `invoice_no`, `invoice_date`, `invoice_company`, `payment_method`, `status`, `requested_by`, `approved_by`, `approved_at`, `reject_reason`, `note`, `created_at`, `updated_at`) VALUES
(1, 'EXP-20260707-001', 10, 7176400.00, '2026-07-07', 'Mua dây nhôm bắn ARC', 1, NULL, NULL, NULL, 'bank_transfer', 'approved', 18, 1, '2026-07-07 12:31:29', NULL, NULL, '2026-07-07 10:36:36', '2026-07-07 12:31:29'),
(2, 'EXP-20260707-002', 8, 400000.00, '2026-07-07', 'Vệ sinh điều hoà', 0, NULL, NULL, NULL, 'cash', 'approved', 18, 1, '2026-07-07 12:31:24', NULL, NULL, '2026-07-07 10:43:04', '2026-07-07 12:31:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `finished_goods_stock`
--

CREATE TABLE `finished_goods_stock` (
  `id` int(11) NOT NULL,
  `fgs_no` varchar(30) NOT NULL,
  `progress_id` int(11) NOT NULL,
  `progress_log_id` int(11) DEFAULT NULL,
  `product_code_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` enum('normal','defect') NOT NULL DEFAULT 'normal',
  `qty_in` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_exported` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_remaining` decimal(15,3) NOT NULL DEFAULT 0.000,
  `status` enum('pending_export','partial_export','exported','delivered') NOT NULL DEFAULT 'pending_export',
  `source_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `holiday_date` date NOT NULL,
  `holiday_name` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `holidays`
--

INSERT INTO `holidays` (`id`, `holiday_date`, `holiday_name`, `year`, `created_by`) VALUES
(1, '2026-01-01', 'Tết Dương lịch', '2026', NULL),
(2, '2026-01-28', 'Tết Nguyên Đán (28/1)', '2026', NULL),
(3, '2026-01-29', 'Tết Nguyên Đán (29/1)', '2026', NULL),
(4, '2026-01-30', 'Tết Nguyên Đán (30/1)', '2026', NULL),
(5, '2026-01-31', 'Tết Nguyên Đán (31/1)', '2026', NULL),
(6, '2026-02-01', 'Tết Nguyên Đán (1/2)', '2026', NULL),
(7, '2026-02-02', 'Tết Nguyên Đán (2/2)', '2026', NULL),
(9, '2026-04-30', 'Ngày Giải phóng miền Nam', '2026', NULL),
(10, '2026-05-01', 'Quốc tế Lao động', '2026', NULL),
(11, '2026-09-02', 'Quốc khánh', '2026', NULL),
(12, '2026-09-03', 'Quốc khánh (bù)', '2026', NULL),
(13, '2025-01-01', 'Tết Dương lịch', '2025', NULL),
(14, '2025-01-27', 'Nghỉ Tết Nguyên Đán (27 tháng Chạp)', '2025', NULL),
(15, '2025-01-28', 'Nghỉ Tết Nguyên Đán (28 tháng Chạp)', '2025', NULL),
(16, '2025-01-29', 'Nghỉ Tết Nguyên Đán (29 tháng Chạp)', '2025', NULL),
(17, '2025-01-30', 'Nghỉ Tết Nguyên Đán (Mùng 1)', '2025', NULL),
(18, '2025-01-31', 'Nghỉ Tết Nguyên Đán (Mùng 2)', '2025', NULL),
(19, '2025-02-01', 'Nghỉ Tết Nguyên Đán (Mùng 3)', '2025', NULL),
(20, '2025-04-07', 'Giỗ Tổ Hùng Vương', '2025', NULL),
(21, '2025-04-30', 'Ngày Giải phóng miền Nam', '2025', NULL),
(22, '2025-05-01', 'Ngày Quốc tế Lao động', '2025', NULL),
(23, '2025-09-01', 'Nghỉ bù Quốc khánh', '2025', NULL),
(24, '2025-09-02', 'Ngày Quốc khánh', '2025', NULL),
(25, '2026-02-17', 'Nghỉ Tết Nguyên Đán (26 tháng Chạp)', '2026', NULL),
(26, '2026-02-18', 'Nghỉ Tết Nguyên Đán (27 tháng Chạp)', '2026', NULL),
(27, '2026-02-19', 'Nghỉ Tết Nguyên Đán (28 tháng Chạp)', '2026', NULL),
(28, '2026-02-20', 'Nghỉ Tết Nguyên Đán (Mùng 1)', '2026', NULL),
(29, '2026-02-21', 'Nghỉ Tết Nguyên Đán (Mùng 2)', '2026', NULL),
(30, '2026-02-22', 'Nghỉ Tết Nguyên Đán (Mùng 3)', '2026', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(30) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `subtotal` decimal(15,0) NOT NULL DEFAULT 0,
  `vat_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `vat_amount` decimal(15,0) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `status` enum('draft','unpaid','partial','paid','cancelled') DEFAULT 'unpaid',
  `created_by` int(11) DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bkav_invoice_no` varchar(50) DEFAULT NULL COMMENT 'Số hoá đơn do BKAV cấp',
  `bkav_status` varchar(20) DEFAULT NULL COMMENT 'issued | error | null',
  `bkav_issued_at` datetime DEFAULT NULL COMMENT 'Thời điểm xuất thành công',
  `bkav_raw_response` text DEFAULT NULL COMMENT 'Raw response từ BKAV (debug)',
  `is_locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = đã khoá, chỉ director sửa được',
  `locked_bkav_no` varchar(50) DEFAULT NULL COMMENT 'Số HĐ BKAV nhập khi khoá',
  `locked_bkav_date` date DEFAULT NULL COMMENT 'Ngày HĐ BKAV nhập khi khoá',
  `locked_at` datetime DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `invoices_v`
-- (See below for the actual view)
--
CREATE TABLE `invoices_v` (
`id` int(11)
,`invoice_no` varchar(30)
,`invoice_date` date
,`due_date` date
,`customer_id` int(11)
,`total_amount` decimal(15,0)
,`subtotal` decimal(15,0)
,`vat_rate` decimal(5,2)
,`vat_amount` decimal(15,0)
,`note` text
,`delivery_id` int(11)
,`status` enum('draft','unpaid','partial','paid','cancelled')
,`created_by` int(11)
,`confirmed_by` int(11)
,`confirmed_at` timestamp
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_delivery_notes`
--

CREATE TABLE `invoice_delivery_notes` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `delivery_note_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `delivery_note_id` int(11) DEFAULT NULL,
  `delivery_note_item_id` int(11) DEFAULT NULL,
  `product_code_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(15,0) NOT NULL DEFAULT 0,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inv_exports`
--

CREATE TABLE `inv_exports` (
  `id` int(11) NOT NULL,
  `export_no` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  `export_date` date NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `requested_by_name` varchar(150) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inv_imports`
--

CREATE TABLE `inv_imports` (
  `id` int(11) NOT NULL,
  `import_no` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  `import_date` date NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `vat_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(15,2) GENERATED ALWAYS AS (`quantity` * `unit_price` * (1 + `vat_percent` / 100)) STORED,
  `invoice_no` varchar(100) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inv_items`
--

CREATE TABLE `inv_items` (
  `id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` enum('consumable','stationery','equipment','machinery','other') NOT NULL DEFAULT 'other',
  `unit` varchar(50) NOT NULL DEFAULT 'Cái',
  `min_stock` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `iqc_receipts`
--

CREATE TABLE `iqc_receipts` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(30) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `received_date` date NOT NULL,
  `received_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('open','in_production','done') NOT NULL DEFAULT 'open',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `iqc_receipts`
--

INSERT INTO `iqc_receipts` (`id`, `receipt_no`, `customer_id`, `received_date`, `received_by`, `note`, `status`, `created_by`, `created_at`) VALUES
(1, 'IQC-20260708-001', 8, '2026-07-08', 59, NULL, 'done', 18, '2026-07-08 07:36:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `iqc_receipt_items`
--

CREATE TABLE `iqc_receipt_items` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `unit` varchar(30) NOT NULL DEFAULT 'cái',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `iqc_receipt_items`
--

INSERT INTO `iqc_receipt_items` (`id`, `receipt_id`, `product_code_id`, `qty`, `unit`, `note`) VALUES
(1, 1, 149, 1.00, 'Ea', NULL),
(2, 1, 144, 1.00, 'Ea', NULL),
(3, 1, 142, 1.00, 'Ea', NULL),
(4, 1, 178, 1.00, 'Ea', NULL),
(5, 1, 158, 1.00, 'Ea', NULL),
(6, 1, 160, 1.00, 'Ea', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kpi_assignments`
--

CREATE TABLE `kpi_assignments` (
  `id` int(11) NOT NULL,
  `assign_date` date NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'nhân viên sản xuất',
  `manager_id` int(11) NOT NULL COMMENT 'quản lý phân bổ',
  `kpi_target` int(11) NOT NULL DEFAULT 0 COMMENT 'số SP mục tiêu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `over_bonus_pct` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT '% thưởng cho mỗi % vượt KPI (vd: 50 = mỗi 1% vượt được thưởng 0.5% lương ngày)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kpi_results`
--

CREATE TABLE `kpi_results` (
  `id` int(11) NOT NULL,
  `kpi_assignment_id` int(11) NOT NULL,
  `actual_qty` int(11) NOT NULL DEFAULT 0 COMMENT 'SP thực tế',
  `salary_per_day` decimal(15,0) DEFAULT 0 COMMENT 'lương ngày đầy đủ',
  `salary_actual` decimal(15,0) DEFAULT 0 COMMENT 'lương ngày thực tế sau KPI',
  `is_deducted` tinyint(1) DEFAULT 0 COMMENT '1=trừ lương, 0=đủ ngày công',
  `reason` text DEFAULT NULL COMMENT 'lý do không trừ lương',
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `leave_type` enum('annual','sick','unpaid','other') NOT NULL DEFAULT 'annual',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` decimal(4,1) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_type`, `start_date`, `end_date`, `total_days`, `reason`, `status`, `approved_by`, `approved_at`, `reject_reason`, `created_at`) VALUES
(2, 63, 'annual', '2026-07-11', '2026-07-11', 1.0, 'Lý do gia đình', 'pending', NULL, NULL, NULL, '2026-07-08 06:57:04'),
(3, 67, 'annual', '2026-07-09', '2026-07-09', 1.0, 'Nhà có việc bận.', 'pending', NULL, NULL, NULL, '2026-07-08 06:59:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT 'general',
  `reference_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `reference_id`, `is_read`, `created_at`) VALUES
(792, 1, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(793, 18, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(794, 57, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(795, 58, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(796, 60, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(797, 59, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Trần Văn Cường (NV012) dùng cùng thiết bị với Lường Đức Hào (NV019) vào ngày 06/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 68, 0, '2026-07-06 10:19:39'),
(798, 1, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(799, 18, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(800, 57, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(801, 58, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(802, 60, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(803, 59, '⚠️ Nghi vấn chấm công hộ', '⚠️ Cảnh báo chấm công hộ: Nguyễn Trung Phong (NV031) dùng cùng thiết bị với Dương Thanh Vương (NV023) vào ngày 07/07/2026. Vui lòng kiểm tra!', 'same_device_alert', 87, 0, '2026-07-07 09:43:26'),
(804, 1, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(805, 18, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(806, 59, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(807, 64, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(808, 65, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(809, 67, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(810, 68, 'Đơn xin nghỉ phép mới', 'Nguyễn Mạnh Tưởng xin nghỉ từ 11/07/2026 đến 11/07/2026', 'leave_request', 2, 0, '2026-07-08 06:57:04'),
(811, 1, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(812, 18, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(813, 59, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(814, 64, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(815, 65, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(816, 67, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45'),
(817, 68, 'Đơn xin nghỉ phép mới', 'Lưu Đình Khôi xin nghỉ từ 09/07/2026 đến 09/07/2026', 'leave_request', 3, 0, '2026-07-08 06:59:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oqc_deliveries`
--

CREATE TABLE `oqc_deliveries` (
  `id` int(11) NOT NULL,
  `delivery_no` varchar(30) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `sender_name` varchar(100) DEFAULT NULL,
  `vehicle_plate` varchar(20) DEFAULT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('draft','delivered') NOT NULL DEFAULT 'draft',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oqc_delivery_items`
--

CREATE TABLE `oqc_delivery_items` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `production_item_id` int(11) NOT NULL,
  `qty_deliver` decimal(12,2) NOT NULL,
  `type` enum('done','error') NOT NULL DEFAULT 'done',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `overtime_requests`
--

CREATE TABLE `overtime_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `ot_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `hours` decimal(4,2) NOT NULL,
  `actual_hours` decimal(4,2) DEFAULT NULL,
  `reason` text NOT NULL,
  `ot_type` enum('weekday','weekend','holiday','night','night_weekday','night_weekend','night_holiday') NOT NULL DEFAULT 'weekday',
  `shift_id` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` enum('cash','transfer','check') DEFAULT 'cash',
  `note` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payroll_periods`
--

CREATE TABLE `payroll_periods` (
  `id` int(11) NOT NULL,
  `period_year` smallint(6) NOT NULL,
  `period_month` tinyint(4) NOT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `working_days` tinyint(4) NOT NULL,
  `status` enum('draft','submitted','approved','locked') DEFAULT 'draft',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `submitted_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payroll_slips`
--

CREATE TABLE `payroll_slips` (
  `id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `basic_salary` decimal(15,0) DEFAULT 0,
  `working_days_standard` tinyint(4) DEFAULT 0,
  `salary_per_day` decimal(10,0) DEFAULT 0,
  `salary_per_hour` decimal(10,0) DEFAULT 0,
  `actual_workdays` decimal(5,2) DEFAULT 0.00,
  `paid_leave_days` decimal(5,2) DEFAULT 0.00,
  `other_paid_leave_days` decimal(5,2) DEFAULT 0.00,
  `unpaid_leave_days` decimal(5,2) DEFAULT 0.00,
  `late_early_hours` decimal(5,2) DEFAULT 0.00,
  `late_early_deduction` decimal(15,0) DEFAULT 0,
  `total_paid_days` decimal(5,2) DEFAULT 0.00,
  `basic_salary_received` decimal(15,0) DEFAULT 0,
  `meal_allowance` decimal(15,0) DEFAULT 0,
  `meal_received` decimal(15,0) DEFAULT 0,
  `clothes_allowance` decimal(15,0) DEFAULT 0,
  `clothes_received` decimal(15,0) DEFAULT 0,
  `phone_allowance` decimal(15,0) DEFAULT 0,
  `phone_received` decimal(15,0) DEFAULT 0,
  `transport_allowance` decimal(15,0) DEFAULT 0,
  `housing_allowance` int(11) NOT NULL DEFAULT 0,
  `transport_received` decimal(15,0) DEFAULT 0,
  `housing_received` int(11) NOT NULL DEFAULT 0,
  `performance_bonus` decimal(15,0) DEFAULT 0,
  `basic_salary_per_hour` decimal(10,0) DEFAULT 0,
  `ot_weekday_hours` decimal(5,2) DEFAULT 0.00,
  `ot_weekend_hours` decimal(5,2) DEFAULT 0.00,
  `ot_holiday_hours` decimal(5,2) DEFAULT 0.00,
  `ot_night_hours` decimal(5,2) DEFAULT 0.00,
  `ot_weekday_amount` decimal(15,0) DEFAULT 0,
  `ot_weekend_amount` decimal(15,0) DEFAULT 0,
  `ot_holiday_amount` decimal(15,0) DEFAULT 0,
  `ot_night_amount` int(11) DEFAULT 0,
  `total_ot_amount` decimal(15,0) DEFAULT 0,
  `ot_meal_days` int(11) NOT NULL DEFAULT 0,
  `ot_meal_bonus` decimal(15,2) NOT NULL DEFAULT 0.00,
  `kpi_bonus` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Thưởng KPI vượt mục tiêu',
  `kpi_over_days` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Số ngày vượt KPI',
  `kpi_under_days` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Số ngày KPI bị trừ lương',
  `annual_leave_total` tinyint(4) DEFAULT 0,
  `annual_leave_used` decimal(5,2) DEFAULT 0.00,
  `annual_leave_remaining` decimal(5,2) DEFAULT 0.00,
  `annual_leave_payout` decimal(15,0) DEFAULT 0,
  `other_income` decimal(15,0) DEFAULT 0,
  `adjustment` decimal(15,0) DEFAULT 0,
  `other_bonus` decimal(15,0) DEFAULT 0,
  `attendance_bonus` decimal(15,0) DEFAULT 0,
  `attendance_bonus_eligible` tinyint(4) DEFAULT 0,
  `has_social_insurance` tinyint(4) DEFAULT 0,
  `si_employee` decimal(15,0) DEFAULT 0,
  `si_company` decimal(15,0) DEFAULT 0,
  `dependants` tinyint(4) DEFAULT 0,
  `personal_deduction` decimal(15,0) DEFAULT 15500000,
  `dependant_deduction` decimal(15,0) DEFAULT 0,
  `ot_exclude_pit` decimal(15,0) DEFAULT 0,
  `taxable_income` decimal(15,0) DEFAULT 0,
  `pit_amount` decimal(15,0) DEFAULT 0,
  `late_deduction` decimal(15,0) DEFAULT 0,
  `kpi_deduction` decimal(15,0) DEFAULT 0,
  `gross_salary` decimal(15,0) DEFAULT 0,
  `advance_payment` decimal(15,0) DEFAULT 0,
  `net_salary` decimal(15,0) DEFAULT 0,
  `pit_adjustment` decimal(15,0) DEFAULT 0,
  `bank_transfer` decimal(15,0) DEFAULT 0,
  `remark` text DEFAULT NULL,
  `is_late_warning` tinyint(4) DEFAULT 0,
  `late_warning_note` text DEFAULT NULL,
  `manually_adjusted` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `night_shift_bonus` int(11) NOT NULL DEFAULT 0 COMMENT 'Phụ trội làm đêm',
  `is_night_shift` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = ca đêm',
  `responsibility_allowance` decimal(15,0) NOT NULL DEFAULT 0,
  `responsibility_allowance_received` decimal(15,0) NOT NULL DEFAULT 0,
  `seniority_allowance` decimal(15,0) NOT NULL DEFAULT 0,
  `seniority_allowance_received` decimal(15,0) NOT NULL DEFAULT 0,
  `ot_night_weekday_hours` decimal(6,2) NOT NULL DEFAULT 0.00,
  `ot_night_weekday_amount` int(11) NOT NULL DEFAULT 0,
  `ot_night_weekend_hours` decimal(6,2) NOT NULL DEFAULT 0.00,
  `ot_night_weekend_amount` int(11) NOT NULL DEFAULT 0,
  `ot_night_holiday_hours` decimal(6,2) NOT NULL DEFAULT 0.00,
  `ot_night_holiday_amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `prices`
-- (See below for the actual view)
--
CREATE TABLE `prices` (
`id` int(11)
,`product_code_id` int(11)
,`unit_price` decimal(15,0)
,`effective_from` date
,`note` text
,`created_by` int(11)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_items`
--

CREATE TABLE `production_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `iqc_item_id` int(11) NOT NULL,
  `qty_total` decimal(12,2) NOT NULL,
  `qty_done` decimal(12,2) NOT NULL DEFAULT 0.00,
  `qty_error` decimal(12,2) NOT NULL DEFAULT 0.00,
  `stage` varchar(100) DEFAULT NULL,
  `status` enum('in_progress','done','error') NOT NULL DEFAULT 'in_progress',
  `note` text DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `production_items`
--

INSERT INTO `production_items` (`id`, `order_id`, `iqc_item_id`, `qty_total`, `qty_done`, `qty_error`, `stage`, `status`, `note`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55'),
(2, 1, 2, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55'),
(3, 1, 3, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55'),
(4, 1, 4, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55'),
(5, 1, 5, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55'),
(6, 1, 6, 1.00, 1.00, 0.00, NULL, 'done', NULL, 18, '2026-07-08 07:36:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_orders`
--

CREATE TABLE `production_orders` (
  `id` int(11) NOT NULL,
  `order_no` varchar(30) NOT NULL,
  `iqc_receipt_id` int(11) NOT NULL,
  `status` enum('pending','in_progress','done') NOT NULL DEFAULT 'pending',
  `expected_delivery_date` date DEFAULT NULL COMMENT 'Ngày giao hàng dự kiến',
  `qty_target` decimal(12,2) DEFAULT 0.00 COMMENT 'Sản lượng kế hoạch',
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `production_orders`
--

INSERT INTO `production_orders` (`id`, `order_no`, `iqc_receipt_id`, `status`, `expected_delivery_date`, `qty_target`, `note`, `created_by`, `created_at`) VALUES
(1, 'PO-20260708-001', 1, 'done', NULL, 0.00, NULL, 18, '2026-07-08 07:36:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_outputs`
--

CREATE TABLE `production_outputs` (
  `id` int(11) NOT NULL,
  `output_no` varchar(30) NOT NULL,
  `output_date` date NOT NULL,
  `production_receipt_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity_completed` decimal(15,2) NOT NULL DEFAULT 0.00,
  `quantity_defect` decimal(15,2) NOT NULL DEFAULT 0.00,
  `quantity_delivered` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_progress`
--

CREATE TABLE `production_progress` (
  `id` int(11) NOT NULL,
  `progress_no` varchar(30) NOT NULL,
  `warehouse_in_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `qty_total` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_done` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_defect` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_remaining` decimal(15,3) NOT NULL DEFAULT 0.000,
  `status` enum('in_progress','completed') NOT NULL DEFAULT 'in_progress',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_progress_logs`
--

CREATE TABLE `production_progress_logs` (
  `id` int(11) NOT NULL,
  `progress_id` int(11) NOT NULL,
  `log_date` date NOT NULL,
  `qty_done` decimal(15,3) NOT NULL DEFAULT 0.000,
  `qty_defect` decimal(15,3) NOT NULL DEFAULT 0.000,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_receipts`
--

CREATE TABLE `production_receipts` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(30) NOT NULL,
  `receipt_date` date NOT NULL,
  `warehouse_import_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity_received` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `production_stock`
--

CREATE TABLE `production_stock` (
  `id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `stock_date` date NOT NULL,
  `qty_pending` decimal(15,2) DEFAULT 0.00,
  `qty_completed` decimal(15,2) DEFAULT 0.00,
  `qty_defect` decimal(15,2) DEFAULT 0.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_codes`
--

CREATE TABLE `product_codes` (
  `id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_category` enum('finished_goods','raw_material','consumable','office','equipment','other') NOT NULL DEFAULT 'finished_goods',
  `description` varchar(500) NOT NULL,
  `unit` varchar(20) DEFAULT 'cái',
  `category` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_codes`
--

INSERT INTO `product_codes` (`id`, `product_code`, `product_category`, `description`, `unit`, `category`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '123621', 'finished_goods', 'Phí gia công mài phun cát cho sản phẩm nhôm mã 123621', 'cái', 'Thành Phẩm', 1, 1, '2026-03-10 17:10:18', '2026-04-29 07:20:49'),
(2, '122987', 'finished_goods', 'Phí gia công mài phun cát cho sản phẩm nhôm mã 122987', 'cái', 'Thành Phẩm', 1, 2, '2026-04-29 07:20:40', '2026-04-29 07:21:14'),
(3, '122988', 'finished_goods', 'Phí gia công mài phun cát cho sản phẩm nhôm mã 122988', 'cái', 'Thành Phẩm', 1, 2, '2026-04-29 07:21:05', '2026-04-29 07:21:10'),
(4, 'SP-01', 'finished_goods', 'PHÍ DỊCH VỤ GIAO NHẬN HÀNG HOÁ', 'chiếc', NULL, 1, 2, '2026-06-28 17:20:40', '2026-06-28 17:20:40'),
(5, '12938', 'finished_goods', 'Phun Mài', 'Cái', NULL, 1, 18, '2026-06-30 05:06:17', '2026-06-30 05:06:17'),
(6, '1', 'finished_goods', 'CHEMICAL TRANSPORTATION LICENSE', 'chiếc', NULL, 1, 18, '2026-06-30 16:08:32', '2026-06-30 16:08:32'),
(7, 'SP-0111', 'finished_goods', 'Phí Dịch Vụ Giao Nhận Hàng Hoá', 'chiếc', NULL, 1, 18, '2026-06-30 16:08:46', '2026-06-30 16:08:46'),
(8, 'AVT_TG01', 'finished_goods', 'YD PVD TABLE LINER CLEAN 965.2*120', 'EA', NULL, 1, 59, '2026-07-07 08:02:09', '2026-07-07 08:02:09'),
(9, 'AVT_TG02', 'finished_goods', 'YD PVD TABLE SHIELD CLEAN 949.96*6.5', 'EA', NULL, 1, 59, '2026-07-07 08:03:15', '2026-07-07 08:03:15'),
(10, 'AVT_TG03', 'finished_goods', 'YD PVD TOP PLATE SHIELD CLEAN 965.2*11.43', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(11, 'AVT_TG04', 'finished_goods', 'YD PVD PYROMETER SHIELD CLEAN 63.5*37.34', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(12, 'AVT_TG05', 'finished_goods', 'YD PVD SLIT PORT SHIELD CLEAN 56*422*68', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(13, 'AVT_TG06', 'finished_goods', 'YD PVD TABLE LINER CLEAN 386*46', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(14, 'AVT_TG07', 'finished_goods', 'YD ICP TABLE LINER CLEAN 965.2*120', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(15, 'AVT_TG08', 'finished_goods', 'YD ICP QUARTZ SHIELD HOLDER CLEAN  952.5*15.8', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(16, 'AVT_TG09', 'finished_goods', 'YD ICP TABLE SHIELD  CLEAN 918.2*12.7', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(17, 'AVT_TG10', 'finished_goods', 'YD ICP FULL FACE SHIELD  CLEAN  914.4*6.5', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(18, 'AVT_CNI01', 'finished_goods', 'CLEANING SERVICE IDSH37001 ( 394.21*215.57 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(19, 'AVT_CNI02', 'finished_goods', 'CLEANING SERVICE IDSH37002 ( 394.21*215.57 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(20, 'AVT_CNI03', 'finished_goods', 'CLEANING SERVICE IDSH37003 ( 252.62*447.28 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(21, 'AVT_CNI04', 'finished_goods', 'CLEANING SERVICE IDSH37004 ( 356.62*447.88 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(22, 'AVT_CNI05', 'finished_goods', 'CLEANING SERVICE IDSH37005 ( 202.65 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(23, 'AVT_CNI06', 'finished_goods', 'CLEANING SERVICE IDSH37006 ( 239.67*215.17 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(24, 'AVT_CNI07', 'finished_goods', 'CLEANING SERVICE IDSH37007 ( 468.02*219.29 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(25, 'AVT_CNI08', 'finished_goods', 'CLEANING SERVICE IDSH37008 ( 110.93*216.78 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(26, 'AVT_CNI09', 'finished_goods', 'YD CLEANING SERVICE SHIELD EHDC10011 (187.11*37.98 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(27, 'AVT_CNI10', 'finished_goods', 'YD CLEANING SERVICE SHIELD EHDC10013 ( 187.37*38.3 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(28, 'AVT_CNI11', 'finished_goods', 'YD CLEANING SERVICE SHIELD IDDC12002 (185.17*161.37*193.89 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(29, 'AVT_CNI12', 'finished_goods', 'YD CLEANING SERVICE SHIELD LASH32018 ( 186.16*114.87*24.4 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(30, 'AVT_CNI13', 'finished_goods', 'CLEANING SERVICE HADC11001 ( 193.46*54.25*88.89 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(31, 'AVT_CNI14', 'finished_goods', 'YD CLEANING SERVICE SHIELD IDDC16001 ( 54.24*197.99 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(32, 'AVT_CNI15', 'finished_goods', 'CLEANING SERVICE HADC11002 ( 197.96*54.25 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(33, 'AVT_CNI16', 'finished_goods', 'CLEANING SERVICE IDSH33001 ( 514.1*112.45 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(34, 'AVT_CNI17', 'finished_goods', 'CLEANING SERVICE IDSH33002 ( 451.81*111.87 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(35, 'AVT_CNI18', 'finished_goods', 'CLEANING SERVICE IDSH33003 ( 385.88*189.01 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(36, 'AVT_CNI19', 'finished_goods', 'CLEANING SERVICE IDSH33004 ( 286.69*241.41 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(37, 'AVT_CNI20', 'finished_goods', 'CLEANING SERVICE IDSH33005 ( 401.43*356.77 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(38, 'AVT_CNI21', 'finished_goods', 'CLEANING SERVICE IDSH33006 ( 270.4*229.03 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(39, 'AVT_CNI22', 'finished_goods', 'CLEANING SERVICE IDSH33007 ( 343.67*373.94 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(40, 'AVT_CNI23', 'finished_goods', 'CLEANING SERVICE IDSH33008 ( 343.66*373.93 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(41, 'AVT_CNI24', 'finished_goods', 'CLEANING SERVICE LDSH34016 ( 195.4*169.99 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(42, 'AVT_CNI25', 'finished_goods', 'CLEANING SERVICE IDSH38001 ( 392.32*215.01 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(43, 'AVT_CNI26', 'finished_goods', 'CLEANING SERVICE IDSH38002 ( 394.22*215.56 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(44, 'AVT_CNI27', 'finished_goods', 'CLEANING SERVICE IDSH38003 ( 356.63*447.89 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(45, 'AVT_CNI28', 'finished_goods', 'CLEANING SERVICE IDSH38004 ( 252.63*447.27 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(46, 'AVT_CNI29', 'finished_goods', 'YD CLEANING SERVICE SHIELD IDDC25001 ( 54.26*197.97 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(47, 'AVT_CNI30', 'finished_goods', 'CLEANING SERVICE IDSH34001 ( 212.9*112.6 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(48, 'AVT_CNI31', 'finished_goods', 'CLEANING SERVICE LDSH34002 ( 540.01*111.63 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(49, 'AVT_CNI32', 'finished_goods', 'CLEANING SERVICE IDHS34003 ( 273.79*189.14 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(50, 'AVT_CNI33', 'finished_goods', 'CLEANING SERVICE LDSH34004 ( 539.99*111.62 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(51, 'AVT_CNI34', 'finished_goods', 'CLEANING SERVICE LDSH34005 ( 401.44*356.8 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(52, 'AVT_CNI35', 'finished_goods', 'CLEANING SERVICE LDSH34006 ( 401.39*356.79 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(53, 'AVT_CNI36', 'finished_goods', 'CLEANING SERVICE IDSH34007 ( 401.41*356.78 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(54, 'AVT_CNI37', 'finished_goods', 'CLEANING SERVICE IDSH34008 ( 343.65*373.92 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(55, 'AVT_CNI38', 'finished_goods', 'YD CLEANING SERVICE SHIELD LDSH34015 ( 195.39*184.97*116.14 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(56, 'AVT_CNI39', 'finished_goods', 'YD CLEANING SERVICE SHIELD LDSH34017 ( 195.54*168.65 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(57, 'AVT_CNI40', 'finished_goods', 'CLEANING SERVICE LDSH35001 ( 540.02*111.65 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(58, 'AVT_CNI41', 'finished_goods', 'CLEANING SERVICE IDSH35002 ( 212.92*112.58 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(59, 'AVT_CNI42', 'finished_goods', 'CLEANING SERVICE LDSH35003 ( 614.68*188.79 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(60, 'AVT_CNI43', 'finished_goods', 'CLEANING SERVICE IDSH35004 ( 426.8*189.66 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(61, 'AVT_CNI44', 'finished_goods', 'CLEANING SERVICE LDSH35007 ( 245.7*227.04 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(62, 'AVT_CNI45', 'finished_goods', 'CLEANING SERVICE LDSH35008 ( 270.43*229.07 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(63, 'AVT_CNI46', 'finished_goods', 'YD CLEANING SERVICE SHIELD LDSH35015 ( 195.54*168.65 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(64, 'AVT_CNI47', 'finished_goods', 'CLEANING SERVICE IDSH36001 ( 451.8*111.88 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(65, 'AVT_CNI48', 'finished_goods', 'CLEANING SERVICE IDSH36002 ( 385.32*111.82 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(66, 'AVT_CNI49', 'finished_goods', 'CLEANING SERVICE IDSH36003 ( 525.37*188.88 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(67, 'AVT_CNI50', 'finished_goods', 'CLEANING SERVICE IDSH36004 ( 385.89*189.03 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(68, 'AVT_CNI51', 'finished_goods', 'YD CLEANING SERVICE SHIELD IDSH36005', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(69, 'AVT_CNI52', 'finished_goods', 'CLEANING SERVICE IDSH36006 ( 400.94*344.47 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(70, 'AVT_CNI53', 'finished_goods', 'CLEANING SERVICE Cover Tray Clean ( 920.19*19.75 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(71, 'AVT_EQ01', 'finished_goods', 'YD CLEANING SERVICE SHIELD BOTTOM-5(B-1) ( 1105*185*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(72, 'AVT_EQ02', 'finished_goods', 'YD CLEANING SERVICE SHIELD BOTTOM-8(B-2) ( 1100*170*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(73, 'AVT_EQ03', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-1 (  640*161*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(74, 'AVT_EQ04', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-2 (  640*161*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(75, 'AVT_EQ05', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-3 (  570*96*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(76, 'AVT_EQ06', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-4 (  570*96*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(77, 'AVT_EQ07', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-5(L)  (  1117*157*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(78, 'AVT_EQ08', 'finished_goods', 'YD CLEANING SERVICE SHIELD SIDE S-5(S)  (  1117*112*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(79, 'AVT_EQ09', 'finished_goods', 'YD CLEANING SERVICE DEP SHIELD (  177*108*9 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(80, 'AVT_EQ10', 'finished_goods', 'YD CLEANING SERVICE SHIELD T-1 ( 1073x174x15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(81, 'AVT_EQ11', 'finished_goods', 'YD CLEANING SERVICE SHIELD T-2 ( 1073x260x15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(82, 'AVT_EQ12', 'finished_goods', 'YD CLEANING SERVICE SHIELD T-5 ( 1073*174*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(83, 'AVT_EQ13', 'finished_goods', 'YD CLEANING SERVICE SHIELD TUBE-1 (  168*8*68 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(84, 'AVT_EQ14', 'finished_goods', 'YD CLEANING SERVICE SHIELD TUBE-2 (  168*75*72 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(85, 'AVT_EQ15', 'finished_goods', 'YD CLEANING SERVICE SHIELD TUBE-5 (  84*75*72 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(86, 'AVT_EQ16', 'finished_goods', 'YD CLEANING SERVICE SHIELD TUBE-6 (  84*75x72 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(87, 'AVT_EQ17', 'finished_goods', 'YD CLEANING SERVICE INNER SHIELD (  1200*980*15 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(88, 'AVT_EQ18', 'finished_goods', 'YD CLEANING SERVICE WEIGHT BAR (  370*370x*20 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(89, 'AVT_EQ19', 'finished_goods', 'YD CLEANING SERVICE CARRIER ( 910*910*20 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(90, 'AVT_EQ20', 'finished_goods', 'YD CLEANING SERVICE VIEW PORT ( 300*180*18 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(91, 'AVT_EQ21', 'finished_goods', 'YD CLEANING SERVICE PT SHIELD ( 360*360*60 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(92, 'AVT_EQ22', 'finished_goods', 'YD CLEANING SERVICE SHIELD VIEW PORT COVER 1 (  140*90 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(93, 'AVT_EQ23', 'finished_goods', 'YD CLEANING SERVICE SHIELD VIEW PORT COVER 2 (  140*91 )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(94, 'AVT_EQ24', 'finished_goods', 'YD CLEANING SERVICE SHIELD PT CHAMBER CERAMIC PLATE ( D320MM )', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(95, 'AVT_EQ25', 'finished_goods', 'YD CLEANING SERVICE CERAMIC BOTL', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(96, 'AVT_EQ26', 'finished_goods', 'Glass viewport', 'EA', NULL, 1, 59, '2026-07-07 08:23:52', '2026-07-07 08:23:52'),
(97, 'ECI_ARC01', 'finished_goods', 'Lá che', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(98, 'ECI_ARC02', 'finished_goods', 'Tấm chống bám bẩn target 1', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(99, 'ECI_SD03', 'finished_goods', 'Tâm chống bám bẩn Ion Beam', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(100, 'ECI_SD04', 'finished_goods', 'Hộp chia khí', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(101, 'ECI_SD05', 'finished_goods', 'Tâm chống bám bẩn trên, dưới', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(102, 'ECI_SD06', 'finished_goods', 'hộp đầu dưới targer', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(103, 'ECI_SD07', 'finished_goods', 'Thanh nối Tấm chống bám bẩn target', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(104, 'ECI_SD08', 'finished_goods', 'Thanh nối Tấm chống bám bẩn target', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(105, 'ECI_SD09', 'finished_goods', 'hộp đầu trên targer', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(106, 'ECI_SD10', 'finished_goods', 'Tâm chống bám bẩn target ( phía dưới target)', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(107, 'ECI_SD11', 'finished_goods', 'Tấm JIG', 'EA', NULL, 1, 59, '2026-07-07 08:43:18', '2026-07-07 08:43:18'),
(108, 'TRV_01', 'finished_goods', 'HKMC TK REAR', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(109, 'TRV_02', 'finished_goods', 'HKMC TK PANEL FRONT SPRAY JIGUP', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(110, 'TRV_03', 'finished_goods', 'HKMC TK PANEL FRONT SPRAY JIG BOTTOM', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(111, 'TRV_04', 'finished_goods', 'X1312', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(112, 'TRV_05', 'finished_goods', 'AZV', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(113, 'TRV_06', 'finished_goods', 'E3PA', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(114, 'TRV_07', 'finished_goods', 'PANNEL FRONT BTMHJD', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(115, 'TRV_08', 'finished_goods', 'X52', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(116, 'TRV_09', 'finished_goods', 'X1312 FRONT PANEL SIDE', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(117, 'TRV_10', 'finished_goods', 'BBB LATAM SIDE MK', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(118, 'TRV_11', 'finished_goods', 'X1312 FRONT PANEL TOP', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(119, 'TRV_12', 'finished_goods', 'BASE', 'EA', NULL, 1, 59, '2026-07-07 08:50:56', '2026-07-07 08:50:56'),
(120, 'FTC_SHIELD01', 'finished_goods', 'Dịch vụ làm sạch bề mặt Shied máy coating', 'SET', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(121, 'FTC_SHIELD02', 'finished_goods', 'Dịch vụ làm sạch và tạo nhám bề mặt Shied máy coating', 'SET', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(122, 'FTC_SHIELD03', 'finished_goods', 'Dịch vụ làm sạch bề mặt Shied máy coating 2050', 'SET', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(123, 'FTC_SHIELD04', 'finished_goods', 'Dịch vụ làm sạch và tạo nhám bề mặt shied máy coating\nØ1550', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(124, 'FTC_SHIELD05', 'finished_goods', 'Dịch vụ làm sạch bề mặt Shied máy coating\nØ1800,Ø1550', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(125, 'FTC_SHIELD06', 'finished_goods', 'Dịch vụ làm sạch bề mặt Shied máy hall sensor', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(126, 'FTC_VT01', 'finished_goods', 'Grid insulator ring 1.2T A37-0009', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(127, 'FTC_VT02', 'finished_goods', 'Grid insulator ring 1.0T A37-0008', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(128, 'FTC_VT03', 'finished_goods', 'Discharge chamber, Ø38 * Ø30.4 * 45H', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(129, 'FTC_VT04', 'finished_goods', 'Electron beam Holder (1)', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(130, 'FTC_VT05', 'finished_goods', 'Pole piece 1550/1800', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(131, 'FTC_VT06', 'finished_goods', 'RUBBER SEALING\n10*10.5 NBR HS70\nV05-0010-0( dẹt)', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(132, 'FTC_VT07', 'finished_goods', 'RUBBER SEALING\n10*10.5 NBR HS70\nV05-0010-0(tròn)', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(133, 'FTC_VT08', 'finished_goods', 'Main Valve Cover O-ring\nV03-5740-0\nV740(HS75+-5)', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(134, 'FTC_VT09', 'finished_goods', 'Baffle-DP O-ring\nK740', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(135, 'FTC_VT11', 'finished_goods', 'RFN Insulator', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(136, 'FTC_VT12', 'finished_goods', 'Vaccum Valve', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(137, 'FTC_VT13', 'finished_goods', 'Vòng oring cao su Vitton G250 Rubber O-ring', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(138, 'FTC_VT14', 'finished_goods', 'Vòng oring cao su Vitton G270 Rubber O-ring', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(139, 'FTC_VT15', 'finished_goods', 'Hóa chất tẩy cặn canxi', 'EA', NULL, 1, 59, '2026-07-07 09:26:06', '2026-07-07 09:26:06'),
(140, 'FTC_VT10', 'finished_goods', 'Baffle-DP O-ring\nK740', 'EA', NULL, 1, 59, '2026-07-07 09:27:19', '2026-07-07 09:27:19'),
(141, 'JW_SDSET01', 'finished_goods', 'Tấm chắn vỏ máy_ Sanding', 'Set', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(142, 'JW_CR01', 'finished_goods', 'Carry đồng hồ', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(143, 'JW_CR02', 'finished_goods', 'Carry  camera', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(144, 'JW_CR03', 'finished_goods', 'Carry  Test', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(145, 'JW_CR04', 'finished_goods', 'Carry ô tô', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(146, 'JW_MASK01', 'finished_goods', 'Hard coating mask( Mask dài)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(147, 'JW_MASK02', 'finished_goods', 'Thanh coating mask\n( phanh mask pin)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(148, 'JW_ARC01', 'finished_goods', 'Chi tiết Shield mạ 01', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(149, 'JW_ARC02', 'finished_goods', 'Chi tiết Shield mạ 02 (Hàng mạ 1 tầng)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(150, 'JW_SD01', 'finished_goods', 'Hàng chỉ sanđing 1 tầng', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(151, 'JW_ARC03', 'finished_goods', 'Chi tiết Shield mạ 03', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(152, 'JW_ARC04', 'finished_goods', 'Chi tiết Shield mạ 04', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(153, 'JW_ARC05', 'finished_goods', 'Chi tiết Shield mạ 05', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(154, 'JW_ARC06', 'finished_goods', 'Chi tiết Shield mạ 06', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(155, 'JW_ARC07', 'finished_goods', 'Chi tiết Shield mạ 07', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(156, 'JW_MASK03', 'finished_goods', 'Coating mask new( ngắn)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(157, 'JW_MASK042', 'finished_goods', 'Coating mask new( ngắn)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(158, 'JW_ARC08', 'finished_goods', 'Chi tiết Shield mạ 08', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(159, 'JW_ARC09', 'finished_goods', 'Chi tiết Shield mạ 09', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(160, 'JW_ARC10', 'finished_goods', 'Chi tiết Shield mạ 10 (Đai khóa target)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(161, 'JW_ARC11', 'finished_goods', 'Chi tiết Shield mạ 11 (Đèn mạ)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(162, 'JW_DXC01', 'finished_goods', 'Tấm chắn Target DXC01', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(163, 'JW_DXC02', 'finished_goods', 'Tấm chắn Target DXC02', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(164, 'JW_DXC03', 'finished_goods', 'Tấm chắn Target DXC03', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(165, 'JW_DXC04', 'finished_goods', 'Tấm chắn Target DXC04', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(166, 'JW_DXC05', 'finished_goods', 'Tấm chắn Target DXC05', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(167, 'JW_DXC06', 'finished_goods', 'Tấm chắn Target DXC06', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(168, 'JW_DXC07', 'finished_goods', 'Tấm chắn Target DXC07', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(169, 'JW_DXC08', 'finished_goods', 'Tấm chắn Target DXC08', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(170, 'JW_DXC09', 'finished_goods', 'Tấm chắn Target DXC09', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(171, 'JW_DXC10', 'finished_goods', 'Tấm chắn Target DXC10', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(172, 'JW_DXC11', 'finished_goods', 'Tấm chắn Target DXC11', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(173, 'JW_DXC12', 'finished_goods', 'Tấm chắn Target DXC12', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(174, 'JW_DXC13', 'finished_goods', 'Tấm chắn Target DXC13', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(175, 'JW_DXC14', 'finished_goods', 'Tấm chắn Target DXC14', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(176, 'JW_DXC15', 'finished_goods', 'Tấm chắn Target DXC15', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(177, 'JW_DXC16', 'finished_goods', 'Tấm chắn Target DXC16', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(178, 'JW_ARC12', 'finished_goods', 'Chi tiết Shield mạ 12 (Tấm chắn coating)', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(179, 'JW_ARC13', 'finished_goods', 'Chi tiết Shield mạ 13', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(180, 'JW_ARC14', 'finished_goods', 'Chi tiết Shield mạ 14', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(181, 'JW_ARC15', 'finished_goods', 'Chi tiết Shield mạ 15', 'Ea', NULL, 1, 59, '2026-07-08 05:05:21', '2026-07-08 05:05:21'),
(182, 'JW_MASK04', 'finished_goods', 'Coating mask new( ngắn)', 'Ea', NULL, 1, 59, '2026-07-08 05:07:27', '2026-07-08 05:07:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `unit_price` decimal(15,0) NOT NULL DEFAULT 0,
  `effective_from` date NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provinces`
--

CREATE TABLE `provinces` (
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `provinces`
--

INSERT INTO `provinces` (`code`, `name`, `name_en`, `full_name`) VALUES
('01', 'Hà Nội', NULL, 'Thành phố Hà Nội'),
('02', 'Hà Giang', NULL, 'Tỉnh Hà Giang'),
('04', 'Cao Bằng', NULL, 'Tỉnh Cao Bằng'),
('06', 'Bắc Kạn', NULL, 'Tỉnh Bắc Kạn'),
('08', 'Tuyên Quang', NULL, 'Tỉnh Tuyên Quang'),
('10', 'Lào Cai', NULL, 'Tỉnh Lào Cai'),
('11', 'Điện Biên', NULL, 'Tỉnh Điện Biên'),
('12', 'Lai Châu', NULL, 'Tỉnh Lai Châu'),
('14', 'Sơn La', NULL, 'Tỉnh Sơn La'),
('15', 'Yên Bái', NULL, 'Tỉnh Yên Bái'),
('17', 'Hoà Bình', NULL, 'Tỉnh Hoà Bình'),
('19', 'Thái Nguyên', NULL, 'Tỉnh Thái Nguyên'),
('20', 'Lạng Sơn', NULL, 'Tỉnh Lạng Sơn'),
('22', 'Quảng Ninh', NULL, 'Tỉnh Quảng Ninh'),
('24', 'Bắc Giang', NULL, 'Tỉnh Bắc Giang'),
('25', 'Phú Thọ', NULL, 'Tỉnh Phú Thọ'),
('26', 'Vĩnh Phúc', NULL, 'Tỉnh Vĩnh Phúc'),
('27', 'Bắc Ninh', NULL, 'Tỉnh Bắc Ninh'),
('30', 'Hải Dương', NULL, 'Tỉnh Hải Dương'),
('31', 'Hải Phòng', NULL, 'Thành phố Hải Phòng'),
('33', 'Hưng Yên', NULL, 'Tỉnh Hưng Yên'),
('34', 'Thái Bình', NULL, 'Tỉnh Thái Bình'),
('35', 'Hà Nam', NULL, 'Tỉnh Hà Nam'),
('36', 'Nam Định', NULL, 'Tỉnh Nam Định'),
('37', 'Ninh Bình', NULL, 'Tỉnh Ninh Bình'),
('38', 'Thanh Hóa', NULL, 'Tỉnh Thanh Hóa'),
('40', 'Nghệ An', NULL, 'Tỉnh Nghệ An'),
('42', 'Hà Tĩnh', NULL, 'Tỉnh Hà Tĩnh'),
('44', 'Quảng Bình', NULL, 'Tỉnh Quảng Bình'),
('45', 'Quảng Trị', NULL, 'Tỉnh Quảng Trị'),
('46', 'Thừa Thiên Huế', NULL, 'Tỉnh Thừa Thiên Huế'),
('48', 'Đà Nẵng', NULL, 'Thành phố Đà Nẵng'),
('49', 'Quảng Nam', NULL, 'T��nh Quảng Nam'),
('51', 'Quảng Ngãi', NULL, 'Tỉnh Quảng Ngãi'),
('52', 'Bình Định', NULL, 'Tỉnh Bình Định'),
('54', 'Phú Yên', NULL, 'Tỉnh Phú Yên'),
('56', 'Khánh Hòa', NULL, 'Tỉnh Khánh Hòa'),
('58', 'Ninh Thuận', NULL, 'Tỉnh Ninh Thuận'),
('60', 'Bình Thuận', NULL, 'Tỉnh Bình Thuận'),
('62', 'Kon Tum', NULL, 'Tỉnh Kon Tum'),
('64', 'Gia Lai', NULL, 'Tỉnh Gia Lai'),
('66', 'Đắk Lắk', NULL, 'Tỉnh Đắk Lắk'),
('67', 'Đắk Nông', NULL, 'Tỉnh Đắk Nông'),
('68', 'Lâm Đồng', NULL, 'Tỉnh Lâm Đồng'),
('70', 'Bình Phước', NULL, 'Tỉnh Bình Phước'),
('72', 'Tây Ninh', NULL, 'Tỉnh Tây Ninh'),
('74', 'Bình Dương', NULL, 'Tỉnh Bình Dương'),
('75', 'Đồng Nai', NULL, 'Tỉnh Đồng Nai'),
('77', 'Bà Rịa - Vũng Tàu', NULL, 'Tỉnh Bà Rịa - Vũng Tàu'),
('79', 'Hồ Chí Minh', NULL, 'Thành phố Hồ Chí Minh'),
('80', 'Long An', NULL, 'Tỉnh Long An'),
('82', 'Tiền Giang', NULL, 'Tỉnh Tiền Giang'),
('83', 'Bến Tre', NULL, 'Tỉnh Bến Tre'),
('84', 'Trà Vinh', NULL, 'Tỉnh Trà Vinh'),
('86', 'Vĩnh Long', NULL, 'Tỉnh Vĩnh Long'),
('87', 'Đồng Tháp', NULL, 'Tỉnh Đồng Tháp'),
('89', 'An Giang', NULL, 'Tỉnh An Giang'),
('91', 'Kiên Giang', NULL, 'Tỉnh Kiên Giang'),
('92', 'Cần Thơ', NULL, 'Thành phố Cần Thơ'),
('93', 'Hậu Giang', NULL, 'Tỉnh Hậu Giang'),
('94', 'Sóc Trăng', NULL, 'Tỉnh Sóc Trăng'),
('95', 'Bạc Liêu', NULL, 'Tỉnh Bạc Liêu'),
('96', 'Cà Mau', NULL, 'Tỉnh Cà Mau');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`) VALUES
(1, 'director', 'Giám đốc'),
(2, 'accountant', 'Kế toán'),
(3, 'manager', 'Quản lý'),
(4, 'warehouse', 'Quản lý Kho'),
(5, 'production', 'Quản lý Sản xuất'),
(6, 'employee', 'Nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `salary_components`
--

CREATE TABLE `salary_components` (
  `id` int(11) NOT NULL,
  `component_code` varchar(30) NOT NULL,
  `component_name` varchar(150) NOT NULL,
  `component_name_en` varchar(150) DEFAULT NULL,
  `component_type` enum('earning','deduction','bonus') DEFAULT 'earning',
  `is_default` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `salary_components`
--

INSERT INTO `salary_components` (`id`, `component_code`, `component_name`, `component_name_en`, `component_type`, `is_default`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'basic', 'Lương cơ bản', 'Basic salary', 'earning', 1, 1, 1, '2026-03-10 12:14:03'),
(2, 'meal', 'Trợ cấp ăn uống', 'Meal allowance', 'earning', 1, 2, 1, '2026-03-10 12:14:03'),
(3, 'clothes', 'Trợ cấp trang phục', 'Clothes allowance', 'earning', 1, 3, 1, '2026-03-10 12:14:03'),
(4, 'phone', 'Trợ cấp điện thoại', 'Mobile allowance', 'earning', 1, 4, 1, '2026-03-10 12:14:03'),
(5, 'transport', 'Trợ cấp xăng xe, đi lại', 'Gas - travelling allowance', 'earning', 1, 5, 1, '2026-03-10 12:14:03'),
(6, 'performance', 'Thưởng hiệu quả công việc', 'Job effectiveness bonus', 'bonus', 1, 6, 1, '2026-03-10 12:14:03'),
(7, 'housing', 'Trợ cấp nhà ở', 'Housing allowance', 'earning', 0, 7, 1, '2026-03-10 12:14:03'),
(8, 'responsibility', 'Phụ cấp trách nhiệm', 'Responsibility allowance', 'earning', 0, 8, 1, '2026-03-10 12:14:03'),
(9, 'seniority', 'Phụ cấp thâm niên', 'Seniority allowance', 'earning', 0, 9, 1, '2026-03-10 12:14:03'),
(10, 'hazard', 'Phụ cấp độc hại, nguy hiểm', 'Hazard allowance', 'earning', 0, 10, 1, '2026-03-10 12:14:03'),
(11, 'attendance_bonus', 'Chuyên Cần', 'Attendance Bonus', 'bonus', 1, 99, 1, '2026-03-11 04:26:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shift_schedules`
--

CREATE TABLE `shift_schedules` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `work_date` date NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_exports`
--

CREATE TABLE `stock_exports` (
  `id` int(11) NOT NULL,
  `export_no` varchar(30) NOT NULL,
  `export_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` enum('draft','confirmed') NOT NULL DEFAULT 'draft',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_export_items`
--

CREATE TABLE `stock_export_items` (
  `id` int(11) NOT NULL,
  `export_id` int(11) NOT NULL,
  `fgs_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `qty_export` decimal(15,3) NOT NULL DEFAULT 0.000,
  `note` varchar(255) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_code` varchar(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `employee_code`, `full_name`, `username`, `password_hash`, `email`, `phone`, `role_id`, `department_id`, `is_active`, `created_at`) VALUES
(1, 'nam', 'Đào Ngọc Minh Nam', 'giamdoc', '$2y$12$xs5/EsBGuEUH/wHnPEC8VePrqUQvKsm8NrHP4n2knu1eA.cVB6DyG', '', '', 1, 1, 1, '2026-03-10 06:57:59'),
(18, 'dung', 'Đào Ngọc Anh Dũng', 'dung', '$2y$12$KhDFFZVG7fqGb3UyukVbNOyPevQfGlG8aes5F5HdUD1z9lma6pvue', '', '', 1, 1, 1, '2026-06-29 15:13:23'),
(57, 'NV001', 'Nguyễn Phương Duyên', 'NV001', '$2y$12$PQPIJYeW7AZy4zLMs7yXvuRNoLhNY25WRAeHaxzuCIbz3mo.6jsme', '', '947839836', 2, 2, 1, '2026-07-06 06:09:56'),
(58, 'NV002', 'Nguyễn Thị Yến', 'NV002', '$2y$12$YC6nTEZTanZxCLKXVLGCp.5MviCYNZKEZzyLqnlrNpIQxsWHNzkcy', '', '971998863', 2, 2, 1, '2026-07-06 06:09:56'),
(59, 'thu', 'Đàm Thị Thu', 'NV003', '$2y$12$2.Q8AT2HygCoTLCz9.PC7OEHcKPFaOydG7wb970IZYcGz5ItPfpG.', '', '0357046600', 3, 2, 1, '2026-07-06 06:09:56'),
(60, 'NV004', 'Nguyễn Thị Thảo', 'NV004', '$2y$12$qEwA3SltSy7mQNHXC15i9O.a9DnCQWzMxzrrpdtGN9AAngnRPi3Mu', '', '979126892', 2, 2, 1, '2026-07-06 06:09:57'),
(61, 'NV005', 'Nguyễn Xuân Cao Cường', 'NV005', '$2y$12$S.x0P3i4z7wbPKh7/5DWsOPm/Ylz21Y/dI6UaDYlvhTMs95YS/uBe', '', '948201189', 6, 5, 1, '2026-07-06 06:09:57'),
(62, 'NV006', 'Mạc Lam Trường', 'NV006', '$2y$12$eQtiA6B5wYwKK5o2fO9IN.9s3.fgzj4bwIKs0U3PF9OUdHUEkqB3K', '', '866687525', 6, 5, 1, '2026-07-06 06:09:57'),
(63, 'NV007', 'Nguyễn Mạnh Tưởng', 'NV007', '$2y$12$EYbOsTQxpzm6BGCE/6wr7.yADFxrUzRri9DW6XPYfsrYTQeM3FosG', '', '', 6, 5, 1, '2026-07-06 06:09:57'),
(64, 'NV008', 'Nguyễn Thị Yên Na', 'NV008', '$2y$12$a8E0bh55ggxriT8Rx2flv.f5XGp1J018JB5Gn8MHLglqDfpzsjajq', '', '0333693617', 5, 4, 1, '2026-07-06 06:09:58'),
(65, 'NV009', 'Nguyễn Văn Dân', 'NV009', '$2y$12$C6y.O24SPDvuVqUYyDD6i.sSwuMRH.Zv9Ck.6GY69YD95HB9koljm', '', '0985060291', 5, 4, 1, '2026-07-06 06:09:58'),
(66, 'NV010', 'Nguyễn Đức Kiểm', 'NV010', '$2y$12$oKi1tPDrvF71TrVvpv2dI.j4yD7jVBO7f4QA0Whsc7qp3hAzDcNnO', NULL, NULL, 6, 4, 0, '2026-07-06 06:09:58'),
(67, 'NV011', 'Lưu Đình Khôi', 'NV011', '$2y$12$gspI9EOuGfWDq3IsjDeZdeyhCeMNIK0VvQZ2ocqvfF5GMZdhoLq/y', '', '962012921', 5, 4, 1, '2026-07-06 06:09:58'),
(68, 'NV012', 'Trần Văn Cường', 'NV012', '$2y$12$2q/OfdcG5kdtJFdQNfq.rOvWvTn/h8EJZpjRDQcCVIQTYIZ4ml/2y', '', '392594456', 5, 4, 1, '2026-07-06 06:09:59'),
(69, 'NV013', 'Mã Thị Nhung', 'NV013', '$2y$12$1wduvdLLBEi6ejBvHPu1Xed7mAnsqYdcHZV3cug3QFnQP3Qob33jq', '', '969099903', 6, 4, 1, '2026-07-06 06:09:59'),
(70, 'NV014', 'Trần Thị Phương', 'NV014', '$2y$12$Apx.FrmcHuw5OUspvitxyuA//MIystie12Swgc30FpwVL0rsq6hvi', NULL, '354442498', 6, 4, 1, '2026-07-06 06:09:59'),
(71, 'NV015', 'Quàng Thị Tiệp', 'NV015', '$2y$12$szdeoLUg5VWDlL5Kdytw3u6f//c4ipl0K/7bpvCs/VB6cWJvpSDLC', '', '869890863', 6, 4, 1, '2026-07-06 06:09:59'),
(72, 'NV016', 'Phùng Thị Hương', 'NV016', '$2y$12$oYDOv3yl6g1txTVFY5hfEenXdvTdrz2xkPhdyZLfSdYKgqt/430Ke', NULL, '373448706', 6, 4, 1, '2026-07-06 06:10:00'),
(73, 'NV017', 'Phạm Văn Mạnh', 'NV017', '$2y$12$/mcY1jq/ZWRIiIRD97rw6eS0s36KrsXp0C1jAq4vm7NLCiob44NAG', NULL, '356511952', 6, 4, 1, '2026-07-06 06:10:00'),
(74, 'NV018', 'Lô Văn Hà', 'NV018', '$2y$12$cVAPUjzBI1Q6bbxAR/d/4uNsoiGmNvek0QqW1cyvVP6jm6fyviADi', NULL, '967413970', 6, 4, 1, '2026-07-06 06:10:00'),
(75, 'NV019', 'Lường Đức Hào', 'NV019', '$2y$12$hbm7l0HIMipijmoAyYMV5unIIvowY5Uk3d1d.DrL6YD/U7LA/sb9.', NULL, '961690765', 6, 4, 1, '2026-07-06 06:10:00'),
(76, 'NV020', 'Phùng Văn Huệ', 'NV020', '$2y$12$5QB/Qf0pjXuEt4DERNIgR.NYPheR7zpcVM1IRP88uQRrOTtkxTTtS', NULL, '975586023', 6, 4, 1, '2026-07-06 06:10:00'),
(77, 'NV021', 'Nguyễn Duy Thường', 'NV021', '$2y$12$fDax9q6GpfImLkxU8CD8v.9sjkdrYxrR6JAlduItz8Ff5psHBwjCm', NULL, '559146187', 6, 4, 1, '2026-07-06 06:10:01'),
(78, 'NV022', 'Trần Văn Dương', 'NV022', '$2y$12$EN2He762rlV2f.GkJIGg9.8DHtECmb2l9yYfxjhAxptfRrDzdVGU6', NULL, '396237837', 6, 4, 1, '2026-07-06 06:10:01'),
(79, 'NV023', 'Dương Thanh Vương', 'NV023', '$2y$12$Q/vnqTwetvFJHqJGx82qBOX.FG.RSH3i2ZxcO7HHby5lEUfDXxq0K', NULL, '979938371', 6, 4, 1, '2026-07-06 06:10:01'),
(80, 'NV024', 'Lương Ngọc Thắng', 'NV024', '$2y$12$7u/nJn9ak0AcrMoC44Cx8OEOTBlsKa9iqHcVQ.Bc9VyQsUyLjYoHO', '', '0369231503', 6, 4, 1, '2026-07-06 06:10:01'),
(81, 'NV025', 'Nông Quốc Trung', 'NV025', '$2y$12$D7s1AMIdpTID48rccHgkyuRTvBQdbWeIM01pmtdvfYQyySzy8s4/e', NULL, '366740015', 6, 4, 1, '2026-07-06 06:10:02'),
(82, 'NV026', 'Triệu Tiến Vinh', 'NV026', '$2y$12$xjbRY3dfPFpE3/wgzltSvuUw1q3J/XZHUjY2SPkCq4a.fbeNn1cwi', NULL, NULL, 6, 4, 1, '2026-07-06 06:10:02'),
(83, 'NV027', 'Vương Thị Hoa', 'NV027', '$2y$12$579zzt7MD66V8aOecnvC8OhosfF2fgBG9QZs7DaBAoT3KmlR/aOe2', NULL, '365354057', 6, 4, 1, '2026-07-06 06:10:02'),
(84, 'NV028', 'Hà Hào Quang', 'NV028', '$2y$12$wvLw8H5IkSa5UoCxcVgPouZ3Tp5vXPkNgFgyRI0inwMqOYNH.DCJS', NULL, '961446195', 6, 4, 1, '2026-07-06 06:10:02'),
(85, 'NV029', 'Nghiêm Đình Tuấn', 'NV029', '$2y$12$wkpKqvT2ttjC5OOjPaBEk./lq90gWYlBmDuRrvdN4PUvtDwU7BdEq', NULL, '964857622', 6, 4, 1, '2026-07-06 06:10:03'),
(86, 'NV030', 'Trần Đức Mạnh', 'NV030', '$2y$12$VZrfNdwMY6BGopRWG5NCgO7SCZkAG0CE5Zo/BBzfBqHfNiWgSkhsW', NULL, '355627698', 6, 4, 1, '2026-07-06 06:10:03'),
(87, 'NV031', 'Nguyễn Trung Phong', 'NV031', '$2y$12$hPtFPrTFnTuYa0DIZ/LDjOV97D01KDsdlHT86LUN2rGxZ5lANWLLS', NULL, '362819211', 6, 4, 1, '2026-07-06 06:10:03'),
(88, 'NV032', 'Nguyễn Minh Tuấn', 'NV032', '$2y$12$fQGuae/jrfXdEUYyP.W0.u/syBDmufi.QUykkFw7PeKxrPgjc3up2', NULL, NULL, 6, 4, 0, '2026-07-06 06:10:03'),
(89, 'NV033', 'Trần Đức Cảnh', 'NV033', '$2y$12$/zU9GM4VHiVgHepOnzCBdOD22iUBEcO5e5CiMghot6V6i3y.LN8hi', NULL, NULL, 6, 4, 0, '2026-07-06 06:10:04'),
(90, 'NV034', 'Nguyễn Văn Cường', 'NV034', '$2y$12$soHNPt0rPAYjzhsEoHfTquqQjj93.fA2XuSgqwzu3aRmAwlALOuk6', NULL, NULL, 6, 4, 0, '2026-07-06 06:10:04'),
(91, 'NV035', 'Lê Thị Tám', 'NV035', '$2y$12$14cIsKhuqpxV2.2ZyNpGFORVmjlijk94EnekxPZGrwVvEGfN4COJa', '', '0362673294', 6, 4, 1, '2026-07-06 06:10:04'),
(92, 'NV036', 'Hoàng Thị Hường', 'NV036', '$2y$12$0bx13cQCuWt0PVfLWHOQj.jgHcjlNDfyOcbr3OxdjLKHyd6pk0vmO', NULL, NULL, 6, 4, 0, '2026-07-06 06:10:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `vehicle_name` varchar(200) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `status` enum('active','maintenance','disposed') DEFAULT 'active',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_documents`
--

CREATE TABLE `vehicle_documents` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `doc_type` enum('registration','insurance','maintenance') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cost` decimal(15,2) DEFAULT 0.00,
  `provider` varchar(200) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_fuel`
--

CREATE TABLE `vehicle_fuel` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `fuel_date` date NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `liters` decimal(8,2) DEFAULT NULL,
  `odometer` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_maintenance`
--

CREATE TABLE `vehicle_maintenance` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `maintenance_date` date NOT NULL,
  `maintenance_type` enum('routine','repair') NOT NULL DEFAULT 'routine' COMMENT 'routine=bảo dưỡng định kỳ, repair=sửa chữa',
  `description` varchar(500) NOT NULL COMMENT 'Mô tả công việc',
  `garage_name` varchar(200) DEFAULT NULL COMMENT 'Garage/xưởng thực hiện',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Chi phí',
  `invoice_no` varchar(100) DEFAULT NULL COMMENT 'Số hóa đơn',
  `odometer` int(11) DEFAULT NULL COMMENT 'Số km khi bảo dưỡng',
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_trips`
--

CREATE TABLE `vehicle_trips` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `trip_date` date NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `origin` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `km_start` int(11) DEFAULT NULL,
  `km_end` int(11) DEFAULT NULL,
  `toll_fee` decimal(15,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_imports`
--

CREATE TABLE `warehouse_imports` (
  `id` int(11) NOT NULL,
  `import_no` varchar(30) NOT NULL,
  `import_date` date NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `quantity_sent` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `status` enum('pending','partial','completed') DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_in`
--

CREATE TABLE `warehouse_in` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('open','processing','done') DEFAULT 'open',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_in_items`
--

CREATE TABLE `warehouse_in_items` (
  `id` int(11) NOT NULL,
  `warehouse_in_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_items`
--

CREATE TABLE `warehouse_items` (
  `id` int(11) NOT NULL,
  `warehouse_in_id` int(11) DEFAULT NULL,
  `wo_process_id` int(11) DEFAULT NULL,
  `product_code_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000,
  `quantity_delivered` decimal(15,3) DEFAULT 0.000,
  `status` enum('done','waiting','delivered','rejected') DEFAULT 'done',
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_out`
--

CREATE TABLE `warehouse_out` (
  `id` int(11) NOT NULL,
  `export_no` varchar(50) DEFAULT NULL,
  `export_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('draft','confirmed') DEFAULT 'draft',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_out_items`
--

CREATE TABLE `warehouse_out_items` (
  `id` int(11) NOT NULL,
  `warehouse_out_id` int(11) NOT NULL,
  `warehouse_item_id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_stock`
--

CREATE TABLE `warehouse_stock` (
  `id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `category` enum('raw_material','consumable','office','equipment','other') NOT NULL DEFAULT 'raw_material',
  `qty_pending` decimal(15,2) DEFAULT 0.00,
  `qty_completed` decimal(15,2) DEFAULT 0.00,
  `qty_defect` decimal(15,2) DEFAULT 0.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_stock_log`
--

CREATE TABLE `warehouse_stock_log` (
  `id` int(11) NOT NULL,
  `product_code_id` int(11) NOT NULL,
  `log_date` date NOT NULL,
  `txn_type` enum('import','send_to_prod','return_completed','return_defect','return_pending','delivery') NOT NULL,
  `stock_type` enum('pending','completed','defect') NOT NULL,
  `qty_change` decimal(15,2) NOT NULL COMMENT 'Dương: nhập vào, Âm: xuất ra',
  `ref_table` varchar(50) DEFAULT NULL COMMENT 'Bảng nguồn tham chiếu',
  `ref_id` int(11) DEFAULT NULL COMMENT 'ID bản ghi nguồn',
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Lịch sử biến động tồn kho (traceback)';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wa_categories`
--

CREATE TABLE `wa_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wa_categories`
--

INSERT INTO `wa_categories` (`id`, `name`, `description`, `is_active`) VALUES
(1, 'Máy móc', NULL, 1),
(2, 'Thiết bị', NULL, 1),
(3, 'Văn phòng phẩm', NULL, 1),
(4, 'Vật tư tiêu hao', NULL, 1),
(5, 'Khác', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wa_items`
--

CREATE TABLE `wa_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `unit` varchar(30) NOT NULL DEFAULT 'cái',
  `min_stock` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wa_items`
--

INSERT INTO `wa_items` (`id`, `category_id`, `item_code`, `item_name`, `unit`, `min_stock`, `is_active`, `created_at`) VALUES
(1, 4, 'H2O', 'Nước', 'Lit', 200.00, 1, '2026-07-03 06:52:41'),
(2, 4, 'AL', 'Dây Nhôm ARC', 'Cuộn', 2.00, 1, '2026-07-07 03:39:07'),
(3, 4, 'TSD11001300', 'Túi Shielding hút chân không 1100*1300*0.075mm', 'chiếc', 40.00, 1, '2026-07-08 03:53:27'),
(4, 4, 'TSD10701260', 'Túi Shielding hút chân không 1070*1260*0.075mm', 'chiếc', 100.00, 1, '2026-07-08 03:56:41'),
(5, 4, 'IPA', 'Iso Propyl Alcohol tech', 'kg', 16.00, 1, '2026-07-08 05:05:19'),
(6, 4, 'NH4HF2', 'Hóa chất Amoni biflorua', 'kg', 25.00, 1, '2026-07-08 05:06:14'),
(7, 4, 'HNO3', 'Hóa chất Acid Nitric-HNO3', 'kg', 35.00, 1, '2026-07-08 05:07:21'),
(8, 4, 'HF', 'Hóa chất Acid Flohidric-HF 55%', 'kg', 25.00, 1, '2026-07-08 05:09:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wa_transactions`
--

CREATE TABLE `wa_transactions` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` enum('import','export') NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `transacted_by` int(11) NOT NULL,
  `transacted_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wa_transactions`
--

INSERT INTO `wa_transactions` (`id`, `item_id`, `type`, `qty`, `ref_no`, `note`, `transacted_by`, `transacted_at`, `created_at`) VALUES
(1, 2, 'import', 2.00, NULL, NULL, 18, '2026-07-07', '2026-07-07 03:39:23'),
(2, 3, 'import', 40.00, '070726', NULL, 57, '2026-07-07', '2026-07-08 05:01:50'),
(3, 3, 'export', 40.00, '070726', NULL, 57, '2026-07-08', '2026-07-08 05:02:05'),
(4, 5, 'import', 16.00, '010726', NULL, 57, '2026-07-01', '2026-07-08 05:10:05'),
(5, 5, 'export', 16.00, 'HT-010726', NULL, 57, '2026-07-02', '2026-07-08 05:10:40'),
(6, 6, 'import', 25.00, 'HT-010726', NULL, 57, '2026-07-01', '2026-07-08 05:11:23'),
(7, 6, 'export', 25.00, 'HT-010726', NULL, 57, '2026-07-01', '2026-07-08 05:11:50'),
(8, 7, 'import', 175.00, 'HT-010726', NULL, 57, '2026-07-01', '2026-07-08 05:12:19'),
(9, 7, 'export', 175.00, 'HT-010726', NULL, 57, '2026-07-01', '2026-07-08 05:12:36'),
(10, 8, 'import', 25.00, 'HT-030726', NULL, 57, '2026-07-02', '2026-07-08 05:13:17'),
(11, 8, 'export', 25.00, 'HT-030726', NULL, 57, '2026-07-03', '2026-07-08 05:13:49'),
(12, 6, 'import', 25.00, 'HT-070726', NULL, 57, '2026-07-07', '2026-07-08 05:14:17'),
(13, 6, 'export', 25.00, 'HT-070726', NULL, 57, '2026-07-07', '2026-07-08 05:15:16'),
(14, 7, 'import', 175.00, 'HT-070726', NULL, 57, '2026-07-07', '2026-07-08 05:15:51'),
(15, 7, 'export', 175.00, 'HT-070726', NULL, 57, '2026-07-07', '2026-07-08 05:16:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_shifts`
--

CREATE TABLE `work_shifts` (
  `id` int(11) NOT NULL,
  `shift_code` varchar(20) NOT NULL,
  `shift_name` varchar(100) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `late_threshold` int(11) DEFAULT 15,
  `break_minutes` int(11) DEFAULT 60,
  `work_hours` decimal(4,2) DEFAULT 8.00,
  `ot_multiplier` decimal(3,2) DEFAULT 1.50,
  `weekend_multiplier` decimal(3,2) DEFAULT 2.00,
  `holiday_multiplier` decimal(3,2) DEFAULT 3.00,
  `is_night_shift` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(20) DEFAULT '#0d6efd',
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `work_shifts`
--

INSERT INTO `work_shifts` (`id`, `shift_code`, `shift_name`, `start_time`, `end_time`, `late_threshold`, `break_minutes`, `work_hours`, `ot_multiplier`, `weekend_multiplier`, `holiday_multiplier`, `is_night_shift`, `color`, `is_active`, `created_by`, `created_at`) VALUES
(1, 'HANHCHINH', 'Hành chính', '08:00:00', '17:00:00', 15, 60, 8.00, 1.50, 2.00, 3.00, 0, '#0d6efd', 1, NULL, '2026-03-10 09:51:42'),
(4, 'CA_DEM', 'Ca đêm', '20:00:00', '05:00:00', 15, 30, 8.50, 1.50, 2.00, 3.00, 1, '#6f42c1', 1, NULL, '2026-03-10 09:51:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wo_processes`
--

CREATE TABLE `wo_processes` (
  `id` int(11) NOT NULL,
  `warehouse_in_id` int(11) NOT NULL,
  `warehouse_in_item_id` int(11) DEFAULT NULL,
  `product_code_id` int(11) NOT NULL,
  `quantity_input` decimal(15,3) DEFAULT 0.000,
  `quantity_done` decimal(15,3) DEFAULT 0.000,
  `quantity_rejected` decimal(15,3) DEFAULT 0.000,
  `status` enum('processing','done') DEFAULT 'processing',
  `process_date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_budgets`
--
ALTER TABLE `admin_budgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_budget` (`budget_year`,`budget_month`,`category_id`),
  ADD KEY `fk_ab_category` (`category_id`);

--
-- Chỉ mục cho bảng `asset_assignments`
--
ALTER TABLE `asset_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aa_asset` (`asset_id`),
  ADD KEY `fk_aa_user` (`user_id`);

--
-- Chỉ mục cho bảng `attendance_audit_logs`
--
ALTER TABLE `attendance_audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attendance_department_policies`
--
ALTER TABLE `attendance_department_policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_dept_policy` (`department_id`);

--
-- Chỉ mục cho bảng `attendance_location_settings`
--
ALTER TABLE `attendance_location_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`user_id`,`work_date`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `idx_att_device_date` (`device_id`,`work_date`);

--
-- Chỉ mục cho bảng `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_table_record` (`table_name`,`record_id`),
  ADD KEY `idx_changed_by` (`changed_by`),
  ADD KEY `idx_changed_at` (`changed_at`);

--
-- Chỉ mục cho bảng `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`code`),
  ADD KEY `district_code` (`district_code`);

--
-- Chỉ mục cho bảng `company_assets`
--
ALTER TABLE `company_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_code` (`asset_code`);

--
-- Chỉ mục cho bảng `company_ip_whitelist`
--
ALTER TABLE `company_ip_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `company_location_config`
--
ALTER TABLE `company_location_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `config_key` (`config_key`);

--
-- Chỉ mục cho bảng `cost_entries`
--
ALTER TABLE `cost_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entry_date` (`entry_date`),
  ADD KEY `idx_cost_type` (`cost_type`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_customer_code` (`customer_code`);

--
-- Chỉ mục cho bảng `customer_prices`
--
ALTER TABLE `customer_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cp_product` (`product_code_id`),
  ADD KEY `idx_cp_cust_prod_date` (`customer_id`,`product_code_id`,`effective_date`);

--
-- Chỉ mục cho bảng `day_close_log`
--
ALTER TABLE `day_close_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_close_date` (`close_date`);

--
-- Chỉ mục cho bảng `debt_payments`
--
ALTER TABLE `debt_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dp_debt` (`debt_id`),
  ADD KEY `idx_dp_date` (`payment_date`);

--
-- Chỉ mục cho bảng `debt_tracking`
--
ALTER TABLE `debt_tracking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_debt_invoice` (`invoice_id`),
  ADD KEY `idx_debt_customer` (`customer_id`),
  ADD KEY `idx_debt_status` (`status`);

--
-- Chỉ mục cho bảng `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_no` (`delivery_no`),
  ADD KEY `fk_dl_customer` (`customer_id`),
  ADD KEY `fk_dl_wo` (`warehouse_out_id`),
  ADD KEY `fk_dl_user` (`created_by`),
  ADD KEY `fk_deliveries_export` (`export_id`);

--
-- Chỉ mục cho bảng `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dli_dl` (`delivery_id`),
  ADD KEY `fk_dli_pc` (`product_code_id`),
  ADD KEY `fk_delivery_items_export_item` (`export_item_id`);

--
-- Chỉ mục cho bảng `delivery_notes`
--
ALTER TABLE `delivery_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_delivery_no` (`delivery_no`),
  ADD KEY `idx_delivery_date` (`delivery_date`),
  ADD KEY `idx_delivery_status` (`status`),
  ADD KEY `idx_delivery_customer` (`customer_id`);

--
-- Chỉ mục cho bảng `delivery_note_items`
--
ALTER TABLE `delivery_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dni_delivery_note` (`delivery_note_id`),
  ADD KEY `idx_dni_output` (`production_output_id`),
  ADD KEY `product_code_id` (`product_code_id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`code`),
  ADD KEY `province_code` (`province_code`);

--
-- Chỉ mục cho bảng `document_sequences`
--
ALTER TABLE `document_sequences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_doctype_date` (`doc_type`,`doc_date`);

--
-- Chỉ mục cho bảng `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `permanent_province` (`permanent_province`),
  ADD KEY `temp_province` (`temp_province`);

--
-- Chỉ mục cho bảng `employee_salaries`
--
ALTER TABLE `employee_salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Chỉ mục cho bảng `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `ethnicities`
--
ALTER TABLE `ethnicities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `expense_payments`
--
ALTER TABLE `expense_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ep_expense` (`expense_id`);

--
-- Chỉ mục cho bảng `expense_requests`
--
ALTER TABLE `expense_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_no` (`request_no`),
  ADD KEY `fk_er_category` (`category_id`),
  ADD KEY `fk_er_requested_by` (`requested_by`);

--
-- Chỉ mục cho bảng `finished_goods_stock`
--
ALTER TABLE `finished_goods_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fgs_no` (`fgs_no`),
  ADD KEY `idx_fgs_progress` (`progress_id`),
  ADD KEY `idx_fgs_customer` (`customer_id`),
  ADD KEY `idx_fgs_product` (`product_code_id`),
  ADD KEY `idx_fgs_status` (`status`);

--
-- Chỉ mục cho bảng `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `holiday_date` (`holiday_date`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_invoice_no` (`invoice_no`),
  ADD KEY `idx_invoice_date` (`invoice_date`),
  ADD KEY `idx_invoice_status` (`status`),
  ADD KEY `idx_invoice_customer` (`customer_id`),
  ADD KEY `fk_inv_delivery` (`delivery_id`),
  ADD KEY `fk_inv_user` (`created_by`);

--
-- Chỉ mục cho bảng `invoice_delivery_notes`
--
ALTER TABLE `invoice_delivery_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_inv_dn` (`invoice_id`,`delivery_note_id`),
  ADD KEY `delivery_note_id` (`delivery_note_id`);

--
-- Chỉ mục cho bảng `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ii_invoice` (`invoice_id`),
  ADD KEY `idx_ii_dn` (`delivery_note_id`),
  ADD KEY `idx_ii_product` (`product_code_id`),
  ADD KEY `delivery_note_item_id` (`delivery_note_item_id`);

--
-- Chỉ mục cho bảng `inv_exports`
--
ALTER TABLE `inv_exports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `export_no` (`export_no`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Chỉ mục cho bảng `inv_imports`
--
ALTER TABLE `inv_imports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `import_no` (`import_no`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `inv_items`
--
ALTER TABLE `inv_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Chỉ mục cho bảng `iqc_receipts`
--
ALTER TABLE `iqc_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `received_by` (`received_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `iqc_receipt_items`
--
ALTER TABLE `iqc_receipt_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_id` (`receipt_id`),
  ADD KEY `product_code_id` (`product_code_id`);

--
-- Chỉ mục cho bảng `kpi_assignments`
--
ALTER TABLE `kpi_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_assign` (`assign_date`,`user_id`),
  ADD KEY `fk_kpi_user` (`user_id`),
  ADD KEY `fk_kpi_manager` (`manager_id`);

--
-- Chỉ mục cho bảng `kpi_results`
--
ALTER TABLE `kpi_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_result` (`kpi_assignment_id`),
  ADD KEY `fk_result_assign` (`kpi_assignment_id`);

--
-- Chỉ mục cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `oqc_deliveries`
--
ALTER TABLE `oqc_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_no` (`delivery_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `oqc_delivery_items`
--
ALTER TABLE `oqc_delivery_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `production_item_id` (`production_item_id`);

--
-- Chỉ mục cho bảng `overtime_requests`
--
ALTER TABLE `overtime_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pay_inv` (`invoice_id`),
  ADD KEY `fk_pay_user` (`created_by`);

--
-- Chỉ mục cho bảng `payroll_periods`
--
ALTER TABLE `payroll_periods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_period` (`period_year`,`period_month`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `submitted_by` (`submitted_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `locked_by` (`locked_by`);

--
-- Chỉ mục cho bảng `payroll_slips`
--
ALTER TABLE `payroll_slips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_slip` (`period_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `production_items`
--
ALTER TABLE `production_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `iqc_item_id` (`iqc_item_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Chỉ mục cho bảng `production_orders`
--
ALTER TABLE `production_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_no` (`order_no`),
  ADD KEY `iqc_receipt_id` (`iqc_receipt_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `production_outputs`
--
ALTER TABLE `production_outputs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_output_no` (`output_no`),
  ADD KEY `idx_output_date` (`output_date`),
  ADD KEY `idx_production_receipt` (`production_receipt_id`),
  ADD KEY `product_code_id` (`product_code_id`);

--
-- Chỉ mục cho bảng `production_progress`
--
ALTER TABLE `production_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `progress_no` (`progress_no`),
  ADD KEY `idx_progress_warehouse_in` (`warehouse_in_id`),
  ADD KEY `idx_progress_customer` (`customer_id`),
  ADD KEY `idx_progress_product` (`product_code_id`);

--
-- Chỉ mục cho bảng `production_progress_logs`
--
ALTER TABLE `production_progress_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_progress_logs_progress` (`progress_id`),
  ADD KEY `idx_progress_logs_date` (`log_date`);

--
-- Chỉ mục cho bảng `production_receipts`
--
ALTER TABLE `production_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_receipt_no` (`receipt_no`),
  ADD KEY `idx_receipt_date` (`receipt_date`),
  ADD KEY `idx_warehouse_import` (`warehouse_import_id`),
  ADD KEY `product_code_id` (`product_code_id`);

--
-- Chỉ mục cho bảng `production_stock`
--
ALTER TABLE `production_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_prod_stock` (`product_code_id`,`stock_date`);

--
-- Chỉ mục cho bảng `product_codes`
--
ALTER TABLE `product_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_product_code` (`product_code`),
  ADD KEY `idx_product_category` (`product_category`);

--
-- Chỉ mục cho bảng `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_effective` (`product_code_id`,`effective_from`);

--
-- Chỉ mục cho bảng `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `salary_components`
--
ALTER TABLE `salary_components`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `component_code` (`component_code`);

--
-- Chỉ mục cho bảng `shift_schedules`
--
ALTER TABLE `shift_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_schedule` (`user_id`,`work_date`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `stock_exports`
--
ALTER TABLE `stock_exports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `export_no` (`export_no`),
  ADD KEY `idx_stock_exports_customer` (`customer_id`),
  ADD KEY `idx_stock_exports_status` (`status`);

--
-- Chỉ mục cho bảng `stock_export_items`
--
ALTER TABLE `stock_export_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_stock_export_items_export` (`export_id`),
  ADD KEY `idx_stock_export_items_fgs` (`fgs_id`),
  ADD KEY `idx_stock_export_items_delivery` (`delivery_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Chỉ mục cho bảng `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_number` (`plate_number`);

--
-- Chỉ mục cho bảng `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vd_vehicle` (`vehicle_id`);

--
-- Chỉ mục cho bảng `vehicle_fuel`
--
ALTER TABLE `vehicle_fuel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vf_vehicle` (`vehicle_id`);

--
-- Chỉ mục cho bảng `vehicle_maintenance`
--
ALTER TABLE `vehicle_maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `vehicle_trips`
--
ALTER TABLE `vehicle_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vt_vehicle` (`vehicle_id`);

--
-- Chỉ mục cho bảng `warehouse_imports`
--
ALTER TABLE `warehouse_imports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_import_no` (`import_no`),
  ADD KEY `idx_import_date` (`import_date`),
  ADD KEY `idx_import_status` (`status`),
  ADD KEY `product_code_id` (`product_code_id`);

--
-- Chỉ mục cho bảng `warehouse_in`
--
ALTER TABLE `warehouse_in`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`),
  ADD KEY `fk_wi_customer` (`customer_id`),
  ADD KEY `fk_wi_created_by` (`created_by`);

--
-- Chỉ mục cho bảng `warehouse_in_items`
--
ALTER TABLE `warehouse_in_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wii_wi` (`warehouse_in_id`),
  ADD KEY `fk_wii_product` (`product_code_id`);

--
-- Chỉ mục cho bảng `warehouse_items`
--
ALTER TABLE `warehouse_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_witm_wi` (`warehouse_in_id`),
  ADD KEY `fk_witm_wop` (`wo_process_id`),
  ADD KEY `fk_witm_pc` (`product_code_id`),
  ADD KEY `fk_witm_cust` (`customer_id`);

--
-- Chỉ mục cho bảng `warehouse_out`
--
ALTER TABLE `warehouse_out`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `export_no` (`export_no`),
  ADD KEY `fk_wo_customer` (`customer_id`),
  ADD KEY `fk_wo_created_by` (`created_by`);

--
-- Chỉ mục cho bảng `warehouse_out_items`
--
ALTER TABLE `warehouse_out_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_woi_wo` (`warehouse_out_id`),
  ADD KEY `fk_woi_witm` (`warehouse_item_id`),
  ADD KEY `fk_woi_pc` (`product_code_id`);

--
-- Chỉ mục cho bảng `warehouse_stock`
--
ALTER TABLE `warehouse_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_wh_stock` (`product_code_id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_product_category` (`product_code_id`,`category`);

--
-- Chỉ mục cho bảng `warehouse_stock_log`
--
ALTER TABLE `warehouse_stock_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_date` (`log_date`),
  ADD KEY `idx_log_product` (`product_code_id`),
  ADD KEY `idx_log_type` (`txn_type`);

--
-- Chỉ mục cho bảng `wa_categories`
--
ALTER TABLE `wa_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wa_items`
--
ALTER TABLE `wa_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `wa_transactions`
--
ALTER TABLE `wa_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `transacted_by` (`transacted_by`);

--
-- Chỉ mục cho bảng `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shift_code` (`shift_code`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `wo_processes`
--
ALTER TABLE `wo_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wop_wi` (`warehouse_in_id`),
  ADD KEY `fk_wop_wii` (`warehouse_in_item_id`),
  ADD KEY `fk_wop_pc` (`product_code_id`),
  ADD KEY `fk_wop_user` (`updated_by`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_budgets`
--
ALTER TABLE `admin_budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `asset_assignments`
--
ALTER TABLE `asset_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attendance_audit_logs`
--
ALTER TABLE `attendance_audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `attendance_department_policies`
--
ALTER TABLE `attendance_department_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `attendance_location_settings`
--
ALTER TABLE `attendance_location_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `company_assets`
--
ALTER TABLE `company_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `company_ip_whitelist`
--
ALTER TABLE `company_ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `company_location_config`
--
ALTER TABLE `company_location_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cost_entries`
--
ALTER TABLE `cost_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `customer_prices`
--
ALTER TABLE `customer_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT cho bảng `day_close_log`
--
ALTER TABLE `day_close_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `debt_payments`
--
ALTER TABLE `debt_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `debt_tracking`
--
ALTER TABLE `debt_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `delivery_items`
--
ALTER TABLE `delivery_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `delivery_notes`
--
ALTER TABLE `delivery_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `delivery_note_items`
--
ALTER TABLE `delivery_note_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `document_sequences`
--
ALTER TABLE `document_sequences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `employee_profiles`
--
ALTER TABLE `employee_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `employee_salaries`
--
ALTER TABLE `employee_salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT cho bảng `employee_shifts`
--
ALTER TABLE `employee_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `ethnicities`
--
ALTER TABLE `ethnicities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `expense_payments`
--
ALTER TABLE `expense_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `expense_requests`
--
ALTER TABLE `expense_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `finished_goods_stock`
--
ALTER TABLE `finished_goods_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoice_delivery_notes`
--
ALTER TABLE `invoice_delivery_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inv_exports`
--
ALTER TABLE `inv_exports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inv_imports`
--
ALTER TABLE `inv_imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inv_items`
--
ALTER TABLE `inv_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `iqc_receipts`
--
ALTER TABLE `iqc_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `iqc_receipt_items`
--
ALTER TABLE `iqc_receipt_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `kpi_assignments`
--
ALTER TABLE `kpi_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `kpi_results`
--
ALTER TABLE `kpi_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=818;

--
-- AUTO_INCREMENT cho bảng `oqc_deliveries`
--
ALTER TABLE `oqc_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oqc_delivery_items`
--
ALTER TABLE `oqc_delivery_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `overtime_requests`
--
ALTER TABLE `overtime_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payroll_periods`
--
ALTER TABLE `payroll_periods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `payroll_slips`
--
ALTER TABLE `payroll_slips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `production_items`
--
ALTER TABLE `production_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `production_orders`
--
ALTER TABLE `production_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `production_outputs`
--
ALTER TABLE `production_outputs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `production_progress`
--
ALTER TABLE `production_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `production_progress_logs`
--
ALTER TABLE `production_progress_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `production_receipts`
--
ALTER TABLE `production_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `production_stock`
--
ALTER TABLE `production_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_codes`
--
ALTER TABLE `product_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT cho bảng `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `salary_components`
--
ALTER TABLE `salary_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `shift_schedules`
--
ALTER TABLE `shift_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_exports`
--
ALTER TABLE `stock_exports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_export_items`
--
ALTER TABLE `stock_export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vehicle_fuel`
--
ALTER TABLE `vehicle_fuel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vehicle_maintenance`
--
ALTER TABLE `vehicle_maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vehicle_trips`
--
ALTER TABLE `vehicle_trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_imports`
--
ALTER TABLE `warehouse_imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_in`
--
ALTER TABLE `warehouse_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_in_items`
--
ALTER TABLE `warehouse_in_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_items`
--
ALTER TABLE `warehouse_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_out`
--
ALTER TABLE `warehouse_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_out_items`
--
ALTER TABLE `warehouse_out_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_stock`
--
ALTER TABLE `warehouse_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_stock_log`
--
ALTER TABLE `warehouse_stock_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wa_categories`
--
ALTER TABLE `wa_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `wa_items`
--
ALTER TABLE `wa_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wa_transactions`
--
ALTER TABLE `wa_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `wo_processes`
--
ALTER TABLE `wo_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `invoices_v`
--
DROP TABLE IF EXISTS `invoices_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ntnvncom`@`localhost` SQL SECURITY DEFINER VIEW `invoices_v`  AS SELECT `invoices`.`id` AS `id`, `invoices`.`invoice_no` AS `invoice_no`, `invoices`.`invoice_date` AS `invoice_date`, `invoices`.`due_date` AS `due_date`, `invoices`.`customer_id` AS `customer_id`, `invoices`.`total_amount` AS `total_amount`, `invoices`.`subtotal` AS `subtotal`, `invoices`.`vat_rate` AS `vat_rate`, `invoices`.`vat_amount` AS `vat_amount`, `invoices`.`note` AS `note`, `invoices`.`delivery_id` AS `delivery_id`, `invoices`.`status` AS `status`, `invoices`.`created_by` AS `created_by`, `invoices`.`confirmed_by` AS `confirmed_by`, `invoices`.`confirmed_at` AS `confirmed_at`, `invoices`.`created_at` AS `created_at`, `invoices`.`updated_at` AS `updated_at` FROM `invoices` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `prices`
--
DROP TABLE IF EXISTS `prices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ntnvncom`@`localhost` SQL SECURITY DEFINER VIEW `prices`  AS SELECT `product_prices`.`id` AS `id`, `product_prices`.`product_code_id` AS `product_code_id`, `product_prices`.`unit_price` AS `unit_price`, `product_prices`.`effective_from` AS `effective_from`, `product_prices`.`note` AS `note`, `product_prices`.`created_by` AS `created_by`, `product_prices`.`created_at` AS `created_at` FROM `product_prices` ;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `admin_budgets`
--
ALTER TABLE `admin_budgets`
  ADD CONSTRAINT `fk_ab_category` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`);

--
-- Ràng buộc cho bảng `asset_assignments`
--
ALTER TABLE `asset_assignments`
  ADD CONSTRAINT `fk_aa_asset` FOREIGN KEY (`asset_id`) REFERENCES `company_assets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_aa_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `attendance_department_policies`
--
ALTER TABLE `attendance_department_policies`
  ADD CONSTRAINT `fk_adp_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `work_shifts` (`id`);

--
-- Ràng buộc cho bảng `communes`
--
ALTER TABLE `communes`
  ADD CONSTRAINT `communes_ibfk_1` FOREIGN KEY (`district_code`) REFERENCES `districts` (`code`);

--
-- Ràng buộc cho bảng `customer_prices`
--
ALTER TABLE `customer_prices`
  ADD CONSTRAINT `fk_cp_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cp_product` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `debt_payments`
--
ALTER TABLE `debt_payments`
  ADD CONSTRAINT `debt_payments_ibfk_1` FOREIGN KEY (`debt_id`) REFERENCES `debt_tracking` (`id`);

--
-- Ràng buộc cho bảng `debt_tracking`
--
ALTER TABLE `debt_tracking`
  ADD CONSTRAINT `debt_tracking_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `debt_tracking_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Ràng buộc cho bảng `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `fk_deliveries_export` FOREIGN KEY (`export_id`) REFERENCES `stock_exports` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dl_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_dl_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dl_wo` FOREIGN KEY (`warehouse_out_id`) REFERENCES `warehouse_out` (`id`) ON DELETE SET NULL;

--
-- Ràng buộc cho bảng `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD CONSTRAINT `fk_delivery_items_export_item` FOREIGN KEY (`export_item_id`) REFERENCES `stock_export_items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dli_dl` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dli_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `delivery_notes`
--
ALTER TABLE `delivery_notes`
  ADD CONSTRAINT `delivery_notes_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Ràng buộc cho bảng `delivery_note_items`
--
ALTER TABLE `delivery_note_items`
  ADD CONSTRAINT `delivery_note_items_ibfk_1` FOREIGN KEY (`delivery_note_id`) REFERENCES `delivery_notes` (`id`),
  ADD CONSTRAINT `delivery_note_items_ibfk_2` FOREIGN KEY (`production_output_id`) REFERENCES `production_outputs` (`id`),
  ADD CONSTRAINT `delivery_note_items_ibfk_3` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`code`);

--
-- Ràng buộc cho bảng `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD CONSTRAINT `employee_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_profiles_ibfk_2` FOREIGN KEY (`permanent_province`) REFERENCES `provinces` (`code`),
  ADD CONSTRAINT `employee_profiles_ibfk_3` FOREIGN KEY (`temp_province`) REFERENCES `provinces` (`code`);

--
-- Ràng buộc cho bảng `employee_salaries`
--
ALTER TABLE `employee_salaries`
  ADD CONSTRAINT `employee_salaries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_salaries_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `salary_components` (`id`),
  ADD CONSTRAINT `employee_salaries_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `employee_salaries_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD CONSTRAINT `employee_shifts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `employee_shifts_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `work_shifts` (`id`),
  ADD CONSTRAINT `employee_shifts_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `expense_payments`
--
ALTER TABLE `expense_payments`
  ADD CONSTRAINT `fk_ep_expense` FOREIGN KEY (`expense_id`) REFERENCES `expense_requests` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `expense_requests`
--
ALTER TABLE `expense_requests`
  ADD CONSTRAINT `fk_er_category` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `fk_er_requested_by` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_inv_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_inv_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_inv_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Ràng buộc cho bảng `invoice_delivery_notes`
--
ALTER TABLE `invoice_delivery_notes`
  ADD CONSTRAINT `invoice_delivery_notes_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_delivery_notes_ibfk_2` FOREIGN KEY (`delivery_note_id`) REFERENCES `delivery_notes` (`id`);

--
-- Ràng buộc cho bảng `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `fk_ii_inv` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ii_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`),
  ADD CONSTRAINT `invoice_items_ibfk_4` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `inv_exports`
--
ALTER TABLE `inv_exports`
  ADD CONSTRAINT `inv_exports_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inv_items` (`id`),
  ADD CONSTRAINT `inv_exports_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inv_exports_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `inv_imports`
--
ALTER TABLE `inv_imports`
  ADD CONSTRAINT `inv_imports_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inv_items` (`id`),
  ADD CONSTRAINT `inv_imports_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `iqc_receipts`
--
ALTER TABLE `iqc_receipts`
  ADD CONSTRAINT `iqc_receipts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `iqc_receipts_ibfk_2` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `iqc_receipts_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `iqc_receipt_items`
--
ALTER TABLE `iqc_receipt_items`
  ADD CONSTRAINT `iqc_receipt_items_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `iqc_receipts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `iqc_receipt_items_ibfk_2` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `kpi_results`
--
ALTER TABLE `kpi_results`
  ADD CONSTRAINT `fk_result_assign` FOREIGN KEY (`kpi_assignment_id`) REFERENCES `kpi_assignments` (`id`);

--
-- Ràng buộc cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `oqc_deliveries`
--
ALTER TABLE `oqc_deliveries`
  ADD CONSTRAINT `oqc_deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `oqc_deliveries_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `oqc_delivery_items`
--
ALTER TABLE `oqc_delivery_items`
  ADD CONSTRAINT `oqc_delivery_items_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `oqc_deliveries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oqc_delivery_items_ibfk_2` FOREIGN KEY (`production_item_id`) REFERENCES `production_items` (`id`);

--
-- Ràng buộc cho bảng `overtime_requests`
--
ALTER TABLE `overtime_requests`
  ADD CONSTRAINT `overtime_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `overtime_requests_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_pay_inv` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_pay_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ràng buộc cho bảng `payroll_periods`
--
ALTER TABLE `payroll_periods`
  ADD CONSTRAINT `payroll_periods_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payroll_periods_ibfk_2` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payroll_periods_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payroll_periods_ibfk_4` FOREIGN KEY (`locked_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `payroll_slips`
--
ALTER TABLE `payroll_slips`
  ADD CONSTRAINT `payroll_slips_ibfk_1` FOREIGN KEY (`period_id`) REFERENCES `payroll_periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_slips_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `production_items`
--
ALTER TABLE `production_items`
  ADD CONSTRAINT `production_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `production_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_items_ibfk_2` FOREIGN KEY (`iqc_item_id`) REFERENCES `iqc_receipt_items` (`id`),
  ADD CONSTRAINT `production_items_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `production_orders`
--
ALTER TABLE `production_orders`
  ADD CONSTRAINT `production_orders_ibfk_1` FOREIGN KEY (`iqc_receipt_id`) REFERENCES `iqc_receipts` (`id`),
  ADD CONSTRAINT `production_orders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `production_outputs`
--
ALTER TABLE `production_outputs`
  ADD CONSTRAINT `production_outputs_ibfk_1` FOREIGN KEY (`production_receipt_id`) REFERENCES `production_receipts` (`id`),
  ADD CONSTRAINT `production_outputs_ibfk_2` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `production_receipts`
--
ALTER TABLE `production_receipts`
  ADD CONSTRAINT `production_receipts_ibfk_1` FOREIGN KEY (`warehouse_import_id`) REFERENCES `warehouse_imports` (`id`),
  ADD CONSTRAINT `production_receipts_ibfk_2` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_ibfk_1` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `shift_schedules`
--
ALTER TABLE `shift_schedules`
  ADD CONSTRAINT `shift_schedules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shift_schedules_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `work_shifts` (`id`),
  ADD CONSTRAINT `shift_schedules_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Ràng buộc cho bảng `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  ADD CONSTRAINT `fk_vd_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vehicle_fuel`
--
ALTER TABLE `vehicle_fuel`
  ADD CONSTRAINT `fk_vf_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vehicle_maintenance`
--
ALTER TABLE `vehicle_maintenance`
  ADD CONSTRAINT `vehicle_maintenance_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_maintenance_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `vehicle_trips`
--
ALTER TABLE `vehicle_trips`
  ADD CONSTRAINT `fk_vt_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `warehouse_imports`
--
ALTER TABLE `warehouse_imports`
  ADD CONSTRAINT `warehouse_imports_ibfk_1` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`);

--
-- Ràng buộc cho bảng `warehouse_in`
--
ALTER TABLE `warehouse_in`
  ADD CONSTRAINT `fk_wi_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wi_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Ràng buộc cho bảng `warehouse_in_items`
--
ALTER TABLE `warehouse_in_items`
  ADD CONSTRAINT `fk_wii_product` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`),
  ADD CONSTRAINT `fk_wii_wi` FOREIGN KEY (`warehouse_in_id`) REFERENCES `warehouse_in` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `warehouse_items`
--
ALTER TABLE `warehouse_items`
  ADD CONSTRAINT `fk_witm_cust` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_witm_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`),
  ADD CONSTRAINT `fk_witm_wi` FOREIGN KEY (`warehouse_in_id`) REFERENCES `warehouse_in` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_witm_wop` FOREIGN KEY (`wo_process_id`) REFERENCES `wo_processes` (`id`) ON DELETE SET NULL;

--
-- Ràng buộc cho bảng `warehouse_out`
--
ALTER TABLE `warehouse_out`
  ADD CONSTRAINT `fk_wo_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wo_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Ràng buộc cho bảng `warehouse_out_items`
--
ALTER TABLE `warehouse_out_items`
  ADD CONSTRAINT `fk_woi_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`),
  ADD CONSTRAINT `fk_woi_witm` FOREIGN KEY (`warehouse_item_id`) REFERENCES `warehouse_items` (`id`),
  ADD CONSTRAINT `fk_woi_wo` FOREIGN KEY (`warehouse_out_id`) REFERENCES `warehouse_out` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `warehouse_stock_log`
--
ALTER TABLE `warehouse_stock_log`
  ADD CONSTRAINT `fk_wsl_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`) ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `wa_items`
--
ALTER TABLE `wa_items`
  ADD CONSTRAINT `wa_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wa_categories` (`id`);

--
-- Ràng buộc cho bảng `wa_transactions`
--
ALTER TABLE `wa_transactions`
  ADD CONSTRAINT `wa_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `wa_items` (`id`),
  ADD CONSTRAINT `wa_transactions_ibfk_2` FOREIGN KEY (`transacted_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD CONSTRAINT `work_shifts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `wo_processes`
--
ALTER TABLE `wo_processes`
  ADD CONSTRAINT `fk_wop_pc` FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`),
  ADD CONSTRAINT `fk_wop_user` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wop_wi` FOREIGN KEY (`warehouse_in_id`) REFERENCES `warehouse_in` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wop_wii` FOREIGN KEY (`warehouse_in_item_id`) REFERENCES `warehouse_in_items` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

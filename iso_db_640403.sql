-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cgd_iso
CREATE DATABASE IF NOT EXISTS `cgd_iso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cgd_iso`;

-- Dumping structure for table cgd_iso.asset_equipment
CREATE TABLE IF NOT EXISTS `asset_equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ip_address`)),
  `equip_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`service_port`)),
  `equip_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`equip_tags`)),
  `group_id` bigint(20) unsigned NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_equipment_group_id_foreign` (`group_id`),
  CONSTRAINT `asset_equipment_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.asset_equipment: ~0 rows (approximately)
/*!40000 ALTER TABLE `asset_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_equipment` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.asset_people
CREATE TABLE IF NOT EXISTS `asset_people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ip_address`)),
  `people_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `people_type` tinyint(4) NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `people_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`people_tags`)),
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_people_group_id_foreign` (`group_id`),
  CONSTRAINT `asset_people_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.asset_people: ~0 rows (approximately)
/*!40000 ALTER TABLE `asset_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_people` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.documents
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_form_id` bigint(20) unsigned NOT NULL,
  `group_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` smallint(6) NOT NULL,
  `order_no` tinyint(4) NOT NULL,
  `updated_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `documents_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.documents: ~1 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`id`, `request_form_id`, `group_code`, `year`, `order_no`, `updated_date`, `created_at`, `updated_at`) VALUES
	(1, 1, 'SDG1', 2564, 1, '2021-04-02', '2021-04-02 16:26:25', '2021-04-02 16:26:25');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name_short` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_type` tinyint(4) NOT NULL,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ip_address`)),
  `group_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`group_tags`)),
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(38, '2014_10_12_000000_create_users_table', 1),
	(39, '2014_10_12_100000_create_password_resets_table', 1),
	(40, '2019_08_19_000000_create_failed_jobs_table', 1),
	(41, '2021_03_24_140043_create_request_forms_table', 1),
	(42, '2021_03_24_143513_create_request_details_table', 1),
	(43, '2021_04_01_140109_add_relation_request_form_detail', 1),
	(44, '2021_04_01_140447_add_relation_request_detail', 1),
	(45, '2021_04_02_042406_create_documents_table', 1),
	(46, '2021_04_02_102919_create_request_files_table', 2),
	(50, '2021_04_02_182645_create_groups_table', 3),
	(51, '2021_04_02_183113_create_asset_equipment_table', 3),
	(52, '2021_04_02_183256_create_asset_people_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_details
CREATE TABLE IF NOT EXISTS `request_details` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `order` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `request_detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_form_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_details_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `request_details_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
INSERT INTO `request_details` (`id`, `order`, `type`, `request_detail`, `description`, `created_at`, `updated_at`, `request_form_id`) VALUES
	(8, 2, 1, 'การทดสอบที่ 2', NULL, '2021-04-02 09:24:40', '2021-04-02 09:24:40', 1),
	(11, 2, 1, 'dsadasdasd', NULL, '2021-04-02 15:39:12', '2021-04-02 15:39:12', 1);
/*!40000 ALTER TABLE `request_details` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_files
CREATE TABLE IF NOT EXISTS `request_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_form_id` bigint(20) unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_files_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `request_files_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_files: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_files` DISABLE KEYS */;
INSERT INTO `request_files` (`id`, `request_form_id`, `file_name`, `file_title`, `updated_date`, `created_at`, `updated_at`) VALUES
	(20, 1, '1617373817.pdf', 'Refund2.pdf', '2021-04-02', '2021-04-02 14:30:17', '2021-04-02 14:30:17'),
	(21, 1, '1617374162.pdf', 'response4.pdf', '2021-04-02', '2021-04-02 14:36:02', '2021-04-02 14:36:02');
/*!40000 ALTER TABLE `request_files` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_forms
CREATE TABLE IF NOT EXISTS `request_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` smallint(6) NOT NULL,
  `order_no` tinyint(4) DEFAULT NULL,
  `created_date` date NOT NULL,
  `request_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_type` tinyint(4) DEFAULT NULL,
  `request_title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_reason` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`document_relate`)),
  `person_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`person_relate`)),
  `system_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`system_relate`)),
  `env_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`env_impact`)),
  `system_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`system_impact`)),
  `level_impact` tinyint(4) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_forms_user_id_foreign` (`user_id`),
  CONSTRAINT `request_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_forms: ~1 rows (approximately)
/*!40000 ALTER TABLE `request_forms` DISABLE KEYS */;
INSERT INTO `request_forms` (`id`, `group_code`, `year`, `order_no`, `created_date`, `request_no`, `change_type`, `request_title`, `request_reason`, `document_relate`, `person_relate`, `system_relate`, `env_impact`, `system_impact`, `level_impact`, `begin_date`, `end_date`, `begin_time`, `end_time`, `status`, `description`, `updated_date`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 'SDG1', 2564, 0, '2021-03-24', '', 1, 'ทดสอบ', 'ทดสอบนิ', 'null', 'null', 'null', '"3"', 'null', 1, '2021-03-24', '2021-03-27', '08:00:00', '17:00:00', 1, 'ทดสอบ', '2021-04-02', '2021-04-02 04:49:53', '2021-04-02 16:26:25', 1);
/*!40000 ALTER TABLE `request_forms` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ttt', '', NULL, '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cgd_iso
CREATE DATABASE IF NOT EXISTS `cgd_iso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cgd_iso`;

-- Dumping structure for table cgd_iso.asset_equipment
CREATE TABLE IF NOT EXISTS `asset_equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `equip_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `equip_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_equipment_group_id_foreign` (`group_id`),
  CONSTRAINT `asset_equipment_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.asset_equipment: ~2 rows (approximately)
/*!40000 ALTER TABLE `asset_equipment` DISABLE KEYS */;
INSERT INTO `asset_equipment` (`id`, `ip_address`, `equip_name`, `service_port`, `equip_tags`, `group_id`, `description`, `created_at`, `updated_at`) VALUES
	(1, '["10.100.90.17"]', 'e-withdraw-app', '["80","443","9292","3306"]', '["ถอนคืน"]', 1, NULL, '2021-04-13 17:08:22', '2021-04-13 17:08:33'),
	(4, '["1.1.1.1"]', 'CyberArk', '["80"]', '["cyberark"]', 1, NULL, '2021-04-15 09:23:14', '2021-04-15 09:23:14');
/*!40000 ALTER TABLE `asset_equipment` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.asset_people
CREATE TABLE IF NOT EXISTS `asset_people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `people_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `people_type` tinyint(4) NOT NULL,
  `ldap_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `group_id` bigint(20) unsigned NOT NULL,
  `people_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `org_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_people_group_id_foreign` (`group_id`),
  CONSTRAINT `asset_people_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.asset_people: ~0 rows (approximately)
/*!40000 ALTER TABLE `asset_people` DISABLE KEYS */;
INSERT INTO `asset_people` (`id`, `ip_address`, `people_name`, `people_type`, `ldap_name`, `group_id`, `people_tags`, `org_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, '["10.10.31.85"]', 'songwut', 1, 'songwut.saj', 1, '["songwut","secure"]', 'กลุ่มงานรักษาความปลอดภัยสารสนเทศ', NULL, '2021-04-13 19:22:37', '2021-04-13 19:31:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.documents: ~4 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`id`, `request_form_id`, `group_code`, `year`, `order_no`, `updated_date`, `created_at`, `updated_at`) VALUES
	(5, 1, 'SECD', 2564, 1, '2021-04-07', '2021-04-07 07:53:46', '2021-04-07 07:53:46'),
	(6, 12, 'SECD', 2564, 2, '2021-04-16', '2021-04-16 18:12:23', '2021-04-16 18:12:23'),
	(7, 13, 'SECD', 2564, 2, '2021-04-24', '2021-04-24 10:32:04', '2021-04-24 10:32:04'),
	(8, 14, 'SECD', 2564, 2, '2021-04-24', '2021-04-24 17:04:29', '2021-04-24 17:04:29');
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
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `group_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.groups: ~10 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `group_name`, `group_name_short`, `group_type`, `ip_address`, `group_tags`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'กลุ่มงานพัฒนาระบบงาน 1', 'SDG1', 1, '[]', '[]', NULL, '2021-04-13 17:07:46', '2021-04-13 17:07:46'),
	(2, 'กลุ่มงานพัฒนาระบบงาน 2', 'SDG2', 1, '[]', '[]', NULL, '2021-04-13 17:30:31', '2021-04-13 17:30:31'),
	(3, 'กลุ่มงานพัฒนาระบบงาน 3', 'SDG3', 1, '[]', '[]', NULL, '2021-04-13 19:37:25', '2021-04-13 19:37:25'),
	(4, 'กลุ่มงานพัฒนาระบบงาน 4', 'SDG4', 1, '[]', '[]', NULL, '2021-04-13 19:37:43', '2021-04-13 19:37:43'),
	(5, 'กลุ่มงานเครื่องคอมพิวเตอร์', 'COMD', 1, '[]', '[]', NULL, '2021-04-13 19:38:05', '2021-04-13 19:38:57'),
	(6, 'กลุ่มงานเครือข่ายและการสื่อสาร', 'NETD', 1, '[]', '[]', NULL, '2021-04-13 19:38:34', '2021-04-13 19:38:46'),
	(7, 'กลุ่มงานรักษาความปลอดภัยสารสนเทศ', 'SECD', 1, '[]', '[]', NULL, '2021-04-13 19:39:38', '2021-04-13 19:39:38'),
	(8, 'บริษัท โปรเฟชันนอล คอมพิวเตอร์ จำกัด', 'PCC', 2, '[]', '[]', NULL, '2021-04-13 19:40:06', '2021-04-13 19:40:13'),
	(9, 'บริษัท ดราก้อน มูฟ จำกัด', 'DRAM', 2, '[]', '[]', NULL, '2021-04-13 19:41:01', '2021-04-13 19:41:01'),
	(10, 'ศูนย์เทคโนโลยีสารสนเทศและการสื่อสาร', 'ITC', 1, '[]', '["ศทส","ผอ"]', NULL, '2021-04-24 18:08:22', '2021-04-24 18:08:22');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.migrations: ~22 rows (approximately)
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
	(52, '2021_04_02_183256_create_asset_people_table', 3),
	(53, '2021_04_14_072551_create_policies_table', 4),
	(54, '2021_04_14_072613_create_policy_details_table', 4),
	(56, '2021_04_16_014153_create_user_details_table', 5),
	(57, '2021_04_16_083921_add_column_group_id_to_request_forms', 6),
	(60, '2021_04_17_171552_create_request_policy_details_table', 7),
	(61, '2016_06_01_000001_create_oauth_auth_codes_table', 8),
	(62, '2016_06_01_000002_create_oauth_access_tokens_table', 8),
	(63, '2016_06_01_000003_create_oauth_refresh_tokens_table', 8),
	(64, '2016_06_01_000004_create_oauth_clients_table', 8),
	(65, '2016_06_01_000005_create_oauth_personal_access_clients_table', 8),
	(66, '2014_10_12_200000_add_two_factor_columns_to_users_table', 9),
	(67, '2021_04_24_063719_create_request_statuses_table', 10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_personal_access_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

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

-- Dumping structure for table cgd_iso.policies
CREATE TABLE IF NOT EXISTS `policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `policy_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_date` date DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policies_group_id_foreign` (`group_id`),
  CONSTRAINT `policies_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policies: ~4 rows (approximately)
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` (`id`, `group_id`, `policy_name`, `updated_date`, `description`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ทดสอบ111', '2021-04-15', '', 'songwut.saj', NULL, '2021-04-15 15:42:50'),
	(5, 1, 'policy firewall สำหรับระบบถอนคืน', '2021-04-16', NULL, 'songwut.saj', '2021-04-14 12:27:23', '2021-04-16 01:20:55'),
	(9, 1, 'vpn กลุ่ม secure', '2021-04-16', NULL, 'songwut.saj', '2021-04-15 09:21:39', '2021-04-16 01:21:03'),
	(10, 1, 'Policy Firewall สำหรับระบบ eGP', '2021-04-23', NULL, 'songwut.saj', '2021-04-23 01:39:15', '2021-04-23 01:39:15');
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.policy_details
CREATE TABLE IF NOT EXISTS `policy_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `policy_id` bigint(20) unsigned NOT NULL,
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `destination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_details_policy_id_foreign` (`policy_id`),
  CONSTRAINT `policy_details_policy_id_foreign` FOREIGN KEY (`policy_id`) REFERENCES `policies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policy_details: ~6 rows (approximately)
/*!40000 ALTER TABLE `policy_details` DISABLE KEYS */;
INSERT INTO `policy_details` (`id`, `policy_id`, `source`, `destination`, `service_port`, `updated_date`, `tags`, `created_at`, `updated_at`) VALUES
	(3, 1, '[{"code":"equip_1","asset":"e-withdraw-app","ldap":"","ip_address":["10.100.90.17"],"tags":["ถอนคืน"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292"]', '2021-04-15', NULL, '2021-04-15 09:08:48', '2021-04-15 09:08:48'),
	(4, 1, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80"]', '2021-04-15', NULL, '2021-04-15 09:10:28', '2021-04-15 09:10:28'),
	(5, 5, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292","3306"]', '2021-04-15', NULL, '2021-04-15 09:13:57', '2021-04-15 09:13:57'),
	(6, 9, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80","443","9292","3306"]', '2021-04-15', NULL, '2021-04-15 09:22:00', '2021-04-15 09:22:00'),
	(7, 9, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]},{"code":"equip_2","asset":"CyberArk","ip_address":["1.1.1.1"],"service_port":["80"],"tags":["cyberark"]}]', '["80"]', '2021-04-15', NULL, '2021-04-15 09:23:59', '2021-04-15 09:23:59'),
	(9, 10, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_2","asset":"CyberArk","ip_address":["1.1.1.1"],"service_port":["80"],"tags":["cyberark"]}]', '["80"]', '2021-04-23', '[]', '2021-04-23 01:47:15', '2021-04-23 01:47:15');
/*!40000 ALTER TABLE `policy_details` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_details
CREATE TABLE IF NOT EXISTS `request_details` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `request_detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_form_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_details_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `request_details_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_details: ~7 rows (approximately)
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
INSERT INTO `request_details` (`id`, `type`, `request_detail`, `description`, `created_at`, `updated_at`, `request_form_id`) VALUES
	(8, 1, 'ขอเปลี่ยนอุปกรณ์ Loadbalance ยี่ห้อ cisco', NULL, '2021-04-02 09:24:40', '2021-04-02 09:24:40', 1),
	(12, 1, 'ขอใช้ VLAN ของ IP 192.168.1.63 ในห้องประชุม', NULL, '2021-04-07 07:35:06', '2021-04-07 07:35:06', 4),
	(14, 1, 'การเปลี่ยนอุปกรณ์ core switch', NULL, '2021-04-16 18:11:53', '2021-04-16 18:11:53', 12),
	(28, 1, 'ขอใช้ VLAN ของ IP 192.168.1.63 ในห้องประชุม dsd', NULL, '2021-04-22 12:49:48', '2021-04-22 15:07:40', 13),
	(33, 2, 'ทดสอบ111', NULL, '2021-04-22 15:15:36', '2021-04-22 15:15:36', 13),
	(34, 2, 'policy firewall สำหรับระบบถอนคืน', NULL, '2021-04-22 15:15:37', '2021-04-22 15:15:37', 13),
	(36, 2, 'vpn กลุ่ม secure', NULL, '2021-04-24 17:04:01', '2021-04-24 17:04:01', 14);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `request_files` DISABLE KEYS */;
INSERT INTO `request_files` (`id`, `request_form_id`, `file_name`, `file_title`, `updated_date`, `created_at`, `updated_at`) VALUES
	(25, 12, '1618596714.pdf', 'Refund.pdf', '2021-04-16', '2021-04-16 18:11:54', '2021-04-16 18:11:54');
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
  `document_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `person_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `system_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `env_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `system_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
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
  `group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_forms_user_id_foreign` (`user_id`),
  KEY `request_forms_group_id_foreign` (`group_id`),
  CONSTRAINT `request_forms_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `request_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_forms: ~4 rows (approximately)
/*!40000 ALTER TABLE `request_forms` DISABLE KEYS */;
INSERT INTO `request_forms` (`id`, `group_code`, `year`, `order_no`, `created_date`, `request_no`, `change_type`, `request_title`, `request_reason`, `document_relate`, `person_relate`, `system_relate`, `env_impact`, `system_impact`, `level_impact`, `begin_date`, `end_date`, `begin_time`, `end_time`, `status`, `description`, `updated_date`, `created_at`, `updated_at`, `user_id`, `group_id`) VALUES
	(12, 'SECD', 2564, 2, '2021-04-16', 'SECD-2564/002', 1, 'การขอเปลี่ยนแปลงอุปกรณ์เครือข่ายสำหรับระบบ eGP', 'ทดสอบการแก้ไขระบบ', '[]', '["ทรงวุฒิ"]', '[{"value":5,"text":"Network"}]', '[1,2]', '["egp"]', 1, '2021-04-16', '2021-04-17', '08:30:00', '17:00:00', 8, NULL, '2021-04-16', '2021-04-16 18:09:12', '2021-04-24 16:54:24', 1, 1),
	(13, 'SECD', 2564, 2, '2021-04-16', 'SECD-2564/002', 1, 'ขอเปิด policy firewall สำหรับกลุ่มงาน security', 'ทดสอบการใช้งานระบบ', '[]', '[]', '[]', '[1,2,3]', '[]', 1, '2021-04-16', '2021-04-30', NULL, NULL, 7, NULL, '2021-04-24', '2021-04-16 18:14:03', '2021-04-24 16:39:37', 1, 1),
	(14, 'SECD', 2564, 2, '2021-04-23', 'SECD-2564/002', 1, 'การต่ออายุ Policy Firewall สำหรับเจ้าหน้าที่ บ.PCC', 'เพื่อพัฒนา ดูแลระบบ eGP', '[]', '[]', '[]', '[1]', '[]', 1, '2021-04-23', '2021-04-30', NULL, NULL, 8, NULL, '2021-04-24', '2021-04-23 01:36:41', '2021-04-24 17:08:16', 1, 1),
	(15, 'SECD', 2564, 0, '2021-04-24', NULL, 0, 'การขอให้ VLAN ในห้องประชุม ศทส.', 'เพื่อตรวจรับโครงการ', '[]', '[]', '[]', '[]', '[]', 1, '2021-04-24', NULL, NULL, NULL, 0, NULL, '2021-04-24', '2021-04-24 13:18:12', '2021-04-24 13:18:12', 1, 1);
/*!40000 ALTER TABLE `request_forms` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_policy_details
CREATE TABLE IF NOT EXISTS `request_policy_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_detail_id` smallint(5) unsigned NOT NULL,
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`source`)),
  `destination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`destination`)),
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`service_port`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_policy_details_request_detail_id_foreign` (`request_detail_id`),
  CONSTRAINT `request_policy_details_request_detail_id_foreign` FOREIGN KEY (`request_detail_id`) REFERENCES `request_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_policy_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `request_policy_details` DISABLE KEYS */;
INSERT INTO `request_policy_details` (`id`, `request_detail_id`, `source`, `destination`, `service_port`, `tags`, `created_at`, `updated_at`) VALUES
	(16, 33, '[{"code":"equip_1","asset":"e-withdraw-app","ldap":"","ip_address":["10.100.90.17"],"tags":["ถอนคืน"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292"]', NULL, '2021-04-22 15:15:36', '2021-04-22 15:15:36'),
	(17, 33, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80"]', NULL, '2021-04-22 15:15:36', '2021-04-22 15:15:36'),
	(18, 34, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292","3306"]', NULL, '2021-04-22 15:15:37', '2021-04-22 15:15:37'),
	(21, 36, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80","443","9292","3306"]', NULL, '2021-04-24 17:04:02', '2021-04-24 17:04:02'),
	(22, 36, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]},{"code":"equip_2","asset":"CyberArk","ip_address":["1.1.1.1"],"service_port":["80"],"tags":["cyberark"]}]', '["80"]', NULL, '2021-04-24 17:04:02', '2021-04-24 17:04:02');
/*!40000 ALTER TABLE `request_policy_details` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_statuses
CREATE TABLE IF NOT EXISTS `request_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_form_id` bigint(20) unsigned NOT NULL,
  `ensure_status` tinyint(4) DEFAULT NULL,
  `ensure_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ensure_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ensure_date` date DEFAULT NULL,
  `consider_status` tinyint(4) DEFAULT NULL,
  `forward_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`forward_to`)),
  `consider_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consider_date` date DEFAULT NULL,
  `consider_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_status` tinyint(4) DEFAULT NULL,
  `approve_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `approve_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operate_status` tinyint(4) DEFAULT NULL,
  `operate_date` date DEFAULT NULL,
  `operator_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operate_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operate_save_date` date DEFAULT NULL,
  `operate_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow_status` tinyint(4) DEFAULT NULL,
  `follow_impact` tinyint(4) DEFAULT NULL,
  `follow_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow_date` date DEFAULT NULL,
  `follow_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_status` tinyint(4) DEFAULT NULL,
  `check_detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_date` date DEFAULT NULL,
  `check_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_statuses_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `request_statuses_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_statuses: ~3 rows (approximately)
/*!40000 ALTER TABLE `request_statuses` DISABLE KEYS */;
INSERT INTO `request_statuses` (`id`, `request_form_id`, `ensure_status`, `ensure_detail`, `ensure_by`, `ensure_date`, `consider_status`, `forward_to`, `consider_detail`, `consider_date`, `consider_by`, `approve_status`, `approve_detail`, `approve_date`, `approve_by`, `operate_status`, `operate_date`, `operator_name`, `operate_detail`, `operate_save_date`, `operate_by`, `follow_status`, `follow_impact`, `follow_detail`, `follow_date`, `follow_by`, `check_status`, `check_detail`, `check_date`, `check_by`, `created_at`, `updated_at`) VALUES
	(1, 13, 1, 'test', 'songwut.saj', '2021-04-24', 2, '[1,3]', 'asdas', '2021-04-24', 'songwut.saj', 1, 'test', '2021-04-24', 'songwut.saj', 1, '2021-04-24', 'asdas', 'sasdasd', '2021-04-24', 'songwut.saj', 1, 1, 'gfgsdfg', '2021-04-24', 'songwut.saj', NULL, NULL, NULL, NULL, '2021-04-24 10:32:04', '2021-04-24 16:39:37'),
	(2, 12, 1, 'aaaaaa', 'songwut.saj', '2021-04-24', 1, '[4]', 'xxx', '2021-04-24', 'songwut.saj', NULL, NULL, NULL, NULL, 1, '2021-04-21', 'กกกกก', 'fsdf', '2021-04-24', 'songwut.saj', 1, 0, NULL, '2021-04-24', 'songwut.saj', 1, 'tetstat', '2021-04-24', 'songwut.saj', NULL, '2021-04-24 16:54:24'),
	(3, 14, 1, 'ok', 'songwut.saj', '2021-04-24', 2, '[8]', NULL, '2021-04-24', 'songwut.saj', 1, NULL, '2021-04-24', 'songwut.saj', 1, '2021-04-24', 'testttt', NULL, '2021-04-24', 'songwut.saj', 1, 1, NULL, '2021-04-24', 'songwut.saj', 1, NULL, '2021-04-24', 'songwut.saj', '2021-04-24 17:04:29', '2021-04-24 17:08:16');
/*!40000 ALTER TABLE `request_statuses` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ttt', '', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(3, 'newton', 'r', NULL, 'a', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.user_details
CREATE TABLE IF NOT EXISTS `user_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ldap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`roles`)),
  `last_logon` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_group_id_foreign` (`group_id`),
  CONSTRAINT `user_details_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.user_details: ~48 rows (approximately)
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` (`id`, `ldap`, `firstname`, `lastname`, `group_id`, `roles`, `last_logon`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'korawan.kit', 'กรวรรณ', 'กิตติวรกาญจน์', 1, '["request","follow"]', NULL, 1, NULL, '2021-04-24 17:57:34'),
	(2, 'kitikun.jon', 'กิติคุณ', 'จงเสรีกิจ', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(3, 'thannicha.cho', 'ธัญณิชา', 'ชูมี', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(4, 'nunthawan.sae', 'นันทวรรณ', 'แสงบุญมาก', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(5, 'parisa.rat', 'ปริษา', 'รัตนโรจน์', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(6, 'porntip.bea', 'พรทิพย์', 'เบี้ยวทุ่งน้อย', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(7, 'worrawit.klu', 'วรวิทย์', 'คลังแสง', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(8, 'anintisa.tha', 'อนินทิศา', 'ไทยบัณฑิตย์', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(9, 'isarapong.pro', 'อิศราพงษ์', 'พรหมประเทศ', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(10, 'jettarin.tud', 'เจตรินทร์', 'ทัดปากน้ำ', 1, '["request","follow"]', NULL, 1, NULL, NULL),
	(11, 'thitiporn.kra', 'ฐิติพร', 'กระสาทอง', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(12, 'thawiwan.aph', 'ทวิวัลย์', 'ศรีศิล', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(13, 'phanawat.eka', 'ปณวรรธ', 'เอกชลธ์', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(14, 'pradasak.pho', 'ประดาศักดิ์', 'ภูมิกระจ่าง', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(15, 'piyanudda.mee', 'ปิยนัดดา', 'มีศรี', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(16, 'rabhibon.jin', 'รพีพร', 'จินะ', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(17, 'rattiporn.kan', 'รัฐฏิพร', 'กัลณา', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(18, 'rattanaporn.uss', 'รัตนาภรณ์', 'อัศวนุภาพ', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(19, 'supachai.udo', 'ศุภชัย', 'อุดมเจริญศิลป์', 2, '["request","follow"]', NULL, 1, NULL, NULL),
	(20, 'kannika.jea', 'กรรณิการ์', 'เจียมพุก', 3, '["request","follow"]', NULL, 1, NULL, NULL),
	(21, 'tanawut.chu', 'ธนาวุฒิ', 'จุลเลศ', 3, '["request","follow"]', NULL, 1, NULL, NULL),
	(22, 'lalit.jan', 'ลลิต', 'จันทนะมาฬะกะ', 3, '["request","follow"]', NULL, 1, NULL, NULL),
	(23, 'oraya.sum', 'อรญา', 'สุโมตยกุล', 3, '["request","follow"]', NULL, 1, NULL, NULL),
	(24, 'thiti.kun', 'ฐิติ', 'คุณาวุฒิตระกูล', 4, '["request","follow"]', NULL, 1, NULL, NULL),
	(25, 'boontariga.yim', 'บุญฑริกา', 'ยิ้มศิริวัฒนะ', 4, '["request","follow"]', NULL, 1, NULL, NULL),
	(26, 'pongsathorn.ant', 'พงศธร', 'อันตะริกานนท์', 4, '["request","follow"]', NULL, 1, NULL, NULL),
	(27, 'vulapa.nut', 'วัลภา', 'นุตโร', 4, '["request","follow"]', NULL, 1, NULL, NULL),
	(28, 'densakda.tub', 'เด่นศักดิ์ดา', 'ทับทิม', 4, '["request","follow"]', NULL, 1, NULL, NULL),
	(29, 'janjarus.dan', 'จันทร์จรัส', 'แดงเอียด', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(30, 'nareepat.sar', 'นรีพัฒน์', 'สาระทรัพย์', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(31, 'nartnapha.pho', 'นาฏนภา', 'พรสิริญาดา', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(32, 'pisate.cha', 'พิเศษ', 'ไชยจิตร', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(33, 'hatsada.phr', 'หัสดา', 'พฤฒาจารย์บดี', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(34, 'adisorn.kar', 'อดิศร', 'กาญจโน', 5, '["request","follow"]', NULL, 1, NULL, NULL),
	(35, 'jantharat.ink', 'จันทรัชต์', 'อินทร์แก้ว', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(36, 'jittawut.fak', 'จิตตวุฒิ', 'ฟักอ่อน', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(37, 'chit.tho', 'ชิต', 'โต๊ะยียา', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(38, 'nutthapong.non', 'ณฐพงศ์', 'นนท์ธีระเวคิน', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(39, 'terapat.tan', 'ธีรภัทร', 'ธัญลักษณ์เดโช', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(40, 'prapad.aud', 'ประพัทธ์', 'อุดหนุน', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(41, 'prareeya.tha', 'ปรารีย์ญาณ์', 'ธนศักดิ์สกุล', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(42, 'pransaeng.sir', 'พันแสง', 'ศิริเพ็ง', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(43, 'vipat.kri', 'วิพัฒน์', 'ไกรเกียรติสกุล', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(44, 'paiboon.kit', 'ไพบูลย์', 'กิจจารึก', 6, '["request","follow"]', NULL, 1, NULL, NULL),
	(45, 'chanathip.kea', 'ชนาธิป', 'แก้วเนิน', 7, '["request","follow","admin","check","consider","operation"]', NULL, 1, NULL, '2021-04-24 18:06:17'),
	(46, 'songwut.saj', 'ทรงวุฒิ', 'สัจจบุตร', 7, '["request","follow","admin","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:06:04'),
	(47, 'siriluk.sir', 'ศิริลักษณ์', 'ศิริมังคลา', 7, '["request","follow","admin","ensure","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:05:56'),
	(64, 'sudjid.lap', 'สุดจิตร', 'ลาภเลิศสุข', 10, '["approve"]', NULL, 1, '2021-04-24 18:08:51', '2021-04-24 18:08:51');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

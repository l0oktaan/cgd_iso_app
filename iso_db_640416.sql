-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
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
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `equip_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `equip_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
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
REPLACE INTO `asset_equipment` (`id`, `ip_address`, `equip_name`, `service_port`, `equip_tags`, `group_id`, `description`, `created_at`, `updated_at`) VALUES
	(1, '["10.100.90.17"]', 'e-withdraw-app', '["80","443","9292","3306"]', '["ถอนคืน"]', 1, NULL, '2021-04-13 17:08:22', '2021-04-13 17:08:33'),
	(4, '["1.1.1.1"]', 'CyberArk', '["80"]', '["cyberark"]', 1, NULL, '2021-04-15 09:23:14', '2021-04-15 09:23:14');
/*!40000 ALTER TABLE `asset_equipment` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.asset_people
CREATE TABLE IF NOT EXISTS `asset_people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `people_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `people_type` tinyint(4) NOT NULL,
  `ldap_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `group_id` bigint(20) unsigned NOT NULL,
  `people_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
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
REPLACE INTO `asset_people` (`id`, `ip_address`, `people_name`, `people_type`, `ldap_name`, `group_id`, `people_tags`, `org_name`, `description`, `created_at`, `updated_at`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.documents: ~0 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
REPLACE INTO `documents` (`id`, `request_form_id`, `group_code`, `year`, `order_no`, `updated_date`, `created_at`, `updated_at`) VALUES
	(5, 1, 'SECD', 2564, 1, '2021-04-07', '2021-04-07 07:53:46', '2021-04-07 07:53:46');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `group_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.groups: ~9 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
REPLACE INTO `groups` (`id`, `group_name`, `group_name_short`, `group_type`, `ip_address`, `group_tags`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'กลุ่มงานรักษาความปลอดภัยสารสนเทศ', 'SECD', 1, '["10.10.31.85","10.10.31.124"]', '["secure","SECD"]', NULL, '2021-04-13 17:07:46', '2021-04-13 17:07:46'),
	(2, 'ดราก้อน มู้ฟ', 'DRGM', 2, '[]', '["dragons move"]', NULL, '2021-04-13 17:30:31', '2021-04-13 17:30:31'),
	(3, 'กลุ่มงานพัฒนาระบบงาน 1', 'SDG1', 1, '[]', '["กลุ่ม 1"]', NULL, '2021-04-13 19:37:25', '2021-04-13 19:37:25'),
	(4, 'กลุ่มงานพัฒนาระบบงาน 2', 'SDG2', 1, '[]', '["กลุ่ม 2"]', NULL, '2021-04-13 19:37:43', '2021-04-13 19:37:43'),
	(5, 'กลุ่มงานพัฒนาระบบงาน 3', 'SDG3', 1, '[]', '["SDG3"]', NULL, '2021-04-13 19:38:05', '2021-04-13 19:38:57'),
	(6, 'กลุ่มงานพัฒนาระบบงาน 4', 'SDG4', 1, '[]', '["SDG4"]', NULL, '2021-04-13 19:38:34', '2021-04-13 19:38:46'),
	(7, 'กลุ่มงานเครื่องคอมพิวเตอร์', 'COMD', 1, '[]', '["COMD"]', NULL, '2021-04-13 19:39:38', '2021-04-13 19:39:38'),
	(8, 'กลุ่มงานเครือข่ายและการสื่อสาร', 'NETD', 1, '[]', '["NETD"]', NULL, '2021-04-13 19:40:06', '2021-04-13 19:40:13'),
	(9, 'บริษัท โปรเฟชันนอล คอมพิวเตอร์ จำกัด', 'PCC', 2, '[]', '["PCC"]', NULL, '2021-04-13 19:41:01', '2021-04-13 19:41:01');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.migrations: ~16 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
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
	(57, '2021_04_16_083921_add_column_group_id_to_request_forms', 6);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policies: ~3 rows (approximately)
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
REPLACE INTO `policies` (`id`, `group_id`, `policy_name`, `updated_date`, `description`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ทดสอบ111', '2021-04-15', '', 'songwut.saj', NULL, '2021-04-15 15:42:50'),
	(5, 1, 'policy firewall สำหรับระบบถอนคืน', '2021-04-16', NULL, 'songwut.saj', '2021-04-14 12:27:23', '2021-04-16 01:20:55'),
	(9, 1, 'vpn กลุ่ม secure', '2021-04-16', NULL, 'songwut.saj', '2021-04-15 09:21:39', '2021-04-16 01:21:03');
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.policy_details
CREATE TABLE IF NOT EXISTS `policy_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `policy_id` bigint(20) unsigned NOT NULL,
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `destination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `updated_date` date DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_details_policy_id_foreign` (`policy_id`),
  CONSTRAINT `policy_details_policy_id_foreign` FOREIGN KEY (`policy_id`) REFERENCES `policies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policy_details: ~6 rows (approximately)
/*!40000 ALTER TABLE `policy_details` DISABLE KEYS */;
REPLACE INTO `policy_details` (`id`, `policy_id`, `source`, `destination`, `service_port`, `updated_date`, `tags`, `created_at`, `updated_at`) VALUES
	(1, 1, '[{"code":"eqip_1","asset":"app","ip_address":["10","20"]}]', '[{"code":"eqip_1","asset":"app","ip_address":["10","20"]}]', '["80"]', '2021-04-15', '["add->db"]', NULL, '2021-04-15 15:20:18'),
	(3, 1, '[{"code":"equip_1","asset":"e-withdraw-app","ldap":"","ip_address":["10.100.90.17"],"tags":["ถอนคืน"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292"]', '2021-04-15', NULL, '2021-04-15 09:08:48', '2021-04-15 09:08:48'),
	(4, 1, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80"]', '2021-04-15', NULL, '2021-04-15 09:10:28', '2021-04-15 09:10:28'),
	(5, 5, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["443","9292","3306"]', '2021-04-15', NULL, '2021-04-15 09:13:57', '2021-04-15 09:13:57'),
	(6, 9, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]}]', '["80","443","9292","3306"]', '2021-04-15', NULL, '2021-04-15 09:22:00', '2021-04-15 09:22:00'),
	(7, 9, '[{"code":"people_1","asset":"songwut","ldap":"songwut.saj","ip_address":["10.10.31.85"],"tags":["songwut","secure"]}]', '[{"code":"equip_1","asset":"e-withdraw-app","ip_address":["10.100.90.17"],"service_port":["80","443","9292","3306"],"tags":["ถอนคืน"]},{"code":"equip_2","asset":"CyberArk","ip_address":["1.1.1.1"],"service_port":["80"],"tags":["cyberark"]}]', '["80"]', '2021-04-15', NULL, '2021-04-15 09:23:59', '2021-04-15 09:23:59');
/*!40000 ALTER TABLE `policy_details` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_details
CREATE TABLE IF NOT EXISTS `request_details` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `request_detail` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_form_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_details_request_form_id_foreign` (`request_form_id`),
  CONSTRAINT `request_details_request_form_id_foreign` FOREIGN KEY (`request_form_id`) REFERENCES `request_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
REPLACE INTO `request_details` (`id`, `type`, `request_detail`, `description`, `created_at`, `updated_at`, `request_form_id`) VALUES
	(8, 1, 'ขอเปลี่ยนอุปกรณ์ Loadbalance ยี่ห้อ cisco', NULL, '2021-04-02 09:24:40', '2021-04-02 09:24:40', 1),
	(12, 1, 'ขอใช้ VLAN ของ IP 192.168.1.63 ในห้องประชุม', NULL, '2021-04-07 07:35:06', '2021-04-07 07:35:06', 4);
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

-- Dumping data for table cgd_iso.request_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `request_files` DISABLE KEYS */;
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
  `document_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `person_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `system_relate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `env_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `system_impact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `level_impact` tinyint(4) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_forms: ~0 rows (approximately)
/*!40000 ALTER TABLE `request_forms` DISABLE KEYS */;
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

-- Dumping data for table cgd_iso.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ttt', '', NULL, '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.user_details
CREATE TABLE IF NOT EXISTS `user_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ldap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `roles` json DEFAULT NULL,
  `last_logon` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_group_id_foreign` (`group_id`),
  CONSTRAINT `user_details_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.user_details: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
REPLACE INTO `user_details` (`id`, `ldap`, `firstname`, `lastname`, `group_id`, `roles`, `last_logon`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'songwut.saj', 'ทรงวุฒิ', 'สัจจบุตร', 1, '["admin"]', NULL, 1, '2021-04-16 03:37:43', '2021-04-16 03:38:12'),
	(2, 'chanathip.kea', 'ชนาธิป', 'แก้วเนิน', 1, '["admin", "request", "consider", "check"]', NULL, 1, '2021-04-16 06:44:32', '2021-04-16 07:02:43'),
	(3, 'siriluk.sir', 'ศิริลักษณ์', 'ศิริมังคลา', 1, '["request", "admin", "ensure", "consider", "operation", "follow", "check"]', NULL, 1, '2021-04-16 07:00:35', '2021-04-16 07:03:48'),
	(4, 'juntharat.ink', 'จันทรัชต์', 'อินทร์แก้ว', 8, '["request", "operation", "follow"]', NULL, 0, '2021-04-16 07:05:09', '2021-04-16 08:32:13');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

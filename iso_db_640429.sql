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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.documents: ~4 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`id`, `request_form_id`, `group_code`, `year`, `order_no`, `updated_date`, `created_at`, `updated_at`) VALUES
	(5, 1, 'SECD', 2564, 1, '2021-04-07', '2021-04-07 07:53:46', '2021-04-07 07:53:46'),
	(6, 12, 'SECD', 2564, 2, '2021-04-16', '2021-04-16 18:12:23', '2021-04-16 18:12:23'),
	(7, 13, 'SECD', 2564, 2, '2021-04-24', '2021-04-24 10:32:04', '2021-04-24 10:32:04'),
	(8, 14, 'SECD', 2564, 2, '2021-04-24', '2021-04-24 17:04:29', '2021-04-24 17:04:29'),
	(9, 15, 'SECD', 2564, 2, '2021-04-27', '2021-04-27 16:44:31', '2021-04-27 16:44:31');
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

-- Dumping data for table cgd_iso.migrations: ~21 rows (approximately)
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

-- Dumping data for table cgd_iso.oauth_access_tokens: ~5 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0c9ca42a4eb960ed5bdc8fb467d329ee824f991c1a48b0fc95e3578e7132a75c15ea4040b0123597', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:06:16', '2021-04-28 17:06:16', '2021-04-29 17:06:16'),
	('11fe3c8da0ea1eca0e3a3611d2630c07cc4784dc80cf6819c8f84790f4be27c58a1fa3b560ab18c1', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:40:48', '2021-04-28 14:40:48', '2022-04-28 14:40:48'),
	('13f4306cd259e93bc87cd9cd7614eddcf2ddb80c9fa5716b9494187f996f04e828ed2ea57932cd46', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:54:10', '2021-04-28 14:54:10', '2022-04-28 14:54:10'),
	('1787f033ca78135105e46bcbb5bdb51f38cc61660f958e5b0b45b1adb564fb981cf6e3c9cf14c199', 4, 1, 'LaravelAuthApp', '[]', 0, '2021-04-28 13:32:34', '2021-04-28 13:32:34', '2022-04-28 13:32:34'),
	('1a6bfddae6609e5753b7cc3e8f99c385acac47c9caf63b9a9e1a630021db7dfd9f121754573cc4c6', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:46:25', '2021-04-28 16:46:25', '2021-04-29 16:46:25'),
	('222c6eb2ad5f07e633082266a5633fb6be87f7f905746426a5c529120ab747b2da7002a8253758ba', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:56:44', '2021-04-28 14:56:44', '2021-10-28 14:56:44'),
	('3a3d6cf61be056c00ddac05758bd81d1866880df35dbda01dc84de58cfac043c71a64c508a1d3e91', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:19:15', '2021-04-28 15:19:15', '2021-04-29 15:19:15'),
	('3b666f0c03d8e6a43b03e0506f037bcc3db397c5cfa8116d4661e3e3453b6bee6092be819162c233', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:32:55', '2021-04-28 16:32:55', '2021-04-29 16:32:55'),
	('40a254822e14ac39526ac282b7bbd6dbbec58793d97e5c91efbf27256bd676d6c9583921ebdc8509', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:42:04', '2021-04-28 14:42:04', '2022-04-28 14:42:04'),
	('4545730248310767b5661a4ceb00d2a6120704ee88509badf22399b19969c3fe5937af843f26dfb4', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:39:03', '2021-04-28 16:39:03', '2021-04-29 16:39:02'),
	('463fa9e1ba82e8012dcab62f062b80d8ccf3bea224ee62e6e733b80548cfe3908da365321f6aec2c', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:38:16', '2021-04-28 16:38:16', '2021-04-29 16:38:16'),
	('4e3e045fd8bcac164944e087e2debc3c3913e0884bd37c6ec290eb2da4340efcf7b1999008eca6ae', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:44:36', '2021-04-28 16:44:36', '2021-04-29 16:44:35'),
	('5359ad4426adaf2e670ae0f3792bf4a6dd77ec620ef1911d5dba7838c079aef8a8d61ec315ee0452', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:48:29', '2021-04-28 16:48:29', '2021-04-29 16:48:29'),
	('54502409860b6ae099c1c3c50e973acd4c483d62e17fa32275591ad840e243ad405aa05a2e42f194', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:50:59', '2021-04-28 14:50:59', '2022-04-28 14:50:59'),
	('56733ba0eb4e67c31cdbf33150860e1294bd0ff005cfe6f91951153544e80b7bcd676d7ad88688de', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:36:03', '2021-04-28 16:36:03', '2021-04-29 16:36:03'),
	('59398e3301fd0fa13174043de7bafa4e3e69ab7bc3eab71a6acda2850eb0940a23bfdab6e0dce896', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:41:55', '2021-04-28 16:41:55', '2021-04-29 16:41:55'),
	('6543fac9542effcb7c94d9e9b67c271d3a274994fa3de0cedbfe243a664ba46cc0daf8a627fa35eb', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:58:45', '2021-04-28 16:58:45', '2021-04-29 16:58:45'),
	('70468c1d78e5c75703c76cd7603c354273e83d48e7e7da4932959f327030be83d769fc04da8491f0', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:02:28', '2021-04-28 17:02:28', '2021-04-29 17:02:28'),
	('750f13414b41945725100a09203e201e1e4a75693b0f9bfca783f0cbe777e399283c786d5ca33191', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:30:34', '2021-04-28 14:30:34', '2022-04-28 14:30:34'),
	('758bc8003e50cd2707370c66f1b138ee3cb10818ab79772a71d4aebfc876938216dea9fb9ebbf1d1', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:07:30', '2021-04-28 17:07:30', '2021-04-29 17:07:30'),
	('84f0cc0a7cbe0fe9cd49d1a0f054efe581ef9d8818833ddc1e03a812bf91a28b7e144e9244ae4dc2', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:45:13', '2021-04-28 16:45:13', '2021-04-29 16:45:13'),
	('9279c360b042fdb75b63007deb24edb62df248f04fadbd4679d4d546f9ef9c0f49d34aa77b268e2a', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:29:37', '2021-04-28 14:29:37', '2022-04-28 14:29:37'),
	('9488dfa866b21211b4b85e2dd21ab4403d21122f5d6b34839ddaebda18d01710987a8a0e500ac173', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:31:20', '2021-04-28 16:31:20', '2021-04-29 16:31:20'),
	('96442aa1605f2b7a5f3c828b73d4cc9737fd4b966a5948fbe661429753c2778b0cdaf29c6fef1a65', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:19:23', '2021-04-28 15:19:23', '2021-04-29 15:19:23'),
	('b7ee0033b2441c3f97c0a4ce3a4690eb796d73a338407963eb98786c3183268ee2685f2c25753226', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:45:33', '2021-04-28 16:45:33', '2021-04-29 16:45:33'),
	('b9cac02008478e5ef3ea239f557282a7f4d60f064499512612cd1406de3d00f0f13a7f8840bacb05', 5, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:00:56', '2021-04-28 14:00:56', '2022-04-28 14:00:56'),
	('baa7f1f9cad860e7adedd09d9dc30f62ad1fc8383e9f3f32e424d29048c41383c21697bc2383c54a', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:36:34', '2021-04-28 16:36:34', '2021-04-29 16:36:34'),
	('bcf93ed74385decc0e4a34654300aa22be420915ba40c7b3be1b14f9ff46f1963ad2ebafda642fad', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:44:09', '2021-04-28 16:44:09', '2021-04-29 16:44:09'),
	('c6bbd1a461ecc73cb4f566dac3766f1305c7ffe43c15190b418c5314def8da7d3ddcb5e8f1b80ef3', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:22:37', '2021-04-28 17:22:37', '2021-04-29 17:22:37'),
	('d0ab3d2bb909e0e6cb8e178c93dc61fdc632e05ae036ad06b4b432f9b7405576c2cdca925baa9d3c', 13, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:21:00', '2021-04-28 15:21:00', '2021-04-29 15:20:59'),
	('d2cf80a8c1d7860f2f8313ac571a0eaed0a6ed5f3589a3788e01d36d9b826266acdb78ea94c4ad4f', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:51:01', '2021-04-28 16:51:01', '2021-04-29 16:51:01'),
	('d639e2f59e16b15e82e19b7ea00e9b4faf0b79959b7d3572401067fede150ba6baf44b426f2a9fc9', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:57:37', '2021-04-28 14:57:37', '2021-04-29 14:57:37'),
	('da9d56a9a30ffaf7b9b13b7e31fbc3130bd6b25d9221f722d9bfca18702e21fb1e15bbc8b336a21e', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:57:38', '2021-04-28 16:57:38', '2021-04-29 16:57:37'),
	('db19ed6625d383fd461b3ec2ea309b9bde4342aa4883ada47a38b2478f6e0a9dd37702ed5fc7862c', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:55:54', '2021-04-28 16:55:54', '2021-04-29 16:55:54'),
	('dce1a4a27755fd72eedf8a7e42a2367d1885d1423122f557005fa847015e757e76309f1e842c7811', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:47:09', '2021-04-28 16:47:09', '2021-04-29 16:47:08'),
	('e84768a21bb586ea60460fefd06fa29524a680ff62192b9bf2a4b8723d83cc516ede8974fe40f5b4', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:54:36', '2021-04-28 16:54:36', '2021-04-29 16:54:36'),
	('ed268a13b42b10624c629fcd189345cf588bfa1926a34ad60df159ebb32f54bd7a0f4f6ed77cf5ba', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:37:22', '2021-04-28 16:37:22', '2021-04-29 16:37:22'),
	('ee399a25e63cd8ff919155e7d290747eb8f388eb0f370d0b0fb5e8636d5f44368cea9a2b4269be15', 5, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 13:41:30', '2021-04-28 13:41:30', '2022-04-28 13:41:30'),
	('f0001a04b7b04402345fa51d3123c1cacf43f74798b6cb3f9d4a21fdbd7c40b7e5d842f592d68098', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:52:45', '2021-04-28 14:52:45', '2022-04-28 14:52:45'),
	('f00f1ce513992a35fb662d7cbcf2539c8e4b758bf1855525c32ef5ecd3b42a2b754e561ef1220f17', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:04:49', '2021-04-28 17:04:49', '2021-04-29 17:04:48'),
	('f85ae1fb6e422fb60db9c928abc599925b64fb42b2d63de980c01401526e1df21d6e1b9caa95c772', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:54:33', '2021-04-28 14:54:33', '2022-04-28 14:54:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'Hr6I0i98ro0rjUUufMz09gRtjO1mjeRa5C2zMhen', NULL, 'http://localhost', 1, 0, 0, '2021-04-28 13:19:17', '2021-04-28 13:19:17'),
	(2, NULL, 'Laravel Password Grant Client', '2n0ihXbcJMJe786QO8dHR1F93RAjShdSU9NdSpCR', 'users', 'http://localhost', 0, 1, 0, '2021-04-28 13:19:17', '2021-04-28 13:19:17');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-04-28 13:19:17', '2021-04-28 13:19:17');
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

-- Dumping data for table cgd_iso.policies: ~5 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_details: ~6 rows (approximately)
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
INSERT INTO `request_details` (`id`, `type`, `request_detail`, `description`, `created_at`, `updated_at`, `request_form_id`) VALUES
	(8, 1, 'ขอเปลี่ยนอุปกรณ์ Loadbalance ยี่ห้อ cisco', NULL, '2021-04-02 09:24:40', '2021-04-02 09:24:40', 1),
	(12, 1, 'ขอใช้ VLAN ของ IP 192.168.1.63 ในห้องประชุม', NULL, '2021-04-07 07:35:06', '2021-04-07 07:35:06', 4),
	(14, 1, 'การเปลี่ยนอุปกรณ์ core switch', NULL, '2021-04-16 18:11:53', '2021-04-16 18:11:53', 12),
	(28, 1, 'ขอใช้ VLAN ของ IP 192.168.1.63 ในห้องประชุม dsd', NULL, '2021-04-22 12:49:48', '2021-04-22 15:07:40', 13),
	(33, 2, 'ทดสอบ111', NULL, '2021-04-22 15:15:36', '2021-04-22 15:15:36', 13),
	(34, 2, 'policy firewall สำหรับระบบถอนคืน', NULL, '2021-04-22 15:15:37', '2021-04-22 15:15:37', 13),
	(36, 2, 'vpn กลุ่ม secure', NULL, '2021-04-24 17:04:01', '2021-04-24 17:04:01', 14),
	(37, 1, 'ทดสอบ', NULL, '2021-04-27 16:43:47', '2021-04-27 16:43:47', 15);
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
  `camunda_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_forms_user_id_foreign` (`user_id`),
  KEY `request_forms_group_id_foreign` (`group_id`),
  CONSTRAINT `request_forms_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `request_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_forms: ~4 rows (approximately)
/*!40000 ALTER TABLE `request_forms` DISABLE KEYS */;
INSERT INTO `request_forms` (`id`, `group_code`, `year`, `order_no`, `created_date`, `request_no`, `change_type`, `request_title`, `request_reason`, `document_relate`, `person_relate`, `system_relate`, `env_impact`, `system_impact`, `level_impact`, `begin_date`, `end_date`, `begin_time`, `end_time`, `status`, `description`, `updated_date`, `created_at`, `updated_at`, `user_id`, `group_id`, `camunda_id`) VALUES
	(12, 'SECD', 2564, 2, '2021-04-16', 'SECD-2564/002', 1, 'การขอเปลี่ยนแปลงอุปกรณ์เครือข่ายสำหรับระบบ eGP', 'ทดสอบการแก้ไขระบบ', '[]', '["ทรงวุฒิ"]', '[{"value":5,"text":"Network"}]', '[1,2]', '["egp"]', 1, '2021-04-16', '2021-04-17', '08:30:00', '17:00:00', 8, NULL, '2021-04-16', '2021-04-16 18:09:12', '2021-04-24 16:54:24', 1, 1, NULL),
	(13, 'SECD', 2564, 2, '2021-04-16', 'SECD-2564/002', 1, 'ขอเปิด policy firewall สำหรับกลุ่มงาน security', 'ทดสอบการใช้งานระบบ', '[]', '[]', '[]', '[1,2,3]', '[]', 1, '2021-04-16', '2021-04-30', NULL, NULL, 7, NULL, '2021-04-24', '2021-04-16 18:14:03', '2021-04-24 16:39:37', 1, 1, NULL),
	(14, 'SECD', 2564, 2, '2021-04-23', 'SECD-2564/002', 1, 'การต่ออายุ Policy Firewall สำหรับเจ้าหน้าที่ บ.PCC', 'เพื่อพัฒนา ดูแลระบบ eGP', '[]', '[]', '[]', '[1]', '[]', 1, '2021-04-23', '2021-04-30', NULL, NULL, 8, NULL, '2021-04-24', '2021-04-23 01:36:41', '2021-04-24 17:08:16', 1, 1, NULL),
	(15, 'SECD', 2564, 2, '2021-04-24', 'SECD-2564/002', 1, 'การขอให้ VLAN ในห้องประชุม ศทส.', 'เพื่อตรวจรับโครงการ', '[]', '[]', '[]', '[1]', '[]', 1, '2021-04-24', '2021-04-30', NULL, NULL, 2, NULL, '2021-04-27', '2021-04-24 13:18:12', '2021-04-27 16:44:31', 1, 1, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_statuses: ~3 rows (approximately)
/*!40000 ALTER TABLE `request_statuses` DISABLE KEYS */;
INSERT INTO `request_statuses` (`id`, `request_form_id`, `ensure_status`, `ensure_detail`, `ensure_by`, `ensure_date`, `consider_status`, `forward_to`, `consider_detail`, `consider_date`, `consider_by`, `approve_status`, `approve_detail`, `approve_date`, `approve_by`, `operate_status`, `operate_date`, `operator_name`, `operate_detail`, `operate_save_date`, `operate_by`, `follow_status`, `follow_impact`, `follow_detail`, `follow_date`, `follow_by`, `check_status`, `check_detail`, `check_date`, `check_by`, `created_at`, `updated_at`) VALUES
	(1, 13, 1, 'test', 'songwut.saj', '2021-04-24', 2, '[1,3]', 'asdas', '2021-04-24', 'songwut.saj', 1, 'test', '2021-04-24', 'songwut.saj', 1, '2021-04-24', 'asdas', 'sasdasd', '2021-04-24', 'songwut.saj', 1, 1, 'gfgsdfg', '2021-04-24', 'songwut.saj', NULL, NULL, NULL, NULL, '2021-04-24 10:32:04', '2021-04-24 16:39:37'),
	(2, 12, 1, 'aaaaaa', 'songwut.saj', '2021-04-24', 1, '[4]', 'xxx', '2021-04-24', 'songwut.saj', NULL, NULL, NULL, NULL, 1, '2021-04-21', 'กกกกก', 'fsdf', '2021-04-24', 'songwut.saj', 1, 0, NULL, '2021-04-24', 'songwut.saj', 1, 'tetstat', '2021-04-24', 'songwut.saj', NULL, '2021-04-24 16:54:24'),
	(3, 14, 1, 'ok', 'songwut.saj', '2021-04-24', 2, '[8]', NULL, '2021-04-24', 'songwut.saj', 1, NULL, '2021-04-24', 'songwut.saj', 1, '2021-04-24', 'testttt', NULL, '2021-04-24', 'songwut.saj', 1, 1, NULL, '2021-04-24', 'songwut.saj', 1, NULL, '2021-04-24', 'songwut.saj', '2021-04-24 17:04:29', '2021-04-24 17:08:16'),
	(4, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-27 16:44:31', '2021-04-27 16:44:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ttt', '', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(3, 'newton', 'r', NULL, 'a', NULL, NULL, NULL, NULL, NULL),
	(12, 'request1', 'request7@cgd.go.th', NULL, '$2y$10$kc22t0pGb2kVWCrOlQe5bedpPr2DDDmB3xCKoew8sb9McnPCuAGY2', NULL, NULL, NULL, '2021-04-28 14:29:36', '2021-04-28 14:29:36'),
	(13, 'ensure1', 'ensure1@cgd.go.th', NULL, '$2y$10$S8XmR0513lTjMGVQ1m0XoeS0BQQxHonoc/DOZa2FYyj1U80i7qeRy', NULL, NULL, NULL, '2021-04-28 15:21:00', '2021-04-28 15:21:00');
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
  `user_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_group_id_foreign` (`group_id`),
  CONSTRAINT `user_details_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.user_details: ~49 rows (approximately)
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` (`id`, `ldap`, `firstname`, `lastname`, `group_id`, `roles`, `last_logon`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 'korawan.kit', 'กรวรรณ', 'กิตติวรกาญจน์', 1, '["request","follow"]', NULL, 1, NULL, '2021-04-24 17:57:34', NULL),
	(2, 'kitikun.jon', 'กิติคุณ', 'จงเสรีกิจ', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(3, 'thannicha.cho', 'ธัญณิชา', 'ชูมี', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(4, 'nunthawan.sae', 'นันทวรรณ', 'แสงบุญมาก', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(5, 'parisa.rat', 'ปริษา', 'รัตนโรจน์', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(6, 'porntip.bea', 'พรทิพย์', 'เบี้ยวทุ่งน้อย', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(7, 'worrawit.klu', 'วรวิทย์', 'คลังแสง', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(8, 'anintisa.tha', 'อนินทิศา', 'ไทยบัณฑิตย์', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(9, 'isarapong.pro', 'อิศราพงษ์', 'พรหมประเทศ', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(10, 'jettarin.tud', 'เจตรินทร์', 'ทัดปากน้ำ', 1, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(11, 'thitiporn.kra', 'ฐิติพร', 'กระสาทอง', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(12, 'thawiwan.aph', 'ทวิวัลย์', 'ศรีศิล', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(13, 'phanawat.eka', 'ปณวรรธ', 'เอกชลธ์', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(14, 'pradasak.pho', 'ประดาศักดิ์', 'ภูมิกระจ่าง', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(15, 'piyanudda.mee', 'ปิยนัดดา', 'มีศรี', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(16, 'rabhibon.jin', 'รพีพร', 'จินะ', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(17, 'rattiporn.kan', 'รัฐฏิพร', 'กัลณา', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(18, 'rattanaporn.uss', 'รัตนาภรณ์', 'อัศวนุภาพ', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(19, 'supachai.udo', 'ศุภชัย', 'อุดมเจริญศิลป์', 2, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(20, 'kannika.jea', 'กรรณิการ์', 'เจียมพุก', 3, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(21, 'tanawut.chu', 'ธนาวุฒิ', 'จุลเลศ', 3, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(22, 'lalit.jan', 'ลลิต', 'จันทนะมาฬะกะ', 3, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(23, 'oraya.sum', 'อรญา', 'สุโมตยกุล', 3, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(24, 'thiti.kun', 'ฐิติ', 'คุณาวุฒิตระกูล', 4, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(25, 'boontariga.yim', 'บุญฑริกา', 'ยิ้มศิริวัฒนะ', 4, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(26, 'pongsathorn.ant', 'พงศธร', 'อันตะริกานนท์', 4, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(27, 'vulapa.nut', 'วัลภา', 'นุตโร', 4, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(28, 'densakda.tub', 'เด่นศักดิ์ดา', 'ทับทิม', 4, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(29, 'janjarus.dan', 'จันทร์จรัส', 'แดงเอียด', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(30, 'nareepat.sar', 'นรีพัฒน์', 'สาระทรัพย์', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(31, 'nartnapha.pho', 'นาฏนภา', 'พรสิริญาดา', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(32, 'pisate.cha', 'พิเศษ', 'ไชยจิตร', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(33, 'hatsada.phr', 'หัสดา', 'พฤฒาจารย์บดี', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(34, 'adisorn.kar', 'อดิศร', 'กาญจโน', 5, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(35, 'jantharat.ink', 'จันทรัชต์', 'อินทร์แก้ว', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(36, 'jittawut.fak', 'จิตตวุฒิ', 'ฟักอ่อน', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(37, 'chit.tho', 'ชิต', 'โต๊ะยียา', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(38, 'nutthapong.non', 'ณฐพงศ์', 'นนท์ธีระเวคิน', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(39, 'terapat.tan', 'ธีรภัทร', 'ธัญลักษณ์เดโช', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(40, 'prapad.aud', 'ประพัทธ์', 'อุดหนุน', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(41, 'prareeya.tha', 'ปรารีย์ญาณ์', 'ธนศักดิ์สกุล', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(42, 'pransaeng.sir', 'พันแสง', 'ศิริเพ็ง', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(43, 'vipat.kri', 'วิพัฒน์', 'ไกรเกียรติสกุล', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(44, 'paiboon.kit', 'ไพบูลย์', 'กิจจารึก', 6, '["request","follow"]', NULL, 1, NULL, NULL, NULL),
	(45, 'chanathip.kea', 'ชนาธิป', 'แก้วเนิน', 7, '["request","follow","admin","check","consider","operation"]', NULL, 1, NULL, '2021-04-24 18:06:17', NULL),
	(46, 'songwut.saj', 'ทรงวุฒิ', 'สัจจบุตร', 7, '["request","follow","admin","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:06:04', NULL),
	(47, 'siriluk.sir', 'ศิริลักษณ์', 'ศิริมังคลา', 7, '["request","follow","admin","ensure","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:05:56', NULL),
	(64, 'sudjid.lap', 'สุดจิตร', 'ลาภเลิศสุข', 10, '["approve"]', NULL, 1, '2021-04-24 18:08:51', '2021-04-24 18:08:51', NULL),
	(65, 'request1', 'request1', 'request1', 1, '["admin","request","follow"]', NULL, 1, '2021-04-28 14:29:37', '2021-04-28 14:29:37', 12),
	(66, 'ensure1', 'ensure1', 'ensure1', 1, '["ensure"]', NULL, 1, '2021-04-28 15:21:00', '2021-04-28 15:21:00', 13);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

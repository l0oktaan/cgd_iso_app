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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.asset_equipment: ~2 rows (approximately)
/*!40000 ALTER TABLE `asset_equipment` DISABLE KEYS */;
INSERT INTO `asset_equipment` (`id`, `ip_address`, `equip_name`, `service_port`, `equip_tags`, `group_id`, `description`, `created_at`, `updated_at`) VALUES
	(1, '["10.13.3.8"]', 'hdp-data4', '["9022"]', '[]', 1, NULL, '2021-04-29 15:28:05', '2021-04-29 15:28:05'),
	(2, '["10.13.2.11"]', 'vertica', '["9022","5433"]', '[]', 1, NULL, '2021-04-29 15:28:39', '2021-04-29 15:28:39'),
	(3, '["10.13.4.43"]', 'vm server', '["any"]', '["????????????????????????????????????"]', 1, NULL, '2021-04-29 15:29:36', '2021-04-29 15:29:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.documents: ~2 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`id`, `request_form_id`, `group_code`, `year`, `order_no`, `updated_date`, `created_at`, `updated_at`) VALUES
	(1, 1, 'SDG1', 2564, 1, '2021-04-29', '2021-04-29 15:35:27', '2021-04-29 15:35:27'),
	(2, 2, 'SDG1', 2564, 2, '2021-04-29', '2021-04-29 16:22:01', '2021-04-29 16:22:01');
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
	(1, '???????????????????????????????????????????????????????????? 1', 'SDG1', 1, '[]', '[]', NULL, '2021-04-13 17:07:46', '2021-04-13 17:07:46'),
	(2, '???????????????????????????????????????????????????????????? 2', 'SDG2', 1, '[]', '[]', NULL, '2021-04-13 17:30:31', '2021-04-13 17:30:31'),
	(3, '???????????????????????????????????????????????????????????? 3', 'SDG3', 1, '[]', '[]', NULL, '2021-04-13 19:37:25', '2021-04-13 19:37:25'),
	(4, '???????????????????????????????????????????????????????????? 4', 'SDG4', 1, '[]', '[]', NULL, '2021-04-13 19:37:43', '2021-04-13 19:37:43'),
	(5, '??????????????????????????????????????????????????????????????????????????????', 'COMD', 1, '[]', '[]', NULL, '2021-04-13 19:38:05', '2021-04-13 19:38:57'),
	(6, '??????????????????????????????????????????????????????????????????????????????????????????', 'NETD', 1, '[]', '[]', NULL, '2021-04-13 19:38:34', '2021-04-13 19:38:46'),
	(7, '????????????????????????????????????????????????????????????????????????????????????????????????', 'SECD', 1, '[]', '[]', NULL, '2021-04-13 19:39:38', '2021-04-13 19:39:38'),
	(8, '?????????????????? ????????????????????????????????? ????????????????????????????????? ???????????????', 'PCC', 2, '[]', '[]', NULL, '2021-04-13 19:40:06', '2021-04-13 19:40:13'),
	(9, '?????????????????? ????????????????????? ????????? ???????????????', 'DRAM', 2, '[]', '[]', NULL, '2021-04-13 19:41:01', '2021-04-13 19:41:01'),
	(10, '?????????????????????????????????????????????????????????????????????????????????????????????????????????', 'ITC', 1, '[]', '["?????????","??????"]', NULL, '2021-04-24 18:08:22', '2021-04-24 18:08:22');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.migrations: ~24 rows (approximately)
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

-- Dumping data for table cgd_iso.oauth_access_tokens: ~112 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('019c05afe90356e53bbf9f4fa4d3e957b3662fcf3fc46bf02ae9fef585dbb2510675439aa9e29bf9', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 02:13:30', '2021-04-29 02:13:30', '2021-04-30 02:13:29'),
	('02bf4313b74832b00a2e538fdfc13867d13726d305aeb27f096e9639cf91aa97cc9b5d15699fce88', 17, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 06:11:54', '2021-04-29 06:11:54', '2021-04-30 06:11:53'),
	('04fbd2fa2dacdc1452c2bca6eaaa07d502e9c70af03bcc4d587291f2080d49743d0692f394a9878b', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 08:59:19', '2021-04-29 08:59:19', '2021-04-30 08:59:19'),
	('05beb46981eae7c2968875936d21de30ff1e42bd4d3ff03b5f6fb9f5608018e81172808149f65133', 17, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:21:01', '2021-04-29 12:21:01', '2021-04-30 12:21:01'),
	('06f1cbbabca27923ad3c422051b82a48f195f91fa10cd8b86fad07a9a0e07e5b3e057dc6a7f85178', 16, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 06:03:19', '2021-04-29 06:03:19', '2021-04-30 06:03:19'),
	('084e03b771b23e2b6b57883a0c63c5e2d3b693b805ef55a69e9f482e58e2d68f304dc6657148afea', 15, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 04:43:58', '2021-04-29 04:43:58', '2021-04-30 04:43:58'),
	('0c9ca42a4eb960ed5bdc8fb467d329ee824f991c1a48b0fc95e3578e7132a75c15ea4040b0123597', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:06:16', '2021-04-28 17:06:16', '2021-04-29 17:06:16'),
	('11fe3c8da0ea1eca0e3a3611d2630c07cc4784dc80cf6819c8f84790f4be27c58a1fa3b560ab18c1', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:40:48', '2021-04-28 14:40:48', '2022-04-28 14:40:48'),
	('13f4306cd259e93bc87cd9cd7614eddcf2ddb80c9fa5716b9494187f996f04e828ed2ea57932cd46', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:54:10', '2021-04-28 14:54:10', '2022-04-28 14:54:10'),
	('1758b4296b98c0fe592b0760c0760caf9c6fb0c5df4f6e1f1e09d069d2aeaaed386e1aeb76c7eae2', 12, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 06:14:22', '2021-04-29 06:14:22', '2021-04-30 06:14:22'),
	('1787f033ca78135105e46bcbb5bdb51f38cc61660f958e5b0b45b1adb564fb981cf6e3c9cf14c199', 4, 1, 'LaravelAuthApp', '[]', 0, '2021-04-28 13:32:34', '2021-04-28 13:32:34', '2022-04-28 13:32:34'),
	('1828b6511967cf8475560a408aebb1f2e450644d49652e80d09e55e164ac1318038b8fa1a8885f4a', 17, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:47:18', '2021-04-29 15:47:18', '2021-04-30 15:47:17'),
	('19287a4b931019e1077669f858f9b2a3c95fa5b3fb8df8cbad298107b171fb3a1f2ccfd7f3a6bb8d', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 16:29:11', '2021-04-29 16:29:11', '2021-04-30 16:29:11'),
	('19d9eaecfba32658d7944bc26b47e1ac01efa21d0541fc9d44bf8898962f5a12a377b15468a2a410', 14, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:01:00', '2021-04-29 15:01:00', '2021-04-30 15:00:59'),
	('1a6bfddae6609e5753b7cc3e8f99c385acac47c9caf63b9a9e1a630021db7dfd9f121754573cc4c6', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:46:25', '2021-04-28 16:46:25', '2021-04-29 16:46:25'),
	('1e4f1bb80ad8391268a5cb4fa7226b5e6e1d9120fd3656e2b64f1bfbcfd1bc68cb20fb4b5e1c29bf', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:41:51', '2021-04-29 12:41:51', '2021-04-30 12:41:51'),
	('1f4e74e335ec58d9514c7c73cd26f9664883f01d132fc24cc38a21e621494833a59ccb43e0be8dda', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 08:21:47', '2021-04-29 08:21:47', '2021-04-30 08:21:47'),
	('2036d0d34b325aed23dcdd6409d658a075465f300f939789c9b0ba7c25a0af8a19b6a0c4799faded', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 16:19:53', '2021-04-29 16:19:53', '2021-04-30 16:19:53'),
	('222c6eb2ad5f07e633082266a5633fb6be87f7f905746426a5c529120ab747b2da7002a8253758ba', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:56:44', '2021-04-28 14:56:44', '2021-10-28 14:56:44'),
	('23303540e995d18a5c1c43835247de40307fc2ffe76103cf095fe90c39f1cf76790bf4da99ddfdfe', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:53:41', '2021-04-29 15:53:41', '2021-04-30 15:53:41'),
	('24daa2f7c0d71eebba52580a6d12f8b5b24c267a5f29f2c817cb7cbafa8e6178aaf15429d3e8031b', 16, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:45:56', '2021-04-29 15:45:56', '2021-04-30 15:45:56'),
	('28f1d1ceb1067b088200cd17adff12b0b06ad5350d9832eb39ae32383755bb877d61d8e2b16eb6d6', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 11:52:20', '2021-04-29 11:52:20', '2021-04-30 11:52:20'),
	('32ee4d75aa3e87fe3cc931f8715b6c9ca15de3cee9e010bc1ab61fc44769b707b4373b3aebaa8994', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:44:17', '2021-04-29 15:44:17', '2021-04-30 15:44:17'),
	('3353ed10480cd5d5ed6cdacff71e3fd81b725329acdc2d995b1a5c4968f1bc30aa7e01167a484526', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:24:29', '2021-04-29 15:24:29', '2021-04-30 15:24:28'),
	('3a11b701059f220c74762ef45b7c5a971646d47b3ff94d89e0192d657711347690482544be59bc87', 16, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 06:13:26', '2021-04-29 06:13:26', '2021-04-30 06:13:26'),
	('3a3d6cf61be056c00ddac05758bd81d1866880df35dbda01dc84de58cfac043c71a64c508a1d3e91', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:19:15', '2021-04-28 15:19:15', '2021-04-29 15:19:15'),
	('3ac00f3e1d3e1c1dc4a8896eada1c9c01819de37cd2e96b2cd9cf7044265a0666a55e68e980b37a5', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 02:13:09', '2021-04-29 02:13:09', '2021-04-30 02:13:08'),
	('3b666f0c03d8e6a43b03e0506f037bcc3db397c5cfa8116d4661e3e3453b6bee6092be819162c233', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:32:55', '2021-04-28 16:32:55', '2021-04-29 16:32:55'),
	('3bc6b301367d8d6557411eda1f310a440620fc39b425e158af7a7941b615ce21619dafa255731c29', 17, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 12:22:39', '2021-04-29 12:22:39', '2021-04-30 12:22:38'),
	('3dc5dcf26eb71d1ccf41adeccf1ee8f1c46c9dd447a7a1364a98f480756c57449e2608e211c9d0ce', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:07:46', '2021-04-29 12:07:46', '2021-04-30 12:07:46'),
	('40a254822e14ac39526ac282b7bbd6dbbec58793d97e5c91efbf27256bd676d6c9583921ebdc8509', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:42:04', '2021-04-28 14:42:04', '2022-04-28 14:42:04'),
	('44feeaf1b4fbdd2ce21699b0510f7f079e80c83beae9a136a7897358d1644b7479b891451f371cb7', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 08:51:19', '2021-04-29 08:51:19', '2021-04-30 08:51:19'),
	('4545730248310767b5661a4ceb00d2a6120704ee88509badf22399b19969c3fe5937af843f26dfb4', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:39:03', '2021-04-28 16:39:03', '2021-04-29 16:39:02'),
	('463fa9e1ba82e8012dcab62f062b80d8ccf3bea224ee62e6e733b80548cfe3908da365321f6aec2c', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:38:16', '2021-04-28 16:38:16', '2021-04-29 16:38:16'),
	('47936f69c93fa1fa3b58fa22747c0886662ccf50c52ff10d1a5d4c08b89a073e1cfface6a992c5c6', 16, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 06:06:16', '2021-04-29 06:06:16', '2021-04-30 06:06:15'),
	('4abd47b130e7670e51d697d89f7343da11548030a4acc48ab1d4849ad45c2103ed8b73bcb8c02960', 14, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 04:30:39', '2021-04-29 04:30:39', '2021-04-30 04:30:39'),
	('4b3f63769bd366554125492e49680758b83301b35735ee8c8127f744e2eca988dc945f5798183619', 17, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 06:15:00', '2021-04-29 06:15:00', '2021-04-30 06:15:00'),
	('4e3e045fd8bcac164944e087e2debc3c3913e0884bd37c6ec290eb2da4340efcf7b1999008eca6ae', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:44:36', '2021-04-28 16:44:36', '2021-04-29 16:44:35'),
	('4f0efddea2d7687291a31b00fd29f2dc2040d228ffd63ba662f5508ec7af5819d5a59aa1e1f3c073', 15, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 08:17:13', '2021-04-29 08:17:13', '2021-04-30 08:17:13'),
	('503b9e75fe6a1eddbb809e009a3817aec961b8df698a142ff68813d446c1bdcc36553adbee044a88', 13, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 04:44:38', '2021-04-29 04:44:38', '2021-04-30 04:44:37'),
	('5359ad4426adaf2e670ae0f3792bf4a6dd77ec620ef1911d5dba7838c079aef8a8d61ec315ee0452', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:48:29', '2021-04-28 16:48:29', '2021-04-29 16:48:29'),
	('54502409860b6ae099c1c3c50e973acd4c483d62e17fa32275591ad840e243ad405aa05a2e42f194', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:50:59', '2021-04-28 14:50:59', '2022-04-28 14:50:59'),
	('55c60b46abe389cd0a9b3d83f8709f984df24d16a895a196742c35e2f0f658cd0d2165fe8d89abcd', 17, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 16:31:36', '2021-04-29 16:31:36', '2021-04-30 16:31:36'),
	('5615a4323b0d41b0b17ab426991ea62a15334684f8325ef7fa256a7495ec699ba78bea6fc382eb05', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:23:22', '2021-04-29 09:23:22', '2021-04-30 09:23:21'),
	('56733ba0eb4e67c31cdbf33150860e1294bd0ff005cfe6f91951153544e80b7bcd676d7ad88688de', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:36:03', '2021-04-28 16:36:03', '2021-04-29 16:36:03'),
	('59398e3301fd0fa13174043de7bafa4e3e69ab7bc3eab71a6acda2850eb0940a23bfdab6e0dce896', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:41:55', '2021-04-28 16:41:55', '2021-04-29 16:41:55'),
	('5d1949f5eac65857d3582a984d477834c2c2964de680712aaea6bd1a64727639eb91152e3dcb5a65', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:17:57', '2021-04-29 09:17:57', '2021-04-30 09:17:57'),
	('5e9088fe6a34f2a4ac1d1453079f8d215213e59398384d48d35dcccb631f57fe581c898ee4aa1942', 14, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 12:54:12', '2021-04-29 12:54:12', '2021-04-30 12:54:11'),
	('5f3d5769beb9420a88049177fe54911466c5cd8cce7f295b8dd9ff025b8dcd3f00f84c432dabda11', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 05:05:03', '2021-04-29 05:05:03', '2021-04-30 05:05:03'),
	('6543fac9542effcb7c94d9e9b67c271d3a274994fa3de0cedbfe243a664ba46cc0daf8a627fa35eb', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:58:45', '2021-04-28 16:58:45', '2021-04-29 16:58:45'),
	('662433a85184ebb1780814d7e2903787d768d2c690c36213acd02f4bde77ef4076724c743510457b', 16, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 16:30:55', '2021-04-29 16:30:55', '2021-04-30 16:30:55'),
	('67bafb251e5fcd2bfcb3689f7357f62acf3234d8cbe54dd5feb29b18c5c7953a91310e8ce06b5272', 12, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 12:41:21', '2021-04-29 12:41:21', '2021-04-30 12:41:21'),
	('70468c1d78e5c75703c76cd7603c354273e83d48e7e7da4932959f327030be83d769fc04da8491f0', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:02:28', '2021-04-28 17:02:28', '2021-04-29 17:02:28'),
	('750f13414b41945725100a09203e201e1e4a75693b0f9bfca783f0cbe777e399283c786d5ca33191', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:30:34', '2021-04-28 14:30:34', '2022-04-28 14:30:34'),
	('758bc8003e50cd2707370c66f1b138ee3cb10818ab79772a71d4aebfc876938216dea9fb9ebbf1d1', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:07:30', '2021-04-28 17:07:30', '2021-04-29 17:07:30'),
	('77a0498abba698a037322e5cb6322d0bbc33ad375506f613517b8f81d848ba5e5ddafc35efc460af', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 04:44:06', '2021-04-29 04:44:06', '2021-04-30 04:44:06'),
	('789f78b3d6edbdd90dec231f9a223970c38d8a6c18d4490014df57dd629f218bfe486e410e8fb54d', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:27:33', '2021-04-29 12:27:33', '2021-04-30 12:27:32'),
	('84f0cc0a7cbe0fe9cd49d1a0f054efe581ef9d8818833ddc1e03a812bf91a28b7e144e9244ae4dc2', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:45:13', '2021-04-28 16:45:13', '2021-04-29 16:45:13'),
	('9279c360b042fdb75b63007deb24edb62df248f04fadbd4679d4d546f9ef9c0f49d34aa77b268e2a', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:29:37', '2021-04-28 14:29:37', '2022-04-28 14:29:37'),
	('9488dfa866b21211b4b85e2dd21ab4403d21122f5d6b34839ddaebda18d01710987a8a0e500ac173', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:31:20', '2021-04-28 16:31:20', '2021-04-29 16:31:20'),
	('952993153645fc054257cdd9809e6bf1a554295d16c1133b190a2e040f9324d74c2a119bf9349035', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 02:38:30', '2021-04-29 02:38:30', '2021-04-30 02:38:30'),
	('9553e0881a6e16ddf750cc29a07d4c30cebfa95e18399a5bc03c5275fda772f7dd562e5513316631', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:46:19', '2021-04-29 09:46:19', '2021-04-30 09:46:18'),
	('96442aa1605f2b7a5f3c828b73d4cc9737fd4b966a5948fbe661429753c2778b0cdaf29c6fef1a65', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:19:23', '2021-04-28 15:19:23', '2021-04-29 15:19:23'),
	('970e871d03b86459b39b8d809130b0c5ffdecfca31928e4c8a1107665e8e8c3e1e5a51a1e143afe4', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:54:21', '2021-04-29 15:54:21', '2021-04-30 15:54:21'),
	('973cff8c42ec8de191e30fa6de828b0bd6389b1a918449d07bab82f303be929a26707fcdb7fd584a', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 11:52:53', '2021-04-29 11:52:53', '2021-04-30 11:52:53'),
	('a5192348ba0660688c3372761333aed063ba6e277a380e55da7add36eecb0759658e0d59727d17b3', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:35:47', '2021-04-29 15:35:47', '2021-04-30 15:35:46'),
	('abfc27009cf49fb3e705513e3ec5daf3ac739f77ebf6d6c248911fb7e78304913fb01f12e74f12bf', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:12:31', '2021-04-29 09:12:31', '2021-04-30 09:12:31'),
	('ae576cf4734b51256261480427a80e0cd2cb4dada2c57bd5ee53e13e74b5de309243f3a63ea91e6e', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:06:04', '2021-04-29 15:06:04', '2021-04-30 15:06:03'),
	('afb6394e363fb06d18fe6fa83b4bdd9037b3957179321955c61888d2a610ee53e8052e4bbb4ca34d', 15, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 12:52:26', '2021-04-29 12:52:26', '2021-04-30 12:52:25'),
	('b416d2ac818bf1b79033ec8a9bd5f3ad7fc57740f846c27688feeee53efd01e70b5e922b01e9e15b', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:04:21', '2021-04-29 09:04:21', '2021-04-30 09:04:21'),
	('b5a0c2ac8866eea44ea74461970033dd96ed573b8ef39318bd1774a88ada5bd284fedd2d0ac81167', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 16:30:02', '2021-04-29 16:30:02', '2021-04-30 16:30:02'),
	('b64cd83a91bfc84ee89e5b6bf14840b794d43ec2ebbb064530293a21e6fe9b7a7967f8129bfe01e4', 15, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 16:32:47', '2021-04-29 16:32:47', '2021-04-30 16:32:47'),
	('b6572ec1cc562e7c6e8f10d3a1d567d2bb97cf602c23e0bbd754acda09b114dcdc5b67f8995e3bf5', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:42:38', '2021-04-29 09:42:38', '2021-04-30 09:42:38'),
	('b7ee0033b2441c3f97c0a4ce3a4690eb796d73a338407963eb98786c3183268ee2685f2c25753226', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:45:33', '2021-04-28 16:45:33', '2021-04-29 16:45:33'),
	('b9cac02008478e5ef3ea239f557282a7f4d60f064499512612cd1406de3d00f0f13a7f8840bacb05', 5, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:00:56', '2021-04-28 14:00:56', '2022-04-28 14:00:56'),
	('ba8f4ea6bb923399aeadd4c37638b8e9c29b346bd6c5f1ed6d10bc4f1e12f5e6b4de59307890307f', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:00:51', '2021-04-29 09:00:51', '2021-04-30 09:00:51'),
	('baa7f1f9cad860e7adedd09d9dc30f62ad1fc8383e9f3f32e424d29048c41383c21697bc2383c54a', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:36:34', '2021-04-28 16:36:34', '2021-04-29 16:36:34'),
	('bb60306b2b3d4ec8a01772e87d9a7fc8cb28d5d0dfee025a4762ed16b9fd2c4092ece62edf809b84', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 04:02:27', '2021-04-29 04:02:27', '2021-04-30 04:02:26'),
	('bcf93ed74385decc0e4a34654300aa22be420915ba40c7b3be1b14f9ff46f1963ad2ebafda642fad', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:44:09', '2021-04-28 16:44:09', '2021-04-29 16:44:09'),
	('c6bbd1a461ecc73cb4f566dac3766f1305c7ffe43c15190b418c5314def8da7d3ddcb5e8f1b80ef3', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:22:37', '2021-04-28 17:22:37', '2021-04-29 17:22:37'),
	('c70f57de1c43d25407d85fee3aeb9e4acaa267c6ceaee1b057b84c837b67c66675c913ece54f09ad', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 11:53:25', '2021-04-29 11:53:25', '2021-04-30 11:53:24'),
	('c95e625b548da3425364c67073df977a3dc27ae8574e76f160ae8a00ad58bb5b6ef97699e3c9388d', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 08:14:40', '2021-04-29 08:14:40', '2021-04-30 08:14:40'),
	('cd6cf6758242b3b8381b0693c2d3da2bf0b02e1076876984e4382f66aec5d1e4e6d5adf64f9dfa87', 16, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:19:50', '2021-04-29 12:19:50', '2021-04-30 12:19:50'),
	('cdd8bbbc2c1a0af4a5d0c50ebee249917040ff49bc0ea088c060e9905162f6e7020430c78c2b1329', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 06:05:10', '2021-04-29 06:05:10', '2021-04-30 06:05:10'),
	('d0ab3d2bb909e0e6cb8e178c93dc61fdc632e05ae036ad06b4b432f9b7405576c2cdca925baa9d3c', 13, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 15:21:00', '2021-04-28 15:21:00', '2021-04-29 15:20:59'),
	('d1f69457bc4629771e650a7707150d33b1f87023d73912bba032d9cd8a2ed9cc0d9959498be963ae', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 05:06:43', '2021-04-29 05:06:43', '2021-04-30 05:06:43'),
	('d2cf80a8c1d7860f2f8313ac571a0eaed0a6ed5f3589a3788e01d36d9b826266acdb78ea94c4ad4f', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:51:01', '2021-04-28 16:51:01', '2021-04-29 16:51:01'),
	('d639e2f59e16b15e82e19b7ea00e9b4faf0b79959b7d3572401067fede150ba6baf44b426f2a9fc9', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:57:37', '2021-04-28 14:57:37', '2021-04-29 14:57:37'),
	('da9d56a9a30ffaf7b9b13b7e31fbc3130bd6b25d9221f722d9bfca18702e21fb1e15bbc8b336a21e', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:57:38', '2021-04-28 16:57:38', '2021-04-29 16:57:37'),
	('db19ed6625d383fd461b3ec2ea309b9bde4342aa4883ada47a38b2478f6e0a9dd37702ed5fc7862c', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:55:54', '2021-04-28 16:55:54', '2021-04-29 16:55:54'),
	('dbf7095346b409b28ccbebf7c76c2e320eefef900fbcace16cb8b291b685b73123777ac25407b7b0', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 02:46:12', '2021-04-29 02:46:12', '2021-04-30 02:46:12'),
	('dce1a4a27755fd72eedf8a7e42a2367d1885d1423122f557005fa847015e757e76309f1e842c7811', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:47:09', '2021-04-28 16:47:09', '2021-04-29 16:47:08'),
	('dfe43491aff8b664d6f81d64a722d0f39a92936a0fa4d610e22dedd67a84e2ea2bdf845919d8de6d', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:20:40', '2021-04-29 09:20:40', '2021-04-30 09:20:40'),
	('e0e2f285f16675fd666aac3be4156abf7bfd15d20a814e5b32b113626d07c8ad4058f7d7490a9911', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:54:38', '2021-04-29 15:54:38', '2021-04-30 15:54:38'),
	('e4ac9cea0e51b99170e58a3ba2cc9862a0ae0538f093d5b62daef0707b4928b5797933f5a125fae5', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:45:57', '2021-04-29 09:45:57', '2021-04-30 09:45:57'),
	('e4d60d2b46917c0531c1e344ba21510e9e014fd6c997a685f0e92fe3ec426b4b3e31df2311493b00', 17, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 07:49:45', '2021-04-29 07:49:45', '2021-04-30 07:49:45'),
	('e62acac8a5801a3a9c71703b5dbc098d79ef994c0e2c7cc588d5398a481ff565c370e762f03708a0', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 08:58:08', '2021-04-29 08:58:08', '2021-04-30 08:58:08'),
	('e63a2dbf2ab48c5bce29b571318796559a75de8d4f6bb616798390a4dd56628b95d08b360bd9c1ed', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 15:25:57', '2021-04-29 15:25:57', '2021-04-30 15:25:57'),
	('e77cf73d271f65d868f7819f28b2eb108318e45483150d21767ce1da6f69069bb4da5e82d7083247', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 04:06:59', '2021-04-29 04:06:59', '2021-04-30 04:06:59'),
	('e84768a21bb586ea60460fefd06fa29524a680ff62192b9bf2a4b8723d83cc516ede8974fe40f5b4', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:54:36', '2021-04-28 16:54:36', '2021-04-29 16:54:36'),
	('eb0149fa83d48f7fdd17726dfd37f221fdc33776d98d942ef6c4e850cec2c637e9fc5ded399c8f0b', 15, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:25:45', '2021-04-29 12:25:45', '2021-04-30 12:25:44'),
	('eca120acd21ff163ad2d1eaff342ad90b2d4039859990a79c9d7d9ca5bcb18052da5bb871cf7ec3f', 13, 3, 'CGD_ISO_APP', '[]', 0, '2021-04-29 02:52:16', '2021-04-29 02:52:16', '2021-04-30 02:52:16'),
	('ed268a13b42b10624c629fcd189345cf588bfa1926a34ad60df159ebb32f54bd7a0f4f6ed77cf5ba', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 16:37:22', '2021-04-28 16:37:22', '2021-04-29 16:37:22'),
	('ee399a25e63cd8ff919155e7d290747eb8f388eb0f370d0b0fb5e8636d5f44368cea9a2b4269be15', 5, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 13:41:30', '2021-04-28 13:41:30', '2022-04-28 13:41:30'),
	('f0001a04b7b04402345fa51d3123c1cacf43f74798b6cb3f9d4a21fdbd7c40b7e5d842f592d68098', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:52:45', '2021-04-28 14:52:45', '2022-04-28 14:52:45'),
	('f00f1ce513992a35fb662d7cbcf2539c8e4b758bf1855525c32ef5ecd3b42a2b754e561ef1220f17', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 17:04:49', '2021-04-28 17:04:49', '2021-04-29 17:04:48'),
	('f2d64fcdecc62d6a35c70929146015b11b44146c7827a80e0423a7339d37a720b592ad1e20703ff9', 14, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 04:31:33', '2021-04-29 04:31:33', '2021-04-30 04:31:33'),
	('f4051ee799dc0d30f89e531b8d0dd6b7d74f388b6786e42877f882acb0a31b719d8fa1e466ac6a79', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 12:04:21', '2021-04-29 12:04:21', '2021-04-30 12:04:21'),
	('f520d1147d509a087b94201e3314e7735e25666754d4a5284ae81ade375e9444ecf6f20485a168ea', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 14:11:59', '2021-04-29 14:11:59', '2021-04-30 14:11:59'),
	('f62ac68d0039f74962a8b55af250354e0f3b9341cdc1572f4102305f9f990fcdda229d256d870702', 13, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:26:48', '2021-04-29 09:26:48', '2021-04-30 09:26:48'),
	('f85ae1fb6e422fb60db9c928abc599925b64fb42b2d63de980c01401526e1df21d6e1b9caa95c772', 12, 1, 'CGD_ISO_APP', '[]', 0, '2021-04-28 14:54:33', '2021-04-28 14:54:33', '2022-04-28 14:54:33'),
	('f88e17caf69d8826bdabd4970fbff418be7c26f3a555ee0fdfe63996fcd5aeb75d805bddbf4548a2', 12, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 09:03:01', '2021-04-29 09:03:01', '2021-04-30 09:03:01'),
	('fe7e3902a0be68233c2c4f8057bf93c31f669c6655f62ce276e37347e54ea6aee1ede4e691b900b0', 16, 3, 'CGD_ISO_APP', '[]', 1, '2021-04-29 06:10:29', '2021-04-29 06:10:29', '2021-04-30 06:10:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_clients: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'Hr6I0i98ro0rjUUufMz09gRtjO1mjeRa5C2zMhen', NULL, 'http://localhost', 1, 0, 0, '2021-04-28 13:19:17', '2021-04-28 13:19:17'),
	(2, NULL, 'Laravel Password Grant Client', '2n0ihXbcJMJe786QO8dHR1F93RAjShdSU9NdSpCR', 'users', 'http://localhost', 0, 1, 0, '2021-04-28 13:19:17', '2021-04-28 13:19:17'),
	(3, NULL, 'Laravel Personal Access Client', 'oWae79LNqaAmHhULa97tmBfxd6vnpOSB7izV9JP2', NULL, 'http://localhost', 1, 0, 0, '2021-04-29 02:12:57', '2021-04-29 02:12:57'),
	(4, NULL, 'Laravel Password Grant Client', 'YfKkgJz0xrTDgiS6zn7tvTtwwOPgJyFVLM3WTetm', 'users', 'http://localhost', 0, 1, 0, '2021-04-29 02:12:57', '2021-04-29 02:12:57');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.oauth_personal_access_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-04-28 13:19:17', '2021-04-28 13:19:17'),
	(2, 3, '2021-04-29 02:12:57', '2021-04-29 02:12:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policies: ~0 rows (approximately)
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` (`id`, `group_id`, `policy_name`, `updated_date`, `description`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Policy Firewall ?????????????????? Verticar', '2021-04-29', NULL, NULL, '2021-04-29 15:30:42', '2021-04-29 15:30:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.policy_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `policy_details` DISABLE KEYS */;
INSERT INTO `policy_details` (`id`, `policy_id`, `source`, `destination`, `service_port`, `updated_date`, `tags`, `created_at`, `updated_at`) VALUES
	(1, 1, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_1","asset":"hdp-data4","ip_address":["10.13.3.8"],"service_port":["9022"],"tags":[]},{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '2021-04-29', '[]', '2021-04-29 15:31:40', '2021-04-29 15:31:40'),
	(2, 1, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["5433"]', '2021-04-29', '[]', '2021-04-29 15:32:07', '2021-04-29 15:32:07'),
	(3, 1, '[{"code":"equip_1","asset":"hdp-data4","ldap":"","ip_address":["10.13.3.8"],"tags":[]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '2021-04-29', '[]', '2021-04-29 15:32:42', '2021-04-29 15:32:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
INSERT INTO `request_details` (`id`, `type`, `request_detail`, `description`, `created_at`, `updated_at`, `request_form_id`) VALUES
	(1, 2, 'Policy Firewall ?????????????????? Verticar', NULL, '2021-04-29 15:35:11', '2021-04-29 15:35:11', 1),
	(2, 2, 'Policy Firewall ?????????????????? Verticar', NULL, '2021-04-29 16:21:10', '2021-04-29 16:21:10', 2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_forms_user_id_foreign` (`user_id`),
  KEY `request_forms_group_id_foreign` (`group_id`),
  CONSTRAINT `request_forms_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `request_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_forms: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_forms` DISABLE KEYS */;
INSERT INTO `request_forms` (`id`, `group_code`, `year`, `order_no`, `created_date`, `request_no`, `change_type`, `request_title`, `request_reason`, `document_relate`, `person_relate`, `system_relate`, `env_impact`, `system_impact`, `level_impact`, `begin_date`, `end_date`, `begin_time`, `end_time`, `status`, `description`, `updated_date`, `created_at`, `updated_at`, `user_id`, `group_id`, `camunda_id`, `user_name`) VALUES
	(1, 'SDG1', 2564, 1, '2021-04-29', 'SDG1-2564/001', 1, '?????????????????? policy firewall ???????????????????????????????????? vertica', '??????????????????????????????????????????????????????????????????????????????????????????????????? Bigdata', '[]', '["???????????????????????????????????? ??????????????????"]', '[{"value":5,"text":"Network"}]', '[1,2]', '[]', 1, '2021-03-12', NULL, NULL, NULL, 8, NULL, '2021-04-29', '2021-04-29 15:33:46', '2021-04-29 15:55:39', 12, 1, NULL, 'request1'),
	(2, 'SDG1', 2564, 2, '2021-04-29', 'SDG1-2564/002', 1, '??????????????????????????? Policy ?????????????????? Vertica', '???????????????????????????????????????????????? Big Data', '[]', '["????????? ???"]', '[{"value":5,"text":"Network"}]', '[1,2]', '[]', 1, '2021-04-29', '2021-05-31', NULL, NULL, 8, NULL, '2021-04-29', '2021-04-29 16:20:51', '2021-04-29 16:33:00', 12, 1, NULL, 'request1');
/*!40000 ALTER TABLE `request_forms` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.request_policy_details
CREATE TABLE IF NOT EXISTS `request_policy_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_detail_id` smallint(5) unsigned NOT NULL,
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `destination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_policy_details_request_detail_id_foreign` (`request_detail_id`),
  CONSTRAINT `request_policy_details_request_detail_id_foreign` FOREIGN KEY (`request_detail_id`) REFERENCES `request_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_policy_details: ~6 rows (approximately)
/*!40000 ALTER TABLE `request_policy_details` DISABLE KEYS */;
INSERT INTO `request_policy_details` (`id`, `request_detail_id`, `source`, `destination`, `service_port`, `tags`, `created_at`, `updated_at`) VALUES
	(1, 1, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_1","asset":"hdp-data4","ip_address":["10.13.3.8"],"service_port":["9022"],"tags":[]},{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '[]', '2021-04-29 15:35:11', '2021-04-29 15:35:11'),
	(2, 1, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["5433"]', '[]', '2021-04-29 15:35:11', '2021-04-29 15:35:11'),
	(3, 1, '[{"code":"equip_1","asset":"hdp-data4","ldap":"","ip_address":["10.13.3.8"],"tags":[]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '[]', '2021-04-29 15:35:11', '2021-04-29 15:35:11'),
	(4, 2, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_1","asset":"hdp-data4","ip_address":["10.13.3.8"],"service_port":["9022"],"tags":[]},{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '[]', '2021-04-29 16:21:10', '2021-04-29 16:21:10'),
	(5, 2, '[{"code":"equip_3","asset":"vm server","ldap":"","ip_address":["10.13.4.43"],"tags":["????????????????????????????????????"]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["5433"]', '[]', '2021-04-29 16:21:10', '2021-04-29 16:21:10'),
	(6, 2, '[{"code":"equip_1","asset":"hdp-data4","ldap":"","ip_address":["10.13.3.8"],"tags":[]}]', '[{"code":"equip_2","asset":"vertica","ip_address":["10.13.2.11"],"service_port":["9022","5433"],"tags":[]}]', '["9022"]', '[]', '2021-04-29 16:21:10', '2021-04-29 16:21:10');
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
  `forward_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.request_statuses: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_statuses` DISABLE KEYS */;
INSERT INTO `request_statuses` (`id`, `request_form_id`, `ensure_status`, `ensure_detail`, `ensure_by`, `ensure_date`, `consider_status`, `forward_to`, `consider_detail`, `consider_date`, `consider_by`, `approve_status`, `approve_detail`, `approve_date`, `approve_by`, `operate_status`, `operate_date`, `operator_name`, `operate_detail`, `operate_save_date`, `operate_by`, `follow_status`, `follow_impact`, `follow_detail`, `follow_date`, `follow_by`, `check_status`, `check_detail`, `check_date`, `check_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, 'ensure1', '2021-04-29', 2, '[6]', '??????????????????????????????????????????????????????????????????????????????', '2021-04-29', 'consider', 1, '???????????????????????????????????????', '2021-04-29', 'approve', 1, '2021-04-29', '???.??????????????????????????????', '???????????????????????????????????????', '2021-04-29', 'operate', 1, 0, NULL, '2021-04-29', 'request1', 1, NULL, '2021-04-29', 'consider', '2021-04-29 15:35:27', '2021-04-29 15:55:39'),
	(2, 2, 1, '???????????????????????????????????????', 'ensure1', '2021-04-29', 2, '[6]', '?????????????????????????????????????????????????????????????????????', '2021-04-29', 'consider', 1, '???????????????????????????????????????', '2021-04-29', 'approve', 1, '2021-04-29', '????????? ???', '???????????????????????????????????????', '2021-04-29', 'operate', 1, 0, NULL, '2021-04-29', 'request1', 1, NULL, '2021-04-29', 'consider', '2021-04-29 16:22:01', '2021-04-29 16:33:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ttt', '', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(3, 'newton', 'r', NULL, 'a', NULL, NULL, NULL, NULL, NULL),
	(12, 'request1', 'request7@cgd.go.th', NULL, '$2y$10$kc22t0pGb2kVWCrOlQe5bedpPr2DDDmB3xCKoew8sb9McnPCuAGY2', NULL, NULL, NULL, '2021-04-28 14:29:36', '2021-04-28 14:29:36'),
	(13, 'ensure1', 'ensure1@cgd.go.th', NULL, '$2y$10$S8XmR0513lTjMGVQ1m0XoeS0BQQxHonoc/DOZa2FYyj1U80i7qeRy', NULL, NULL, NULL, '2021-04-28 15:21:00', '2021-04-28 15:21:00'),
	(14, 'songwut.saj', 'songwut.saj@cgd.go.th', NULL, '$2y$10$ZhoTkcVcHFjo8iISyOheUOVJDMpHHiQ9An.yCb5V09mIosvc1cfwC', NULL, NULL, NULL, '2021-04-29 04:30:39', '2021-04-29 04:30:39'),
	(15, 'consider', 'consider@cgd.go.th', NULL, '$2y$10$tqMdWYfHt2MwOVv2S9MKUuYiw8L8D01yJoTzrrreyTHkP/6YvvI7O', NULL, NULL, NULL, '2021-04-29 04:43:58', '2021-04-29 04:43:58'),
	(16, 'approve', 'approve@cgd.go.th', NULL, '$2y$10$Ts187dGBFN9ESppX2GnrEOBlaZ.FpnvQeqyR08R340hd5kgxTQvkq', NULL, NULL, NULL, '2021-04-29 06:03:19', '2021-04-29 06:03:19'),
	(17, 'operate', 'operate@cgd.go.th', NULL, '$2y$10$AcrMf9o4348loExMNPXY1uq./qLL7e0hqLacL2gWIubqM/5Q.xppC', NULL, NULL, NULL, '2021-04-29 06:11:53', '2021-04-29 06:11:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cgd_iso.user_details
CREATE TABLE IF NOT EXISTS `user_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ldap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_logon` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_group_id_foreign` (`group_id`),
  CONSTRAINT `user_details_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cgd_iso.user_details: ~6 rows (approximately)
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` (`id`, `ldap`, `firstname`, `lastname`, `group_id`, `roles`, `last_logon`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
	(65, 'request1', 'request1', 'request1', 1, '["request","follow"]', NULL, 1, '2021-04-28 14:29:37', '2021-04-28 14:29:37', 12),
	(66, 'ensure1', 'ensure1', 'ensure1', 1, '["ensure"]', NULL, 1, '2021-04-28 15:21:00', '2021-04-28 15:21:00', 13),
	(67, 'songwut.saj', '?????????????????????', '????????????????????????', 7, '["request","consider","follow","check"]', NULL, 1, '2021-04-29 04:30:39', '2021-04-29 04:30:39', 14),
	(68, 'consider', 'consider', 'consider', 7, '["consider","check"]', NULL, 1, '2021-04-29 04:43:58', '2021-04-29 04:43:58', 15),
	(69, 'approve', 'approve', 'approve', 10, '["approve"]', NULL, 1, '2021-04-29 06:03:19', '2021-04-29 06:03:19', 16),
	(70, 'operate', 'operate', 'operate', 6, '["operate"]', NULL, 1, '2021-04-29 06:11:53', '2021-04-29 06:11:53', 17);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

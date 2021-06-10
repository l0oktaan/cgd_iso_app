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

-- Dumping data for table cgd_iso.user_details: ~55 rows (approximately)
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
REPLACE INTO `user_details` (`id`, `ldap`, `firstname`, `lastname`, `group_id`, `roles`, `last_logon`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
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
	(46, 'songwut.saj1', 'ทรงวุฒิ', 'สัจจบุตร', 7, '["request","follow","admin","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:06:04', NULL),
	(47, 'siriluk.sir', 'ศิริลักษณ์', 'ศิริมังคลา', 7, '["request","follow","admin","ensure","consider","check","operation"]', NULL, 1, NULL, '2021-04-24 18:05:56', NULL),
	(64, 'sudjid.lap', 'สุดจิตร', 'ลาภเลิศสุข', 10, '["approve"]', NULL, 1, '2021-04-24 18:08:51', '2021-04-24 18:08:51', NULL),
	(65, 'request1', 'request1', 'request1', 1, '["request","follow"]', NULL, 1, '2021-04-28 14:29:37', '2021-04-28 14:29:37', 12),
	(66, 'ensure1', 'ensure1', 'ensure1', 1, '["ensure"]', NULL, 1, '2021-04-28 15:21:00', '2021-04-28 15:21:00', 13),
	(67, 'songwut.saj1', 'ทรงวุฒิ', 'สัจจบุตร', 7, '["admin","request","consider","follow","check"]', NULL, 1, '2021-04-29 04:30:39', '2021-04-29 04:30:39', 14),
	(68, 'consider', 'consider', 'consider', 7, '["consider","check"]', NULL, 1, '2021-04-29 04:43:58', '2021-04-29 04:43:58', 15),
	(69, 'approve', 'approve', 'approve', 10, '["approve"]', NULL, 1, '2021-04-29 06:03:19', '2021-04-29 06:03:19', 16),
	(70, 'operate', 'operate', 'operate', 7, '["operate"]', NULL, 1, '2021-04-29 06:11:53', '2021-04-29 06:11:53', 17),
	(79, 'songwut.saj', 'ทรงวุฒิ', 'สัจจบุตร', 7, '["request","follow"]', NULL, 0, '2021-06-10 08:18:54', '2021-06-10 08:18:54', 34);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

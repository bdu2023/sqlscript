-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.8 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table bdusupport.admission_forward_record
CREATE TABLE IF NOT EXISTS `admission_forward_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ma_ho_so` int DEFAULT NULL,
  `ho_ten_day_du` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(15) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `ngay_sinh` varchar(20) DEFAULT '',
  `gioi_tinh` int DEFAULT '0',
  `nhap_ho` tinyint(1) DEFAULT '0',
  `nguoi_gt_ho_ten` varchar(255) DEFAULT '',
  `nguoi_gt_sdt` varchar(15) DEFAULT '',
  `nguoi_nhap_ho_ten` varchar(255) DEFAULT '',
  `nguoi_nhap_sdt` varchar(15) DEFAULT '',
  `trang_thai` varchar(30) DEFAULT 'MOI_TIEP_NHAN',
  `bctm_response` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admission_forward_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mini_app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table bdusupport.miniapp_banner
CREATE TABLE IF NOT EXISTS `miniapp_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `order` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
ALTER TABLE `news` ADD COLUMN `bdu_id` integer NULL UNIQUE;
ALTER TABLE `news` ADD COLUMN `content` longtext NULL;
ALTER TABLE `mini_app_user` ADD COLUMN `phone` varchar(20) NULL;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

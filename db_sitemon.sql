/*
MySQL Backup
Database: db_sitemon
Backup Time: 2022-06-29 16:38:01
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `db_sitemon`.`auth_activation_attempts`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_groups`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_groups_permissions`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_groups_users`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_logins`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_permissions`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_reset_attempts`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_tokens`;
DROP TABLE IF EXISTS `db_sitemon`.`auth_users_permissions`;
DROP TABLE IF EXISTS `db_sitemon`.`migrations`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_bidangbalai`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_bidangbalai_detail`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_dokumenkak`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_indikator_subkegiatan`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_kegiatan`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_program`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_subkegiatan`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_tahapankak`;
DROP TABLE IF EXISTS `db_sitemon`.`tb_urusan`;
DROP TABLE IF EXISTS `db_sitemon`.`users`;
DROP VIEW IF EXISTS `db_sitemon`.`view_bidangbalai_detail`;
CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `tb_bidangbalai` (
  `id_bidangbalai` int(5) NOT NULL,
  `bidangbalai` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bidangbalai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_bidangbalai_detail` (
  `id_bidangbalai_detail` int(5) NOT NULL AUTO_INCREMENT,
  `id_bidangbalai` int(5) DEFAULT NULL,
  `id_subkegiatan` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_bidangbalai_detail`) USING BTREE,
  KEY `fk_tb_bidangbalai_memiliki_tb_bidangbalai_1` (`id_bidangbalai`),
  KEY `fk_tb_bidangbalai_memiliki_tb_subkegiatan_1` (`id_subkegiatan`),
  CONSTRAINT `tb_bidangbalai_detail_ibfk_1` FOREIGN KEY (`id_bidangbalai`) REFERENCES `tb_bidangbalai` (`id_bidangbalai`),
  CONSTRAINT `tb_bidangbalai_detail_ibfk_4` FOREIGN KEY (`id_subkegiatan`) REFERENCES `tb_subkegiatan` (`id_subkegiatan`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
CREATE TABLE `tb_dokumenkak` (
  `id_dokumen` int(5) NOT NULL,
  `id_bidangbalai` int(5) NOT NULL,
  `id_subkegiatan` int(5) NOT NULL,
  `nama_dokumen` varchar(255) NOT NULL,
  `id_tahapankak` int(5) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `data_dukung` varchar(255) NOT NULL,
  `tahun` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`),
  CONSTRAINT `tb_dokumenkak_ibfk_1` FOREIGN KEY (`id_bidangbalai`) REFERENCES `tb_bidangbalai` (`id_bidangbalai`),
  CONSTRAINT `tb_dokumenkak_ibfk_2` FOREIGN KEY (`id_subkegiatan`) REFERENCES `tb_subkegiatan` (`id_subkegiatan`),
  CONSTRAINT `tb_dokumenkak_ibfk_3` FOREIGN KEY (`id_tahapankak`) REFERENCES `tb_tahapankak` (`id_tahapankak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_indikator_subkegiatan` (
  `id_indikator_subkegiatan` int(5) NOT NULL AUTO_INCREMENT,
  `id_subkegiatan` int(5) DEFAULT NULL,
  `id_bidangbalai` int(5) DEFAULT NULL,
  `indikator_subkegiatan` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `target_anggaran2023` int(10) DEFAULT NULL,
  `pagu_anggaran2023` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_indikator_subkegiatan`),
  KEY `fk_tb_indikatorsubkegiatan_tb_subkegiatan_1` (`id_subkegiatan`),
  KEY `fk_tb_indikatorsubkegiatan_tb_bidangbalai_1` (`id_bidangbalai`),
  CONSTRAINT `fk_tb_indikatorsubkegiatan_tb_bidangbalai_1` FOREIGN KEY (`id_bidangbalai`) REFERENCES `tb_bidangbalai` (`id_bidangbalai`),
  CONSTRAINT `fk_tb_indikatorsubkegiatan_tb_subkegiatan_1` FOREIGN KEY (`id_subkegiatan`) REFERENCES `tb_subkegiatan` (`id_subkegiatan`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;
CREATE TABLE `tb_kegiatan` (
  `id_kegiatan` int(5) NOT NULL,
  `kode_kegiatan` varchar(255) DEFAULT NULL,
  `id_program` int(5) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan`),
  CONSTRAINT `tb_kegiatan_ibfk_1` FOREIGN KEY (`id_program`) REFERENCES `tb_program` (`id_program`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_program` (
  `id_program` int(5) NOT NULL,
  `id_urusan` int(5) DEFAULT NULL,
  `kode_program` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_program`),
  CONSTRAINT `tb_program_ibfk_1` FOREIGN KEY (`id_urusan`) REFERENCES `tb_urusan` (`id_urusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_subkegiatan` (
  `id_subkegiatan` int(5) NOT NULL,
  `kode_subkegiatan` varchar(255) DEFAULT NULL,
  `id_kegiatan` int(5) DEFAULT NULL,
  `subkegiatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_subkegiatan`),
  CONSTRAINT `tb_subkegiatan_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `tb_kegiatan` (`id_kegiatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_tahapankak` (
  `id_tahapankak` int(5) NOT NULL,
  `tahapan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tahapankak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `tb_urusan` (
  `id_urusan` int(5) NOT NULL,
  `kode_urusan` varchar(255) DEFAULT NULL,
  `urusan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_urusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'user_image.jpg',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id_bidangbalai` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `user_ibfk_1` (`id_bidangbalai`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_bidangbalai`) REFERENCES `tb_bidangbalai` (`id_bidangbalai`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_bidangbalai_detail` AS SELECT
tb_bidangbalai_detail.id_bidangbalai_detail,
tb_bidangbalai_detail.id_bidangbalai,
tb_bidangbalai_detail.id_subkegiatan,
tb_subkegiatan.kode_subkegiatan,
tb_subkegiatan.id_kegiatan,
tb_subkegiatan.subkegiatan,
tb_kegiatan.kode_kegiatan,
tb_kegiatan.id_program,
tb_kegiatan.kegiatan,
tb_program.id_urusan,
tb_program.kode_program,
tb_program.program
FROM
tb_bidangbalai_detail
INNER JOIN tb_subkegiatan ON tb_bidangbalai_detail.id_subkegiatan = tb_subkegiatan.id_subkegiatan
INNER JOIN tb_kegiatan ON tb_subkegiatan.id_kegiatan = tb_kegiatan.id_kegiatan
INNER JOIN tb_program ON tb_kegiatan.id_program = tb_program.id_program ;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_activation_attempts` WRITE;
DELETE FROM `db_sitemon`.`auth_activation_attempts`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_groups` WRITE;
DELETE FROM `db_sitemon`.`auth_groups`;
INSERT INTO `db_sitemon`.`auth_groups` (`id`,`name`,`description`) VALUES (1, 'admin', 'Site Administrator'),(2, 'bidangbalai', 'Site Bidang dan Balai');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_groups_permissions` WRITE;
DELETE FROM `db_sitemon`.`auth_groups_permissions`;
INSERT INTO `db_sitemon`.`auth_groups_permissions` (`group_id`,`permission_id`) VALUES (1, 1),(1, 1),(2, 2);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_groups_users` WRITE;
DELETE FROM `db_sitemon`.`auth_groups_users`;
INSERT INTO `db_sitemon`.`auth_groups_users` (`group_id`,`user_id`) VALUES (1, 3),(2, 4),(2, 5);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_logins` WRITE;
DELETE FROM `db_sitemon`.`auth_logins`;
INSERT INTO `db_sitemon`.`auth_logins` (`id`,`ip_address`,`email`,`user_id`,`date`,`success`) VALUES (1, '::1', 'apnovaldi@gmail.com', 3, '2022-06-14 23:32:59', 1),(2, '::1', 'apnovaldi@gmail.com', 3, '2022-06-14 23:35:47', 1),(3, '::1', '196506141991031005', NULL, '2022-06-15 00:26:18', 0),(4, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 00:45:44', 1),(5, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 00:46:08', 1),(6, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 00:47:22', 1),(7, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 01:25:31', 1),(8, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 23:19:42', 1),(9, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 23:40:08', 1),(10, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 23:48:54', 1),(11, '::1', 'apnovaldi@gmail.com', 3, '2022-06-15 23:52:23', 1),(12, '::1', 'apnovaldi@gmail.com', 3, '2022-06-16 00:12:06', 1),(13, '::1', 'apnovaldi@gmail.com', 3, '2022-06-16 01:23:22', 1),(14, '::1', 'apnovaldi@gmail.com', 3, '2022-06-16 02:03:57', 1),(15, '::1', 'apnovaldi@gmail.com', 3, '2022-06-17 01:17:26', 1),(16, '::1', 'apnovaldi@gmail.com', 3, '2022-06-17 02:37:47', 1),(17, '::1', 'apnovaldi@gmail.com', 3, '2022-06-18 07:19:16', 1),(18, '::1', 'apnovaldi@gmail.com', 3, '2022-06-18 11:55:25', 1),(19, '::1', 'apnovaldi@gmail.com', 3, '2022-06-18 22:47:25', 1),(20, '::1', 'apnovaldi@gmail.com', 3, '2022-06-19 06:16:59', 1),(21, '::1', 'apnovaldi@gmail.com', 3, '2022-06-19 20:17:02', 1),(22, '::1', 'apnovaldi@gmail.com', 3, '2022-06-20 01:46:48', 1),(23, '::1', 'apnovaldi@gmail.com', 3, '2022-06-20 04:08:49', 1),(24, '::1', 'apnovaldi@gmail.com', 3, '2022-06-21 21:19:09', 1),(25, '::1', 'apnovaldi@gmail.com', 3, '2022-06-22 20:12:36', 1),(26, '::1', 'apnovaldi@gmail.com', 3, '2022-06-23 02:56:57', 1),(27, '::1', 'apnovaldi@gmail.com', 3, '2022-06-23 21:53:46', 1),(28, '::1', 'apnovaldi@gmail.com', 3, '2022-06-27 03:51:31', 1),(29, '::1', 'apnovaldi@gmail.com', 3, '2022-06-27 19:42:05', 1),(30, '::1', 'apnovaldi@gmail.com', 3, '2022-06-28 19:51:41', 1),(31, '::1', 'apnovaldi@gmail.com', 3, '2022-06-28 20:35:50', 1),(32, '::1', 'apnovaldi@gmail.com', 3, '2022-06-28 22:22:43', 1),(33, '::1', 'apnovaldi@gmail.com', 3, '2022-06-29 01:08:30', 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_permissions` WRITE;
DELETE FROM `db_sitemon`.`auth_permissions`;
INSERT INTO `db_sitemon`.`auth_permissions` (`id`,`name`,`description`) VALUES (1, 'manage-user', 'manage data user'),(2, 'Manage-profile', 'manage only profile');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_reset_attempts` WRITE;
DELETE FROM `db_sitemon`.`auth_reset_attempts`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_tokens` WRITE;
DELETE FROM `db_sitemon`.`auth_tokens`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`auth_users_permissions` WRITE;
DELETE FROM `db_sitemon`.`auth_users_permissions`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`migrations` WRITE;
DELETE FROM `db_sitemon`.`migrations`;
INSERT INTO `db_sitemon`.`migrations` (`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) VALUES (1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1655193778, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_bidangbalai` WRITE;
DELETE FROM `db_sitemon`.`tb_bidangbalai`;
INSERT INTO `db_sitemon`.`tb_bidangbalai` (`id_bidangbalai`,`bidangbalai`,`alamat`) VALUES (1, 'Sekretariat', 'Jl. Siliwangi No 355-357 Semarang Barat'),(2, 'Bidang Angkutan Jalan', 'Jl. Siliwangi No 355-357 Semarang Barat'),(3, 'Bidang Lalu Lintas ', 'Jl. Siliwangi No 355-357 Semarang Barat'),(4, 'Bidang Jaringan Transportasi dan Perkeretaapian', 'Jl. Siliwangi No 355-357 Semarang Barat'),(5, 'Bidang Pelayaran', 'Jl. Siliwangi No 355-357 Semarang Barat'),(6, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah I Kelas A', 'Jl. Raung No.24-26, Gajahmungkur, Kec. Gajahmungkur, Kota Semarang'),(7, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah II Kelas B', 'Jl. P Sudirman No 52 Puri Kec. Pati, Kab Pati'),(8, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah III Kelas A', 'Jl. Slamet Riyadi No 2 Surakarta'),(9, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah IV Kelas A', 'Jl. Diponegoro No 1 Magelang'),(10, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah V Kelas B', 'Jl. Adhyaksa No.25, Brubahan, Purwanegara, Kec. Purwokerto Utara, Kabupaten Banyumas'),(11, 'Balai Pengelola Sarana Prasarana Pehubungan Wilayah VI Kelas A', 'Jl. Pemuda No.50, Kergon, Kec. Pekalongan Barat, Kota Pekalongan'),(12, 'Balai Transportasi Jawa Tengah', 'Jl. Siliwangi No 355-357 Semarang Barat');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_bidangbalai_detail` WRITE;
DELETE FROM `db_sitemon`.`tb_bidangbalai_detail`;
INSERT INTO `db_sitemon`.`tb_bidangbalai_detail` (`id_bidangbalai_detail`,`id_bidangbalai`,`id_subkegiatan`) VALUES (1, 4, 1),(2, 4, 1),(3, 3, 2),(4, 3, 2),(5, 3, 2),(6, 3, 2),(7, 3, 2),(8, 3, 2),(9, 3, 2),(10, 8, 2),(11, 8, 2),(12, 8, 2),(13, 8, 2),(14, 8, 2),(15, 7, 2),(16, 7, 2),(17, 7, 2),(18, 7, 2),(19, 7, 2),(20, 6, 2),(21, 6, 2),(22, 6, 2),(23, 6, 2),(24, 6, 2),(25, 9, 2),(26, 9, 2),(27, 9, 2),(28, 9, 2),(29, 9, 2),(30, 9, 2),(31, 11, 2),(32, 11, 2),(33, 11, 2),(34, 11, 2),(35, 11, 2),(36, 10, 2),(37, 10, 2),(38, 10, 2),(39, 10, 2),(40, 10, 2),(41, 10, 2),(42, 10, 2),(43, 10, 2),(44, 12, 2),(45, 8, 3),(46, 8, 3),(47, 7, 3),(48, 7, 3),(49, 6, 3),(50, 6, 3),(51, 9, 3),(52, 9, 3),(53, 11, 3),(54, 11, 3),(55, 10, 3),(56, 10, 3),(57, 4, 4),(58, 4, 5),(59, 4, 5),(60, 4, 5),(61, 4, 6),(62, 4, 6),(63, 4, 6),(64, 4, 6),(65, 4, 7),(66, 4, 7),(67, 3, 8),(68, 3, 9),(69, 3, 10),(70, 3, 11),(71, 8, 12),(72, 7, 12),(73, 6, 12),(74, 9, 12),(75, 11, 12),(76, 10, 12),(77, 3, 13),(78, 3, 13),(79, 3, 14),(80, 3, 14),(81, 8, 14),(82, 7, 14),(83, 6, 14),(84, 9, 14),(85, 11, 14),(86, 10, 14),(87, 12, 15),(88, 8, 16),(89, 7, 16),(90, 6, 16),(91, 9, 16),(92, 11, 16),(93, 10, 16),(94, 2, 16),(95, 2, 17),(96, 2, 17),(97, 2, 17),(98, 2, 18),(99, 2, 18),(100, 2, 19),(101, 2, 20),(102, 2, 20),(103, 2, 21),(104, 2, 21),(105, 8, 22),(106, 8, 22),(107, 7, 22),(108, 7, 22),(109, 6, 22),(110, 6, 22),(111, 9, 22),(112, 9, 22),(113, 11, 22),(114, 11, 22),(115, 10, 22),(116, 10, 22),(117, 2, 23),(118, 2, 23),(119, 2, 24),(120, 12, 25),(121, 5, 26),(122, 5, 27),(123, 5, 27),(124, 5, 27),(125, 5, 27),(126, 5, 28),(127, 5, 28),(128, 5, 28),(129, 5, 28),(130, 5, 28),(131, 5, 28),(132, 5, 28),(133, 5, 29),(134, 5, 30),(135, 5, 30),(136, 5, 31),(137, 5, 31),(138, 5, 31),(139, 4, 32),(140, 4, 33),(141, 4, 33),(142, 4, 33),(143, 4, 33),(144, 4, 33),(145, 4, 33),(146, 4, 33),(147, 1, 34),(148, 1, 35),(149, 1, 36),(150, 12, 37),(151, 8, 37),(152, 7, 37),(153, 6, 37),(154, 9, 37),(155, 11, 37),(156, 10, 37),(157, 1, 37),(158, 1, 38),(159, 1, 39),(160, 1, 40),(161, 1, 41),(162, 1, 42),(163, 12, 43),(164, 8, 43),(165, 7, 43),(166, 6, 43),(167, 9, 43),(168, 11, 43),(169, 10, 43),(170, 1, 43),(171, 12, 44),(172, 8, 44),(173, 7, 44),(174, 6, 44),(175, 9, 44),(176, 1, 44),(177, 10, 44),(178, 1, 44),(179, 1, 44),(180, 12, 45),(181, 8, 45),(182, 7, 45),(183, 6, 45),(184, 9, 45),(185, 11, 45),(186, 10, 45),(187, 1, 45),(188, 12, 46),(189, 8, 46),(190, 7, 46),(191, 6, 46),(192, 9, 46),(193, 11, 46),(194, 10, 46),(195, 1, 46),(196, 12, 47),(197, 8, 47),(198, 7, 47),(199, 6, 47),(200, 9, 47),(201, 11, 47),(202, 10, 47),(203, 1, 47),(204, 1, 48),(205, 1, 49),(206, 1, 50),(207, 1, 51),(208, 1, 52),(209, 1, 53),(210, 1, 54),(211, 1, 55),(212, 12, 56),(213, 1, 57),(214, 12, 58),(215, 8, 58),(216, 7, 58),(217, 6, 58),(218, 9, 58),(219, 11, 58),(220, 10, 58),(221, 1, 58),(222, 1, 59),(223, 12, 60),(224, 8, 60),(225, 7, 60),(226, 6, 60),(227, 9, 60),(228, 11, 60),(229, 10, 60),(230, 1, 60),(231, 1, 61),(232, 1, 62),(233, 12, 63),(234, 12, 64),(235, 8, 64),(236, 7, 64),(237, 6, 64),(238, 9, 64),(239, 11, 64),(240, 10, 64),(241, 1, 64),(242, 12, 65),(243, 8, 65),(244, 7, 65),(245, 6, 65),(246, 9, 65),(247, 11, 65),(248, 10, 65),(249, 1, 65),(250, 1, 66);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_dokumenkak` WRITE;
DELETE FROM `db_sitemon`.`tb_dokumenkak`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_indikator_subkegiatan` WRITE;
DELETE FROM `db_sitemon`.`tb_indikator_subkegiatan`;
INSERT INTO `db_sitemon`.`tb_indikator_subkegiatan` (`id_indikator_subkegiatan`,`id_subkegiatan`,`id_bidangbalai`,`indikator_subkegiatan`,`satuan`,`target_anggaran2023`,`pagu_anggaran2023`) VALUES (1, 1, 4, 'Jumlah fasilitasi pembangunan simpul dan layanan transportasi strategis', 'Lokasi', 8, 200000000),(2, 1, 4, 'Jumlah Penyusunan (Review) dan Sosialisasi Rencana Induk Jaringan LLAJ Provinsi', 'Dokumen', 1, 400000000),(3, 2, 3, 'Jumlah Pengadaan Aplikator Marka', 'Unit', 0, 0),(4, 2, 3, 'Jumlah Pengadaan dan Pemasangan APILL', 'Unit', 2, 515000000),(5, 2, 3, 'Jumlah Pengadaan dan Pemasangan ITS', 'Unit', 0, 0),(6, 2, 3, 'Jumlah Pengadaan dan Pemasangan LPJU', 'Unit', 250, 4838000000),(7, 2, 3, 'Jumlah Pengadaan dan Pemasangan Rambu', 'Buah', 350, 382000000),(8, 2, 3, 'Jumlah Pengadaan dan Pemasangan RPPJ', 'Buah', 29, 273825000),(9, 2, 3, 'Jumlah Pengadaan dan Pemasangan Warning Light', 'Unit', 10, 272500000),(10, 2, 8, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah III Kelas A)', 'Buah', 0, 0),(11, 2, 8, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah III Kelas A)', 'Buah', 0, 0),(12, 2, 8, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah III Kelas A)', 'Unit', 0, 0),(13, 2, 8, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah III Kelas A)', 'm', 10000, 328000000),(14, 2, 8, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah III Kelas A)', 'Unit', 0, 0),(15, 2, 7, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah II Kelas B)', 'Buah', 0, 0),(16, 2, 7, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah II Kelas B)', 'Buah', 0, 0),(17, 2, 7, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah II Kelas B)', 'Unit', 0, 0),(18, 2, 7, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah II Kelas B)', 'm', 10000, 340000000),(19, 2, 7, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah II Kelas B)', 'Unit', 0, 0),(20, 2, 6, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah I Kelas A)', 'Buah', 0, 0),(21, 2, 6, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah I Kelas A)', 'Buah', 0, 0),(22, 2, 6, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah I Kelas A)', 'Unit', 30, 170000000),(23, 2, 6, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah I Kelas A)', 'm', 10000, 240000000),(24, 2, 6, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah I Kelas A)', 'Unit', 0, 0),(25, 2, 9, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah IV Kelas A)', 'Buah', 0, 0),(26, 2, 9, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah IV Kelas A)', 'Buah', 0, 0),(27, 2, 9, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah IV Kelas A)', 'Unit', 25, 300000000),(28, 2, 9, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah IV Kelas A)', 'm', 10000, 240000000),(29, 2, 9, 'Jumlah Pengadaan dan Pemasangan Traffic Cone (BPSPP Wilayah IV Kelas A)', 'Buah', 0, 0),(30, 2, 9, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah IV Kelas A)', 'Unit', 0, 0),(31, 2, 11, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah VI Kelas A)', 'Buah', 0, 0),(32, 2, 11, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah VI Kelas A)', 'Buah', 0, 0),(33, 2, 11, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah VI Kelas A)', 'Unit', 0, 0),(34, 2, 11, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah VI Kelas A)', 'm', 10000, 390000000),(35, 2, 11, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah VI Kelas A)', 'Unit', 0, 0),(36, 2, 10, 'Jumlah Pengadaan dan Pemasangan Cermin Tikung (BPSPP Wilayah V Kelas B)', 'Buah', 0, 0),(37, 2, 10, 'Jumlah Pengadaan dan Pemasangan Deliniator (BPSPP Wilayah V Kelas B)', 'Buah', 0, 0),(38, 2, 10, 'Jumlah Pengadaan dan Pemasangan Gazon (BPSPP Wilayah V Kelas B)', 'Buah', 0, 0),(39, 2, 10, 'Jumlah Pengadaan dan Pemasangan Guardrail (BPSPP Wilayah V Kelas B)', 'Unit', 0, 0),(40, 2, 10, 'Jumlah Pengadaan dan Pemasangan Marka (BPSPP Wilayah V Kelas B)', 'm', 10000, 370000000),(41, 2, 10, 'Jumlah Pengadaan dan Pemasangan Traffic Cone (BPSPP Wilayah V Kelas B)', 'Buah', 0, 0),(42, 2, 10, 'Jumlah Pengadaan dan Pemasangan Water Barrier (BPSPP Wilayah V Kelas B)', 'Buah', 0, 0),(43, 2, 10, 'Jumlah ruas jalan provinsi yang terdata fasilitas perlengkapan jalannya (BPSPP Wilayah V Kelas B)', 'Unit', 0, 0),(44, 2, 12, 'Jumlah Pemeliharaan dan Pembangunan Shelter BRT Trans Jateng', 'Paket', 2, 1818700000),(45, 3, 8, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah III Kelas A)', 'Orang', 76, 91200000),(46, 3, 8, 'Jumlah Penggantian LPJU (BPSPP Wilayah III Kelas A)', 'Unit', 40, 230000000),(47, 3, 7, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah II Kelas B)', 'Orang', 52, 62400000),(48, 3, 7, 'Jumlah Penggantian LPJU (BPSPP Wilayah II Kelas B)', 'Unit', 40, 220000000),(49, 3, 6, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah I Kelas A)', 'Orang', 50, 60000000),(50, 3, 6, 'Jumlah Penggantian LPJU (BPSPP Wilayah I Kelas A)', 'Unit', 40, 220000000),(51, 3, 9, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah IV Kelas A)', 'Orang', 62, 76800000),(52, 3, 9, 'Jumlah Penggantian LPJU (BPSPP Wilayah IV Kelas A)', 'Unit', 40, 230000000),(53, 3, 11, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah VI Kelas A)', 'Orang', 44, 52800000),(54, 3, 11, 'Jumlah Penggantian LPJU (BPSPP Wilayah VI Kelas A)', 'Unit', 40, 220000000),(55, 3, 10, 'Jumlah Anggota Kelompok Masyarakat Sadar Keselamatan yang dilibatkan dalam mempertahankan fungsi perlengkapan jalan (BPSPP Wilayah V Kelas B)', 'Orang', 52, 62400000),(56, 3, 10, 'Jumlah Penggantian LPJU (BPSPP Wilayah V Kelas B)', 'Unit', 40, 220000000),(57, 4, 4, 'Jumlah studi rencana pembangunan Terminal Penumpang Tipe B', 'Dokumen', 1, 60000000),(58, 5, 4, 'Jumlah Pembangunan Terminal', 'Kegiatan', 1, 5191509000),(59, 5, 4, 'Jumlah Pengadan Tanah Terminal', 'Paket', 0, 0),(60, 5, 4, 'Jumlah Pengawasan Pembangunan Terminal', 'Paket', 1, 100000000),(61, 6, 4, 'Jumlah Penerapan Sistem Informasi', 'Lokasi', 0, 0),(62, 6, 4, 'Jumlah Pengadaan dan Pemasangan CCTV', 'Lokasi', 0, 0),(63, 6, 4, 'Jumlah Pengawasan Pengembangan Terminal', 'Paket', 5, 120000000),(64, 6, 4, 'Jumlah Pengembangan Terminal', 'Lokasi', 5, 2930000000),(65, 7, 4, 'Jumlah Pembinaan penyelenggaraan Terminal Type B', 'Kali', 0, 0),(66, 7, 4, 'Jumlah Supervisi dan Bimbingan Teknis penyelenggaraan Terminal Type B', 'Kali', 4, 34700000),(67, 8, 3, 'Jumlah Peserta Kabupaten/Kota di Provinsi Jateng Lomba Tertib Lalin Tingkat Nasional', 'Kabupaten/Kota', 18, 46320000),(68, 9, 3, 'Jumlah Supervisi Penanganan Daerah Rawan Kecelakaan', 'Lokasi', 21, 60000000),(69, 10, 3, 'Jumlah Pelaksanaan Forum LLAJ', 'Kegiatan', 6, 39000000),(70, 11, 3, 'Jumlah penilaian dan pengawasan Andalalin di Ruas Jalan Provinsi', 'Dokumen', 24, 125000000),(71, 12, 8, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah III Kelas A)', 'Kali', 365, 50400000),(72, 12, 7, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah II Kelas B)', 'Kali', 365, 10500000),(73, 12, 6, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah I Kelas A)', 'Kali', 365, 15625000),(74, 12, 9, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah IV Kelas A)', 'Kali', 365, 25000000),(75, 12, 11, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah VI Kelas A)', 'Kali', 365, 21990000),(76, 12, 10, 'Jumlah Pelaksanaan Inspeksi, Audit dan Pemantauan Keselamatan Sarana Transportasi di Terminal Tipe B (BPSPP Wilayah V Kelas B)', 'Kali', 365, 15500000),(77, 13, 3, 'Jumlah peserta Abdi Yasa yang mengikuti pemahaman keselamatan jalan', 'Orang', 70, 130000000),(78, 13, 3, 'Jumlah peserta Pelajar Pelopor yang mengikuti pemahaman keselamatan jalan', 'Orang', 35, 70000000),(79, 14, 3, 'Jumlah Kendaraan Angkutan Umum Penumpang dan Barang diperiksa (Bidang Lalu Lintas)', 'Unit', 0, 0),(80, 14, 3, 'Jumlah Pengawasan Perusahaan Karoseri Terdaftar', 'Unit', 20, 35000000),(81, 14, 8, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah III Kelas A)', 'Unit', 0, 0),(82, 14, 7, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah II Kelas B)', 'Unit', 0, 0),(83, 14, 6, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah I Kelas A)', 'Unit', 0, 0),(84, 14, 9, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah IV Kelas A)', 'Unit', 0, 0),(85, 14, 11, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah VI Kelas A)', 'Unit', 0, 0),(86, 14, 10, 'Jumlah kendaraan angkutan penumpang dan barang diperiksa (BPSPP Wilayah V Kelas B)', 'Unit', 0, 0),(87, 15, 12, 'Jumlah koridor angkutan umum massal di Kawasan Aglomerasi Perkotaan', 'Trayek', 7, 103432939000),(88, 16, 8, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah III Kelas A', 'Lokasi', 11, 313400000),(89, 16, 7, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah II Kelas B', 'Lokasi', 2, 85450000),(90, 16, 6, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah I Kelas A', 'Lokasi', 4, 170000000),(91, 16, 9, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah IV Kelas A', 'Lokasi', 4, 142800000),(92, 16, 11, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah VI Kelas A', 'Lokasi', 5, 200000000),(93, 16, 10, 'Jumlah Pelayanan Posko Angkutan lebaran, natal dan tahun baru di BPSPP Wilayah V Kelas B', 'Lokasi', 4, 150000000),(94, 16, 2, 'Jumlah Pelayanan Posko Terpadu  Angkutan lebaran, natal dan tahun baru', 'Lokasi', 28, 1450000000),(95, 17, 2, 'Jumlah Evaluasi peningkatan kapasitas kelembagaan balai transportasi Jateng', 'Paket', 0, 0),(96, 17, 2, 'Jumlah studi / kajian pengembangan angkutan aglomerasi', 'Dokumen', 1, 70000000),(97, 17, 2, 'Jumlah Studi Review Maseterplan sistem angkutan massal', 'Dokumen', 0, 0),(98, 18, 2, 'Jumlah Peserta sosialisasi angkutan aglomerasi', 'Orang', 300, 110000000),(99, 18, 2, 'Sosialisasi Dokumen review masterplan SAUM', 'Lokasi', 0, 0),(100, 19, 2, 'Jumlah Pelaksanaan fasilitasi angkutan perintis', 'Kali', 2, 50000000),(101, 20, 2, 'Jumlah fasilitasi dan sosialisasi  angkutan lanjutan di simpul transportasi', 'Lokasi', 1, 20000000),(102, 20, 2, 'Jumlah fasilitasi dan sosialisasi layanan angkutan kawasan untuk mendukung kawasan pariwisata strategis', 'Lokasi', 1, 20000000),(103, 21, 2, 'Jumlah Evaluasi Trayek AKDP', 'Dokumen', 0, NULL),(104, 21, 2, 'Jumlah Perusahaan AKDP yang memenuhi Standar Pelayanan Angkutan Orang', 'Unit', 30, 50000000),(105, 22, 8, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah III Kelas A)', 'Unit', 10, 20000000),(106, 22, 8, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah III Kelas A)', 'Unit', 10, 20850000),(107, 22, 7, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah II Kelas B)', 'Unit', 6, 10000000),(108, 22, 7, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah II Kelas B)', 'Unit', 6, 10000000),(109, 22, 6, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah I Kelas A)', 'Unit', 9, 12500000),(110, 22, 6, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah I Kelas A)', 'Unit', 9, 12500000),(111, 22, 9, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah IV Kelas A)', 'Unit', 7, 15000000),(112, 22, 9, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah IV Kelas A)', 'Unit', 7, 15000000),(113, 22, 11, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah VI Kelas A)', 'Unit', 7, 15000000),(114, 22, 11, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah VI Kelas A)', 'Unit', 7, 15000000),(115, 22, 10, 'Jumlah pembaharuan izin yang diterbitkan untuk Perusahaan Bus AKDP (BPSPP Wilayah V Kelas B)', 'Unit', 6, 15000000),(116, 22, 10, 'Jumlah pembinaan perusahaan angkutan umum AKDP (BPSPP Wilayah V Kelas B)', 'Unit', 6, 15000000),(117, 23, 2, 'Jumlah evaluasi kebutuhan pelayanan dan SPM angkutan orang tidak dalam trayek', 'Trayek', 1, 25000000),(118, 23, 2, 'Jumlah pembinaan perusahaan angkutan orang tidak dalam trayek', 'Unit', 15, 25000000),(119, 24, 2, 'Jumlah evaluasi tarif dan load factor Trayek angkutan AKDP kelas Ekonomi', 'Trayek', 0, 0),(120, 25, 12, 'Jumlah Perbaikan dan pemeliharaan KMC Kartini 1', 'Paket', 1, 1732216000),(121, 26, 5, 'Jumlah BAP Peninjauan lapangan dan Verifikasi izin yang diajukan oleh Perusahaan Angkutan Laut dan Jasa Terkait Angkutan di Perairan', 'Dokumen', 50, 135000000),(122, 27, 5, 'Jumlah Appraisal KMC. Kartini I', 'Paket', 0, NULL),(123, 27, 5, 'Jumlah Bintek Penyelenggaraan dan pengusahaan bongkar muat barang', 'Orang', 0, 0),(124, 27, 5, 'Jumlah Bintek Penyelenggaraan dan pengusahaan Depo Peti Kemas', 'Orang', 0, 0),(125, 27, 5, 'Jumlah Bintek Penyelenggaraan dan pengusahaan jasa pengurusan transportasi di perairan', 'Orang', 0, 0),(126, 28, 5, 'Jumlah Evaluasi & monitoring faspel, kinerja pelabuhan', 'Lokasi', 13, 180265000),(127, 28, 5, 'Jumlah Pemasangan & pelepasan mooring buoy', 'Lokasi', 0, 0),(128, 28, 5, 'Jumlah Pemeliharaan SBNP', 'Lokasi', 0, 0),(129, 28, 5, 'Jumlah Penyusunan buku fasilitas pelabuhan di Jateng', 'Buku', 10, 8585000),(130, 28, 5, 'Jumlah Rakor pengoperasian dan pemeliharaan Pelabuhan', 'Lokasi', 3, 20250000),(131, 28, 5, 'Jumlah Sosialisasi keselamatan pelayaran & pengadaan alat keselamatan pelayaran', 'Lokasi', 0, 0),(132, 28, 5, 'Jumlah Sosialisasi SOP perijinan kepelabuhanan', 'Lokasi', 2, 10900000),(133, 29, 5, 'Jumlah SK Gubernur terkait Penetapan trayek penyeberangan sungai lintas Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 'Dokumen', 1, 30000000),(134, 30, 5, 'Jumlah Pembangunan Plengsengan Sungai', 'Lokasi', 3, 1165000000),(135, 30, 5, 'Jumlah PJU Terpasang di dermaga sungai', 'Unit', 3, 75000000),(136, 31, 5, 'Jumlah alat keselamatan ASDP', 'Buah', 0, 0),(137, 31, 5, 'Jumlah dokumen Evaluasi Kinerja ASDP', 'Dokumen', 12, 47000000),(138, 31, 5, 'Jumlah peserta Sosialisasi Keselamatan ASDP', 'Orang', 0, 0),(139, 32, 4, 'Jumlah Penyusunan, Penetapan Kebijakan dan Sosialisasi Rencana Induk Perkeretaapian', 'Kegiatan', 0, 0),(140, 33, 4, 'Jumlah FGD Revitalisasi Jalur KA', 'Lokasi', 0, NULL),(141, 33, 4, 'Jumlah Pengadaan dan pemasangan Early Warning System', 'Lokasi', 5, 1662000000),(142, 33, 4, 'Jumlah Pengadaan dan pemasangan fasilitas keselamatan di perlintasan sebidang', 'Lokasi', 3, 242000000),(143, 33, 4, 'Jumlah Pengadaan dan Pemasangan PJU di Perlintasan sebidang', 'Lokasi', 0, 0),(144, 33, 4, 'Jumlah Pengadan Gazon di perlintasan Sebidang', 'Buah', 0, 0),(145, 33, 4, 'Jumlah Pengaman penunjang keselamatan di perlintasan sebidang', 'Lokasi', 4, 877024000),(146, 33, 4, 'Jumlah Sosialisasi Keselamatan di Perlintasan Sebidang', 'Lokasi', 0, 0),(147, 34, 1, 'Jumlah dokumen perencanaan Perangkat Daerah yg disusun', 'Dokumen', 9, 300000000),(148, 35, 1, 'Jumlah dokumen evaluasi kinerja PD', 'Dokumen', 4, 100000000),(149, 36, 1, 'Jumlah bulan terpenuhinya kebutuhan gaji dan tunjangan ASN', 'Bulan', 12, 42694088000),(150, 37, 12, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (Balai Transportasi Jawa Tengah)', 'Bulan', 0, 0),(151, 37, 8, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 2000000),(152, 37, 7, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 2000000),(153, 37, 6, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 2000000),(154, 37, 9, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 2000000),(155, 37, 11, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 2000000),(156, 37, 10, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 2000000),(157, 37, 1, 'Jumlah bulan terpenuhinya kebutuhan administrasi pendukung pelaksanaan tugas ASN (Kantor Dinas Perhubungan)', 'Bulan', 12, 820200000),(158, 38, 1, 'Jumlah Laporan Keuangan Bulanan/Triwulanan/Semesteran PD yang disusun', 'Laporan', 12, 70000000),(159, 39, 1, 'Jumlah bulan terpenuhinya premi asuransi barang milik daerah', 'Bulan', 12, 165000000),(160, 40, 1, 'Jumlah unit pakaian dinas yang diadakan', 'Unit', 0, 0),(161, 41, 1, 'Jumlah bulan pelayanan administrasi kepegawaian perangkat daerah', 'Bulan', 12, 20000000),(162, 42, 1, 'Jumlah ASN yang mengikuti DIKLAT/Workshop/ Seminar', 'Orang', 20, 105000000),(163, 43, 12, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 7000000),(164, 43, 8, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 44500000),(165, 43, 7, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 35500000),(166, 43, 6, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 37500000),(167, 43, 9, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 37500000),(168, 43, 11, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 38500000),(169, 43, 10, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 36500000),(170, 43, 1, 'Jumlah bulan terpenuhinya penyediaan komponen  Instalasi Listrik/Penerangan Bangunan Kantor (Kantor Dinas Perhubungan)', 'Bulan', 12, 20000000),(171, 44, 12, 'Jumlah unit penyediaan Perlengkapan Kantor (Balai Transportasi Jawa Tengah)', 'Unit', 120, 6000000),(172, 44, 8, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah III Kelas A)', 'Unit', 240, 12000000),(173, 44, 7, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah II Kelas B)', 'Unit', 60, 3000000),(174, 44, 6, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah I Kelas A)', 'Unit', 100, 5000000),(175, 44, 9, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah IV Kelas A)', 'Unit', 100, 5000000),(176, 44, 1, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah VI Kelas A)', 'Unit', 120, 6000000),(177, 44, 10, 'Jumlah unit penyediaan Perlengkapan Kantor (BPSPP Wilayah V Kelas B)', 'Unit', 80, 4000000),(178, 44, 1, 'Jumlah unit penyediaan Peralatan Kantor', 'Unit', NULL, 0),(179, 44, 1, 'Jumlah unit penyediaan Perlengkapan Kantor (Kantor Dinas Perhubungan)', 'Unit', 1760, 88000000),(180, 45, 12, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 10500000),(181, 45, 8, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 11000000),(182, 45, 7, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 2000000),(183, 45, 6, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 4000000),(184, 45, 9, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 4000000),(185, 45, 11, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 5000000),(186, 45, 10, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 3000000),(187, 45, 1, 'Jumlah bulan terpenuhinya kebutuhan rumah tangga perangkat daerah (Kantor Dinas Perhubungan)', 'Bulan', 12, 50000000),(188, 46, 12, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (Balai Transportasi Jawa Tengah)', 'Bulan', 0, 0),(189, 46, 8, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 5500000),(190, 46, 7, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 1000000),(191, 46, 6, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 1500000),(192, 46, 9, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 1500000),(193, 46, 11, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 2000000),(194, 46, 10, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 1500000),(195, 46, 1, 'Jumlah Bulan terpenuhinya kebutuhan logistik kantor (Kantor Dinas Perhubungan)', 'Bulan', 12, 200000000),(196, 47, 12, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 3000000),(197, 47, 8, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 48400000),(198, 47, 7, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 5612000),(199, 47, 6, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 9840000),(200, 47, 9, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 14200000),(201, 47, 11, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 22000000),(202, 47, 10, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 14000000),(203, 47, 1, 'Jumlah Bulan terpenuhinya kebutuhan barang cetakan dan penggandaan kantor (Kantor Dinas Perhubungan)', 'Bulan', 12, 165000000),(204, 48, 1, 'Jumlah bulan tercukupinya kebutuhan bahan bacaan/buku perpustakaan PD', 'Bulan', 12, 5000000),(205, 49, 1, 'Jumlah bulan terpenuhinya kebutuhan fasilitasi kunjungan tamu', 'Bulan', 12, 60000000),(206, 50, 1, 'Jumlah bulan terpenuhinya pelaksanaan rapat-rapat koordinasi dan konsultasi ke dalam dan luar daerah', 'Bulan', 12, 1500000000),(207, 51, 1, 'Jumlah laporan pelaksanaan SPBE', 'Laporan', 3000, 60000000),(208, 52, 1, 'Jumlah unit pengadaan kendaraan dinas operasional', 'Unit', 0, 0),(209, 53, 1, 'Jumlah Unit pengadaan Alat Angkutan Darat tak bermotor', 'Unit', 0, NULL),(210, 54, 1, 'Jumlah unit pengadaan meubelair', 'Unit', 0, 0),(211, 55, 1, 'Jumlah unit pengadaan  Peralatan dan Mesin', 'Unit', 1, 150000000),(212, 56, 12, 'Jumlah unit Aset Tak Berwujud (Balai Transportasi Jawa Tengah)', 'Unit', 1, 200000000),(213, 57, 1, 'Jumlah unit Sarana dan Prasarana gedung Kantor/ Bangunan Lainnya', 'Unit', 5, 105000000),(214, 58, 12, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (Balai Transportasi Jawa Tengah)', 'Bulan', 0, 0),(215, 58, 8, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah III Kelas A)', 'Bulan', 0, 0),(216, 58, 7, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah II Kelas B)', 'Bulan', 0, 0),(217, 58, 6, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah I Kelas A)', 'Bulan', 0, 0),(218, 58, 9, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah IV Kelas A)', 'Bulan', 0, 0),(219, 58, 11, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah VI Kelas A)', 'Bulan', 0, 0),(220, 58, 10, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (BPSPP Wilayah V Kelas B)', 'Bulan', 0, 0),(221, 58, 1, 'Jumlah bulan pemenuhan pelayanan surat menyurat PD (Kantor Dinas Perhubungan)', 'Bulan', 12, 4000000),(222, 59, 1, 'Jumlah bulan terpenuhinya Jasa Komunikasi,air dan listrik PD', 'Bulan', 12, 1867507000),(223, 60, 12, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 5000000),(224, 60, 8, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 43200000),(225, 60, 7, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 7000000),(226, 60, 6, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 20000000),(227, 60, 9, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 25000000),(228, 60, 11, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 26400000),(229, 60, 10, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 19000000),(230, 60, 1, 'Jumlah bulan terpenuhinya jasa pelayanan umum kantor (Kantor Dinas Perhubungan)', 'Bulan', 12, 9446506000),(231, 61, 1, 'Jumlah bulan terpenuhinya biaya Pemeliharaan Rutin/ Berkala dan Pajak Kendaraan Dinas Operasional', 'Bulan', 12, 687400000),(232, 62, 1, 'Jumlah bulan terpenuhinya Pemeliharaan peralatan dan mesin lainnya', 'Bulan', 12, 150000000),(233, 63, 12, 'Jumlah bulan terpenuhinya biaya Pemeliharaan Aset tetap tak berwujud (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 200000000),(234, 64, 12, 'Jumlah Unit Gedung Yang Direhab (Balai Transportasi Jawa Tengah)', 'Unit', 0, 0),(235, 64, 8, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah III Kelas A)', 'Unit', 1, 200000000),(236, 64, 7, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah II Kelas B)', 'Unit', 1, 35000000),(237, 64, 6, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah I Kelas A)', 'Unit', 1, 35000000),(238, 64, 9, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah IV Kelas A)', 'Unit', 1, 35000000),(239, 64, 11, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah VI Kelas A)', 'Unit', 1, 35000000),(240, 64, 10, 'Jumlah Unit Gedung Yang Direhab (BPSPP Wilayah V Kelas B)', 'Unit', 1, 35000000),(241, 64, 1, 'Jumlah Unit Gedung Yang Direhab (Kantor Dinas Perhubungan)', 'Unit', 2, 300000000),(242, 65, 12, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala dsarana prasarana pendukung gedung kantor (Balai Transportasi Jawa Tengah)', 'Bulan', 12, 2500000),(243, 65, 8, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah III Kelas A)', 'Bulan', 12, 10000000),(244, 65, 7, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah II Kelas B)', 'Bulan', 12, 1000000),(245, 65, 6, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah I Kelas A)', 'Bulan', 12, 4000000),(246, 65, 9, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah IV Kelas A)', 'Bulan', 12, 4000000),(247, 65, 11, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah VI Kelas A)', 'Bulan', 12, 5000000),(248, 65, 10, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (BPSPP Wilayah V Kelas B)', 'Bulan', 12, 3000000),(249, 65, 1, 'Jumlah bulan terpenuhinya Pemeliharaan Rutin/ Berkala sarana prasarana pendukung gedung kantor (Kantor Dinas Perhubungan)', 'Bulan', 12, 100000000),(250, 66, 1, 'Jumlah bulan terpenuhinya biaya Pemeliharaan Rutin/ Berkala dsarana prasarana pendukung gedung kantor', 'Bulan', 12, 150000000);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_kegiatan` WRITE;
DELETE FROM `db_sitemon`.`tb_kegiatan`;
INSERT INTO `db_sitemon`.`tb_kegiatan` (`id_kegiatan`,`kode_kegiatan`,`id_program`,`kegiatan`) VALUES (1, '1.01', 2, 'Penetapan Rencana Induk Jaringan LLAJ Provinsi'),(2, '1.02', 2, 'Penyediaan Perlengkapan Jalan di Jalan Provinsi'),(3, '1.03', 2, 'Pengelolaan Terminal Penumpang Tipe B'),(4, '1.05', 2, 'Pelaksanaan Manajemen dan Rekayasa Lalu Lintas untuk Jaringan Jalan Provinsi'),(5, '1.06', 2, 'Persetujuan Hasil Analisis Dampak Lalu Lintas (Andalalin) untuk Jalan Provinsi'),(6, '1.07', 2, 'Audit dan Inspeksi Keselamatan LLAJ di Jalan'),(7, '1.08', 2, 'Penyediaan Angkutan Umum untuk Jasa Angkutan Orang dan/atau Barang Antar Kota dalam 1 (satu) Daerah Provinsi'),(8, '1.09', 2, 'Penetapan Kawasan Perkotaan untuk Pelayanan Angkutan Perkotaan yang Melampaui Batas 1 (satu) Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(9, '1.11', 2, 'Penetapan Rencana Umum Jaringan Trayek Pedesaan yang Melampaui 1 (satu) Daerah Kabupaten dalam 1 (satu) Daerah Provinsi'),(10, '1.12', 2, 'Penetapan Wilayah Operasi Angkutan Orang dengan Menggunakan Taksi dalam Kawasan Perkotaan yang Wilayah Operasinya Melampaui Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(11, '1.13', 2, 'Penerbitan Izin Penyelenggaraan Angkutan Orang dalam Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(12, '1.14', 2, 'Penerbitan Izin Penyelenggaraan Angkutan Taksi yang Wilayah Operasinya Melampaui Lebih dari 1 (satu) Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(13, '1.15', 2, 'Penetapan Tarif Kelas Ekonomi untuk Angkutan Orang yang Melayani Trayek antar Kota dalam Daerah Provinsi serta Angkutan Perkotaan dan Perdesaan yang Melampaui 1 (satu) Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(14, '1.05', 3, 'Penetapan Lintas Penyeberangan dan Persetujuan Pengoperasian untuk Kapal yang Melayani Penyeberangan Lintas Pelabuhan antar Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(15, '1.06', 3, 'Penerbitan Izin Usaha Jasa Terkait Berupa Bongkar Muat Barang, Jasa Pengurusan Transportasi, Angkutan Perairan Pelabuhan, Penyewaan Peralatan Angkutan Laut atau Peralatan Jasa Terkait Dengan Angkutan Laut, Tally Mandiri, dan Depo Peti Kemas'),(16, '1.09', 3, 'Pembangunan, Penerbitan Izin Pembangunan dan Pengoperasian Pelabuhan Pengumpan Regional'),(17, '1.10', 3, 'Pembangunan dan Penerbitan Izin Pelabuhan Sungai dan Danau yang Melayani Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(18, '1.01', 4, 'Penetapan Rencana Induk Perkeretaapian'),(19, '1.01', 1, 'Perencanaan, Penganggaran, dan Evaluasi Kinerja Perangkat Daerah'),(20, '1.02', 1, 'Administrasi Keuangan Perangkat Daerah'),(21, '1.03', 1, 'Administrasi Barang Milik Daerah pada Perangkat Daerah'),(22, '1.05', 1, 'Administrasi Kepegawaian Perangkat Daerah'),(23, '1.06', 1, 'Administrasi Umum Perangkat Daerah'),(24, '1.07', 1, 'Pengadaan Barang Milik Daerah Penunjang Urusan Pemerintah Daerah'),(25, '1.08', 1, 'Penyediaan Jasa Penunjang Urusan Pemerintahan Daerah'),(26, '1.09', 1, 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_program` WRITE;
DELETE FROM `db_sitemon`.`tb_program`;
INSERT INTO `db_sitemon`.`tb_program` (`id_program`,`id_urusan`,`kode_program`,`program`) VALUES (1, 1, '01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI'),(2, 2, '02', 'PROGRAM PENYELENGGARAAN LALU LINTAS DAN ANGKUTAN JALAN (LLAJ)'),(3, 2, '03', 'PROGRAM PENGELOLAAN PELAYARAN'),(4, 2, '05', 'PROGRAM PENGELOLAAN PERKERETAAPIAN');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_subkegiatan` WRITE;
DELETE FROM `db_sitemon`.`tb_subkegiatan`;
INSERT INTO `db_sitemon`.`tb_subkegiatan` (`id_subkegiatan`,`kode_subkegiatan`,`id_kegiatan`,`subkegiatan`) VALUES (1, '01', 1, 'Pelaksanaan Penyusunan Rencana Induk Jaringan LLAJ Provinsi'),(2, '02', 2, 'Penyediaan Perlengkapan Jalan di Jalan Provinsi'),(3, '04', 2, 'Rehabilitasi dan Pemeliharaan Perlengkapan Jalan'),(4, '01', 3, 'Penyusunan Rencana Pembangunan Terminal Penumpang Tipe B'),(5, '02', 3, 'Pembangunan Gedung Terminal'),(6, '03', 3, 'Pengembangan Sarana dan Prasarana Terminal'),(7, '05', 3, 'Peningkatan Kapasitas SDM Pengelola Terminal Tipe B'),(8, '03', 4, 'Uji Coba dan Sosialisasi Pelaksanaan Manajemen dan Rekayasa Lalu Lintas untuk Jaringan Jalan Provinsi'),(9, '04', 4, 'Pengawasan dan Pengendalian Efektivitas Pelaksanaan Kebijakan untuk Jalan Provinsi'),(10, '05', 4, 'Forum Lalu Lintas dan Angkutan Jalan untuk Jaringan Jalan Provinsi'),(11, '01', 5, 'Penetapan Kebijakan Tata Kelola Andalalin'),(12, '03', 6, 'Pelaksanaan Inspeksi, Audit dan Pemantauan Terminal'),(13, '04', 6, 'Pelaksanaan Inspeksi, Audit dan Pemantauan Pemenuhan Persyaratan Penyelenggaraan Kompetensi Pengemudi Kendaraan Bermotor Provinsi'),(14, '05', 6, 'Pelaksanaan Inspeksi, Audit dan Pemantauan Sistem Manajemen Keselamatan Perusahaan Angkutan Umum'),(15, '01', 7, 'Penyediaan Angkutan Umum untuk Jasa Angkutan Orang dan/atau Barang Antar Kota dalam 1 (satu) Daerah Provinsi'),(16, '02', 7, 'Pengendalian dan Pengawasan Ketersediaan Angkutan Umum untuk Jasa Angkutan Orang dan/atau Barang Antar Kota dalam 1 (satu) Provinsi'),(17, '01', 8, 'Perumusan Kebijakan Penetapan Kawasan Perkotaan untuk Angkutan Perkotaan Kewenangan Provinsi'),(18, '02', 8, 'Sosialisasi dan Uji Coba Pelaksanaan Kebijakan Penetapan Kawasan Perkotaan untuk Angkutan Perkotaan Kewenangan Provinsi'),(19, '02', 9, 'Sosialisasi dan Uji Coba Pelaksanaan Kebijakan Rencana Umum Jaringan Trayek Pedesaan Kewenangan Provinsi'),(20, '02', 10, 'Sosialisasi dan Uji Coba Pelaksanaan Kebijakan Penetapan Wilayah Operasi Angkutan Orang dengan Menggunakan Taksi dalam Kawasan Perkotaan Kewenangan Provinsi'),(21, '01', 11, 'Fasilitasi Pemenuhan Persyaratan Perolehan Izin Penyelenggaraan Angkutan Orang dalam Trayek Kewenangan Provinsi dalam Sistem Pelayanan Perizinan Berusaha Terintegrasi Secara Elektronik'),(22, '02', 11, 'Koordinasi dan Sinkronisasi Pengawasan Pelaksanaan Izin Penyelenggaraan Angkutan Orang dalam Trayek Kewenangan Provinsi'),(23, '02', 12, 'Koordinasi dan Sinkronisasi Pengawasan Pelaksanaan Izin Penyelenggaraan Angkutan Taksi yang Wilayah Operasinya Kewenangan Provinsi'),(24, '03', 13, 'Pengendalian dan Pengawasan Tarif Kelas Ekonomi Angkutan Orang dan Angkutan Perkotaan dan Perdesaan dalam 1(satu) Daerah Provinsi'),(25, '02', 14, 'Pengendalian dan Pengawasan Jaringan Lintas Penyeberangan dan Persetujuan Pengoperasian Kapal Penyeberangan Lintas Pelabuhan antar Daerah Kabupaten/Kota dalam Daerah Provinsi'),(26, '01', 15, 'Fasilitasi Pemenuhan Persyaratan Perolehan Izin Usaha Jasa Terkait Berupa Bongkar Muat Barang, Jasa Pengurusan Transportasi, Angkutan Perairan Pelabuhan, Penyewaan Peralatan Angkutan Laut atau Peralatan Jasa Terkait dengan Angkutan Laut, Tally Mandiri, da'),(27, '02', 15, 'Koordinasi dan Sinkronisasi Pengawasan Pelaksanaan Izin Usaha Jasa Terkait Berupa Bongkar Muat Barang, Jasa Pengurusan Transportasi, Angkutan Perairan Pelabuhan, Penyewaan Peralatan Angkutan Laut atau Peralatan Jasa Terkait dengan Angkutan Laut, Tally Man'),(28, '03', 16, 'Pengoperasian dan Pemeliharaan Pelabuhan Pengumpan Regional'),(29, '01', 17, 'Fasilitasi Pemenuhan Persyaratan Perizinan Pelabuhan Sungai dan Danau yang Melayani Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(30, '02', 17, 'Pembangunan Pelabuhan Sungai dan Danau yang Melayani Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(31, '04', 17, 'Pengawasan Pengoperasian Pelabuhan Sungai dan danau yang Melayani Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi'),(32, '01', 18, 'Pelaksanaan Penyusunan Rencana Induk Perkeretaapian'),(33, '03', 18, 'Pengendalian Pelaksanaan Rencana Induk Perkeretaapian'),(34, '01', 19, 'Penyusunan Dokumen Perencanaan Perangkat Daerah'),(35, '07', 19, 'Evaluasi Kinerja Perangkat Daerah'),(36, '01', 20, 'Penyediaan Gaji dan Tunjangan ASN'),(37, '02', 20, 'Penyediaan Administrasi Pelaksanaan Tugas ASN'),(38, '07', 20, 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/Triwulanan/Semesteran SKPD'),(39, '02', 21, 'Pengamanan Barang Milik Daerah SKPD'),(40, '02', 22, 'Pengadaan Pakaian Dinas Beserta Atribut Kelengkapannya'),(41, '03', 22, 'Pendataan dan Pengolahan Administrasi Kepegawaian'),(42, '09', 22, 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi'),(43, '01', 23, 'Penyediaan Komponen Instalasi Listrik/Penerangan Bangunan Kantor'),(44, '02', 23, 'Penyediaan Peralatan dan Perlengkapan Kantor'),(45, '03', 23, 'Penyediaan Peralatan Rumah Tangga'),(46, '04', 23, 'Penyediaan Bahan Logistik Kantor'),(47, '05', 23, 'Penyediaan Barang Cetakan dan Penggandaan'),(48, '06', 23, 'Penyediaan Bahan Bacaan dan Peraturan Perundang- undangan'),(49, '08', 23, 'Fasilitasi Kunjungan Tamu'),(50, '09', 23, 'Penyelenggaraan Rapat Koordinasi dan Konsultasi SKPD'),(51, '11', 23, 'Dukungan Pelaksanaan Sistem Pemerintahan Berbasis Elektronik pada SKPD'),(52, '02', 24, 'Pengadaan Kendaraan Dinas Operasional atau Lapangan'),(53, '04', 24, 'Pengadaan Alat Angkutan Darat Tak Bermotor'),(54, '05', 24, 'Pengadaan Mebel'),(55, '06', 24, 'Pengadaan Peralatan dan Mesin Lainnya'),(56, '08', 24, 'Pengadaan Aset Tak Berwujud'),(57, '10', 24, 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya'),(58, '01', 25, 'Penyediaan Jasa Surat Menyurat'),(59, '02', 25, 'Penyediaan Jasa Komunikasi, Sumber Daya Air dan Listrik'),(60, '04', 25, 'Penyediaan Jasa Pelayanan Umum Kantor'),(61, '02', 26, 'Penyediaan Jasa Pemeliharaan, Biaya Pemeliharaan, Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan'),(62, '06', 26, 'Pemeliharaan Peralatan dan Mesin Lainnya'),(63, '08', 26, 'Pemeliharaan Aset Tak Berwujud'),(64, '09', 26, 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya'),(65, '10', 26, 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya'),(66, '11', 26, 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_tahapankak` WRITE;
DELETE FROM `db_sitemon`.`tb_tahapankak`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`tb_urusan` WRITE;
DELETE FROM `db_sitemon`.`tb_urusan`;
INSERT INTO `db_sitemon`.`tb_urusan` (`id_urusan`,`kode_urusan`,`urusan`) VALUES (1, 'XX.X', NULL),(2, '2.15', 'URUSAN PEMERINTAHAN BIDANG PERHUBUNGAN');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `db_sitemon`.`users` WRITE;
DELETE FROM `db_sitemon`.`users`;
INSERT INTO `db_sitemon`.`users` (`id`,`email`,`username`,`fullname`,`user_image`,`password_hash`,`reset_hash`,`reset_at`,`reset_expires`,`activate_hash`,`status`,`status_message`,`active`,`force_pass_reset`,`created_at`,`updated_at`,`deleted_at`,`id_bidangbalai`) VALUES (3, 'apnovaldi@gmail.com', '197910192001121002', NULL, 'user_image.jpg', '$2y$10$Js2A2tTLmync4G/4pEukeO2yK/J902kWUjC9Rplu.mrFAHRe3LQlK', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-06-14 22:48:10', '2022-06-14 22:48:10', NULL, NULL),(4, 'ademnaturall@icloud.com', '196506141991031005', NULL, 'user_image.jpg', '$2y$10$TeCYrPqlJBukHf.5yBOvm.vQ95MzzIPptkrEQQcsKF5/Hh7Kjr7z2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-06-15 00:25:46', '2022-06-15 00:25:46', NULL, NULL),(5, 'gesangkers22@gmail.com', '1234567890', NULL, 'user_image.jpg', '$2y$10$jjxd0wj10e6MboRFSsgcTe5KECK0RqsGWvINIep4VMZPxCKY2L4IG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-06-15 00:41:20', '2022-06-15 00:41:20', NULL, NULL);
UNLOCK TABLES;
COMMIT;

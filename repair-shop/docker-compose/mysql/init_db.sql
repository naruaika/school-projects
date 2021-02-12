-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: bengkel_motor
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jasa`
--

DROP TABLE IF EXISTS `jasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jasa` (
  `kode_jasa` int NOT NULL AUTO_INCREMENT,
  `deskripsi_jasa` text NOT NULL,
  `ongkos_min` int NOT NULL,
  PRIMARY KEY (`kode_jasa`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mekanik`
--

DROP TABLE IF EXISTS `mekanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mekanik` (
  `kode_mekanik` int NOT NULL AUTO_INCREMENT,
  `nama_mekanik` varchar(255) NOT NULL,
  PRIMARY KEY (`kode_mekanik`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `kode_pelanggan` int NOT NULL AUTO_INCREMENT,
  `no_polisi` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_rangka` varchar(255) DEFAULT NULL,
  `no_mesin` varchar(255) DEFAULT NULL,
  `keluhan` text,
  PRIMARY KEY (`kode_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1, '', 'Anonim', '', '', '', '', '');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengguna` (
  `kode_pengguna` int NOT NULL AUTO_INCREMENT,
  `no_pegawai` varchar(255) NOT NULL,
  `kata_sandi` varchar(255) NOT NULL,
  `hak_akses` enum('kasir','admin') NOT NULL,
  PRIMARY KEY (`kode_pengguna`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES (1, 'root', '!2#4%6&8(0', 'admin');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suku_cadang`
--

DROP TABLE IF EXISTS `suku_cadang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suku_cadang` (
  `kode_suku_cadang` int NOT NULL,
  `nomor_suku_cadang` varchar(255) NOT NULL,
  `nama_suku_cadang` varchar(255) NOT NULL,
  `het` int NOT NULL,
  `stok` int NOT NULL,
  `modal` int NOT NULL,
  PRIMARY KEY (`kode_suku_cadang`),
  UNIQUE KEY `nomor_suku_cadang` (`nomor_suku_cadang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi` (
  `kode_transaksi` int NOT NULL AUTO_INCREMENT,
  `kode_kasir` int NOT NULL,
  `kode_pelanggan` int NOT NULL DEFAULT '1',
  `tgl_masuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_keluar` timestamp NULL DEFAULT NULL,
  `status` enum('sedang','selesai','batal') NOT NULL DEFAULT 'sedang',
  `catatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kode_transaksi`),
  KEY `kode_kasir` (`kode_kasir`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_kasir`) REFERENCES `pengguna` (`kode_pengguna`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaksi_jasa`
--

DROP TABLE IF EXISTS `transaksi_jasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi_jasa` (
  `kode_transaksi_jasa` int NOT NULL AUTO_INCREMENT,
  `kode_transaksi` int NOT NULL,
  `kode_jasa` int NOT NULL,
  `kode_mekanik` int NOT NULL,
  `ongkos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode_transaksi_jasa`),
  KEY `kode_transaksi` (`kode_transaksi`),
  KEY `kode_mekanik` (`kode_mekanik`),
  KEY `transaksi_jasa_ibfk_3` (`kode_jasa`),
  CONSTRAINT `transaksi_jasa_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`),
  CONSTRAINT `transaksi_jasa_ibfk_2` FOREIGN KEY (`kode_mekanik`) REFERENCES `mekanik` (`kode_mekanik`),
  CONSTRAINT `transaksi_jasa_ibfk_3` FOREIGN KEY (`kode_jasa`) REFERENCES `jasa` (`kode_jasa`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaksi_suku_cadang`
--

DROP TABLE IF EXISTS `transaksi_suku_cadang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi_suku_cadang` (
  `kode_transaksi_suku_cadang` int NOT NULL AUTO_INCREMENT,
  `kode_transaksi` int NOT NULL,
  `kode_suku_cadang` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `harga_total` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode_transaksi_suku_cadang`),
  UNIQUE KEY `kode_transaksi_2` (`kode_transaksi`,`kode_suku_cadang`),
  KEY `kode_transaksi` (`kode_transaksi`),
  KEY `kode_suku_cadang` (`kode_suku_cadang`),
  CONSTRAINT `transaksi_suku_cadang_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`),
  CONSTRAINT `transaksi_suku_cadang_ibfk_2` FOREIGN KEY (`kode_suku_cadang`) REFERENCES `suku_cadang` (`kode_suku_cadang`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

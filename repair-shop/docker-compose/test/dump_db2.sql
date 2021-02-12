-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost:00    Database: bengkel_motor:00
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
-- Dumping data for table `jasa`
--

LOCK TABLES `jasa` WRITE;
/*!40000 ALTER TABLE `jasa` DISABLE KEYS */;
INSERT INTO `jasa` VALUES
    (1 , 'Servis ringan motor bebek karburasi' , 35000),
    (2 , 'Servis ringan motor matik karburasi' , 45000),
    (3 , 'Servis ringan motor sport karburasi' , 75000),
    (4 , 'Servis ringan motor bebek injeksi'   , 45000),
    (5 , 'Servis ringan motor matik injeksi'   , 55000),
    (6 , 'Servis ringan motor sport injeksi'   , 90000),
    (7 , 'Servis lengkap motor bebek karburasi', 55000),
    (8 , 'Servis lengkap motor matik karburasi', 60000),
    (9 , 'Servis lengkap motor sport karburasi', 100000),
    (10, 'Servis lengkap motor bebek injeksi'  , 60000),
    (11, 'Servis lengkap motor matik injeksi'  , 70000),
    (12, 'Servis lengkap motor sport injeksi'  , 115000);
/*!40000 ALTER TABLE `jasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mekanik`
--

LOCK TABLES `mekanik` WRITE;
/*!40000 ALTER TABLE `mekanik` DISABLE KEYS */;
INSERT INTO `mekanik` VALUES
    (1, 'Maurice Anderson'),
    (2, 'Rosa Wright'),
    (3, 'Ricardo Matthews'),
    (4, 'Johanna Shelton'),
    (5, 'Lillie Ross');
/*!40000 ALTER TABLE `mekanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES
    (2 , 'U 2918 FYQ', 'Maude Boone', '(640) 454-9832', 'Cipageran Asri', 'XPANJ3386YT225471', 'XPANJ3386YT225471', 'Motor mogok di bawah panas terik.'),
    (3 , 'U 5779 WIE', 'Scott Cross', '(433) 240-8038', 'Puri Cipageran I', 'JKJHD4606SL751945', 'JKJHD4606SL751945', 'Servis bulanan.'),
    (4 , 'O 7411 FRA', 'Marian Hunter', '(835) 585-2333', 'Cipageran Asri', 'SQCSG1576BC311721', 'SQCSG1576BC311721', 'Motor mogok di bawah panas terik.'),
    (5 , 'M 7089 XGP', 'Lois Tyler', '(843) 407-8665', '1933 Deces Plaza', '', '', 'Mogok karena banjir'),
    (6 , 'Z 7182 VLY', 'Brett Grant', '(509) 316-4626', '1061 Kamsa Pass', 'XPANJ3386YT225477', 'XPANJ3386YT225477', 'Beli motor bekas.'),
    (7 , 'M 4977 BMT', 'Hannah Butler', '(911) 780-6230', '1362 Kelupa Way', 'HTTGI9037IW036026', 'HTTGI9037IW036026', 'Servis setelah dipakai mudik.'),
    (8 , 'O 9094 LSU', 'Betty Graves', '(381) 489-1611', '210 Kohvot Key', 'VEUMZ6700GN523687', 'VEUMZ6700GN523687', 'Servis setelah garasi kebanjiran.'),
    (9 , 'G 3629 SWF', 'Harold Buchanan', '(520) 931-6935', '1680 Podku Road', 'JKJHD4606SL751946', 'JKJHD4606SL751946', 'Servis setelah dipakai mudik.'),
    (10, 'Q 8098 FLE', 'Johanna Foster', '(489) 488-4455', '305 Vowiz Heights', 'VHXPL3806WF567471', 'VHXPL3806WF567471', 'Servis setelah dipakai mudik.'),
    (11, 'X 5856 BXF', 'Craig Chambers', '(252) 843-1012', '801 Zudhiz Court', 'ADULA2830BO729764', 'ADULA2830BO729764', 'Servis setelah dipakai mudik.'),
    (12, 'I 2270 LLT', 'Edgar Blake', '(806) 972-5894', '1096 Bupole Heights', 'MMVMN3042YP073402', 'MMVMN3042YP073402', 'Servis setelah dipakai mudik.'),
    (13, 'X 2483 VBF', 'Ruth Carr', '(339) 353-3910', '361 Rohal Square', 'NXSQL9602QM343443', 'NXSQL9602QM343443', 'Motor tidak bisa nyala akibat sempat kehabisan bensin.'),
    (14, 'S 5428 LLT', 'Sophia McDaniel', '(600) 352-1234', '', 'QIRBT9529UT091008', 'QIRBT9529UT091008', 'Servis setelah dipakai mudik.'),
    (15, 'D 0346 VTT', 'Stanley Martinez', '(848) 844-8201', '1201 Utoug Heights', 'EQVOW2964VV139053', 'EQVOW2964VV139053', 'Servis setelah dipakai mudik.'),
    (16, 'J 3694 UHJ', 'Estella Lawrence', '(424) 409-9510', '485 Ubhe Boulevard', 'FSDXZ8689GO438682', 'FSDXZ8689GO438682', 'Servis setelah dipakai mudik.'),
    (17, 'U 6915 VGJ', 'Clyde Silva', '(384) 400-2520', '1233 Asake Pike', 'IIQDH9140NH769761', 'IIQDH9140NH769761', 'Servis rutin.'),
    (18, 'E 8367 KRP', 'Justin Welch', '(437) 415-9739', '617 Irto Ridge', 'TUJJN4157AJ782565', 'TUJJN4157AJ782565', 'Servis rutin.'),
    (19, 'A 9483 EHY', 'Roger George', '(910) 760-2689', '1840 Opig Center', 'OGFPM4148GS343047', 'OGFPM4148GS343047', 'Servis rutin.'),
    (20, 'Y 4049 GAR', 'Max Bradley', '(810) 545-3255', '1020 Faran Way', 'EDVZO5415ZX764054', 'EDVZO5415ZX764054', 'Servis rutin.'),
    (21, 'G 8187 NJC', 'Todd Figueroa', '(629) 626-1641', '1959 Dereco Way', 'ONGOY2196EI720248', 'ONGOY2196EI720248', 'Servis rutin.'),
    (22, 'N 2759 OOW', 'Jeffrey McDonald', '', '1965 Mufun Plaza', 'XPRXW3723JY231800', 'XPRXW3723JY231800', 'Servis rutin.'),
    (23, 'Q 9303 FPZ', 'Nina Allison', '(712) 753-1430', '851 Howob Street', 'SOGTC7037SH292427', 'SOGTC7037SH292427', 'Servis rutin.'),
    (24, 'E 1972 ISX', 'Clarence Pittman', '(677) 545-8349', '1696 Pifa Mill', 'NHDNA2643QB414311', 'NHDNA2643QB414311', 'Servis setelah dipakai mudik.'),
    (25, 'I 6554 BAC', 'Minnie Hale', '(813) 514-4097', '179 Sivnu View', 'SQCSG1576BC311734', 'SQCSG1576BC311734', 'Motor kesamber geledek.'),
    (26, 'K 6227 AVR', 'Estelle Fleming', '(225) 502-2300', '654 Rihiz Circle', 'XXCBU0935OB964021', 'XXCBU0935OB964021', 'Motor kesamber geledek.'),
    (27, 'A 5048 AVY', '', '(763) 837-3297', '944 Hurvon Junction', 'TDBXC9834KJ273320', 'TDBXC9834KJ273320', 'Motor kesamber geledek.'),
    (28, 'M 7025 NIZ', 'Angel Jones', '', '', 'HDVHL4139NZ217346', 'HDVHL4139NZ217346', 'Motor kesamber geledek.'),
    (29, 'E 7026 AYT', 'Adeline Barton', '(887) 825-2474', '1448 Bokfe Place', 'MUIEX3556BL414820', 'MUIEX3556BL414820', 'Servis setelah dipakai mudik.'),
    (30, 'J 0566 DZX', 'Florence Ward', '(444) 298-4546', '1821 Menmoj Avenue', 'QRWKV6142LQ216407', 'QRWKV6142LQ216407', 'Servis setelah dipakai mudik.'),
    (31, 'A 2286 LEV', 'Caroline Walsh', '(476) 485-8252', '358 Remuf Highway', '', 'KUVIP0095YS643633', 'Servis setelah dipakai mudik.'),
    (32, 'V 3608 CFM', 'Evelyn Harmon', '(808) 658-9746', '287 Sazmi Avenue', 'QESUA2672ZS192171', 'QESUA2672ZS192171', 'Motor hancur akibat jatuh dari jalanan menurun.'),
    (33, 'I 8714 SQF', '', '', '429 Ojudec Parkway', 'TWPDQ3014DA813532', 'TWPDQ3014DA813532', 'Motor hancur akibat jatuh dari jalanan menurun.'),
    (34, 'L 7419 PCL', 'Beatrice Grant', '(355) 779-5287', '1669 Fovu Park', 'EAEKO7290OA133685', 'EAEKO7290OA133685', 'Motor hancur akibat jatuh dari jalanan menurun.'),
    (35, 'Y 4801 BNT', 'Aaron Buchanan', '(534) 467-5827', '1827 Siceb Parkway', 'JYSFE1220BT583229', 'JYSFE1220BT583229', 'Motor hancur akibat jatuh dari jalanan menurun.'),
    (36, 'T 9539 WFT', 'Marie Barker', '(814) 909-2172', '501 Feev River', 'NJHZM7780MU900190', 'NJHZM7780MU900190', 'Servis setelah dipakai mudik.'),
    (37, 'W 3323 YAU', 'Virgie Hardy', '(477) 723-3141', '1458 Rocbov Square', 'UEDCV3260YR288521', 'UEDCV3260YR288521', 'Tabrakan dengan mobil bak.'),
    (38, 'R 3865 ORQ', 'Martha Porter', '(548) 341-5787', '185 Tinviz Parkway', 'KTLOV9199GI599280', 'KTLOV9199GI599280', 'Tabrakan dengan mobil bak.'),
    (39, 'I 9896 WBW', 'Bessie Tyler', '(713) 842-7129', '1518 Mozeg View', 'UFLXF5917RU949891', 'UFLXF5917RU949891', 'Tabrakan dengan mobil bak.'),
    (40, 'S 5732 TEB', 'Sue Pittman', '(826) 978-1380', '832 Anho Parkway', 'EBERN8669KT238294', 'EBERN8669KT238294', 'Motor terserempet angkot.'),
    (41, 'V 3116 ZCK', 'Dale Moody', '(525) 671-3908', '840 Vebuvu Plaza', 'EPMME6008CO574143', 'EPMME6008CO574143', 'Motor terserempet angkot.'),
    (42, 'K 7024 TZQ', 'Ivan Olson', '', '', 'GXFZO3659QV407132', 'GXFZO3659QV407132', 'Motor terserempet angkot.'),
    (43, 'S 6784 YWR', 'Rodney Carter', '(949) 998-7795', '383 Zuos Grove', 'VSJZR3673ND106372', 'VSJZR3673ND106372', 'Servis setelah dipakai mudik.'),
    (44, 'E 2318 BLL', 'Minnie Mitchell', '(920) 928-6097', '152 Nira Road', 'UILFM5316PT086400', 'UILFM5316PT086400', 'Servis setelah dipakai mudik.'),
    (45, 'W 9553 VHM', 'Francisco Alvarez', '(235) 840-9855', '603 Bara Heights', 'QMZIW2303IQ141189', 'QMZIW2303IQ141189', 'Servis setelah dipakai mudik.'),
    (46, 'P 3344 NOV', 'Erik Wilkins', '(220) 902-7993', '574 Dorwed Grove', 'KAPEZ2929VN812845', 'KAPEZ2929VN812845', 'Motor tidak bisa disela, loss.'),
    (47, 'G 0413 HMK', 'Aaron White', '(263) 330-7358', '1593 Dodfu River', 'ESKRA9111DF884832', 'ESKRA9111DF884832', 'Motor tidak bisa disela, loss.'),
    (48, 'Y 3323 GPL', 'Willie Payne', '(218) 477-3991', '849 Guun Junction', 'NCDDY9855FW121772', 'NCDDY9855FW121772', 'Servis setelah dipakai mudik.'),
    (49, 'K 0076 LYQ', 'Alex Manning', '(313) 245-6955', '1226 Kakpi Path', 'CEHOJ5429VW594231', 'CEHOJ5429VW594231', 'Motor baru, kopling macet.'),
    (50, 'E 3136 WCT', 'Florence Cunningham', '(408) 997-9732', '1465 Toci Highway', 'JIDIZ2803WB541924', 'JIDIZ2803WB541924', 'Motor baru, kopling macet.'),
    (51, 'T 1249 IPD', 'Ora Keller', '(729) 395-2867', '1816 Nire Plaza', 'KMOUC4021GT228016', 'KMOUC4021GT228016', 'Motor baru, kopling macet.'),
    (52, 'Q 2401 ONP', 'Ricardo Soto', '(788) 767-5697', '157 Taba Street', 'PZEDE0533PX039207', 'PZEDE0533PX039207', 'Motor baru, kopling macet.'),
    (53, 'N 0238 MLG', 'Walter Sanchez', '(417) 588-4531', '1083 Fuuk Avenue', 'LEAPC3347AW873339', 'LEAPC3347AW873339', 'Motor baru, kopling macet.'),
    (54, 'M 2295 ZFS', 'Jesse Buchanan', '', '', 'ELNVL3187SN113847', 'ELNVL3187SN113847', 'Servis setelah dipakai mudik.'),
    (55, 'I 2674 DVQ', 'Isabel Moss', '(734) 307-6509', '68 Bamnu Path', 'XASVA3704ZF869387', 'XASVA3704ZF869387', 'Servis setelah dipakai mudik.'),
    (56, 'X 7060 TWU', 'Russell Phillips', '(862) 876-3800', '1133 Tuzona Path', 'PBBZN6871DL386705', 'PBBZN6871DL386705', 'Servis setelah dipakai mudik.'),
    (57, 'Q 8903 MPX', 'Eliza Griffith', '(421) 844-5986', '786 Cenme Road', 'ASGBX0426ZX919734', 'ASGBX0426ZX919734', 'Servis setelah dipakai mudik.'),
    (58, 'I 1097 HLR', 'Max Henderson', '(280) 421-5655', '498 Dojub Glen', 'WTMHG8374BH210622', 'WTMHG8374BH210622', 'Servis setelah dipakai mudik.'),
    (59, 'T 3514 PEZ', 'Sally Perry', '(453) 776-4583', '1354 Fasaw Pass', 'ZLFNR7913MX938655', 'ZLFNR7913MX938655', 'Servis setelah dipakai mudik.'),
    (60, 'V 6852 JVD', 'Charlotte Watts', '(950) 909-3549', '241 Edeco Boulevard', 'HJRDL2998VS270345', 'HJRDL2998VS270345', 'Servis rutin.'),
    (61, 'X 4315 AMP', 'Katherine Mitchell', '(707) 461-9320', '617 Etirac Highway', 'PJFEH9660JA693732', 'PJFEH9660JA693732', 'Servis rutin.'),
    (62, 'H 3766 NSK', 'Oscar Santiago', '(859) 429-7852', '457 Cupov Highway', 'VYUJV7127DA012288', 'VYUJV7127DA012288', 'Servis rutin.'),
    (63, 'L 1222 VXY', 'Ivan Richards', '(334) 519-2294', '1682 Wirad Square', 'WDNXM2921FK195821', 'WDNXM2921FK195821', 'Servis rutin.'),
    (64, 'Y 3879 KGM', '', '', '1299 Cobif Mill', 'ILTIQ8280FK221843', 'ILTIQ8280FK221843', 'Servis rutin.'),
    (65, 'R 8330 ZVE', '', '', '1785 Gomah Place', 'UTOXD8044KL435070', 'UTOXD8044KL435070', 'Servis rutin.'),
    (66, 'I 1061 IZZ', 'Katherine Meyer', '(948) 975-1722', '578 Vizo Court', 'XHDYG5112XW780657', 'XHDYG5112XW780657', 'Servis rutin.'),
    (67, 'K 6274 MWK', 'Hilda Brewer', '', '', 'FDNYT7318JC668428', 'FDNYT7318JC668428', 'Servis rutin.'),
    (68, 'C 0375 PWL', 'Nina Garner', '(805) 506-9567', '1396 Mabiw Grove', 'GNUAX1038KI990738', 'GNUAX1038KI990738', 'Servis rutin.'),
    (69, 'Y 7506 WVN', 'Arthur Holloway', '(364) 911-4156', '1035 Wesig Place', 'PCGMV3434JB729669', 'PCGMV3434JB729669', 'Servis rutin.'),
    (70, 'B 9279 BTW', 'Matthew Pratt', '(811) 240-7968', '732 Roci Boulevard', 'JLASD2703EI586763', 'JLASD2703EI586763', 'Servis setelah dipakai mudik.'),
    (71, 'Y 3117 COK', 'Angel Mendez', '(540) 835-8375', '687 Tacu Pike', 'YEDHS3636TC069014', 'YEDHS3636TC069014', 'Servis setelah dipakai mudik.'),
    (72, 'Z 3597 KKA', 'Birdie Owen', '(679) 694-8181', '152 Wilzo Boulevard', 'SQQKW4912YM934789', 'SQQKW4912YM934789', 'Modifikasi motor.'),
    (73, 'F 1709 PAE', 'Lena Rivera', '(271) 256-2998', '498 Zivvo Avenue', 'HYGTH4398GU395597', 'HYGTH4398GU395597', 'Modifikasi motor.'),
    (74, 'Q 3807 GLX', 'Elmer Hammond', '(940) 938-9750', '307 Kifa Terrace', 'SBRKU1094MM793476', 'SBRKU1094MM793476', 'Modifikasi motor.'),
    (75, 'E 4255 GBD', '', '(489) 831-9104', '1352 Fijku Road', '', '', 'Modifikasi motor.');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pengguna`
--

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` VALUES
    (2, 'A001', 'admin01', 'admin'),
    (3, 'K001', 'kasir01', 'kasir'),
    (4, 'K002', 'kasir02', 'kasir');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES
    (1  , 3, 1 , '2021-02-01 07:47:00', '2021-02-01 07:47:52', 'selesai', NULL),
    (2  , 4, 2 , '2021-02-01 07:50:00', '2021-02-01 08:50:42', 'selesai', NULL),
    (3  , 3, 3 , '2021-02-01 07:55:00', '2021-02-01 08:55:18', 'selesai', NULL),
    (4  , 3, 4 , '2021-02-01 08:30:00', '2021-02-01 09:30:08', 'selesai', NULL),
    (5  , 3, 5 , '2021-02-01 08:35:00', '2021-02-01 09:35:04', 'selesai', NULL),
    (6  , 4, 6 , '2021-02-01 08:41:00', '2021-02-01 09:41:55', 'selesai', NULL),
    (7  , 3, 7 , '2021-02-01 08:43:00', '2021-02-01 09:43:28', 'selesai', NULL),
    (8  , 3, 8 , '2021-02-02 07:47:00', '2021-02-02 08:47:11', 'selesai', NULL),
    (9  , 3, 9 , '2021-02-02 07:50:00', '2021-02-02 08:50:20', 'selesai', NULL),
    (10 , 3, 1 , '2021-02-02 07:55:00', '2021-02-02 07:55:28', 'selesai', NULL),
    (11 , 3, 1 , '2021-02-02 08:30:00', '2021-02-02 08:30:42', 'selesai', NULL),
    (12 , 3, 1 , '2021-02-02 08:35:00', '2021-02-02 08:35:36', 'selesai', NULL),
    (13 , 4, 1 , '2021-02-02 08:41:00', '2021-02-02 08:41:39', 'selesai', NULL),
    (14 , 4, 10, '2021-02-02 08:43:00', '2021-02-02 09:43:43', 'selesai', NULL),
    (15 , 3, 11, '2021-02-02 09:29:00', '2021-02-03 10:29:55', 'batal'  , 'Motor curian diambil polisi.'),
    (16 , 3, 12, '2021-02-02 09:32:00', '2021-02-02 10:32:14', 'selesai', NULL),
    (17 , 3, 13, '2021-02-02 09:33:00', '2021-02-02 10:33:59', 'selesai', NULL),
    (18 , 3, 14, '2021-02-03 07:55:00', '2021-02-03 08:55:53', 'selesai', NULL),
    (19 , 3, 15, '2021-02-03 08:30:00', '2021-02-03 09:30:41', 'selesai', NULL),
    (20 , 3, 1 , '2021-02-03 08:35:00', '2021-02-03 08:35:07', 'selesai', NULL),
    (21 , 4, 1 , '2021-02-03 10:10:00', '2021-02-03 10:10:55', 'selesai', NULL),
    (22 , 3, 1 , '2021-02-04 07:55:00', '2021-02-04 07:55:35', 'selesai', NULL),
    (23 , 4, 1 , '2021-02-04 08:30:00', '2021-02-04 08:30:19', 'selesai', NULL),
    (24 , 4, 16, '2021-02-04 08:35:00', '2021-02-04 09:35:43', 'selesai', NULL),
    (25 , 4, 17, '2021-02-05 07:55:00', '2021-02-05 08:55:48', 'selesai', NULL),
    (26 , 4, 18, '2021-02-05 08:30:00', '2021-02-05 09:30:05', 'selesai', NULL),
    (27 , 3, 19, '2021-02-05 08:35:00', '2021-02-05 09:35:57', 'selesai', NULL),
    (28 , 3, 20, '2021-02-05 08:43:00', '2021-02-05 09:43:49', 'selesai', NULL),
    (29 , 3, 21, '2021-02-05 08:35:00', '2021-02-05 09:35:02', 'selesai', NULL),
    (30 , 4, 22, '2021-02-05 08:37:00', '2021-02-05 09:37:46', 'selesai', NULL),
    (31 , 3, 1 , '2021-02-06 07:47:00', '2021-02-06 07:47:11', 'selesai', NULL),
    (32 , 4, 23, '2021-02-06 07:50:00', '2021-02-06 08:50:59', 'selesai', NULL),
    (33 , 3, 24, '2021-02-06 07:55:00', '2021-02-06 08:55:13', 'selesai', NULL),
    (34 , 3, 25, '2021-02-06 08:30:00', '2021-02-06 09:30:21', 'selesai', NULL),
    (35 , 3, 26, '2021-02-06 08:35:00', '2021-02-06 09:35:13', 'selesai', NULL),
    (36 , 4, 1 , '2021-02-06 08:41:00', '2021-02-06 08:41:26', 'selesai', NULL),
    (37 , 3, 1 , '2021-02-06 08:43:00', '2021-02-06 08:43:09', 'selesai', NULL),
    (38 , 3, 27, '2021-02-06 08:35:00', '2021-02-06 09:35:54', 'selesai', NULL),
    (39 , 3, 28, '2021-02-06 08:37:00', '2021-02-06 09:37:59', 'selesai', NULL),
    (40 , 3, 29, '2021-02-06 09:12:00', '2021-02-06 10:12:24', 'selesai', NULL),
    (41 , 3, 30, '2021-02-06 09:13:00', '2021-02-06 10:13:57', 'selesai', NULL),
    (42 , 3, 1 , '2021-02-06 09:14:00', '2021-02-06 09:16:52', 'batal'  , 'Pembeli lupa membawa dompet.'),
    (43 , 4, 1 , '2021-02-06 09:17:00', '2021-02-06 09:17:38', 'selesai', NULL),
    (44 , 4, 1 , '2021-02-06 09:28:00', '2021-02-06 09:28:14', 'selesai', NULL),
    (45 , 3, 1 , '2021-02-06 09:29:00', '2021-02-06 09:29:47', 'selesai', NULL),
    (46 , 3, 1 , '2021-02-07 07:55:00', '2021-02-07 07:55:43', 'selesai', NULL),
    (47 , 3, 1 , '2021-02-07 08:30:00', '2021-02-07 08:30:27', 'selesai', NULL),
    (48 , 3, 31, '2021-02-07 08:35:00', '2021-02-07 09:35:25', 'selesai', NULL),
    (49 , 3, 32, '2021-02-07 08:43:00', '2021-02-07 09:43:51', 'selesai', NULL),
    (50 , 3, 33, '2021-02-07 08:35:00', '2021-02-07 09:35:12', 'selesai', NULL),
    (51 , 4, 1 , '2021-02-07 08:37:00', '2021-02-07 08:37:52', 'selesai', NULL),
    (52 , 3, 1 , '2021-02-07 09:17:00', '2021-02-07 09:17:54', 'selesai', NULL),
    (53 , 4, 1 , '2021-02-07 09:28:00', '2021-02-07 09:28:09', 'selesai', NULL),
    (54 , 4, 32, '2021-02-07 09:29:00', '2021-02-07 10:29:48', 'selesai', NULL),
    (55 , 3, 1 , '2021-02-08 07:47:00', '2021-02-08 07:47:47', 'selesai', NULL),
    (56 , 4, 1 , '2021-02-08 07:50:00', '2021-02-08 07:50:10', 'selesai', NULL),
    (57 , 3, 1 , '2021-02-08 07:55:00', '2021-02-08 07:55:11', 'batal', 'Pembeli tidak membawa cukup uang.'),
    (58 , 3, 1 , '2021-02-08 08:30:00', '2021-02-08 08:30:46', 'selesai', NULL),
    (59 , 3, 1 , '2021-02-08 08:35:00', '2021-02-08 08:35:50', 'selesai', NULL),
    (60 , 4, 1 , '2021-02-08 08:41:00', '2021-02-08 08:41:19', 'selesai', NULL),
    (61 , 3, 1 , '2021-02-08 08:43:00', '2021-02-08 08:43:04', 'selesai', NULL),
    (62 , 3, 1 , '2021-02-09 08:35:00', '2021-02-09 08:35:19', 'selesai', NULL),
    (63 , 3, 1 , '2021-02-09 08:37:00', '2021-02-09 08:37:26', 'selesai', NULL),
    (64 , 3, 1 , '2021-02-09 09:12:00', '2021-02-09 09:12:03', 'selesai', NULL),
    (65 , 3, 1 , '2021-02-09 09:13:00', '2021-02-09 09:13:50', 'batal', 'Uang bayar palsu.'),
    (66 , 3, 1 , '2021-02-09 09:14:00', '2021-02-09 09:14:31', 'selesai', NULL),
    (67 , 4, 1 , '2021-02-10 08:30:00', '2021-02-10 08:30:23', 'selesai', NULL),
    (68 , 4, 1 , '2021-02-10 08:35:00', '2021-02-10 08:35:37', 'selesai', NULL),
    (69 , 3, 1 , '2021-02-10 08:43:00', '2021-02-10 08:43:17', 'selesai', NULL),
    (70 , 3, 33, '2021-02-10 08:35:00', '2021-02-10 09:35:38', 'selesai', NULL),
    (71 , 3, 34, '2021-02-10 08:37:00', '2021-02-10 09:37:31', 'selesai', NULL),
    (72 , 3, 35, '2021-02-10 09:44:00', '2021-02-10 10:44:36', 'selesai', NULL),
    (73 , 3, 36, '2021-02-10 09:51:00', '2021-02-10 10:51:39', 'selesai', NULL),
    (74 , 3, 37, '2021-02-10 09:59:00', '2021-02-10 10:59:09', 'selesai', NULL),
    (75 , 4, 38, '2021-02-10 10:10:00', '2021-02-10 11:10:17', 'selesai', NULL),
    (76 , 3, 39, '2021-02-11 07:47:00', '2021-02-11 08:47:41', 'selesai', NULL),
    (77 , 4, 40, '2021-02-11 07:50:00', '2021-02-11 08:50:01', 'selesai', NULL),
    (78 , 4, 41, '2021-02-11 07:55:00', '2021-02-11 08:55:26', 'selesai', NULL),
    (79 , 4, 42, '2021-02-11 08:30:00', '2021-02-11 09:30:24', 'selesai', NULL),
    (80 , 4, 43, '2021-02-11 08:35:00', '2021-02-11 09:35:07', 'selesai', NULL),
    (81 , 3, 44, '2021-02-11 08:41:00', '2021-02-11 09:41:14', 'selesai', NULL),
    (82 , 3, 45, '2021-02-11 08:43:00', '2021-02-11 09:43:52', 'selesai', NULL),
    (83 , 3, 46, '2021-02-11 11:02:00', '2021-02-11 12:02:24', 'selesai', NULL),
    (84 , 3, 47, '2021-02-11 11:07:00', '2021-02-11 12:07:17', 'selesai', NULL),
    (85 , 3, 48, '2021-02-11 11:13:00', '2021-02-11 12:13:33', 'selesai', NULL),
    (86 , 4, 49, '2021-02-11 11:17:00', '2021-02-11 12:17:34', 'selesai', NULL),
    (87 , 4, 50, '2021-02-11 11:18:00', '2021-02-11 12:18:23', 'selesai', NULL),
    (88 , 4, 51, '2021-02-12 09:44:00', '2021-02-12 10:44:58', 'selesai', NULL),
    (89 , 4, 52, '2021-02-12 09:51:00', '2021-02-12 10:51:28', 'selesai', NULL),
    (90 , 4, 53, '2021-02-12 09:59:00', '2021-02-12 10:59:49', 'selesai', NULL),
    (91 , 4, 54, '2021-02-12 10:10:00', '2021-02-12 11:13:19', 'batal'  , 'Motor meledak sesaat sebelum di-starter.'),
    (92 , 4, 1 , '2021-02-12 12:30:00', '2021-02-12 12:30:15', 'selesai', NULL),
    (93 , 4, 1 , '2021-02-12 12:31:00', '2021-02-12 12:31:41', 'selesai', NULL),
    (94 , 3, 1 , '2021-02-12 12:33:00', '2021-02-12 12:33:39', 'selesai', NULL),
    (95 , 3, 1 , '2021-02-12 12:35:00', '2021-02-12 12:35:29', 'selesai', NULL),
    (96 , 3, 1 , '2021-02-12 12:39:00', '2021-02-12 12:39:08', 'selesai', NULL),
    (97 , 4, 55, '2021-02-12 12:51:00', '2021-02-12 13:51:31', 'selesai', NULL),
    (98 , 4, 56, '2021-02-12 12:53:00', '2021-02-12 13:53:20', 'selesai', NULL),
    (99 , 4, 57, '2021-02-12 12:57:00', '2021-02-12 13:57:47', 'selesai', NULL),
    (100, 4, 58, '2021-02-12 12:59:00', '2021-02-12 13:59:02', 'selesai', NULL),
    (101, 3, 59, '2021-02-13 07:47:00', '2021-02-13 08:47:07', 'selesai', NULL),
    (102, 4, 60, '2021-02-13 07:50:00', '2021-02-13 08:50:32', 'selesai', NULL),
    (103, 3, 61, '2021-02-13 07:55:00', '2021-02-13 08:55:49', 'selesai', NULL),
    (104, 3, 62, '2021-02-13 08:30:00', '2021-02-13 09:30:37', 'selesai', NULL),
    (105, 3, 63, '2021-02-13 08:35:00', '2021-02-13 09:35:21', 'selesai', NULL),
    (106, 4, 64, '2021-02-13 08:41:00', '2021-02-13 09:41:04', 'selesai', NULL),
    (107, 3, 65, '2021-02-13 08:43:00', '2021-02-13 09:43:20', 'selesai', NULL),
    (108, 3, 1 , '2021-02-13 08:35:00', '2021-02-13 08:35:56', 'selesai', NULL),
    (109, 3, 66, '2021-02-14 07:47:00', '2021-02-14 08:47:22', 'selesai', NULL),
    (110, 4, 67, '2021-02-14 07:50:00', '2021-02-14 08:50:53', 'selesai', NULL),
    (111, 4, 1 , '2021-02-14 07:55:00', '2021-02-14 07:55:08', 'selesai', NULL),
    (112, 4, 1 , '2021-02-14 08:30:00', '2021-02-14 08:30:26', 'selesai', NULL),
    (113, 4, 1 , '2021-02-14 08:35:00', '2021-02-14 08:35:11', 'selesai', NULL),
    (114, 4, 1 , '2021-02-14 08:41:00', '2021-02-14 08:41:35', 'selesai', NULL),
    (115, 4, 68, '2021-02-14 08:43:00', '2021-02-14 09:43:33', 'selesai', NULL),
    (116, 4, 69, '2021-02-14 08:35:00', '2021-02-14 09:35:37', 'selesai', NULL),
    (117, 4, 70, '2021-02-14 12:31:00', '2021-02-14 13:31:05', 'selesai', NULL),
    (118, 3, 71, '2021-02-14 12:33:00', '2021-02-14 13:33:13', 'selesai', NULL),
    (119, 3, 72, '2021-02-15 07:47:00', '2021-02-15 08:47:36', 'selesai', NULL),
    (120, 3, 73, '2021-02-15 07:50:00', '2021-02-15 08:50:04', 'selesai', NULL),
    (121, 4, 74, '2021-02-15 12:51:00', '2021-02-15 13:51:02', 'selesai', NULL),
    (122, 4, 1 , '2021-02-15 12:52:00', '2021-02-15 12:52:32', 'selesai', NULL),
    (123, 4, 75, '2021-02-15 12:55:00', '2021-02-15 13:56:41', 'selesai', NULL);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaksi_jasa`
--

LOCK TABLES `transaksi_jasa` WRITE;
/*!40000 ALTER TABLE `transaksi_jasa` DISABLE KEYS */;
INSERT INTO `transaksi_jasa` VALUES
    (1 , 2  , 1 , 1, 35000),
    (2 , 3  , 4 , 4, 45000),
    (3 , 4  , 5 , 2, 58000),
    (4 , 5  , 3 , 1, 80000),
    (5 , 6  , 5 , 1, 55000),
    (6 , 7  , 7 , 5, 56000),
    (7 , 8  , 3 , 1, 75000),
    (8 , 9  , 6 , 4, 95000),
    (9 , 14 , 11, 1, 72000),
    (10, 15 , 10, 2, 65000),
    (11, 16 , 4 , 4, 45000),
    (12, 17 , 9 , 5, 105000),
    (13, 18 , 12, 1, 115000),
    (14, 19 , 4 , 3, 45000),
    (15, 24 , 1 , 4, 35000),
    (16, 25 , 12, 4, 115000),
    (17, 26 , 2 , 2, 50000),
    (18, 27 , 2 , 2, 50000),
    (19, 28 , 1 , 1, 35000),
    (20, 29 , 3 , 1, 77500),
    (21, 30 , 3 , 1, 80000),
    (22, 32 , 6 , 3, 95000),
    (23, 33 , 7 , 3, 55000),
    (24, 34 , 8 , 5, 80000),
    (25, 35 , 5 , 3, 55000),
    (26, 38 , 2 , 1, 45000),
    (27, 39 , 10, 5, 65000),
    (28, 40 , 4 , 5, 45000),
    (29, 41 , 3 , 4, 80000),
    (30, 48 , 5 , 4, 55000),
    (31, 49 , 3 , 3, 77500),
    (32, 50 , 7 , 2, 55000),
    (33, 54 , 2 , 3, 45000),
    (34, 70 , 4 , 1, 45000),
    (35, 71 , 4 , 2, 45000),
    (36, 72 , 4 , 5, 45000),
    (37, 73 , 8 , 3, 65000),
    (38, 74 , 11, 5, 72000),
    (39, 75 , 9 , 5, 105000),
    (40, 76 , 7 , 3, 55000),
    (41, 77 , 5 , 5, 55000),
    (42, 78 , 1 , 5, 35000),
    (43, 79 , 8 , 3, 62000),
    (44, 80 , 2 , 1, 47500),
    (45, 81 , 6 , 2, 95000),
    (46, 82 , 11, 3, 72000),
    (47, 83 , 4 , 5, 45000),
    (48, 84 , 5 , 5, 55000),
    (49, 85 , 1 , 1, 35000),
    (50, 86 , 6 , 1, 95000),
    (51, 87 , 9 , 4, 105000),
    (52, 88 , 8 , 2, 62000),
    (53, 89 , 10, 2, 65000),
    (54, 90 , 9 , 4, 100000),
    (55, 91 , 11, 2, 72000),
    (56, 97 , 8 , 3, 62000),
    (57, 98 , 5 , 4, 55000),
    (58, 99 , 1 , 2, 35000),
    (59, 100, 2 , 1, 45000),
    (60, 101, 4 , 2, 45000),
    (61, 102, 7 , 1, 55000),
    (62, 103, 5 , 1, 55000),
    (63, 104, 1 , 1, 35000),
    (64, 105, 6 , 5, 95000),
    (65, 106, 12, 2, 115000),
    (66, 107, 11, 5, 72000),
    (67, 109, 10, 4, 60000),
    (68, 110, 6 , 5, 90000),
    (69, 115, 4 , 2, 45000),
    (70, 116, 11, 3, 72000),
    (71, 117, 1 , 4, 35000),
    (72, 118, 11, 4, 75000),
    (73, 119, 8 , 4, 62000),
    (74, 120, 5 , 4, 59000),
    (75, 121, 5 , 1, 59000),
    (76, 123, 12, 5, 130000);
/*!40000 ALTER TABLE `transaksi_jasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaksi_suku_cadang`
--

LOCK TABLES `transaksi_suku_cadang` WRITE;
/*!40000 ALTER TABLE `transaksi_suku_cadang` DISABLE KEYS */;
INSERT INTO `transaksi_suku_cadang` VALUES
    (1 , 1  , 4    , 1 , 4000),
    (2 , 1  , 6    , 1 , 12000),
    (3 , 3  , 6    , 2 , 24000),
    (4 , 9  , 6    , 1 , 12000),
    (5 , 10 , 5980 , 1 , 21700),
    (6 , 11 , 18   , 1 , 48000),
    (7 , 12 , 18   , 2 , 96000),
    (8 , 12 , 404  , 1 , 43500),
    (9 , 12 , 11397, 1 , 596000),
    (10, 13 , 6    , 1 , 12000),
    (11, 13 , 134  , 1 , 73900),
    (12, 17 , 5425 , 1 , 5000),
    (13, 19 , 31643, 1 , 30000),
    (14, 20 , 237  , 1 , 175000),
    (15, 21 , 5425 , 1 , 5000),
    (16, 22 , 16290, 2 , 220000),
    (17, 22 , 1267 , 1 , 45000),
    (18, 23 , 6    , 2 , 24000),
    (19, 31 , 261  , 1 , 32000),
    (20, 36 , 7448 , 1 , 11500),
    (21, 37 , 27939, 1 , 25000),
    (22, 42 , 27939, 1 , 25000),
    (23, 43 , 25070, 1 , 24000),
    (24, 44 , 4651 , 1 , 134000),
    (25, 45 , 13585, 1 , 2540000),
    (26, 46 , 30894, 5 , 22500),
    (27, 47 , 14097, 1 , 329000),
    (28, 47 , 10836, 1 , 20000),
    (29, 48 , 6    , 1 , 12000),
    (30, 50 , 8553 , 1 , 17000),
    (31, 51 , 8479 , 16, 40000),
    (32, 52 , 21452, 1 , 16000),
    (33, 53 , 21825, 24, 120000),
    (34, 53 , 25655, 2 , 1000),
    (35, 55 , 10866, 1 , 855000),
    (36, 56 , 19623, 2 , 121000),
    (37, 56 , 20240, 2 , 35000),
    (38, 57 , 9737 , 1 , 78000),
    (39, 58 , 31032, 12, 24000),
    (40, 58 , 8553 , 1 , 17000),
    (41, 59 , 28323, 1 , 1215000),
    (42, 60 , 26363, 1 , 16500),
    (43, 60 , 15836, 1 , 50000),
    (44, 61 , 30810, 1 , 572500),
    (45, 62 , 31839, 2 , 277000),
    (46, 63 , 7279 , 1 , 28000),
    (47, 64 , 7279 , 2 , 56000),
    (48, 64 , 31827, 1 , 368000),
    (49, 65 , 9207 , 2 , 1640000),
    (50, 66 , 5548 , 1 , 231000),
    (51, 66 , 26513, 1 , 607200),
    (52, 67 , 32719, 1 , 90000),
    (53, 68 , 21421, 2 , 14400000),
    (54, 69 , 4023 , 1 , 430000),
    (55, 72 , 27530, 2 , 2000),
    (56, 77 , 31643, 1 , 30000),
    (57, 83 , 7279 , 1 , 28000),
    (58, 84 , 11909, 1 , 18000),
    (59, 92 , 31839, 2 , 277000),
    (60, 93 , 15284, 1 , 200000),
    (61, 93 , 17937, 1 , 13500000),
    (62, 93 , 8553 , 1 , 17000),
    (63, 94 , 17968, 1 , 1145000),
    (64, 95 , 9082 , 1 , 1391000),
    (65, 96 , 13416, 9 , 112500),
    (66, 108, 13729, 2 , 34000),
    (67, 110, 25692, 4 , 20000),
    (68, 111, 30810, 1 , 572500),
    (69, 111, 27530, 4 , 4000),
    (70, 112, 323  , 1 , 836900),
    (71, 113, 11909, 1 , 18000),
    (72, 113, 25531, 2 , 156000),
    (73, 114, 8553 , 1 , 17000),
    (74, 122, 9064 , 2 , 1800000);
/*!40000 ALTER TABLE `transaksi_suku_cadang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

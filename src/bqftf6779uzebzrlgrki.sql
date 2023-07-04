-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bqftf6779uzebzrlgrki-mysql.services.clever-cloud.com:3306
-- Generation Time: Jul 04, 2023 at 02:22 PM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bqftf6779uzebzrlgrki`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` tinyint NOT NULL DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '1',
  `accesstimes` int NOT NULL DEFAULT '0',
  `host` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `address`, `fullname`, `email`, `birthday`, `phonenumber`, `priority`, `state`, `accesstimes`, `host`, `token`, `img`) VALUES
('20ca66610dac27d7b062faeb73cf93dafca12e259d374594ae503e18de248ff5', 'cfacbdcd76bea34b1df9e07cda29b43411cfc02df7531a4d74cb4f224f977c1c', NULL, 'Thánh Bom Hàng', 'maidoan2002ns@gmail.com', NULL, '0385779443', -1, 0, 5, 'http://localhost:5173', '3446372a14399e484edb745f262d2261652794200da34a0383e1cd986088fa70', ''),
('22d8d710f3c9d48dd8d1b80217d2ce50752c524120899fecd678c4d58f780e35', '75315259c00a1443fc1306380c08c8781c3d8d9e316301f3f9b9eadcec5ddd2d', 'null', 'Vu Tien Dung', 'alawdishurs@hotmail.com', 'null', '0896011459', 1, 1, 2, 'http://localhost:5173', '8307a37c00d2e16306b18cba5cc7bb604e2503883c8211e99932de77bd1b02ba', 'avt_22d8d710f3c9d48dd8d1b80217d2ce50752c524120899fecd678c4d58f780e35.jpg'),
('69eac4864c82844765e5a780b0982b4f2faa6a78e4cc09753cbd50afb4309ca9', '9e70a02417cc401a2b65d7ac117c5c548b52ae49e5898110203b17feb1124ac2', 'Hà Nội ', 'Ninh Thu Hà', 'fakeadmin@gmail.com', '2002-09-28', '0920390083', 1, 1, 36, 'http://localhost:5173', 'acff145269e550cdc4ddffd6b54d7a95bf20b1595e26f0d430ada14f79fac7f5', 'avt_69eac4864c82844765e5a780b0982b4f2faa6a78e4cc09753cbd50afb4309ca9.jpg'),
('737a8c898a9aeac13ff28b640232ac2c23736cfe721f2bf99e4b426c40996404', '80c4f8a71afbc69511a68cabf1bcf8eb829456510db0e00cfd347792af232a3d', 'null', 'Vu Tien Dung', 'alawdishurs@hotmail.com', '2002-09-23', '0896011459', 0, 1, 3, 'http://localhost:5173', 'd5d2066921467d412be36b22d75be6686da0960987d49871356398afd9721a9d', 'avt_737a8c898a9aeac13ff28b640232ac2c23736cfe721f2bf99e4b426c40996404.jpg'),
('88fb6b9da05a6961aaab5dbad2aaa331b3b317cbd918532c40c9f858acbb0cba', '9e70a02417cc401a2b65d7ac117c5c548b52ae49e5898110203b17feb1124ac2', NULL, 'Ninh Thu Hà', 'phanquangduong2002@gmail.com', NULL, '02553253563', 0, 1, 0, NULL, NULL, NULL),
('8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2ce398774d9f5e7a5cb6a305ed06f484ca7c13d93e65ad7d1481a9e636cc698c', 'Thanh Hóa', 'Admin', 'admin123@gmail.com', '2002-09-18', '0385779443', 1, 1, 170, 'http://localhost:5173', 'dd3556c37b36b17d922bd59014cbc1696ea846fedfcf66f6fc2f9495ff19cdc0', 'avt_8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918.jpg'),
('b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '9e70a02417cc401a2b65d7ac117c5c548b52ae49e5898110203b17feb1124ac2', 'Hà Nội ', 'Ninh Thu Hà', 'Ninhthithuha28092002@gmail.com', '2002-09-28', '08927290371', 0, 1, 16, 'http://localhost:5173', '314bb6f4fcd0322e43a42cf7e849c3b5bc05777f83e2c62717120d06ed74d91e', 'avt_b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624.jpg'),
('cd6304fac2a4c9d93be2f7454662b235b086dc5dc5f1f48db1ad3669b9cd9a59', '901593959b7231e5a3084e43e610e7756b1ebe95198f41e1283109c7fb0dc539', 'Thanh Hóa', 'Mai Ngọc Đoàn', 'doandeptrai123@nuce.edu.vn', 'null', '0385779443', 0, 1, 69, 'http://localhost:5173', 'c41531c84e24751c3eac066d7563313b32cb0168e59fae7f7fde4d895aaed403', 'avt_cd6304fac2a4c9d93be2f7454662b235b086dc5dc5f1f48db1ad3669b9cd9a59.jpg'),
('e6d8b39d4d24e6cb9d3ddc0a20136c23538a5789ef2e337dcf6cb6748b2776db', '01d0b2a8f41d9b219b1514f32a68329b0f503f176e7cd4d9a9f565ddb7f4711e', NULL, 'Lê Văn Hiệp', NULL, NULL, NULL, 0, 1, 0, NULL, NULL, ''),
('f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4', '2ce398774d9f5e7a5cb6a305ed06f484ca7c13d93e65ad7d1481a9e636cc698c', 'Thanh Hóa, Việt Nam', 'Mai Ngọc Đoàn', 'doan1509765@nuce.edu.vn', 'null', '0385779443', 1, 1, 17, 'http://localhost:5173', '0b97e261b09ed11ddc8d3fe903cb286c2d39a5fbb346380321f8342b36f78fa8', 'avt_f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4.jpg'),
('f79577959fbf1b4062c83bb79fc39aafe7063cc20f7ace150842354da873195a', '519ba9b4954239ae44133afe7974a22b0c43358e8cd4193bd8a2b824c27e36dc', 'null', 'Vu Tien Dung', 'alawdishurs@hotmail.com', 'null', '0896011456', 0, 1, 1, 'http://localhost:5173', '0a49886d4e6fdbe541e44c2efce9c9bd16d3c5cafc159d2756065cd3e77edaaf', 'avt_f79577959fbf1b4062c83bb79fc39aafe7063cc20f7ace150842354da873195a.jpg'),
('fe3feeed3a945f0090720a9d99fbea3fe2540e99fe28ce77055a89afcbd8d194', 'af268d5986200b0eeccdc2b42454b0f629db2f11431482b13c1995e98f6a0911', 'Thanh Hóa', 'Hiệp Lê', 'hiep68965@nuce.edu.vn', '2002-07-15', '0869680321', 0, 1, 10, 'http://localhost:5173', '0adeb357eefcbb53f83494fdb59375a73d23a099d8a7964e490493c55795ac66', 'avt_fe3feeed3a945f0090720a9d99fbea3fe2540e99fe28ce77055a89afcbd8d194.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datedone` datetime DEFAULT NULL,
  `totalbill` int NOT NULL DEFAULT '0',
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiveaddress` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `receivephonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receivename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `state`, `datedone`, `totalbill`, `username`, `receiveaddress`, `receivephonenumber`, `receivename`) VALUES
('a24e60t6a17n48', 4, NULL, 17800000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã La Ngâu, Huyện Tánh Linh, Tỉnh Bình Thuận', '0385779443', 'Admin'),
('A28t37p1a16Y1', 4, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Minh Long, Huyện Chơn Thành, Tỉnh Bình Phước', '0385779443', 'Admin'),
('A3jNaNP3G3m29', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Viên An, Huyện Ngọc Hiển, Tỉnh Cà Mau', '0385779443', 'Admin'),
('B36y4x58P46P8', 3, NULL, 199000, 'f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4', 'dsd, Xã Nhơn Thọ, Thị xã An Nhơn, Tỉnh Bình Định', '0385779443', 'Mai Ngọc Đoànnnnn'),
('c7n19T23y11O27', 3, NULL, 398000, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '129 Trương Định , Phường Trương Định, Quận Hai Bà Trưng, Thành phố Hà Nội', '08927290371', 'Ninh Thu Hà'),
('d0D3R50C17T2', 4, NULL, 199998, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Tân Hà, Huyện Đức Linh, Tỉnh Bình Thuận', '0385779443', 'Admin'),
('d0i8J18r20k68', 4, NULL, 798000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Phong Nậm, Huyện Trùng Khánh, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('d18f70X0X62f30', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Thanh Bình, Huyện Bù Đốp, Tỉnh Bình Phước', '0385779443', 'Admin'),
('d1Y9k34A9F1', 4, NULL, 199000, 'f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4', 'Xóm Cần thanh, Xã Nga Hải, Huyện Nga Sơn, Tỉnh Thanh Hóa', '0385779443', 'Mai Ngọc Đoàn'),
('d21i0I38J52t24', 0, NULL, 329000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Bình Tường, Huyện Tây Sơn, Tỉnh Bình Định', '0385779443', 'thánh bom hàng2'),
('E11x0M20x0t28', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Thanh Bình, Huyện Bù Đốp, Tỉnh Bình Phước', '0385779443', 'Admin'),
('E3H52e19T8nNaN', 3, NULL, 798000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã Thanh Tùng, Huyện Đầm Dơi, Tỉnh Cà Mau', '0385779443', 'admon'),
('e5O17o0Y6a0', 3, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Cần Nông, Huyện Thông Nông, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('e7Q12F14G39L20', 0, NULL, 658000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Bình Tường, Huyện Tây Sơn, Tỉnh Bình Định', '0385779443', 'thánh bom hàng2'),
('e7Q39a12i32a16', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Phường Phú Tân, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0385779443', 'Admin'),
('F4c33i0B4Q30', 3, NULL, 399000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Ngõ 43, Ngách 1, số nhà 9, Phường Phương Mai, Quận Đống Đa, Thành phố Hà Nội', '0385779443', 'Admin'),
('f50q12h6Y15c52', 4, NULL, 17800000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã La Ngâu, Huyện Tánh Linh, Tỉnh Bình Thuận', '0385779443', 'Admin'),
('G10c0P10i48Q2', 3, NULL, 178000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Nâm Nung, Huyện Krông Nô, Tỉnh Đắk Nông', '0385779443', 'Admin'),
('G26N22F15j2G16', 3, NULL, 497000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Hòa Bắc, Huyện Hòa Vang, Thành phố Đà Nẵng', '0385779443', 'Admin'),
('H11n51y2r11L11', 2, NULL, 1196000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Thị trấn Cờ Đỏ, Huyện Cờ Đỏ, Thành phố Cần Thơ', '0385779443', 'Admin'),
('h1I13o15g45k5', 4, NULL, 29900000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã Hòa Phú, Thành phố Buôn Ma Thuột, Tỉnh Đắk Lắk', '0385779443', 'Admin'),
('H7I7j23F81f51', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Phường Phú Tân, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0385779443', 'Admin'),
('H8t78C16t24M14', 0, NULL, 799000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Ân Hảo Đông, Huyện Hoài Ân, Tỉnh Bình Định', '0385779443', 'Admin'),
('H9P9r29t24h1', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Phường Phú Tân, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0385779443', 'Admin'),
('i19b61r35m3J29', 2, NULL, 2396000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đông Hưng, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('i19l1r37O0x31', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Phường Phú Tân, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0385779443', 'Admin'),
('i41E32C76F9x17', 0, NULL, 329000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Bình Tường, Huyện Tây Sơn, Tỉnh Bình Định', '0385779443', 'thánh bom hàng2'),
('i68Y60l80h14C50', 0, NULL, 329000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Bình Tường, Huyện Tây Sơn, Tỉnh Bình Định', '0385779443', 'thánh bom hàng2'),
('i6E49k0x18d49', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Đông Hưng, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('j11A42w41b2e1', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Viên An, Huyện Ngọc Hiển, Tỉnh Cà Mau', '0385779443', 'Admin'),
('J13l45l24E30Z24', 3, NULL, 399000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Quang Vinh, Huyện Trà Lĩnh, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('J74Y5b30f2o8', 3, NULL, 399000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Ngõ 43, Ngách 1, số nhà 9, Xã Thanh Tùng, Huyện Đầm Dơi, Tỉnh Cà Mau', '0385779443', 'Admin'),
('K12x54m23M27g34', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đoàn Kết, Huyện Bù Đăng, Tỉnh Bình Phước', '0385779443', 'Admin'),
('k68Q11n23c8c8', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Cái Nước, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('k7n8J24a14P23', 3, NULL, 399000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Tân Phú, Huyện Thới Bình, Tỉnh Cà Mau', '0385779443', 'Admin'),
('l0w3P26p6Z6', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Minh Long, Huyện Chơn Thành, Tỉnh Bình Phước', '0385779443', 'Admin'),
('L0Z93D0x16L0', 1, NULL, 1197000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Phường Thành Nhất, Thành phố Buôn Ma Thuột, Tỉnh Đắk Lắk', '0385779443', 'Admin'),
('l3P7e16C7o21', 3, NULL, 897000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Thị trấn Cờ Đỏ, Huyện Cờ Đỏ, Thành phố Cần Thơ', '0385779443', 'Admin'),
('l5P54k40x12E14', 1, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Thị trấn Cờ Đỏ, Huyện Cờ Đỏ, Thành phố Cần Thơ', '0385779443', 'Admin'),
('M31D10q2L35X33', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Viên An, Huyện Ngọc Hiển, Tỉnh Cà Mau', '0385779443', 'Admin'),
('M5e6L33Q21C42', 1, NULL, 1495000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Thị trấn Cờ Đỏ, Huyện Cờ Đỏ, Thành phố Cần Thơ', '0385779443', 'Admin'),
('m77q68e5C47h5', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Viên An, Huyện Ngọc Hiển, Tỉnh Cà Mau', '0385779443', 'Admin'),
('N15G4g1L7A40', 4, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Cần Nông, Huyện Thông Nông, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('n1t16c13d84e0', 4, NULL, 149000, 'f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4', 'sddsa, Xã Đại Hợp, Huyện Kiến Thuỵ, Thành phố Hải Phòng', '0385779443', 'Mai Ngọc Đoàn'),
('n62P14f78j3i29', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đoàn Kết, Huyện Bù Đăng, Tỉnh Bình Phước', '0385779443', 'Admin'),
('n65w61L9w33Q3', 0, NULL, 799000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Ân Hảo Đông, Huyện Hoài Ân, Tỉnh Bình Định', '0385779443', 'Admin'),
('o24r57F15A2X24', 4, NULL, 598000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Thị trấn Cờ Đỏ, Huyện Cờ Đỏ, Thành phố Cần Thơ', '0385779443', 'Admin'),
('O56k5X14j56M3', 3, NULL, 697000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Đông Hưng, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('O59J3H19w19r19', 3, NULL, 995000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Cuôr KNia, Huyện Buôn Đôn, Tỉnh Đắk Lắk', '0385779443', 'Admin'),
('o8j7h27n58g1', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Cái Nước, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('O8p3p19w66w16', 0, NULL, 799000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Ân Hảo Đông, Huyện Hoài Ân, Tỉnh Bình Định', '0385779443', 'Admin'),
('P10M41T36G41A10', 4, NULL, 798000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Phong Nậm, Huyện Trùng Khánh, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('P12A72g0k1m0', 3, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Viên An, Huyện Ngọc Hiển, Tỉnh Cà Mau', '0385779443', 'Admin'),
('P19Z67f19R9c5', 4, NULL, 17800000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã La Ngâu, Huyện Tánh Linh, Tỉnh Bình Thuận', '0385779443', 'Admin'),
('p2E2x84N2h32', 4, NULL, 399000, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '129 Trương Định , Phường Đề Thám, Thành phố Cao Bằng, Tỉnh Cao Bằng', '08927290371', 'Ninh Thu Hà'),
('P2F34o0P30w43', 3, NULL, 398000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Thanh Bình, Huyện Bù Đốp, Tỉnh Bình Phước', '0385779443', 'Admin'),
('p31t1x0N51d1', 3, NULL, 199000, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', 'Số nhà 10, Xã Cây Trường II, Huyện Bàu Bàng, Tỉnh Bình Dương', '08927290371', 'Ninh Thu Hà'),
('p32l2t2o30w0', 0, NULL, 799000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Ân Hảo Đông, Huyện Hoài Ân, Tỉnh Bình Định', '0385779443', 'Admin'),
('P40p67H13l40d24', 4, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Cần Nông, Huyện Thông Nông, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('p57h69y11g53g17', 2, NULL, 500000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Gần nhà văn hóa xóm Cần Thanh, Xã Nga Hải, Huyện Nga Sơn, Tỉnh Thanh Hóa', '0385779443', 'Mai Ngọc Đoàn'),
('P5Q9C48A0l5', 3, NULL, 399000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '43/1/9 Kim Dong, Xã Thạch Hoà, Huyện Thạch Thất, Thành phố Hà Nội', '0385779443', 'Admin'),
('p75o20N0O36L8', 3, NULL, 99999, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '129 Trương Định , Phường Trương Định, Quận Hai Bà Trưng, Thành phố Hà Nội', '08927290371', 'Ninh Thu Hà'),
('q12B12r16l3e52', 3, NULL, 798000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaa, Xã Thanh Tùng, Huyện Đầm Dơi, Tỉnh Cà Mau', '0385779443', 'admon'),
('q12M12C22T20x4', 4, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Cần Nông, Huyện Thông Nông, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('q17Y27J18E12j1', 3, NULL, 99999, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '129 Trương Định , Phường Trương Định, Quận Hai Bà Trưng, Thành phố Hà Nội', '08927290371', 'Ninh Thu Hà'),
('Q18q38Z16p84GNaN', 4, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Minh Long, Huyện Chơn Thành, Tỉnh Bình Phước', '0385779443', 'Admin'),
('Q51x42I0P29o15', 0, NULL, 799000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Ân Hảo Đông, Huyện Hoài Ân, Tỉnh Bình Định', '0385779443', 'Admin'),
('q5Q75y3P35q17', 3, NULL, 2990000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Pác Miầu, Huyện Bảo Lâm, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('r23o63J6A0R41', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Minh Long, Huyện Chơn Thành, Tỉnh Bình Phước', '0385779443', 'Admin'),
('r29l18e5M7O77', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Phường Phú Tân, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0385779443', 'Admin'),
('R6F78H87g18H24', 3, NULL, 329000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '43/1/9 Kim Dong, Xã Tân Trung, Huyện Đầm Dơi, Tỉnh Cà Mau', '0385779443', 'Admin'),
('t15B2N42x7p37', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đoàn Kết, Huyện Bù Đăng, Tỉnh Bình Phước', '0385779443', 'Admin'),
('T25F17b3y9r3', 2, NULL, 398000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Thị trấn Thanh Bình, Huyện Bù Đốp, Tỉnh Bình Phước', '0385779443', 'Admon'),
('T30a43F7Y43C3', 2, NULL, 697000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Đông Hưng, Huyện Cái Nước, Tỉnh Cà Mau', '0385779443', 'Admin'),
('w16R35Z68n18C35', 2, NULL, 298000, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '129 Trương Định , Phường Trương Định, Quận Hai Bà Trưng, Thành phố Hà Nội', '08927290371', 'Ninh Thu Hà'),
('w32j15o65e3d59', 3, NULL, 99000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Hòa Bắc, Huyện Hòa Vang, Thành phố Đà Nẵng', '0385779443', 'Admin'),
('w9x18I2L2m2', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đoàn Kết, Huyện Bù Đăng, Tỉnh Bình Phước', '0385779443', 'Admin'),
('x36F5Y87i76O7', 2, NULL, 299000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Cần Nông, Huyện Thông Nông, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('x42J48n29k26O26', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Đoàn Kết, Huyện Bù Đăng, Tỉnh Bình Phước', '0385779443', 'Admin'),
('x42m24n1d2K52', 2, NULL, 199000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Minh Long, Huyện Chơn Thành, Tỉnh Bình Phước', '0385779443', 'Admin'),
('Y11i55Q32I31o61', 3, NULL, 398000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'aaaa, Xã Lê Lai, Huyện Thạch An, Tỉnh Cao Bằng', '0385779443', 'Admin'),
('y36G17N56y2G36', 3, NULL, 298000, 'f42aa323a2f2e5e30813054b2d4b17a67687b33035d393fb59c5bd5eda6e91e4', '10, Xã Phước Sơn, Huyện Tuy Phước, Tỉnh Bình Định', '0385779443', 'Mai Ngọc Đoàn'),
('Z30t21J40Q54N9', 1, NULL, 99000, 'b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', 'Nhà số 9, Xã Trung Phúc, Huyện Trùng Khánh, Tỉnh Cao Bằng', '08927290371', 'Ninh Thu Hà'),
('Z4K70b22X3X1', 0, NULL, 987000, '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'số nhà 49 ngõ 53, Xã Bình Tường, Huyện Tây Sơn, Tỉnh Bình Định', '0385779443', 'thánh bom hàng2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
('22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD', 'Nam'),
('E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91', 'Nữ'),
('E2BC67980C4238652AD5D3F9AB46599328696A6C3078E640138B9A5C870E0771', 'Trẻ em');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idproduct` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`username`, `idproduct`, `comment`) VALUES
('8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1', 'ok day\n\n\n'),
('8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '11', 'sdfsdf'),
('8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '8', 'kkk'),
('8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '9', 'Hehe'),
('b1ce170a060c8363ab4b931d0b62c8ea537738909c71ecc09db1b26ba3097624', '2', 'Đã nhận được hàng, quá đẹp. Nên quyết định đặt thêm 1 chiếc nữa! Sẽ ủng hộ Shop lâu dài.'),
('cd6304fac2a4c9d93be2f7454662b235b086dc5dc5f1f48db1ad3669b9cd9a59', '2', 'xcvbvxc'),
('cd6304fac2a4c9d93be2f7454662b235b086dc5dc5f1f48db1ad3669b9cd9a59', '9', 'Haha');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `infoid` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `colorcode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `colorname` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `totalbought` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '1',
  `price` int DEFAULT NULL,
  `promotedprice` int DEFAULT '0',
  `imageurl` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `infoid`, `size`, `colorcode`, `colorname`, `totalbought`, `quantity`, `state`, `price`, `promotedprice`, `imageurl`) VALUES
('05737FE81FD1193839EC61063AA9956F2516787BDA9651F7AB34C14A945B6D4E', '2', 'XL', '#008000', 'Green', 1, 120, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/zDSC05002_copy.jpg'),
('18035EFC19B06B0E49D1394A586E7E03D377D994F11F8CE6EDD90D472170B176', '1', 'S', '#000000', 'Black', 3, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/August2022/_MG_2334-Recovered1.jpg'),
('19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', '9', 'L', '#FFFFFF', 'White', 45, 95, 1, 299000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/CoolMate0541.jpg'),
('1BF375C2691454475BA4A50F35561284DAA1EB0D415FD5D578A1444D20A23CCD', '5', 'S', '#000080', 'Navy', 2, 118, 1, 89000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/activv15.jpg'),
('1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '29', 'L', '#B0BFC6', '64 Blue', 0, 70, 1, 799000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461938/item/vngoods_64_461938.jpg?width=750'),
('2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', '8', 'L', '#000000', 'Black', 29, 41, 1, 199000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/USA_REU_4.jpg'),
('3FDBA35F04DC8C462986C992BCF875546257113072A909C162F7E470E581E278', '13', 'L', '#C0C0C0', 'Silver', 0, 70, 1, 129000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/September2022/xam-nhat-1.jpg'),
('452354011504CD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', '18', '30', '#808080', 'Gray', 0, 70, 1, 199000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/jogger-casual-xam-nhat2_60.jpg'),
('452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', '19', '30', '#000080', 'Navy', 8, 62, 1, 399000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/November2022/anh-mau-jeans-basic-slimfit-xanh-sang-5.jpg'),
('4523540F1504CD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', '17', '30', '#000000', 'Black', 0, 70, 1, 499000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/November2022/skinny-fit-den-1_9.jpg'),
('452364011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', '20', '30', '#000080', 'Navy', 2, 68, 1, 399000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/s3-clean-truoc.jpg'),
('463F234FB04640a168C69102AA4E800BD1C5F1FBDDE73405C8CAF11A468117FC', '6', '2XL', '#000080', 'Navy', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/IMG_6627.jpg'),
('463F234FB04640a168C693456A4E800BD1C5F1FBDDE73405C8CAF11A468117FC', '6', 'L', '#000080', 'Black', 2, 68, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/December2021/pros123.jpeg'),
('463F234FB04640D168C69102AA4E800BD1C5F1FBDDE73405C8CAF11A468117FC', '6', 'L', '#000080', 'Navy', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/IMG_6627.jpg'),
('463F234FB046s0D168C69102AA4E800BD1C5F1FBDDE73405C8CAF11Ac68117FC', '6', 'XL', '#000080', 'Navy', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/IMG_6627.jpg'),
('463sdh4FB04640D168C6r102AA4E800BD1C5F1FBDDE73405C8CAF11A468117FC', '6', 'L', '#FFFFFF', 'White', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80/image/August2022/_MG_0290-3_(1).jpg'),
('4A44DC15364204A80FE80E9039455CC1608281820FE2B24F1E5233ADE6AF1DD5', '10', 'L', '#C0C0C0', 'Silver', 5, 65, 1, 250000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/somicfxam4.jpg'),
('4BCD7B0859FDED98FA714734A7080A6E9549645039522686C23B3588FF5C2380', '3', 'S', '#000080', 'Navy', 2, 70, 1, 199999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/3_lo_basics_mau_navy_2.jpg'),
('4F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '30', 'L', '#cfb997', '32 Beige', 0, 70, 1, 1699000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450310/item/vngoods_32_450310.jpg?width=750'),
('4FC82B26AECB47D2868C4EFBE3581732A3E7CBCC6C2EFB32062C08170A05EEB8', '11', 'L', '#000000', 'Black', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/May2022/DSC05891-copy.jpg'),
('5869CDE9242AFEE104F86B05D686AECEE0B6A26B48286A8C9AE95AFD36FF2674', '2', 'M', '#DBDFEA', 'Gray', 1, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/zDSC05002_copy.jpg'),
('5F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '23', 'S', '#000000', '01 OFF White', 0, 70, 1, 1299000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461535/item/vngoods_01_461535.jpg?width=750'),
('6377CDE9242AFEE104F86B05D686AECEE0B6A26B48286A8C9AE95AFD36FF2673', '2', 'M', '#000000', 'Black', 1, 70, 1, 99999, 0, 'F86B4D3007FDC5613EE00F8C1609018729705EC43596566FED698B647F3D5A68'),
('6B51D431DF5D7F141CBECECCF79EDF3DD861C3B4069F0B11661A3EEFACBBA918', '12', 'L', '#8FBC8F', 'Dark Green', 0, 70, 1, 150000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/DSC01693-copymovexanh_6.jpg  '),
('6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', '1', 'L', '#000000', 'Black', 3, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/August2022/_MG_2334-Recovered1.jpg'),
('6DFA87D93A2CDC8907C012FD775B49C973EDA2B3301375357282CBDE453B3475', '4', 'S', '#0000FF', 'Blue', 2, 68, 1, 149000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/May2023/zzCotton_100_-_Xanh_2D_-_Front_1.jpg'),
('6E4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '22', 'L', '#0000FF', 'Blue', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/458291/item/vngoods_63_458291.jpg?width=750'),
('6F4B6512125FB3A0DAECD2799DFD6C8I299424FD920F9B308110A2C1FBD8F443', '21', 'L', '#CD853F', 'Brown', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_34_455760.jpg?width=750'),
('6F4B6512125FB3A0DAECD279T6FD6C9C299424FD920F9B308110A2C1FBD8F443', '21', 'L', '#EE6AA7', 'HotPink2', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_11_455760.jpg?width=750'),
('6F4B6512125FB3A0DAECE2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '21', 'L', '#FFFFFF', 'White', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_00_455760.jpg?width=750'),
('6F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '21', 'M', '#EE6AA7', 'HotPink2', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_11_455760.jpg?width=750'),
('6F4B6612125FB3A0DAFCD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '26', 'L', '#0000FF', 'Blue', 1, 69, 1, 399000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/457703001/item/vngoods_67_457703001.jpg?width=750'),
('6F4B6612125RB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '21', '2XL', '#EE6AA7', 'HotPink2', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_11_455760.jpg?width=750'),
('6F4B6612129FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '21', 'XL', '#EE6AA7', 'HotPink2', 0, 70, 1, 199000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455760/item/vngoods_11_455760.jpg?width=750'),
('6F4B7612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '24', 'S', '#FFC0CB', 'Pink', 0, 70, 1, 999000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/457470/item/vngoods_11_457470.jpg?width=750'),
('6F5B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '25', 'L', '#000080', 'Navy', 0, 70, 1, 1499000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/456073/item/vngoods_69_456073.jpg?width=750'),
('8527A891E224136950FF32CA212B45BC93F69FBB801C3B1EBEDAC52775F99E61', '14', '30', '#000000', 'Black', 1, 69, 1, 399000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/update_kaki_excool-8.jpg'),
('8F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '28', 'L', '##f5f5dc', 'OFF White', 0, 70, 1, 599000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/457660/item/vngoods_01_457660.jpg?width=750'),
('901CAAF8DDD9DC22463AF928EAF8FD901DE28C46313BCF79D50AC195FE7FADE2', '2', 'S', '#008000', 'Green', 3, 48, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/zDSC05002_copy.jpg'),
('996DFE7810057E0163CBF59167FFFB986E4F7216B25442B5ABC7AE3D4A9337F4', '2', 'L', '#008000', 'Green', 1, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/zDSC05002_copy.jpg'),
('9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', '7', 'L', '#FFFFFF', 'White', 18, 52, 1, 199000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/November2021/uBT5A8961.jpg'),
('9E9B9551CFF6178703978FC81F0B74D60B56E710599249E89E80433F993EA972', '2', '2XL', '#008000', 'Green', 1, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2023/zDSC05002_copy.jpg'),
('9F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', '27', 'L', '#008000', 'Green', 0, 70, 1, 399000, 0, 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462872/item/vngoods_52_462872.jpg?width=750 '),
('A73FCF339640929207281FB8E038884806E2EB0840F2245694DBBA1D5CC89E65  ', '1', 'S', '#808080', 'Gray', 3, 70, 1, 99999, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/August2022/Tank_xam_dam_11.jpg'),
('B17EF6D19C7A5B1EE83B907C595526DCB1EB06DB8227D650D5DDA0A9F4CE8CD9', '16', '30', '#008080', 'Teal', 0, 70, 1, 599000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=100/uploads/March2023/zCoolmate_x_Copper_Jeans_-_Slimfit__-_Xanh_nhat_7.jpg'),
('E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', '15', '30', '#808080', 'Gray', 1, 69, 1, 329000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/March2023/sQuan_Jogger_Nam_tui_hop_Cargo_Outdoor_-_Xam_5.jpg'),
('sghkj34FB04640a168C69102AA4E800BD1C5F1FBDDE73405C8CAF11A468117FC', '6', 'L', '#000080', 'Blue', 0, 70, 1, 99000, 0, 'https://media.coolmate.me/cdn-cgi/image/quality=80/image/July2022/_MG_0137_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `productinbill`
--

CREATE TABLE `productinbill` (
  `idbill` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idproduct` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actualprice` float DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productinbill`
--

INSERT INTO `productinbill` (`idbill`, `idproduct`, `actualprice`, `quantity`) VALUES
('p57h69y11g53g17', '4A44DC15364204A80FE80E9039455CC1608281820FE2B24F1E5233ADE6AF1DD5', 250000, 2),
('o8j7h27n58g1', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('k68Q11n23c8c8', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('d18f70X0X62f30', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('E11x0M20x0t28', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('P2F34o0P30w43', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('T25F17b3y9r3', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('T30a43F7Y43C3', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('T30a43F7Y43C3', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('O56k5X14j56M3', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('O56k5X14j56M3', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('i6E49k0x18d49', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('O59J3H19w19r19', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 5),
('q5Q75y3P35q17', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 10),
('n1t16c13d84e0', '6DFA87D93A2CDC8907C012FD775B49C973EDA2B3301375357282CBDE453B3475', 149000, 1),
('E3H52e19T8nNaN', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('q12B12r16l3e52', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('h1I13o15g45k5', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 100),
('P19Z67f19R9c5', '1BF375C2691454475BA4A50F35561284DAA1EB0D415FD5D578A1444D20A23CCD', 89000, 200),
('a24e60t6a17n48', '1BF375C2691454475BA4A50F35561284DAA1EB0D415FD5D578A1444D20A23CCD', 89000, 200),
('f50q12h6Y15c52', '1BF375C2691454475BA4A50F35561284DAA1EB0D415FD5D578A1444D20A23CCD', 89000, 200),
('d1Y9k34A9F1', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('Y11i55Q32I31o61', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('G26N22F15j2G16', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 2),
('G26N22F15j2G16', '463F234FB04640a168C693456A4E800BD1C5F1FBDDE73405C8CAF11A468117FC', 99000, 1),
('w32j15o65e3d59', '463F234FB04640a168C693456A4E800BD1C5F1FBDDE73405C8CAF11A468117FC', 99000, 1),
('G10c0P10i48Q2', '1BF375C2691454475BA4A50F35561284DAA1EB0D415FD5D578A1444D20A23CCD', 89000, 2),
('d0i8J18r20k68', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('P10M41T36G41A10', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('i19b61r35m3J29', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('i19b61r35m3J29', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 2),
('J13l45l24E30Z24', '8527A891E224136950FF32CA212B45BC93F69FBB801C3B1EBEDAC52775F99E61', 399000, 1),
('d0D3R50C17T2', '05737FE81FD1193839EC61063AA9956F2516787BDA9651F7AB34C14A945B6D4E', 99999, 2),
('k7n8J24a14P23', '452364011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 1),
('L0Z93D0x16L0', '452364011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 1),
('L0Z93D0x16L0', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 2),
('l5P54k40x12E14', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('o24r57F15A2X24', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 2),
('l3P7e16C7o21', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 3),
('H11n51y2r11L11', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 4),
('M5e6L33Q21C42', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 5),
('e5O17o0Y6a0', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('N15G4g1L7A40', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('P40p67H13l40d24', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('q12M12C22T20x4', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('x36F5Y87i76O7', '19581E27DE7CED00FF1CE50B2047E7A567C76B1CBAEBABE5EF03F7C3017BB5B7', 299000, 1),
('x42J48n29k26O26', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('K12x54m23M27g34', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('n62P14f78j3i29', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('t15B2N42x7p37', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('w9x18I2L2m2', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('r23o63J6A0R41', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('x42m24n1d2K52', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('l0w3P26p6Z6', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('A28t37p1a16Y1', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('Q18q38Z16p84GNaN', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('P12A72g0k1m0', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('m77q68e5C47h5', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('M31D10q2L35X33', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('A3jNaNP3G3m29', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('j11A42w41b2e1', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('i19l1r37O0x31', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('H7I7j23F81f51', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('r29l18e5M7O77', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('e7Q39a12i32a16', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('H9P9r29t24h1', '2C624232CDD221771294DFBB310ACA000A0DF6AC8B66B696D90EF06FDEFB64A3', 199000, 1),
('p75o20N0O36L8', '901CAAF8DDD9DC22463AF928EAF8FD901DE28C46313BCF79D50AC195FE7FADE2', 99999, 1),
('P5Q9C48A0l5', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 1),
('F4c33i0B4Q30', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 1),
('B36y4x58P46P8', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('y36G17N56y2G36', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('y36G17N56y2G36', '463F234FB04640a168C693456A4E800BD1C5F1FBDDE73405C8CAF11A468117FC', 99000, 1),
('q17Y27J18E12j1', '901CAAF8DDD9DC22463AF928EAF8FD901DE28C46313BCF79D50AC195FE7FADE2', 99999, 1),
('J74Y5b30f2o8', '6F4B6612125FB3A0DAFCD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 399000, 1),
('w16R35Z68n18C35', '6DFA87D93A2CDC8907C012FD775B49C973EDA2B3301375357282CBDE453B3475', 149000, 2),
('R6F78H87g18H24', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 1),
('c7n19T23y11O27', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 2),
('p2E2x84N2h32', '452354011504OD17100C4835E85B7EEFD49911580F8EFFF0599A8F283BE6B9E3', 399000, 1),
('Z30t21J40Q54N9', '463F234FB04640a168C693456A4E800BD1C5F1FBDDE73405C8CAF11A468117FC', 99000, 1),
('p31t1x0N51d1', '9B6DD0F55D1CEA37555DB317F53A0631F694BD46DF8018CC2AEED3D9E2F32F5F', 199000, 1),
('n65w61L9w33Q3', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 1),
('H8t78C16t24M14', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 1),
('Q51x42I0P29o15', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 1),
('p32l2t2o30w0', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 1),
('O8p3p19w66w16', '1F4B6612125FB3A0DAECD2799DFD6C9C299424FD920F9B308110A2C1FBD8F443', 799000, 1),
('d21i0I38J52t24', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 1),
('e7Q12F14G39L20', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 2),
('Z4K70b22X3X1', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 3),
('i41E32C76F9x17', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 1),
('i68Y60l80h14C50', 'E629FA6598D732768F7C726B4B621285F9C3B85303900AA912017DB7617D8BDB', 329000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productincart`
--

CREATE TABLE `productincart` (
  `idcart` int NOT NULL,
  `idproduct` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productinfo`
--

CREATE TABLE `productinfo` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `totalbought` int NOT NULL DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '1',
  `rate` float NOT NULL DEFAULT '-1',
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `category` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productinfo`
--

INSERT INTO `productinfo` (`id`, `totalbought`, `state`, `rate`, `name`, `description`, `category`) VALUES
('1', 5, 1, -1, 'Áo Tank Top thể thao nam Active V1', 'Chất liệu 100% Recycle Polyester, theo xu hướng thời trang bền vững\r\nCông nghệ ứng dụng: Wicking (thoáng khí) & Quick-Dry (Nhanh khô)\r\nPhù hợp với: chơi thể thao\r\nKiểu dáng: áo tanktop khoét nách sâu, đem đến sự thoải mái trong quá trình vận động\r\nTự hào may và hoàn thiện tại nhà máy Nobland, Bình Dương  \r\nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('10', 0, 1, -1, 'Áo sơ mi nam dài tay Café-DriS khử mùi hiệu quả', 'Chất liệu: 50% S.Café + 50% Recycled PET \nPhù hợp với: đi làm, đi chơi \nKiểu dáng: Regular fit dáng suông \nNgười mẫu: 177 cm - 74 kg, mặc size XL \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('11', 0, 1, -1, 'Quần short nam thể thao ProMax-S1 thoáng khí', 'Chất liệu: 100% Poly \nXử lý hoàn thiện vải: Quick-Dry và Wicking \nPhù hợp với: chơi thể thao, mặc ở nhà \nĐộ dài quần: 7 inch \nNgười mẫu: 175 cm - 75 kg, mặc size XL \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('12', 0, 1, -1, 'Quần short nam thể thao Movement 7\" co giãn', 'Chất liệu: 100% Polyester kết hợp tính năng: Wicking (Thấm hút nhanh), 4-way Mechanical stretch (Co giãn 4 chiều) và Quick-Dry (Nhanh khô) \nVải siêu nhẹ chỉ 106 \ngsm, mang lại cảm giác mặc như không mặc\nPhù hợp với: mặc thể thao chạy nhẹ hoặc tập gym \n Vải được dệt kiểu \nDouble Weaving và nhuộm bằng công nghệ Zero Water \nDischarge (Không nước thải) theo đuổi xu hướng yếu tố \nthời trang bền vững \nĐộ dài quần: 7 inch \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('13', 0, 1, -1, '[Upto 50%] Quần shorts nam thể thao 7\" V2 (túi sau có khóa kéo)', 'Chất liệu: 43% sợi Recycle, 57% Polyester, theo xu hướng thời trang bền vững \nCông nghệ xử lý hoàn thiện vải: \nQuickdry (nhanh khô) + Wicking (thấm hút nhanh) + Stretch (Co giãn) \nPhù hợp với: vận động thể thao\nĐộ dài quần: 7 inch \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('14', 0, 1, -1, 'Quần dài Kaki Excool co giãn', 'Chất liệu: 43% Sợi Sorona + 57% Polyester co giãn \nCông nghệ Excool: Co giãn 4 chiều, Nhẹ, Thoáng khí, Chống tia UV SPF50+ \nPhù hợp với: đi làm, đi chơi \nKiểu dáng hơi ôm một chút \nNgười mẫu: 175 cm - 69 kg, mặc quần size XL \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('15', 0, 1, -1, 'Quần Jogger nam túi hộp Cargo Outdoor', 'Chất liệu 100% Polyester \nXử lý hoàn thiện vải: Quick-Dry + Wicking + Stretch \nThoái mái vận động, nhẹ nhàng, không lo bí bách khó chịu\nTúi hộp to bên thân quần\nPhần gấu bo chun ôm vừa phải cổ chân, tạo dáng khỏe khoắn năng động cho người mặc\nTự hào sản xuất tại Việt Nam \nNgười mẫu: 186 cm - 72 kg, mặc quần size XL', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('16', 0, 1, -1, 'Coolmate x Copper Denim | Quần Jeans dáng Slim Fit', 'Chất liệu: 12 Oz / 99% Cotton - 1% Spandex \nDáng Slimfit: Dáng ôm tôn dáng, giúp bạn \"hack\" đôi chân dài và gọn đẹp \nTính chất: Không còn rút và hạn chế ra màu sau khi giặt. \nCảm giác khi chạm mịn màng \nLưu ý:Sản phẩm vẫn sẽ bạc màu sau một thời gian dài sử dụng theo tính chất tự nhiên \nNgười mẫu: 175 cm - 69 kg, mặc áo XL, quần size 32 \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('17', 0, 1, -1, 'Quần Jeans Skinny Fit', 'Chất liệu 98% Cotton+ 2% Spandex, tạo sự co giãn đem đến sự thoải mái khi vận động \nKiểu dáng Skinny, ôm từ phần hông dọc xuống chân khiến các chàng như cao hơn \nKết cấu mịn để có lớp ngoài hơi bóng, trang nhã \nChất liệu vải siêu co giãn cho cảm giác vừa vặn, thoải mái và không gò bó \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('18', 0, 1, -1, 'Quần nỉ nam Jogger Casual co giãn\r\n', 'Chất liệu 60% Polyester + 35% Cotton + 5% Spandex, co giãn tốt \nPhù hợp với: các hoạt động hàng ngày mùa đông \nKiểu dáng: regularfit dáng xuông, bo gấu \nSản xuất tại xưởng 8 năm kinh nghiệm tại TP Hồ Chí Minh  \nNgười mẫu: 1m75, 69kg * Mặc áo XL, quần L \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('19', 0, 1, -1, 'Quần Jeans Basic Slimfit', 'Quần màu Xanh: 78% Cotton+ 10% Polyester + 11% Rayon + 1% Spandex \n10% Polyester và 11% Rayon đảm bảo tính mềm tay \n1% Spandex để có sự co giãn \nQuần màu Đen: 98% Cotton+ 2% Spandex \nKiểu dáng Slimfit, không bo ống \nTự hào sản xuất tại Việt Nam \nNgười mẫu: 175 cm - 69 kg, mặc áo XL, quần size 32', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('2', 1, 1, -1, 'Áo Tank Top chạy bộ nam Fast & Free Run', 'Chất liệu: 95% Polyester + 5% Spandex\r\nXử lý hoàn thiện vải: Quick-Dry + Wicking + Stretch\r\nCông nghệ Chafe-Free hạn chế tối đa ma sát trong quá trình vận động từ các đường may may Seamless\r\nĐịnh lượng vải 100gsm siêu nhẹ\r\nĐược phát triển và kiểm nghiệm bởi các VĐV Marathon\r\nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('20', 0, 1, -1, 'Quần Jeans Clean Denim dáng Slimfit S3', 'Chất liệu: 98% Regenerative Cotton (Cotton Tái sinh) + 2% Spandex, tạo sự co giãn đem đến sự thoải mái khi vận động \nĐịnh lượng vải: 13.7 Oz \nCông nghệ ứng dụng: nhuộm KHÔNG sử dụng Sufur (lưu huỳnh) và KHÔNG có nước thải ra môi trường \nCông nghệ nhuộm Rope Dyeing mang lại độ bền màu cao hơn cho vải \nKiểu dáng : slimfit, không bo ống phù hợp mặc đa chức năng \nPhù hợp với: đi làm, đi chơi \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('21', 0, 1, -1, 'Áo Thun Vải Slub Jersey Dáng Ngắn Ngắn Tay', '- Chất liệu vải cotton-jersey với kết cấu thô, mịn. *Xin lưu ý rằng màu sắc tươi sáng hơi nhạt. \n- Một chiếc áo phông cắt xén với phom dáng thoải mái. \n- Gân cổ. \n- Vải thô nhẹ.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('22', 0, 1, -1, 'Áo Thun Gân Dáng Ngắn Kẻ Sọc Ngắn Tay Xếp Ly', '- Chất liệu cotton gân co giãn cho dáng người vừa vặn.\n- Cổ tròn.\n- Áo dáng nắng và vừa vặn.\n- Tay áo xếp nếp.\n- Họa tiết kẻ sọc mát mẻ.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('23', 0, 1, -1, 'Warhol Đầm Hai Dây Họa Tiết Hoa Xếp Nếp', 'Bộ sưu tập hoa của Andy Warhol \nNhiều tác phẩm của Warhol được lấy cảm hứng từ những đồ vật mà ông quan tâm. \nVào những năm 1950, Warhol, một họa sĩ minh họa quảng cáo, đã vẽ rất nhiều tác phẩm sử dụng hoa làm họa tiết, và vào những năm 1960, Series Hoa đặc trưng của ông đã ra đời. Dựa trên việc anh ấy theo đuổi nhiều cách thể hiện hoa lá, bộ sưu tập này là thiết kế ban đầu của UNIQLO dựa trên nghệ thuật của anh ấy.\nAndy Warhol \nLà nghệ sĩ người Mỹ ưu tú của thế kỷ 20, Andy Warhol đã thách thức thế giới nhìn nhận nghệ thuật theo một cách khác. Sản phẩm này được sản xuất theo giấy phép của The Andy Warhol Foundation for the Visual Arts, Inc., một công ty phi lợi nhuận ở New York nhằm quảng bá nghệ thuật thị giác.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('24', 0, 1, -1, 'Áo Parka Chống UV Bỏ Túi (Chống Nắng)', '- Áo chống thấm nước bền bỉ. *Vải được phủ một chất chống thấm nước nên hiệu quả kéo dài lâu hơn. Nhưng không phải là vĩnh viễn. \n- Cập nhật với kiểu dáng rộng rãi, thoải mái. \n- Thiết kế tay áo rộng tạo nên chiếc áo khoác ngoài tuyệt vời. \n- Thiết kế dài ngang hông kết hợp tốt với bất kỳ loại quần nào.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('25', 0, 1, -1, 'AirSense Áo Khoác (Siêu Nhẹ)', '- Cập nhật với công nghệ chống UV. \n- Nhẹ và chống nhăn. \n- Thêm vào độ co giãn cho chuyển động dễ dàng. \n- Với công nghệ DRY. \n- Cập nhật cho một kiểu dáng nhỏ gọn, bóng bẩy quanh vai. \n- Chiếc áo khoác nhẹ này mặc lên như một chiếc áo len. \n- Kiểu dáng đẹp mắt làm cho nó phù hợp với trang phục công sở.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('26', 0, 1, -1, 'Chân Váy Mini Xếp Ly', 'Sự đầu tư của UNIQLO vào thiết kế, độ vừa vặn, chất liệu vải và chức năng được kết hợp với sự tập trung của JW Anderson vào trang phục truyền thống của Anh để tạo ra một LifeWear mới. \n- Hợp tác với JW Anderson. \n- Chân váy mini xếp ly lấy cảm hứng từ chân váy tennis cổ điển. \n- Tạo điểm nhấn bằng các chi tiết thể thao ở eo có gân và viền không đều.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('27', 0, 1, -1, 'Quần Relaco Lửng 3/4', '- Chất liệu 100% rayon mềm, nhẹ với độ rủ mềm mại. \n- Thoải mái cắt. \n- Diềm xếp nếp ở eo tạo điểm nhấn cho thiết kế. \n- Lưng thun co giãn dễ mặc. \n- Có túi bên hông tiện dụng. \n- Họa tiết hoa, lá màu sắc sặc sỡ. \n- Một lựa chọn tuyệt vời để làm quần áo ngủ, làm việc ở nhà hoặc mặc đi chơi.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('28', 0, 1, -1, 'Peanuts Bộ Đồ Siêu Co Giãn (Ngắn Tay)', 'Snoopy và Charlie Brown hóa trang thành vận động viên quần vợt đáng yêu. Logo kết cấu trông tuyệt đẹp trên thân áo mềm mại màu trắng.\nPEANUTS Loung\nBộ sưu tập đồ mặc nhà mới có các nhân vật nổi tiếng của Peanuts hiện đã có sẵn. Tác phẩm nghệ thuật, trưng bày Snoopy và Peanuts Gang, được tạo điểm nhấn bằng các biểu trưng kiểu trường đại học và thông điệp tích cực về năm mới. Chất liệu có thể co giãn thoải mái và thư giãn cùng các nhân vật Peanuts đáng yêu sẽ khiến thời gian ở nhà của bạn trở nên vui vẻ!', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('29', 0, 1, -1, 'Lisa Larson Bộ Mặc Nhà Ngắn Tay', 'Lisa Larsson \nThiết kế có những con vật hài hước được vẽ bằng nét vẽ mộc mạc được yêu thích trên toàn thế giới. Màu sắc Scandinavian nhẹ nhàng và êm dịu là lựa chọn hoàn hảo cho khoảng thời gian yên bình trong căn phòng của bạn. \nLISA LARSON \nThợ gốm / Sinh năm 1931 tại Härlunda thuộc tỉnh Småland ở phía nam Thụy Điển. Năm 1954, bà bắt đầu làm việc cho sứ Gustavsberg. Sau đó, với tư cách là nhà thiết kế ngôi sao của công ty, cô trở thành trụ cột trong thời kỳ hoàng kim của gốm sứ Thụy Điển. Năm 1980, Larson rời công ty để làm việc như một nhà thiết kế tự do. Năm 1992, cô đồng sáng lập Keramikstudio Gustavsberg. Tràn đầy sức sống, Lisa tiếp tục tạo ra những thiết kế mới cho sản xuất và những mảnh gốm độc đáo (chỉ có một lần).', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('3', 2, 1, -1, 'Áo ba lỗ Cotton 100% Coolmate Basics V2', 'Chất liệu 100% Cotton chất lượng cao, đem đến trải nghiệm thoải mái hơn\r\nVải đã chải lông kỹ, xử lý co giãn 2 chiều\r\nĐịnh lượng vải nặng hơn với áo V1, mang lại cảm giác chắc và bền dai hơn\r\nTự hào sản xuất tại Việt Nam\r\nNgười mẫu: 1m80 - 75kg, mặc 2XL', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('30', 0, 1, -1, 'Ultra Light Down Áo Khoác Siêu Nhẹ', '- Chất liệu mềm và nhẹ. \n- Lớp phủ bền, không thấm nước. \n-750+ Fill Power * theo phương pháp đo lường IDFB \n-Trọng lượng siêu nhẹ. \n-Thiết kế có thể tháo rời. Bao gồm túi đựng riêng. \n- Lớp lót chống tĩnh điện. \n- Dáng ngắn kết hợp tốt với chân váy và quần cạp cao. \n- Thiết kế dây kéo phía trước tinh tế.', 'E15BC11CBD791E21C493EE20983F344B36815094E108A608BA7D3C670C9C7C91'),
('31', 0, 1, -1, 'AIRism Áo Khoác Khóa Kéo Chống UV Vải Mắt Lưới', '- Mẫu mới được cập nhật với chất liệu vải siêu co giãn tạo cảm giác thoải mái và dễ dàng vận động.\n - Chống tia UV (UPF50+). \n- Chất vải AIRism mềm mịn với công nghệ DRY nhanh khô.\n- Tấm chắn cằm bảo vệ khuôn mặt của con bạn khỏi dây kéo.\n- Mát mẻ và thoải mái.\n- Dây kéo phía trước \n- Có họa tiết in toàn thân với sự cộng tác của Rei Nakanishi. \n- Từ một bộ sưu tập các thiết kế hiện đại, thú vị thể hiện phong cách đặc trưng của Rei Nakanishi, người đã kết hợp các họa tiết CG và các nét vẽ bằng tay. \n- Các thiết kế phù hợp có sẵn theo phong cách nam và nữ. \n- Rei Nakanishi đến Hoa Kỳ vào năm 2016 và bắt đầu sự nghiệp nghệ sĩ của mình khi làm trợ lý cho Meguru Yamaguchi ở thành phố New York. \n- Sau khi trở về Nhật Bản vào năm 2019, anh ấy đã sản xuất và phát hành bộ truyện nổi tiếng nhất của mình, \"Flower of Life\". \n- Có trụ sở tại tỉnh Shizuoka, anh tiếp tục triển lãm các tác phẩm của mình ở cả Nhật Bản và quốc tế. \n- Móc khóa kéo. \n- Vòng treo ở phía sau. \n- Nhãn tên ở phía trong bên trái.', 'E2BC67980C4238652AD5D3F9AB46599328696A6C3078E640138B9A5C870E0771'),
('4', 0, 1, -1, 'Áo thun nam Cotton Coolmate Basics 200gsm', 'Chất liệu: 100% Cotton mềm mại\r\nĐịnh lượng vải: 200gsm, dày dặn\r\nDáng áo vừa vặn, phù hợp với đi chơi, đi làm và ở nhà\r\nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('5', 0, 1, -1, 'Áo thun thể thao nam Active ProMax', 'Chất liệu: 100% Polyester, không nhăn và tạo cảm giác thoáng mát khi vận động\r\nPhù hợp với: chơi thể thao\r\nKiểu dáng: regularfit dáng suông\r\nCông nghệ xử lý hoàn thiện vải: Quick-Dry (nhanh khô) và Wicking (thấm hút nhanh)\r\nTự hào may và hoàn thiện tại nhà máy Nobland, \r\nNgười mẫu: 1m80 - 75kg, mặc 2XL', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('6', 0, 1, -1, 'Áo Polo thể thao nam ProMax-S1 Logo thoáng khí', 'Chất liệu: 100% Poly, định lượng vải 155gsm siêu nhẹ \nXử lý hoàn thiện vải: Quick-Dry và Wicking\nPhù hợp với: đi làm, đi chơi, mặc ở nhà\nKiểu dáng: Regular fit dáng suông\nNgười mẫu: 184 cm - 73 kg, mặc áo size XL \nTự hào sản xuất tại Việt Nam ', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('7', 0, 1, -1, 'Áo Polo nam Excool', 'Chất liệu: 56% Polyester PET + 44% Polyester PTT Sorona \nPhù hợp với: đi làm, đi chơi, mặc ở nhà\nSản xuất trực tiếp tại Quận 12, Hồ Chí Minh, Việt Nam \nNgười mẫu: 1m77 \n- 74kg; mặc áo size XL \nTự hào sản xuất tại Việt Nam', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('8', 0, 1, -1, 'Áo Polo nam Pique Cotton USA thấm hút (trơn)', 'Chất liệu: 97% Cotton USA + 3% Spandex, co giãn 4 chiều \nPhù hợp với: đi làm, đi chơi \nTự hào sản xuất tại Việt Nam \nNgười mẫu: 182 cm - 70kg, mặc áo size XL\r\n', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD'),
('9', 0, 1, -1, 'Áo sơ mi nam dài tay Cafe Sticky Free khử mùi', 'Chất liệu: 50% Café - 50% Recycled Poly from PET đem đến sự mềm mại và khử mùi hiệu quả \nCo giãn tự nhiên tạo cảm giác thoải mái\nVải S-Café Sticky Free có cấu trúc dệt khép giảm tiếp xúc giữa da và vải, đem lại cảm giác thoải mái \nMỏng nhẹ và thấm hút mồi hôi giúp bạn luôn khô thoáng\nNguyên liệu bền vững, thân thiện với môi trường\nTự hào sản xuất tại Việt Nam \n Người mẫu: 1m77 - 74kg * Mặc size XL', '22DD59C8A41BB6FC7C23CF9C354A606641EE04E852BBDD0398BAC848E8E92EAD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FR_bill_key` (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FR_KEY` (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`username`,`idproduct`),
  ADD KEY `idproduct` (`idproduct`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infoid` (`infoid`);

--
-- Indexes for table `productinfo`
--
ALTER TABLE `productinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`idproduct`) REFERENCES `productinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`infoid`) REFERENCES `productinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `productinfo`
--
ALTER TABLE `productinfo`
  ADD CONSTRAINT `productinfo_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

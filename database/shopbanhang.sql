-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 13, 2021 lúc 04:25 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Sản Phẩm', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'Đồ chơi trẻ em', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Đồ chơi điện tử', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'Đồ chơi thể thao', '', 1, 3, '2017-04-22 05:37:50'),
(10, 'Đồ chơi gỗ', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'Đồ chơi trẻ sơ sinh', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'Đồ chơi mô hình', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'Đồ chơi giáo dục', '', 7, 4, '2017-04-22 09:09:14'),
(14, 'Đồ chơi điều khiển', '', 7, 5, '2017-04-22 09:09:31'),
(15, 'Playstation', '', 8, 1, '2017-04-22 09:09:46'),
(16, 'Thiết bị thông minh', '', 8, 2, '2017-04-22 09:10:10'),
(17, 'Máy chơi game', '', 8, 3, '2017-04-22 09:23:39'),
(18, 'Phụ Kiện', '', 8, 4, '2017-04-22 09:23:57'),
(19, 'Đồ chơi vận động', '', 9, 1, '2017-04-22 09:25:55'),
(20, 'Thiết bị thể chất', '', 9, 2, '2017-04-22 09:26:21'),
(21, 'Dụng cụ', '', 9, 4, '2017-04-22 09:26:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(18, 15, 28, 1, '169000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0),
(14, 11, 25, 1, '300000.00', 0),
(15, 12, 28, 1, '169000.00', 0),
(17, 14, 24, 1, '830000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 16, 'Apple Watch S5', '<p>Apple Watch S5 44 mm l&agrave; phi&ecirc;n bản n&acirc;ng cấp nhẹ so với phi&ecirc;n bản Apple Watch S4 tiền nhiệm. Lần đầu ti&ecirc;n Apple Watch sẽ được trang bị m&agrave;n h&igrave;nh OLED lu&ocirc;n bật, t&iacute;nh năng la b&agrave;n v&agrave; khả năng cảnh b&aacute;o khẩn cấp tr&ecirc;n nhiều quốc gia hơn.</p>\r\n', '9979000.00', 20000, 'apple-watch-s5-44mm-vien-nhom-day-cao-su-10-600x600.jpg', '[\"apple-watch-s5-44mm-vien-nhom-day-cao-su-10-600x600.jpg\"]', 24, 1, 14, 3, 1493983674),
(2, 16, 'Đồng hồ định vị trẻ em Kidcare 08S', '<p>Đồng hồ th&ocirc;ng minh trẻ em Kidcare 08S c&oacute; thiết kế m&agrave;n h&igrave;nh 1.3 Inch, độ ph&acirc;n giải 240 x 240 Pixels c&ugrave;ng với d&acirc;y đeo l&agrave;m từ silicone mang đến cảm gi&aacute;c &ecirc;m &aacute;i khi đeo. T&iacute;nh năng nổi trội ở mẫu đồng hồ n&agrave;y l&agrave; khả năng định vị chuẩn x&aacute;c, cảnh b&aacute;o v&ugrave;ng nguy hiểm v&agrave; gọi điện khẩn cấp, gi&uacute;p phụ huynh của b&eacute; c&oacute; thể y&ecirc;n t&acirc;m theo d&otilde;i b&eacute; từ xa.</p>\r\n', '1255000.00', 51000, 'kidcare-08s-ava-600x600.jpg', '[\"kidcare-08s-ava-600x600.jpg\"]', 2, 1, 4, 1, 1493983674),
(3, 16, 'Oppo Watch 41mm', '<h2>Đồng hồ th&ocirc;ng minh Oppo Watch m&agrave;u&nbsp;hồng&nbsp;phi&ecirc;n&nbsp;bản&nbsp;41mm trang bị m&agrave;n h&igrave;nh&nbsp;AMOLED&nbsp;1.6 inch c&ugrave;ng độ ph&acirc;n giải l&agrave; 320 x 360 pixels, mật độ điểm ảnh 326ppi cho chất lượng hiển thị cực k&igrave; sắc n&eacute;t.&nbsp;D&acirc;y đeo&nbsp;l&agrave;m từ silicon với thiết kế mang lại cảm gi&aacute;c v&ocirc; c&ugrave;ng mềm mại, kh&ocirc;ng bị đau khi đeo l&acirc;u.&nbsp;</h2>\r\n', '5300000.00', 150000, 'PS3-games-list-800x8001.jpg', '[\"PS3-games-list-800x8002.jpg\"]', 43, 4, 11, 3, 1493983674),
(4, 18, ' Tay cầm chơi game', '<p>&nbsp;</p>\r\n\r\n<p>Tay cầm chơi game Flydigi Wee 2 cho IOS,Androi trực tiếp</p>\r\n', '1280000.00', 80000, '61fevtyxetl__sl1088__large.jpg', '[\"61fevtyxetl__sl1088__large.jpg\"]', 16, 7, 18, 4, 1493983674),
(12, 17, ' Aturos XYC Q8', '<p>M&aacute;y chơi game 4 n&uacute;t mini cầm tay với hơn 506 game cổ điển Aturos XYC Q8 (m&agrave;u đen)</p>\r\n', '920000.00', 60000, 'cxy-q8-gia-re_482ec49081de4470b402a3d009e686ae_large.jpg', '[\"cxy-q8-gia-re_482ec49081de4470b402a3d009e686ae_large.jpg\"]', 27, 3, 9, 2, 0),
(13, 17, 'PowKiddy X18 Android', '<p>M&aacute;y chơi game cầm tay t&iacute;ch hợp m&aacute;y nghe nhạc PowKiddy X18 Android</p>\r\n', '3200000.00', 0, 'powkiddy_x18_e2882a5a85ab48c9a16fba57b13324c5_medium.jpg', '[\"powkiddy_x18_e2882a5a85ab48c9a16fba57b13324c5_medium.jpg\"]', 5, 1, 4, 1, 1493983674),
(6, 18, 'Nút bắn chơi game PUBG, Liên quân Flydigi Stinger', '<p>N&uacute;t bắn chơi game PUBG, Li&ecirc;n qu&acirc;n Flydigi Stinger</p>\r\n', '300000.00', 100000, 'o1cn019xk0kb1zdwbfnnhfp___2936966681_large.png', '[\"o1cn019xk0kb1zdwbfnnhfp___2936966681_large.png\"]', 2, 1, 4, 1, 1493983674),
(7, 17, 'Android Powkiddy X15', '<p>M&aacute;y chơi game cầm tay Android Powkiddy X15 ( M&agrave;n h&igrave;nh 5.5 inches, RAM 2GB, ROM 32GB)</p>\r\n', '4450000.00', 100000, 'powkiddy_x18_e2882a5a85ab48c9a16fba57b13324c5_medium1.jpg', '[\"powkiddy_x18_e2882a5a85ab48c9a16fba57b13324c5_medium2.jpg\"]', 20, 6, 13, 3, 1493983674),
(9, 15, 'PS3', '<p><em>Playstation 3 l&agrave; một trong c&aacute;c hệ m&aacute;y video game mới nhất, l&agrave; một phần thuộc thế hệ thứ 7, c&ugrave;ng thời điểm với Xbox360 v&agrave; Wii. PS 3 gồm 2 loại: Basic v&agrave; Prenium. Bản basic bao gồm ổ cứng 20 GB c&oacute; thể mở rộng, tay cầm bluetooth, ổ blue-ray, cổng HDMI, v&agrave; c&aacute;p quang. Prenium th&igrave; c&oacute; ổ cứng 60 GB, t&iacute;ch hợp Wi-Fi, đầu đọc thẻ nhớ. Hiện nay, phi&ecirc;n bản 60 GB của PS 3 đ&atilde; giảm gi&aacute; v&agrave; ngưng sản xuấ. Thay v&agrave;o đ&oacute;, l&agrave; ổ 80 GB v&agrave; c&oacute; khả năng tương th&iacute;ch ngược. Ngo&agrave;i ra, Sony cũng c&oacute; cho ra phi&ecirc;n bản 40 GB nhưng kh&ocirc;ng c&oacute; khả năng tương th&iacute;ch ngược.</em></p>\r\n', '4180000.00', 100000, 'ps3-800x800.jpg', '[\"PS3-games-list-800x800.jpg\"]', 2, 1, 4, 1, 1493983674),
(11, 15, 'PS4', '<p><strong>PlayStation 4 Slim - m&aacute;y chơi game tốt</strong></p>\r\n\r\n<p>Chiếc m&aacute;y PlayStation 4 mở ra một c&aacute;nh cửa cho việc giải tr&iacute; v&agrave; trải nghiệm những c&ocirc;ng nghệ tuyệt đỉnh, những chiều s&acirc;u trong việc giao tiếp tr&ecirc;n mạng d&agrave;nh cho game thủ. Với hơn 180 games đẳng cấp đang được ph&aacute;t triển. PS4 tập trung v&agrave;o những điều tuyệt vời, những tựa game bom tấn v&agrave; những s&aacute;ng tạo nổi bật từ cảm hứng của c&aacute;c nh&agrave; ph&aacute;t triển - Gamer Focus</p>\r\n', '8000000.00', 10000, 'ps4-slim-cyberpunk-2077-combo-00-700x700.jpg', '[\"ps4-slim-46-700x700.jpg\"]', 36, 3, 5, 1, 1493983674),
(10, 15, 'PS5', '<p>Chi tiết CPU.AMD Zen 2 8 nh&acirc;n 16 luồng, xung nhịp 3.5GHz GPU:Kiến tr&uacute;c RDNA 2 của AMD, sức mạnh 10.28 TFLOPS, tốc độ 2.23GHz, hỗ trợ ray-tracing RAM:GDDR5 16GB Bộ nhớ trong 825GB SSD tốc độ đạt 5,5 GB/s T&iacute;nh năng mới Hỗ trợ ray-tracing, hỗ trợ chơi game 8K 120Hz, &acirc;m thanh v&ograve;m 3D audio, tương th&iacute;ch ngược với game PS4 Sản Phẩm Playstation 5 Sony ra mắt với 2 phi&ecirc;n bản : phi&ecirc;n bản digital v&agrave; phi&ecirc;n bản vừa digital k&egrave;m ổ đĩa</p>\r\n', '21129000.00', 0, 'ps5-standard-bh-12th-00-700x700.jpg', '[\"ps5-40-700x700.jpg\"]', 9, 2, 4, 1, 1493983674),
(14, 17, 'Laptop bỏ túi', '<p>Laptop bỏ t&uacute;i,m&aacute;y t&iacute;nh bảng tablet windows, Mini PC ,GPD Micro (Chip 4 nh&acirc;n, DDR 4 8G, SSD M2 128G) - Black</p>\r\n', '8200000.00', 50000, '2019-08-03_160037_b2b36a42d54f43ddbedca05db0d62c1b_large.jpg', '[\"2019-08-03_160037_b2b36a42d54f43ddbedca05db0d62c1b_large.jpg\"]', 3, 2, 4, 1, 1493983674),
(15, 17, 'Máy chơi game 4 ', '<p>M&aacute;y chơi game 4 n&uacute;t Aturos U8 t&iacute;ch hợp 800 game cổ điển, hỗ trợ ch&eacute;p game b&ecirc;n ngo&agrave;i, hỗ trợ 4K, chơi game Arcade (NES, GBA, FPS, SFC, PS1...), 2 tay cầm kh&ocirc;ng d&acirc;y</p>\r\n', '1350000.00', 180000, 'aturos-u8-bo-choi-game_a534684433a5498f95dabaca153412bc_large.jpg', '[\"aturos-u8-bo-choi-game_a534684433a5498f95dabaca153412bc_large.jpg\"]', 5, 1, 4, 1, 1493983674),
(16, 19, 'Ván trượt 9 lớp', '<p>&nbsp;</p>\r\n\r\n<p>- Thương Hiệu: BBT Global</p>\r\n\r\n<p>- H&atilde;ng SX: Cougar</p>\r\n\r\n<p>- K&iacute;ch thước: 79*20cm</p>\r\n\r\n<p>- V&aacute;n trượt c&oacute; 4 b&aacute;nh ph&aacute;t s&aacute;ng</p>\r\n\r\n<p>- Chất liệu: V&aacute;n trượt 9 lớp gỗ chống nước cực tốt, mặt tr&ecirc;n c&oacute; lớp nh&aacute;m gi&uacute;p b&aacute;m trượt tốt hơn. Mặt dưới c&oacute; nhiều h&igrave;nh ảnh cho c&aacute;c bạn thoải m&aacute;i lựa chọn thể hiện c&aacute; t&iacute;nh của m&igrave;nh, v&ograve;ng bi ABEC 7 carbon, trục l&agrave;m bằng th&eacute;p si&ecirc;u bền, b&aacute;nh xe l&agrave;m bằng nhựa PU.</p>\r\n\r\n<p>- Tải trọng: 60kg</p>\r\n\r\n<p>- Tuổi sử dụng: người lớn v&agrave; trẻ em tr&ecirc;n 8 tuổi</p>\r\n\r\n<p>- V&aacute;n trượt skateboard được nhập khẩu v&agrave; ph&acirc;n phối ch&iacute;nh h&atilde;ng bởi C&ocirc;ng ty BBT Việt Nam- Số 1 về đồ</p>\r\n', '980000.00', 0, 'mh3108gs-van-truot-skateboard-co-banh-phat-sang-medium1.jpg', '[\"mh3108gs-van-truot-skateboard-co-banh-phat-sang-medium.jpg\"]', 5, 3, 13, 3, 1493983674),
(17, 19, 'Giầy trượt patin', '<p>✪ H&atilde;ng SX: COUGAR</p>\r\n\r\n<p>✪ M&agrave;u sắc: đỏ đen, ghi x&aacute;m, xanh đen</p>\r\n\r\n<p>✪ Đủ Size: M (37-40), L (41-44)</p>\r\n\r\n<p>✪ TCCL: CE (h&agrave;ng xuất Ch&acirc;u &Acirc;u)</p>\r\n\r\n<p>✪ V&ograve;ng bi ABEC 7 Chrome gi&uacute;p trượt nhanh v&agrave; si&ecirc;u bền, đồng thời phanh cũng được thiết kế tốt hơn c&aacute;c d&ograve;ng patin c&ugrave;ng loại.</p>\r\n\r\n<p>✪ Chất liệu da PVC mềm, c&oacute; phần bảo vệ cứng bao ngo&agrave;i. Khung xương b&aacute;nh xe l&agrave;m bằng nh&ocirc;m hợp kim chắc chắn, nhẹ, bền, kh&ocirc;ng gỉ; b&aacute;nh xe bằng PU bền, chịu đựng va đập tốt</p>\r\n\r\n<p>✪ Bảo h&agrave;nh: 24 th&aacute;ng với khung v&agrave; v&ograve;ng bi</p>\r\n', '900000.00', 50000, 'mzs308n-giay-truot-patin-cho-be-medium.jpg', '[\"mzs308n-giay-truot-patin-cho-be-medium.jpg\"]', 37, 1, 14, 4, 1493983674),
(18, 20, 'Bộ tập chân KAB001', '<p>✪ H&atilde;ng SX: BBT Global</p>\r\n\r\n<p>✪ Gi&aacute; chưa bao gồm VAT</p>\r\n\r\n<p>✪ Độ tuổi th&iacute;ch hợp: cho b&eacute; từ 3-9 tuổi</p>\r\n\r\n<p>✪ Tải trọng: 25kg</p>\r\n\r\n<p>​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​✪ Chất liệu: Với khung sắt phun sơn tĩnh điện ( kh&ocirc;ng gỉ s&eacute;t), kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng độc hại chống han n&ecirc;n m&agrave;u sắc v&agrave; sản phẩm bền đẹp theo thời gian d&ugrave; để ngo&agrave;i trời. Sản phẩm c&oacute; chứng nhận Tổng cục TCCL Việt Nam, được nhập khẩu v&agrave; ph&acirc;n phối bởi cty BBT Việt Nam</p>\r\n', '1900000.00', 0, 'thiet-bi-tap-the-duc-tre-em-kab001-medium.jpg', '[\"js005-thiet-bi-the-duc-cho-tre-em-1-medium1.jpg\"]', 2, 1, 5, 1, 0),
(19, 21, 'Bể bơi phao Salon', '<p>✪ H&atilde;ng sản xuất: Intex</p>\r\n\r\n<p>✪ K&iacute;ch thước: &plusmn;229*229*66(cm) (xấp xỉ). Trọng lượng hộp 6.65 kg</p>\r\n\r\n<p>✪ Phụ kiện: Miếng v&aacute; chuy&ecirc;n dụng.</p>\r\n', '1390000.00', 50000, 'intex-57165-be-boi-phao-cau-truot-intex-2-1-medium1.jpg', '[\"intex-57165-be-boi-phao-cau-truot-intex-2-1-medium.jpg\"]', 2, 1, 4, 1, 1493983674),
(20, 21, 'Bộ bảo vệ tay chân 6 món  Cougar MH660', '<p>- H&atilde;ng sản xuất: Cougar</p>\r\n\r\n<p>- Size: M, L</p>\r\n\r\n<p>- M&agrave;u sắc: đỏ đen, xanh, hồng</p>\r\n\r\n<p>- Bộ sản phẩm bảo vệ 6 m&oacute;n cho b&eacute; bao gồm: 2 b&agrave;n tay, 2 khuỷu tay, 2 đầu gối</p>\r\n\r\n<p>- Hướng dẫn c&aacute;ch đeo bộ bảo vệ đ&uacute;ng chuẩn chi tiết ph&iacute;a dưới</p>\r\n', '380000.00', 90000, 'mh660-bo-bao-ve-tay-chan-cho-be-chinh-hang-cougar-medium.jpg', '[\"mh660-bo-bao-ve-tay-chan-cho-be-chinh-hang-cougar-medium.jpg\"]', 32, 1, 4, 1, 1493983674),
(21, 21, 'Túi đựng giày patin Cougar cao cấp MD003', '<p>✪ T&ecirc;n sản phẩm: T&uacute;i đựng gi&agrave;y patin MD003</p>\r\n\r\n<p>✪ H&atilde;ng sản xuất: Cougar</p>\r\n\r\n<p>✪ Gi&agrave;y patin của bạn sẽ được bảo quản tuyệt đối trong t&uacute;i dựng gi&agrave;y cougar, bạn sẽ mang đi mang lại dễ d&agrave;ng.</p>\r\n\r\n<p>✪ Size S-M gi&aacute; 150,000đ, Size L-XL gi&aacute; 180,000đ</p>\r\n', '180000.00', 35000, 'md003-tui-dung-giay-truot-patin-cho-be-medium.jpg', '[\"md003-tui-dung-giay-truot-patin-cho-be-medium.jpg\"]', 0, 1, 4, 1, 1493983674),
(22, 21, 'Mũ bảo hiểm chĩnh hãng Cougar MT867', '<p>✪ H&atilde;ng SX: Cougar</p>\r\n\r\n<p>✪ Size: M, L</p>\r\n\r\n<p>✪ M&agrave;u sắc: xanh dương, đỏ</p>\r\n\r\n<p>✪ TCCL: CE (h&agrave;ng xuất ch&acirc;u &Acirc;u)</p>\r\n\r\n<p>✪ Mũ bảo hiểm được l&agrave;m bằng chất liệu xốp nhẹ, an to&agrave;n v&agrave; rất chắc chắn, c&oacute; 6 lỗ tho&aacute;ng kh&iacute; gi&uacute;p b&eacute; thoải m&aacute;i, tho&aacute;ng m&aacute;t đầu khi tập</p>\r\n', '400000.00', 100000, 'mt867-mu-bao-hiem-truot-patin-2-medium.jpg', '[\"mt867-mu-bao-hiem-truot-patin-2-medium.jpg\"]', 0, 1, 4, 1, 1493983674),
(23, 21, 'Bộ bảo hiểm chân tay Patin Cougar MH630', '<p>✪ H&atilde;ng SX: Cougar</p>\r\n\r\n<p>✪ Mầu sắc: Đỏ đen, Xanh dương v&agrave; Hồng</p>\r\n\r\n<p>✪ K&iacute;ch thước: C&oacute; size S,M,L ph&ugrave; hợp với cỡ giầy b&eacute; đi</p>\r\n\r\n<p>✪ TCCL: CE (h&agrave;ng xuất ch&acirc;u &Acirc;u)</p>\r\n\r\n<p>✪ Bộ bảo hiểm ch&acirc;n tay gồm c&oacute; 1 bảo hiểm đầu gối, 1 bảo hiểm l&ograve;ng b&agrave;n tay, 1 bảo hiểm khuỷu tay, bảo hiểm gồm 2 lớp bảo vệ an to&agrave;n, d&acirc;y bảo hiểm mềm v&agrave; chắc chắn tạo cảm gi&aacute;c thoải m&aacute;i</p>\r\n', '450000.00', 80000, 'mh630-0-medium.jpg', '[\"mh630-0-medium.jpg\"]', 20, 7, 22, 5, 1493983674),
(24, 11, 'Thảm nằm chơi đàn piano ', '<p>Nếu bạn đang t&igrave;m kiếm một tấm thảm chơi cho b&eacute; c&oacute; ph&aacute;t ra &acirc;m thanh th&igrave;&nbsp;Thảm nằm chơi đ&agrave;n piano đại đương Winfun 860-NL ch&iacute;nh l&agrave; sự lựa chọn h&agrave;ng đầu cho bạn. Sản phẩm c&oacute; đ&iacute;nh k&egrave;m bộ chơi đ&agrave;n piano, b&eacute; c&oacute; thể vừa nằm chơi bằng tay hoặc c&oacute; thể d&ugrave;ng ch&acirc;n để đạp l&ecirc;n b&agrave;n ph&iacute;m piano, khi đ&oacute; chiếc đ&agrave;n sẽ ph&aacute;t ra những &acirc;m thanh quen thuộc kh&ocirc;ng kh&aacute;c g&igrave; chiếc piano trong thực tế</p>\r\n', '830000.00', 0, 'tham-nam-choi-dan-piano-dai-duong-winfun-860-nl-2.jpg', '[\"tham-nam-choi-dan-piano-dai-duong-winfun-860-nl-2.jpg\"]', 38, 1, 9, 2, 1493983674),
(25, 11, 'Võng đưa có nhạc ', '<ul>\r\n	<li><strong>V&otilde;ng đưa brevi miou c&oacute; nhạc BRE559</strong>&nbsp;sẽ l&agrave;m b&eacute; th&iacute;ch th&uacute; v&agrave; tăng tr&iacute; tưởng tượng với nhiều h&igrave;nh th&ugrave; ngộ nghĩnh treo tr&ecirc;n v&otilde;ng.<strong>&nbsp;Brevi Miou</strong>&nbsp;sẽ mang đến cho gia đ&igrave;nh bạn 1 sản phẩm tiện &iacute;ch v&agrave; tối ưu h&oacute;a khả năng sử dụng. Bạn c&oacute; thể điều chỉnh tốc độ đung đưa, chỉnh thời gian v&agrave; đổi c&aacute;c bản nhạc kh&aacute;c nhau để tăng th&ecirc;m phần hứng th&uacute; cho b&eacute; khi ngồi ăn hoặc ngồi chơi thư gi&atilde;n. Ngo&agrave;i ra, v&otilde;ng c&oacute; thể gấp gọn lại v&agrave; cất đi khi kh&ocirc;ng cần sử dụng nữa, gi&uacute;p bạn tiết kiệm kh&ocirc;ng gian trong nh&agrave;.</li>\r\n</ul>\r\n', '4450000.00', 1150000, 'vong-dua-co-nhac-brevi-miou-bre559-1.jpg', '[\"vong-dua-co-nhac-brevi-miou-bre559-1.jpg\"]', 3, 1, 9, 2, 1493983674),
(26, 14, 'Đồ chơi robot', '<p><strong>Robot lắp gh&eacute;p chiến binh Laval VBC-7001R</strong>&nbsp;gồm c&aacute;c chi tiết được l&agrave;m từ nhựa nguy&ecirc;n sinh với thiết kế m&ocirc; phỏng sống động, b&eacute; c&oacute; thể tự tay lắp r&aacute;p th&agrave;nh robot theo hướng dẫn hoặc tự kh&aacute;m ph&aacute;. Hơn nữa, việc lắp r&aacute;p robot c&ograve;n gi&uacute;p b&eacute; ph&aacute;t triển tr&iacute; tuệ, tư duy, sự kh&eacute;o k&eacute;o của đ&ocirc;i tay.</p>\r\n', '665000.00', 0, 'do-choi-robot-lap-ghep-chien-binh-chi-iron-hero-vbc-8005r-2.jpg', '[\"do-choi-robot-lap-ghep-chien-binh-chi-iron-hero-vbc-8005r-21.jpg\"]', 6, 1, 9, 2, 1493983674),
(27, 14, 'Xe đua F1 ', '<p><strong>Xe đua F1 điều khiển từ xa, c&oacute; đ&egrave;n Led v&agrave; pin sạc Duka DK81037</strong>&nbsp;được thiết kế rất tinh t&ecirc; v&agrave; hấp dẫn, xe với 4 chức năng: Tiến - l&ugrave;i - rẽ tr&aacute;i - rẽ phải, đ&egrave;n led xinh động, c&aacute;c b&eacute; sẽ nhanh ch&oacute;ng nhập vai v&agrave; thể hiện khả năng, bản lĩnh của một tay đua đ&iacute;ch thực. Xe c&ograve;n gi&uacute;p b&eacute; tăng cường tr&iacute; th&ocirc;ng minh v&agrave; n&acirc;ng cao chỉ số cảm s&uacute;c EQ.</p>\r\n', '500000.00', 40000, 'xe-dua-f1-dieu-khien-tu-xa-co-den-led-va-pin-sac-duka-dk81035-3.jpg', '[\"xe-dua-f1-dieu-khien-tu-xa-co-den-led-va-pin-sac-duka-dk81035-3.jpg\"]', 3, 1, 4, 1, 1493983674),
(28, 13, 'Vui học Toán', '<p><strong>Vui học To&aacute;n c&ugrave;ng thẻ đồ chơi Duka DK81015</strong>&nbsp;c&ugrave;ng thẻ minh họa để b&eacute; học c&aacute;c ph&eacute;p to&aacute;n đơn giản v&agrave; dễ hiểu. Sản phẩm gồm 60 thẻ học c&ugrave;ng 120 nội dung b&aacute;m s&aacute;t chương tr&igrave;nh của bộ gi&aacute;o dục d&agrave;nh cho b&eacute; từ 3 tuổi trở l&ecirc;n.&nbsp;</p>\r\n', '169000.00', 0, 'vui-hoc-toan-cung-the-do-choi-dk81015-1.jpg', '[\"vui-hoc-toan-cung-the-do-choi-dk81015-1.jpg\"]', 18, 1, 18, 4, 1493983674),
(29, 13, 'Vui học Tiếng Việt', '<p><strong>Vui học Tiếng Việt c&ugrave;ng thẻ đồ chơi Duka DK81013</strong>&nbsp;với thiết kế vừa chơi vừa học th&uacute; vị, b&eacute; sẽ nhận diện được c&aacute;c mặt chữ c&aacute;i cũng như c&aacute;ch gh&eacute;p vần th&ocirc;ng qua c&aacute;c thẻ học. Sản phẩm gồm 60 thẻ học c&ugrave;ng 120 nội dung b&aacute;m s&aacute;t chương tr&igrave;nh của bộ gi&aacute;o dục d&agrave;nh cho b&eacute; từ 3 tuổi trở l&ecirc;n.&nbsp;</p>\r\n', '300000.00', 120000, 'vui-hoc-tieng-viet-cung-the-do-choi-dk81013-3.jpg', '[\"vui-hoc-tieng-viet-cung-the-do-choi-dk81013-3.jpg\"]', 24, 1, 4, 1, 1493983674);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'sl1.jpg', 'http://localhost/webshop/', 1, '2017-04-25 15:24:43'),
(4, '2', 'sl12.jpg', 'http://localhost/webshop/', 2, '2017-04-25 15:36:41'),
(5, '3', 'sl11.jpg', 'http://localhost/webshop/', 3, '2017-04-25 15:37:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 25, 2022 lúc 02:52 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my_pham_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `CART_DETAIL_ID` int(11) NOT NULL,
  `CART_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart_detail`
--

INSERT INTO `cart_detail` (`CART_DETAIL_ID`, `CART_ID`, `PRODUCT_ID`, `QUANTITY`) VALUES
(69, 1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CATEGORY_ID` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CATEGORY_ID`, `CATEGORY_NAME`) VALUES
(1, 'Trang điểm'),
(2, 'Chăm sóc da'),
(3, 'Chăm sóc cơ thể'),
(4, 'Chăm sóc tóc'),
(5, 'Chăm sóc sức khỏe'),
(6, 'Phụ kiện'),
(7, 'Dành cho nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `ORDER_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PROMOTION_ID` int(11) DEFAULT NULL,
  `NOTE` varchar(2000) DEFAULT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `RECEIVER_NAME` varchar(50) DEFAULT NULL,
  `RECEIVER_PHONE` varchar(15) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`ORDER_ID`, `USER_ID`, `ADDRESS`, `PROMOTION_ID`, `NOTE`, `ORDER_DATE`, `RECEIVER_NAME`, `RECEIVER_PHONE`, `TOTAL`, `STATUS`) VALUES
(9, 1, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nộifwf', NULL, 'wegwerghwegweaszvsherh', '2022-11-27 16:13:59', 'Nguyễn Trung Anh', '0123456789', 304000, b'1'),
(10, 1, ' Ha Noi', NULL, 'hthrttrjrjrtjtr', '2022-11-27 16:17:03', 'Nguyễn Trung Anh', '0123456789', 304000, b'1'),
(11, 1, 'ggg', NULL, 'ggg', '2022-11-27 16:18:36', 'Nguyễn Trung Anh', '0123456789', 304000, b'1'),
(17, 2, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nội', NULL, 'pọihghjkl', '2022-12-03 00:41:08', 'Nguyễn Trung Anh', '12345678', 304000, b'0'),
(18, 16, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nội', NULL, 'tetwg', '2022-12-03 13:26:07', 'Nguyễn Trung Anh', '0944798324', 304000, b'0'),
(19, 2, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nội', NULL, 'sad', '2022-12-13 00:08:35', 'Nguyễn Trung Anh', '1234567322', 464000, b'0'),
(20, 2, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nội', NULL, 'qsdwaefsgdh', '2022-12-23 22:47:23', 'Nguyễn Trung Anh', '1234567322', 320000, b'0'),
(25, 2, 'Nhân Hòa - Nhân Chính - Thanh Xuân - Hà Nội', NULL, 'áCdxcgb', '2022-12-24 23:02:27', 'Nguyễn Trung Anh', '1234567322', 152000, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) DEFAULT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `PROMOTION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`PRODUCT_ID`, `PRODUCT_NAME`, `CATEGORY_ID`, `PRICE`, `IMAGE`, `DESCRIPTION`, `PROMOTION_ID`) VALUES
(1, 'Sữa rửa mặt', 1, 100000, 'Screenshot_1.png', 'đẹp đẹp', 1),
(2, 'Sữa rửa mặt', 1, 200000, 'Screenshot_2.png', 'đẹp đẹp', 1),
(3, 'Sữa rửa mặt', 1, 170000, 'Screenshot_3.png', 'đẹp đẹp', NULL),
(4, 'Sữa rửa mặt', 1, 176000, 'Screenshot_4.png', 'đẹp đẹp', 3),
(5, 'Sữa rửa mặt', 1, 453000, 'Screenshot_5.png', 'đẹp đẹp', 2),
(6, 'Sữa rửa mặtew', 2, 80000, 'Screenshot_6.png', 'đẹp đẹp', 1),
(7, 'Sữa rửa mặt', 2, 106000, 'Screenshot_7.png', 'đẹp đẹp', NULL),
(8, 'bsdbbd', 2, 110000, 'Screenshot_8.png', 'đẹp đẹp', 1),
(9, 'sdbsdb', 2, 56000, 'Screenshot_9.png', 'đẹp đẹp', 2),
(10, 'Sữa rửa mặtmrtmc', 2, 70000, 'Screenshot_10.png', 'đẹp đẹp', 2),
(11, 'gewsbd', 2, 980000, 'Screenshot_11.png', 'đẹp đẹp', 2),
(12, 'Sữa rửa mmtmrặt', 2, 160000, 'Screenshot_12.png', 'đẹp đẹp', 2),
(13, 'ffsafs', 7, 124000, 'Screenshot_13.png', 'rrwasg', 1),
(21, 'ewew', 2, 450000, 'Screenshot_15.png', 'dwcsvds', 3),
(22, 'fsdfg', 3, 550000, 'Screenshot_16.png', 'rhtfjghj', 3),
(23, 'ewdvf', 4, 344000, 'Screenshot_17.png', '1wefdfgb', 2),
(24, 'fef', 2, 35000, 'Screenshot_18.png', 'e12', 1),
(25, 'dwd', 2, 790000, 'Screenshot_19.png', '111', 3),
(26, '11121e', 2, 111000, 'Screenshot_20.png', 'ewfdgtf', 2),
(27, 'wfegrty', 3, 213000, 'Screenshot_21.png', 'wefgr', 1),
(28, 'efdf', 4, 324000, 'Screenshot_23.png', '121132', 1),
(30, 'gà', 2, 121200, 'Screenshot_24.png', 'édgbf', NULL),
(31, 'csa', 4, 451000, 'Screenshot_25.png', NULL, NULL),
(32, 'sadsfdf', 3, 12000, 'Screenshot_26.png', 'wdfsdg', 2),
(34, 'hellowww', 2, 400000, 'Screenshot_27.png', 'egsnsdhdsh', 2),
(35, 'rrgdd', 6, 350000, 'Screenshot_28_1670043220275.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', NULL),
(36, 'wqfesd', 6, 400000, 'Screenshot_29_1670043915303.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(37, 'wqfesd', 6, 400000, 'Screenshot_30.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(38, 'wqfesd', 6, 400000, 'Screenshot_31.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(39, 'wqfesd', 6, 400000, 'Screenshot_32.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(40, 'wqfesd', 6, 400000, 'Screenshot_33.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(41, 'wqfesd', 6, 400000, 'Screenshot_34.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(42, 'wqfesd', 6, 400000, 'Screenshot_35.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(43, 'wqfesd', 6, 400000, 'Screenshot_36.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(44, 'wqfesd', 6, 400000, 'Screenshot_38.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(45, 'wqfesd', 6, 400000, 'Screenshot_39.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(46, 'wqfesd', 6, 400000, 'Screenshot_40.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(47, 'wqfesd', 6, 400000, 'Screenshot_42.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(48, 'wqfesd', 6, 400000, 'Screenshot_43.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(49, 'wqfesd', 6, 400000, 'Screenshot_44.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 2),
(50, 'wqfesd', 6, 400000, 'Screenshot_46.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(51, 'wqfesd', 6, 400000, 'Screenshot_48.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 1),
(52, 'wqfesd', 6, 400000, 'Screenshot_50.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 2),
(53, 'wqfesd', 6, 400000, 'Screenshot_42.png', 'COMBO Dear, Klairs Chăm da khỏe- sạch- sáng bao gồm:\nDear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\nDear, Klairs Sữa rửa mặt Gentle Black Facial Cleanser 140ml (IP04)\nQuà tặng đi kèm:\n\nDear, Klairs nước hoa hồng Toner 30ml ( hàng bán hay QT đều được) \n2 Dear, Klairs mặt nạ giấy Midnight Blue Calming Sheet Mask 25ml (IP04) (Hàng bán hoặc QT đều được)\n1. Dear, Klairs Dầu tẩy trang Gentle Black Deep Cleansing Oil 150ml (IP04)\n\nDầu Tẩy Trang Klairs Gentle Black Deep Cleansing Oil giúp làm sạch các lớp trang điểm trên da, kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa, cung cấp các hiệu ứng chất chống oxy hóa mạnh mẽ cho da. \nLoại da phù hợp: \n\nPhù hợp mọi loại da.\nDa nhiều mụn ẩn, mụn đầu đen.\nCông dụng:\n\nĐậu Đen: kiểm soát sự tiết dầu, tăng độ đàn hồi cho da.\nDầu hạt Mè Đen: ngăn ngừa mất nước và lão hóa da đồng thời chống Oxy hóa mạnh mẽ thông qua các thành phần hữu ích khác nhau như Beta-carotene, Axit Rinolenic, Sesamin, Sesaminol và Tocopherol.\nDầu hạt Lý Chua Đen: củng cố lớp bảo vệ để ngăn chặn sự bay hơi của độ ẩm trên da, thúc đẩy tái tạo tế bào da và cung cấp tác dụng chống Oxy hóa nhờ chứa nhiều khoáng chất và vitamin khác nhau.\nThành phần:\n\nCaprylic/Capric Triglyceride, Cetyl Ethylhexanoate, Isononyl Isononanoate, PEG-7 Glyceryl Cocoate, Isopropyl Myristate, Simmondsia Chinensis (Jojoba) Seed Oil, Glycine Soja (Soybean) Oil, Sesamum Indicum (Sesame) Seed Oil, Ribes Nigrum (Black Currant) Seed Oil, Tocopheryl Acetate, PEG-20 Glyceryl Triisostearate, Polysorbate 20, Fragrance, Butyrospermum Parkii (Shea Butter), Carapa Guaianensis Seed Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil.', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_oder`
--

CREATE TABLE `product_oder` (
  `ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `ORDER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_oder`
--

INSERT INTO `product_oder` (`ID`, `PRODUCT_ID`, `QUANTITY`, `ORDER_ID`) VALUES
(8, 8, 2, 9),
(9, 4, 2, 9),
(25, 2, 1, 17),
(26, 6, 1, 17),
(27, 2, 1, 18),
(28, 1, 1, 18),
(29, 6, 1, 18),
(30, 1, 3, 19),
(31, 2, 1, 19),
(32, 6, 1, 19),
(33, 2, 2, 20),
(38, 6, 1, 25),
(39, 8, 1, 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion`
--

CREATE TABLE `promotion` (
  `PROMOTION_ID` int(11) NOT NULL,
  `PROMOTION_KEY` varchar(50) DEFAULT NULL,
  `PROMOTION_NAME` varchar(50) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `START_DATE` timestamp NULL DEFAULT NULL,
  `END_DATE` timestamp NULL DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `promotion`
--

INSERT INTO `promotion` (`PROMOTION_ID`, `PROMOTION_KEY`, `PROMOTION_NAME`, `VALUE`, `START_DATE`, `END_DATE`, `TYPE`) VALUES
(1, 'BLF001', 'Black Friday', 20, '2022-11-21 17:00:00', '2023-11-26 17:00:00', 2),
(2, 'S053', 'Sale', 19, '2023-11-05 17:00:00', '2023-12-28 17:00:00', 2),
(3, 'SS4212', 'Siêu Sale', 25, '2024-09-04 17:00:00', '2023-12-04 17:00:00', 2),
(4, 'tete', 'tet', 32, '2022-12-02 17:00:00', '2023-11-30 17:00:00', 1),
(6, 'GSGG', 'sale123', 14, '2023-12-03 17:00:00', '2023-01-04 17:00:00', 1),
(8, 'QQQ', 'qqqq', 12, '2022-12-06 17:00:00', '2022-12-26 17:00:00', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_type`
--

CREATE TABLE `promotion_type` (
  `ID` int(11) NOT NULL,
  `TYPE_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `promotion_type`
--

INSERT INTO `promotion_type` (`ID`, `TYPE_NAME`) VALUES
(1, 'Giảm tiền'),
(2, 'Giảm theo %');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `CART_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shopping_cart`
--

INSERT INTO `shopping_cart` (`CART_ID`, `USER_ID`) VALUES
(1, 2),
(4, 16),
(5, 17),
(6, 18),
(7, 19),
(9, 20),
(10, 21),
(11, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `BIRTH_DATE` timestamp NULL DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`USER_ID`, `USER_NAME`, `FULL_NAME`, `BIRTH_DATE`, `EMAIL`, `PASSWORD`, `PHONE_NUMBER`, `ROLE`, `STATUS`) VALUES
(1, 'admin', 'Admin', NULL, NULL, '$2a$10$dt57pi5QQYqPKxvXaBWK/ef6CrNiW93/KqZcw.IseOnclR8voEf5i', NULL, '0', b'1'),
(2, 'user', 'Nguyễn Trung Anh', '2024-02-10 17:00:00', 'trunganh669911@gmial.com', '$2a$10$dt57pi5QQYqPKxvXaBWK/ef6CrNiW93/KqZcw.IseOnclR8voEf5i', '1234567322', '1', b'1'),
(15, 'trunganh', 'Nguyễn Trung Anh', '2022-12-08 17:00:00', NULL, '$2a$10$.DUUzgfFkp75wZXrGfn9Y.gI.Yqg9ss9SNlJA9229X5bwJpzXiM3W', '0944798325', '1', b'1'),
(16, 'monitor', 'Anh Trung', '2022-11-30 17:00:00', NULL, '$2a$10$JfUYLmnIQWbWdrRUBCxCUuZeLVwo.FQQmFglSjHJKo7u6V1AzhGOm', '0944798324', '0', b'1'),
(17, 'trunganh343', 'Anh NT', '2022-12-04 17:00:00', NULL, '123', '0944798325', '1', b'1'),
(18, 'trunganh111', 'dbfng', '2022-11-30 17:00:00', NULL, '', '0944798325', '1', b'1'),
(19, 'user111', 'yytty', '2022-11-27 17:00:00', NULL, '', '0944798325', '1', b'1'),
(20, 'user123', 'Nguyễn Trung Anhssss', '2022-11-29 17:00:00', NULL, '$2a$10$oAdmkjAKMgxz3jpbACsTWeSyz8ezhPd2GSJK6.VYzxsRJQzNICoNq', '0944794212', '1', b'1'),
(21, 'sqdwasefdg', 'dwasf', '2022-12-27 17:00:00', NULL, '$2a$10$e1ixlXXz81BgU2npGSWKLuTxI0aPjMCfo77caO5f9crtYIzwtJmtS', '0944798325', '1', b'1'),
(22, 'wfwfwf', 'fwfw', '2023-01-05 17:00:00', NULL, '$2a$10$vgu3DCJnzkJJCvXZiaKbvuFGAkOO5GV2IqExnvA57iUTnKbmCLc3.', '0123345325', '1', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ware_house`
--

CREATE TABLE `ware_house` (
  `ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ware_house`
--

INSERT INTO `ware_house` (`ID`, `PRODUCT_ID`, `UPDATED_DATE`, `QUANTITY`) VALUES
(5, 21, '2022-12-02 21:16:30', 11),
(6, 22, '2022-12-02 21:20:50', 300),
(7, 23, '2022-12-02 21:21:15', 1),
(8, 24, '2022-12-02 21:21:23', 111),
(9, 25, '2022-12-02 21:21:31', 11),
(10, 26, '2022-12-02 21:21:38', 111),
(11, 27, '2022-12-02 21:21:45', 31243),
(12, 28, '2022-12-02 21:21:55', 3123),
(13, 30, '2022-12-02 21:22:03', 212),
(14, 31, '2022-12-02 21:22:12', 21),
(15, 32, NULL, 21),
(17, 34, NULL, 212),
(18, 35, '2022-12-03 11:54:00', 1000),
(19, 36, NULL, 2100),
(20, 37, NULL, 2100),
(21, 38, NULL, 2100),
(22, 39, NULL, 2100),
(23, 40, NULL, 2100),
(24, 41, NULL, 2100),
(25, 42, NULL, 2100),
(26, 43, NULL, 2100),
(27, 44, NULL, 2100),
(28, 45, NULL, 2100),
(29, 46, NULL, 2100),
(30, 47, NULL, 2100),
(31, 48, NULL, 2100),
(32, 49, NULL, 2100),
(33, 50, NULL, 2100),
(34, 51, NULL, 2100),
(35, 52, NULL, 2100),
(36, 1, '2022-12-24 00:38:19', 2100),
(37, 2, NULL, 2100),
(38, 3, NULL, 2100),
(39, 4, NULL, 2100),
(40, 5, NULL, 2100),
(41, 6, NULL, 2098),
(42, 7, NULL, 2100),
(43, 8, NULL, 2099),
(44, 9, NULL, 2100),
(45, 10, NULL, 2100),
(46, 11, NULL, 2100),
(47, 12, NULL, 2100),
(48, 13, NULL, 2100);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`CART_DETAIL_ID`),
  ADD KEY `FK_cart_detail_shopping_cart` (`CART_ID`),
  ADD KEY `FK_cart_detail_product` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `FK_order_promotion` (`PROMOTION_ID`),
  ADD KEY `FK_order_address` (`ADDRESS`) USING BTREE,
  ADD KEY `FK_order_user` (`USER_ID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `FK_product_promotion` (`PROMOTION_ID`),
  ADD KEY `FK_product_category` (`CATEGORY_ID`);

--
-- Chỉ mục cho bảng `product_oder`
--
ALTER TABLE `product_oder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_product_oder_product` (`PRODUCT_ID`),
  ADD KEY `FK_product_oder_order` (`ORDER_ID`);

--
-- Chỉ mục cho bảng `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`PROMOTION_ID`),
  ADD KEY `FK_promotion_promotion_type` (`TYPE`);

--
-- Chỉ mục cho bảng `promotion_type`
--
ALTER TABLE `promotion_type`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`CART_ID`),
  ADD KEY `FK_shopping_cart_user` (`USER_ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Chỉ mục cho bảng `ware_house`
--
ALTER TABLE `ware_house`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ware_house_product` (`PRODUCT_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `CART_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `product_oder`
--
ALTER TABLE `product_oder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `PROMOTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `promotion_type`
--
ALTER TABLE `promotion_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `CART_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `ware_house`
--
ALTER TABLE `ware_house`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `FK_cart_detail_product` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK_cart_detail_shopping_cart` FOREIGN KEY (`CART_ID`) REFERENCES `shopping_cart` (`CART_ID`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order_promotion` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`),
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  ADD CONSTRAINT `FK_product_promotion` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`);

--
-- Các ràng buộc cho bảng `product_oder`
--
ALTER TABLE `product_oder`
  ADD CONSTRAINT `FK_product_oder_order` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_product_oder_product` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Các ràng buộc cho bảng `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `FK_promotion_promotion_type` FOREIGN KEY (`TYPE`) REFERENCES `promotion_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `FK_shopping_cart_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Các ràng buộc cho bảng `ware_house`
--
ALTER TABLE `ware_house`
  ADD CONSTRAINT `FK_ware_house_product` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

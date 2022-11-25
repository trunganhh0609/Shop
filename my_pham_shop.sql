-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 25, 2022 lúc 02:02 AM
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
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `ADDRESS_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `ADDRESS_ID` int(11) DEFAULT NULL,
  `PROMOTION_ID` int(11) DEFAULT NULL,
  `NOTE` varchar(2000) DEFAULT NULL,
  `ORDER_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `PROMOTION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`PRODUCT_ID`, `PRODUCT_NAME`, `CATEGORY_ID`, `PRICE`, `IMAGE`, `DESCRIPTION`, `PROMOTION_ID`) VALUES
(1, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', 1),
(2, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', 1),
(3, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', NULL),
(4, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', 3),
(5, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', 2),
(6, 'Sữa rửa mặtew', 2, 10000, NULL, 'đẹp đẹp', 1),
(7, 'Sữa rửa mặt', 2, 10000, NULL, 'đẹp đẹp', NULL),
(8, 'bsdbbd', 2, 10000, NULL, 'đẹp đẹp', 1),
(9, 'sdbsdb', 2, 10000, NULL, 'đẹp đẹp', 2),
(10, 'Sữa rửa mặtmrtmc', 2, 10000, NULL, 'đẹp đẹp', 2),
(11, 'gewsbd', 2, 10000, NULL, 'đẹp đẹp', 2),
(12, 'Sữa rửa mmtmrặt', 2, 10000, NULL, 'đẹp đẹp', 2);

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion`
--

CREATE TABLE `promotion` (
  `PROMOTION_ID` int(11) NOT NULL,
  `PROMOTION_NAME` varchar(50) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `promotion`
--

INSERT INTO `promotion` (`PROMOTION_ID`, `PROMOTION_NAME`, `VALUE`, `START_DATE`, `END_DATE`) VALUES
(1, 'Black Friday', 20, '2022-11-22 00:13:48', '2022-11-27 00:14:01'),
(2, 'Sale', 19, '2022-11-22 00:13:48', '2022-11-27 00:14:01'),
(3, 'Siêu Sale', 25, '2022-11-30 00:15:05', '2022-12-05 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `CART_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`USER_ID`, `USER_NAME`, `FULL_NAME`, `EMAIL`, `PASSWORD`, `PHONE_NUMBER`, `ROLE`) VALUES
(0, 'user', 'Nguyễn Trung Anh', 'trunganh669911@gmial.com', '$2a$10$dt57pi5QQYqPKxvXaBWK/ef6CrNiW93/KqZcw.IseOnclR8voEf5i', '0123456789', '1');

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
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ADDRESS_ID`),
  ADD KEY `FK__user` (`USER_ID`);

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
  ADD KEY `FK_order_address` (`ADDRESS_ID`),
  ADD KEY `FK_order_promotion` (`PROMOTION_ID`);

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
  ADD KEY `FK_product_oder_product` (`PRODUCT_ID`);

--
-- Chỉ mục cho bảng `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`PROMOTION_ID`);

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
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `ADDRESS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `CART_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `product_oder`
--
ALTER TABLE `product_oder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `PROMOTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `CART_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ware_house`
--
ALTER TABLE `ware_house`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

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
  ADD CONSTRAINT `FK_order_address` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  ADD CONSTRAINT `FK_order_promotion` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`);

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
  ADD CONSTRAINT `FK_product_oder_product` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Các ràng buộc cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `FK_shopping_cart_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

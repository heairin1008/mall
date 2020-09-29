-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.24-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 mall.admin 구조 내보내기
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(250) NOT NULL,
  `admin_pw` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.category 구조 내보내기
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `category_pic` varchar(200) NOT NULL DEFAULT 'category.jpg',
  `category_ck` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.member 구조 내보내기
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `member_email` varchar(250) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_date` datetime NOT NULL,
  PRIMARY KEY (`member_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(200) NOT NULL,
  `notice_content` text NOT NULL,
  `notice_date` datetime NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.orders 구조 내보내기
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `orders_amount` int(11) NOT NULL,
  `orders_price` int(11) NOT NULL,
  `member_email` varchar(250) NOT NULL,
  `orders_addr` varchar(250) NOT NULL,
  `orders_state` enum('결제완료','배송준비중','배송완료','주문취소') NOT NULL,
  `orders_date` datetime NOT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `FK__product` (`product_id`),
  KEY `FK_orders_member` (`member_email`),
  CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_orders_member` FOREIGN KEY (`member_email`) REFERENCES `member` (`member_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.product 구조 내보내기
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_content` text NOT NULL,
  `product_soldout` enum('Y','N') NOT NULL COMMENT 'Y면 품절',
  `product_pic` varchar(200) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`product_id`),
  KEY `FK_product_category` (`category_id`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.x 구조 내보내기
DROP TABLE IF EXISTS `x`;
CREATE TABLE IF NOT EXISTS `x` (
  `a` int(11) NOT NULL,
  `b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mall.y 구조 내보내기
DROP TABLE IF EXISTS `y`;
CREATE TABLE IF NOT EXISTS `y` (
  `b` int(11) NOT NULL,
  `c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

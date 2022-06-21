-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para heladeria_y_pizzeria_la_65
DROP DATABASE IF EXISTS `heladeria_y_pizzeria_la_65`;
CREATE DATABASE IF NOT EXISTS `heladeria_y_pizzeria_la_65` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `heladeria_y_pizzeria_la_65`;

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.customers: ~6 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `age`) VALUES
	(1, 'sebastian cardona', 22),
	(2, 'esteban henao', 20),
	(3, 'camila santa', 21),
	(4, 'cristian paez', 20),
	(5, ' alexander garcia', 20),
	(6, 'andrea pulgarin', 22),
	(7, 'jose lezcano', 32);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.discounts
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.discounts: ~5 rows (aproximadamente)
DELETE FROM `discounts`;
INSERT INTO `discounts` (`id`, `name`, `value`) VALUES
	(1, 'cumpleaños', 0.05),
	(2, 'amor y amistad', 0.10),
	(3, 'sabado picoso', 0.15),
	(4, 'domingo de remate', 0.20),
	(5, 'miercoles de antojo', 0.08);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.products: ~4 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `value`) VALUES
	(1, 'helado', 15000.00),
	(2, 'pollo', 25000.00),
	(3, 'pizza', 30000.00),
	(4, 'pasteles de pollo', 8500.00),
	(5, 'cerveza', 7500.00);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float(12,2) NOT NULL,
  `customer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales: ~5 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `date`, `value`, `customer_id`) VALUES
	(1, '2022-06-17', 60000.00, 1),
	(2, '2022-06-16', 105000.00, 3),
	(3, '2022-06-15', 30000.00, 5),
	(4, '2022-06-14', 100000.00, 2),
	(5, '2022-06-17', 17000.00, 6);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_discounts
DROP TABLE IF EXISTS `sales_discounts`;
CREATE TABLE IF NOT EXISTS `sales_discounts` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(6) NOT NULL,
  `discount_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_discounts: ~4 rows (aproximadamente)
DELETE FROM `sales_discounts`;
INSERT INTO `sales_discounts` (`id`, `sale_id`, `discount_id`) VALUES
	(1, 1, 3),
	(2, 3, 5),
	(3, 5, 1),
	(5, 4, 1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65.sales_products
DROP TABLE IF EXISTS `sales_products`;
CREATE TABLE IF NOT EXISTS `sales_products` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(6) unsigned NOT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `amount` smallint(6) unsigned NOT NULL,
  `value` float(12,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65.sales_products: ~6 rows (aproximadamente)
DELETE FROM `sales_products`;
INSERT INTO `sales_products` (`id`, `sale_id`, `product_id`, `amount`, `value`) VALUES
	(1, 1, 3, 2, 30000.00),
	(2, 2, 1, 3, 25000.00),
	(3, 2, 2, 2, 15000.00),
	(4, 3, 1, 4, 25000.00),
	(5, 4, 4, 2, 8500.00),
	(6, 5, 2, 1, 15000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

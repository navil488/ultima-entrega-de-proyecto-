-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_globos
CREATE DATABASE IF NOT EXISTS `bd_globos` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `bd_globos`;

-- Volcando estructura para tabla bd_globos.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla bd_globos.cliente: ~2 rows (aproximadamente)
INSERT INTO `cliente` (`ID`, `nombre`, `direccion`, `telefono`) VALUES
	(1, 'lester', 'carmen', 45454521),
	(2, 'jorge', 'santa anita', 12451254);

-- Volcando estructura para tabla bd_globos.historial
CREATE TABLE IF NOT EXISTS `historial` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cliente` int(11) DEFAULT NULL,
  `Id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `FK_historial_cliente` (`Id_cliente`),
  KEY `costo` (`costo`),
  KEY `FK_historial_producto` (`Id_producto`),
  CONSTRAINT `FK_historial_cliente` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_historial_producto` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_historial_producto_2` FOREIGN KEY (`costo`) REFERENCES `producto` (`costo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla bd_globos.historial: ~1 rows (aproximadamente)
INSERT INTO `historial` (`id_factura`, `Id_cliente`, `Id_producto`, `cantidad`, `costo`, `direccion`, `telefono`) VALUES
	(1, 1, 1, 25, 5, NULL, NULL);

-- Volcando estructura para tabla bd_globos.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `desciprcion` varchar(50) DEFAULT NULL,
  `cantidad` decimal(20,6) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `costo` (`costo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla bd_globos.producto: ~10 rows (aproximadamente)
INSERT INTO `producto` (`id_producto`, `nombre_producto`, `desciprcion`, `cantidad`, `costo`) VALUES
	(1, 'globos', 'grande', 100.000000, 5),
	(2, 'Sombrilla', 'grande', 200.000000, 50),
	(3, 'taza', 'taza de 1.5 ml', 1500.000000, 25),
	(4, 'boli', 'boli personalisado', 1500.000000, 25),
	(5, 'block de notas', 'personalisado', 1500.000000, 25),
	(6, 'llaveros', 'personalizado', 1500.000000, 25),
	(7, 'usb', 'personalizado', 15020.000000, 50),
	(8, 'power bank', 'personalizado', 1500.000000, 250),
	(9, 'gorras', 'personalizado', 1500.000000, 200),
	(10, 'camisas', 'personalizado', 2500.000000, 250);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

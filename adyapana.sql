-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.29 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for adyapana
DROP DATABASE IF EXISTS `adyapana`;
CREATE DATABASE IF NOT EXISTS `adyapana` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adyapana`;

-- Dumping structure for table adyapana.class
DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `Class_no` int NOT NULL AUTO_INCREMENT,
  `Timeslot` varchar(45) NOT NULL,
  `Teacher_Tno` int NOT NULL,
  `Subno` int NOT NULL,
  PRIMARY KEY (`Class_no`),
  KEY `fk_Class_Teacher1_idx` (`Teacher_Tno`),
  KEY `fk_Class_Subject1_idx` (`Subno`),
  CONSTRAINT `fk_Class_Subject1` FOREIGN KEY (`Subno`) REFERENCES `subject` (`Subno`),
  CONSTRAINT `fk_Class_Teacher1` FOREIGN KEY (`Teacher_Tno`) REFERENCES `teacher` (`Tno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.invoice
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `Invoice_id` int NOT NULL AUTO_INCREMENT,
  `Student_Sno` int NOT NULL,
  `Teacher_Tno` int NOT NULL,
  `subno` int NOT NULL,
  `Month` varchar(10) NOT NULL DEFAULT '',
  `Price` double NOT NULL,
  PRIMARY KEY (`Invoice_id`),
  KEY `fk_Invoice_Student1_idx` (`Student_Sno`),
  KEY `fk_Invoice_Teacher1_idx` (`Teacher_Tno`),
  KEY `fk_Invoice_Subject1_idx` (`subno`) USING BTREE,
  CONSTRAINT `fk_Invoice_Student1` FOREIGN KEY (`Student_Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `fk_Invoice_Subject1` FOREIGN KEY (`subno`) REFERENCES `subject` (`Subno`),
  CONSTRAINT `fk_Invoice_Teacher1` FOREIGN KEY (`Teacher_Tno`) REFERENCES `teacher` (`Tno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.invoice_print
DROP TABLE IF EXISTS `invoice_print`;
CREATE TABLE IF NOT EXISTS `invoice_print` (
  `class id` int DEFAULT NULL,
  `subject name` varchar(50) DEFAULT NULL,
  `teacher name` varchar(50) DEFAULT NULL,
  `month` int DEFAULT NULL,
  `payment` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.payment_type
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE IF NOT EXISTS `payment_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Sno` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Add_line1` varchar(45) NOT NULL,
  `Add_line2` varchar(45) NOT NULL,
  `Mobile` int NOT NULL,
  `Gender_id` int NOT NULL,
  PRIMARY KEY (`Sno`),
  KEY `fk_Student_Gender1_idx` (`Gender_id`),
  CONSTRAINT `fk_Student_Gender1` FOREIGN KEY (`Gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.student attendance
DROP TABLE IF EXISTS `student attendance`;
CREATE TABLE IF NOT EXISTS `student attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Sno` int NOT NULL,
  `Class_no` int NOT NULL,
  `A_Date` date NOT NULL,
  `attend` varchar(45) NOT NULL DEFAULT 'absend',
  PRIMARY KEY (`id`),
  KEY `fk_Student attendance_Student1_idx` (`Sno`) USING BTREE,
  KEY `fk_Student attendance_Class1_idx` (`Class_no`) USING BTREE,
  CONSTRAINT `fk_Student attendance_Class1` FOREIGN KEY (`Class_no`) REFERENCES `class` (`Class_no`),
  CONSTRAINT `fk_Student attendance_Student1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Subno` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Subno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `Tno` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Add_line1` varchar(45) NOT NULL,
  `Add_line2` varchar(45) NOT NULL,
  `Mobile` varchar(45) NOT NULL,
  `Gender_id` int NOT NULL,
  PRIMARY KEY (`Tno`),
  KEY `fk_Teacher_Gender1_idx` (`Gender_id`),
  CONSTRAINT `fk_Teacher_Gender1` FOREIGN KEY (`Gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table adyapana.teacher_has_subject
DROP TABLE IF EXISTS `teacher_has_subject`;
CREATE TABLE IF NOT EXISTS `teacher_has_subject` (
  `id` varchar(45) NOT NULL,
  `Teacher_Tno` int NOT NULL,
  `Subject_Subno` int NOT NULL,
  `Student_Sno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Teacher_has_Subject_Subject1_idx` (`Subject_Subno`),
  KEY `fk_Teacher_has_Subject_Teacher1_idx` (`Teacher_Tno`),
  KEY `fk_Teacher_has_Subject_Student1_idx` (`Student_Sno`),
  CONSTRAINT `fk_Teacher_has_Subject_Student1` FOREIGN KEY (`Student_Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `fk_Teacher_has_Subject_Subject1` FOREIGN KEY (`Subject_Subno`) REFERENCES `subject` (`Subno`),
  CONSTRAINT `fk_Teacher_has_Subject_Teacher1` FOREIGN KEY (`Teacher_Tno`) REFERENCES `teacher` (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

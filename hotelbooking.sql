-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2024 at 08:22 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `accorderretirerdroit`
--

DROP TABLE IF EXISTS `accorderretirerdroit`;
CREATE TABLE IF NOT EXISTS `accorderretirerdroit` (
  `coderDeProfille` int NOT NULL,
  `codeClient` int NOT NULL,
  `accorder` tinyint(1) DEFAULT NULL,
  `retirer` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`coderDeProfille`,`codeClient`),
  KEY `FK_ACCORDER_CLIENTPRO_CLIENTS` (`codeClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admine`
--

DROP TABLE IF EXISTS `admine`;
CREATE TABLE IF NOT EXISTS `admine` (
  `nome` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `slaire` float DEFAULT NULL,
  `rolle` varchar(254) DEFAULT NULL,
  `privileges` varchar(254) DEFAULT NULL,
  `codeAdmin` int NOT NULL,
  `salire` float DEFAULT NULL,
  `modeDePass` int DEFAULT NULL,
  PRIMARY KEY (`codeAdmin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `codeBank` int NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `bic` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`codeBank`),
  KEY `AK_IDENTIFIER_2` (`codeBank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `nome` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `slaire` float DEFAULT NULL,
  `rolle` varchar(254) DEFAULT NULL,
  `privileges` varchar(254) DEFAULT NULL,
  `codeClient` int NOT NULL,
  `moteDePass` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`codeClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `confirmetransation`
--

DROP TABLE IF EXISTS `confirmetransation`;
CREATE TABLE IF NOT EXISTS `confirmetransation` (
  `Pay_codeDePayment` int NOT NULL,
  `codeAdmin` int NOT NULL,
  `codeDePayment` int NOT NULL,
  `codeClient` int NOT NULL,
  `codeBank` int NOT NULL,
  `codeDetransation` int NOT NULL,
  `leMontant` int DEFAULT NULL,
  `eteRecu_UserName_` int DEFAULT NULL,
  `eteEnvoye_AccountHotel_` int DEFAULT NULL,
  PRIMARY KEY (`Pay_codeDePayment`,`codeAdmin`,`codeDePayment`,`codeClient`,`codeDetransation`),
  KEY `AK_IDENTIFIER_2` (`codeDetransation`),
  KEY `FK_CONFIRME_ASSOCIATI_CLIENTS` (`codeClient`),
  KEY `FK_CONFIRME_ASSOCIATI_PAYMENT` (`codeDePayment`),
  KEY `FK_CONFIRME_CONFIRMAT_ADMINE` (`codeAdmin`),
  KEY `FK_CONFIRME_CONFIRME_BANK` (`codeBank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daitlesdechambers`
--

DROP TABLE IF EXISTS `daitlesdechambers`;
CREATE TABLE IF NOT EXISTS `daitlesdechambers` (
  `idedit` int NOT NULL,
  `codeChamber` int NOT NULL,
  `LocationDechamber` varchar(50) DEFAULT NULL,
  `image` longblob,
  `memberDechambre` int DEFAULT NULL,
  PRIMARY KEY (`idedit`,`codeChamber`),
  KEY `FK_DAITLESD_DIALTLELE_ROOM` (`codeChamber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `definirdroit`
--

DROP TABLE IF EXISTS `definirdroit`;
CREATE TABLE IF NOT EXISTS `definirdroit` (
  `codeDroit` int NOT NULL,
  `idRole` int NOT NULL,
  PRIMARY KEY (`codeDroit`,`idRole`),
  KEY `FK_DEFINIRD_DEFINIRDR_ROLE` (`idRole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `droitdeprofile`
--

DROP TABLE IF EXISTS `droitdeprofile`;
CREATE TABLE IF NOT EXISTS `droitdeprofile` (
  `codeDroit` int NOT NULL,
  `coderDeProfille` int NOT NULL,
  PRIMARY KEY (`codeDroit`,`coderDeProfille`),
  KEY `FK_DROITDEP_DROITDEPR_PROFIEL` (`coderDeProfille`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `droits`
--

DROP TABLE IF EXISTS `droits`;
CREATE TABLE IF NOT EXISTS `droits` (
  `codeDroit` int NOT NULL,
  `libdroit` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`codeDroit`),
  KEY `AK_IDENTIFIER_1` (`codeDroit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `nome` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `slaire` float DEFAULT NULL,
  `rolle` varchar(254) DEFAULT NULL,
  `privileges` varchar(254) DEFAULT NULL,
  `idedit` int NOT NULL,
  `pz` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idedit`),
  KEY `AK_IDENTIFIER_1` (`idedit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `codeDePayment` int NOT NULL,
  `DateDeTranstion` int DEFAULT NULL,
  `PaymentBank` int DEFAULT NULL,
  PRIMARY KEY (`codeDePayment`),
  KEY `AK_IDENTIFIER_1` (`codeDePayment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiel`
--

DROP TABLE IF EXISTS `profiel`;
CREATE TABLE IF NOT EXISTS `profiel` (
  `coderDeProfille` int NOT NULL,
  `inforamtionDePorfile` int DEFAULT NULL,
  `imgDeProfile` int DEFAULT NULL,
  PRIMARY KEY (`coderDeProfille`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `codeChamber` int NOT NULL,
  `codeClient` int NOT NULL,
  `codeDereservation` int NOT NULL,
  `dateDereservation` datetime DEFAULT NULL,
  PRIMARY KEY (`codeChamber`,`codeClient`,`codeDereservation`),
  KEY `AK_IDENTIFIER_1` (`codeDereservation`),
  KEY `FK_RESERVAT_RESERVATI_CLIENTS` (`codeClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int NOT NULL,
  `nomeDerolle` int DEFAULT NULL,
  PRIMARY KEY (`idRole`),
  KEY `AK_IDENTIFIER_1` (`idRole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `codeChamber` int NOT NULL,
  `numberDeChmabre` int DEFAULT NULL,
  PRIMARY KEY (`codeChamber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

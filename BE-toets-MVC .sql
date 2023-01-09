-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 09 jan 2023 om 12:10
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BE-toets-MVC`
--
CREATE DATABASE IF NOT EXISTS `BE-toets-MVC` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `BE-toets-MVC`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Auto`
--

DROP TABLE IF EXISTS `Auto`;
CREATE TABLE IF NOT EXISTS `Auto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(10) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Auto`
--

INSERT INTO `Auto` (`Id`, `Kenteken`, `Type`, `InstructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR ', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur`
--

DROP TABLE IF EXISTS `Instructeur`;
CREATE TABLE IF NOT EXISTS `Instructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Naam`, `Email`) VALUES
(1, 'Groen', 'groen@gmail.com'),
(2, 'Manhoi', 'manhoi@gmail.com'),
(3, 'Zoyi', 'zoyi@gmail.com'),
(4, 'Berthold', 'berthold@gmail.com'),
(5, 'Denekamp', 'denekamp@gmail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Mankement`
--

DROP TABLE IF EXISTS `Mankement`;
CREATE TABLE IF NOT EXISTS `Mankement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Mankement` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AutoId` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Mankement`
--

INSERT INTO `Mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES
(1, 4, '2023-01-04', 'Profiel rechterband minder dan 2 mm'),
(2, 2, '2023-01-02', 'Rechter achterlicht kapot'),
(4, 2, '2023-01-06', 'Bumper rechtsachter ingedeukt'),
(5, 2, '2023-01-08', 'Radio kapot'),
(10, 2, '2023-01-09', 'Stuur draait niet');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Auto`
--
ALTER TABLE `Auto`
  ADD CONSTRAINT `Instructeur` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`);

--
-- Beperkingen voor tabel `Mankement`
--
ALTER TABLE `Mankement`
  ADD CONSTRAINT `AutoId` FOREIGN KEY (`AutoId`) REFERENCES `Auto` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

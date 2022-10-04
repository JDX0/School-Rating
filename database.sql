-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2022 at 11:20 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skoly`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(16) NOT NULL,
  `school_id` int(16) NOT NULL,
  `text` text COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `school_id`, `text`) VALUES
(1, 18, '12ss'),
(2, 14, 'hu'),
(3, 14, 'hu'),
(4, 14, 'abcs'),
(5, 14, 'abcs'),
(6, 14, 'abcs'),
(7, 14, 'abcs'),
(8, 14, 'abcs'),
(9, 18, 'nejhorsi skola'),
(10, 43, 'Kdyby nebylo Šimůnka nejlepší škola'),
(11, 43, 'Kdyby nebylo Šimůnka nejlepší škola'),
(12, 20, 'ok'),
(13, 43, 'textarea'),
(14, 43, 'jshdkjajsnckjsa');

-- --------------------------------------------------------

--
-- Table structure for table `mesto`
--

CREATE TABLE `mesto` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) NOT NULL,
  `okres_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mesto`
--

INSERT INTO `mesto` (`id`, `nazev`, `okres_id`, `active`) VALUES
(1, 'Uherský Brod', 1, 1),
(2, 'Uherské Hradiště', 1, 1),
(3, 'Vsetín', 4, 1),
(4, 'Bojkovice', 1, 1),
(5, 'Kunovice', 1, 1),
(6, 'Velehrad', 1, 1),
(7, 'Staré Město', 1, 1),
(8, 'Kroměříž', 2, 1),
(9, 'Bystřice pod Hostýnem', 2, 1),
(10, 'Holešov', 2, 1),
(11, 'Valašské Meziříčí', 4, 1),
(12, 'Rožnov pod Radhoštěm', 4, 1),
(13, 'Slavičín', 3, 1),
(14, 'Vizovice', 3, 1),
(15, 'Luhačovice', 3, 1),
(16, 'Raková', 3, 1),
(17, 'Otrokovice', 3, 1),
(18, 'Kelč', 4, 0),
(19, 'Valašské Klobouky', 3, 1),
(20, 'Zlín', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `obor`
--

CREATE TABLE `obor` (
  `id` int(11) NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `typ_oboru` int(11) NOT NULL,
  `kod_oboru` varchar(255) NOT NULL,
  `active` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `obor`
--

INSERT INTO `obor` (`id`, `nazev`, `typ_oboru`, `kod_oboru`, `active`) VALUES
(1, 'Automechanik', 0, '', 1),
(2, 'Cestovní ruch', 9, '', 1),
(3, 'Fotograf', 1, '', 1),
(4, 'Chemik', 10, '', 1),
(5, 'Cukrář', 1, '29-54-H/01', 1),
(6, 'Ekonomika a podnikání', 1, '', 1),
(7, 'Informační technologie', 1, '', 1),
(8, 'Hotelnictví', 9, '', 1),
(9, 'Kadeřník', 1, '', 1),
(10, 'Klempíř', 0, '', 1),
(11, 'Gymnázium', 11, '', 1),
(13, 'Puškař', 0, '', 1),
(14, 'Truhlář', 7, '', 1),
(15, 'Umělecký kovář a zámečník', 7, '', 1),
(16, 'Umělecký keramik', 7, '', 1),
(17, 'Sociální činnost', 9, '', 1),
(19, 'Karosář', 0, '23-55-H/02', 1),
(20, 'Podlahář', 0, '36-59-H/01', 1),
(21, 'Tesař', 12, '36-64-H/01', 1),
(22, 'Zedník', 0, '', 1),
(23, 'Instalatér', 0, '', 1),
(24, 'Obráběč kovů', 0, '', 1),
(25, 'Nástrojář', 0, '23-52-H/01', 1),
(26, 'Kuchař-číšník', 9, '65-51-H/01', 1),
(27, 'Mechanik opravář motorových vozidel', 0, '', 1),
(28, 'Mechanik strojů a zařízení', 5, '23-44-L/01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `okresy`
--

CREATE TABLE `okresy` (
  `id` int(11) NOT NULL,
  `nazev` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `okresy`
--

INSERT INTO `okresy` (`id`, `nazev`) VALUES
(1, 'Uherské Hradiště'),
(2, 'Kroměříž'),
(3, 'Zlín'),
(4, 'Vsetín');

-- --------------------------------------------------------

--
-- Table structure for table `skola`
--

CREATE TABLE `skola` (
  `id` int(11) NOT NULL,
  `nazev` varchar(128) NOT NULL,
  `info` tinytext NOT NULL,
  `termindod` date NOT NULL,
  `mesto_id` int(11) NOT NULL,
  `zemepisna_delka` double NOT NULL,
  `zemepisna_sirka` double NOT NULL,
  `zrizovatel_id` int(11) NOT NULL,
  `fotografie` varchar(128) NOT NULL,
  `link_skoly` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skola`
--

INSERT INTO `skola` (`id`, `nazev`, `info`, `termindod`, `mesto_id`, `zemepisna_delka`, `zemepisna_sirka`, `zrizovatel_id`, `fotografie`, `link_skoly`, `active`) VALUES
(14, 'Academic School, Střední škola, Zlín', '', '2022-01-21', 20, 0, 0, 1, '', 'http://academicschool.cz/stredni-skola/', 1),
(18, 'Arcibiskupské gymnázium v Kroměříži', '', '0000-00-00', 8, 0, 0, 1, 'agkm.png', 'http://www.agkm.cz', 1),
(19, 'Církevní střední škola pedagogická a sociální Bojkovice', '', '0000-00-00', 4, 0, 0, 1, 'logo_cssps.png', 'http://www.cirkevka-bojkovice.cz/', 1),
(20, 'CREATIVE HILL COLLEGE, Střední škola filmová, multimediální a počítačových technologií, s. r. o.', '', '0000-00-00', 20, 0, 0, 1, 'chc.png', 'http://www.creativehill.cz/', 1),
(21, 'Gymnázium a Jazyková škola s právem státní jazykové zkoušky Zlín', '', '2021-04-24', 20, 0, 0, 1, 'gjszlin.jpg', 'http://www.gjszlin.cz', 1),
(22, 'Gymnázium Františka Palackého Valašské Meziříčí', '', '0000-00-00', 3, 0, 0, 1, 'gfpvm.png', 'http://www.gfpvm.cz', 1),
(23, 'Gymnázium J. A. Komenského a Jazyková škola s právem státní jazykové zkoušky Uherský Brod', '', '0000-00-00', 2, 0, 0, 1, 'gjak.png', 'https://www.gjak.cz', 1),
(24, 'Gymnázium Jana Pivečky a SOŠ Slavičín', '', '0000-00-00', 1, 0, 0, 1, 'gjpsosslavicin.png', 'http://gjpsosslavicin.cz', 1),
(25, 'Gymnázium Kroměříž', '', '0000-00-00', 8, 0, 0, 1, 'gymkrom.jpg', 'http://www.gymkrom.cz', 1),
(26, 'Gymnázium Ladislava Jaroše Holešov', '', '0000-00-00', 8, 0, 0, 1, 'gymhol.png', 'http://www.gymhol.cz', 1),
(27, 'Gymnázium Otrokovice', '', '0000-00-00', 17, 0, 0, 1, 'gyotr.jpg\r\n', 'http://www.gyotr.cz', 1),
(28, 'Gymnázium Rožnov pod Radhoštěm', '', '0000-00-00', 3, 0, 0, 1, 'logo.png', 'http://www.gymroznov.cz', 1),
(29, 'Gymnázium Uherské Hradiště', '', '0000-00-00', 2, 0, 0, 1, 'guh.jpg', 'http://www.guh.cz', 1),
(30, 'Gymnázium Valašské Klobouky', '', '0000-00-00', 19, 0, 0, 1, 'gym-vk.svg', 'http://www.gymnazium-vk.cz', 1),
(31, 'Gymnázium Zlín – Lesní čtvrť', '', '0000-00-00', 20, 0, 0, 1, 'gymzl.png', 'http://www.gymzl.cz', 1),
(32, 'Integrovaná střední škola – Centrum odborné přípravy a Jazyková škola s právem státní jazykové zkoušky Valašské Meziříčí', '', '0000-00-00', 11, 0, 0, 1, 'isscop.png', 'http://www.isscopvm.cz', 1),
(33, 'Konzervatoř P. J. Vejvanovského Kroměříž', '', '0000-00-00', 8, 0, 0, 1, 'konzkm.png', 'http://konzkm.cz', 1),
(34, 'Masarykovo gymnázium, Střední zdravotnická škola a Vyšší odborná škola zdravotnická Vsetín', '', '0000-00-00', 3, 0, 0, 1, 'mgvsetin.svg', 'http://www.mgvsetin.cz', 1),
(35, 'MESIT střední škola, o.p.s.\r\n', '', '0000-00-00', 2, 0, 0, 1, 'mesit.jpg', 'http://www.mesitstredniskola.cz', 1),
(36, 'Obchodní akademie a Vyšší odborná škola Valašské Meziříčí', '', '0000-00-00', 11, 0, 0, 1, 'oavm.png', 'http://www.oavm.cz', 1),
(41, 'Obchodní akademie Kroměříž', '', '0000-00-00', 8, 0, 0, 1, 'oakm.png', 'http://www.oakm.cz', 1),
(42, 'Obchodní akademie Tomáše Bati a Vyšší odborná škola ekonomická Zlín', '', '0000-00-00', 20, 0, 0, 1, 'oazlin.jpg', 'http://www.oazlin.cz', 1),
(43, 'Obchodní akademie, Vyšší odborná škola a Jazyková škola s právem státní jazykové zkoušky Uherské Hradiště', '', '0000-00-00', 2, 0, 0, 1, 'oauh-logo.png', 'http://www.oauh.cz', 1),
(44, 'Odborné učiliště a Základní škola Holešov', '', '0000-00-00', 10, 0, 0, 1, 'ouholesov.png', 'http://www.ouholesov.cz', 1),
(45, 'Odborné učiliště Kelč', '', '0000-00-00', 3, 0, 0, 1, 'ou-kelc.svg', 'http://www.oukelc.cz', 1),
(46, 'Soukromá střední škola, s.r.o.', '', '0000-00-00', 2, 0, 0, 1, '', 'http://sou.uh.cz', 1),
(47, 'Soukromé gymnázium, střední odborná škola a jazyková škola s právem státní jazykové zkoušky, s.r.o.', '', '0000-00-00', 5, 0, 0, 1, 'sgasos.png', 'http://stredni.cz', 1),
(48, 'Stojanovo gymnázium Velehrad', '', '0000-00-00', 6, 0, 0, 1, 'sgv.jpg', 'http://www.sgv.cz', 1),
(49, 'Střední odborná škola a Gymnázium Staré Město', '', '0000-00-00', 7, 0, 0, 1, 'sosg.png', 'http://www.sosgsm.cz', 1),
(50, 'Střední odborná škola Josefa Sousedíka Vsetín', '', '0000-00-00', 3, 0, 0, 1, 'sjs.png', 'http://www.sosvsetin.cz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `skola_has_obor`
--

CREATE TABLE `skola_has_obor` (
  `id` int(11) NOT NULL,
  `skola_id` int(11) NOT NULL,
  `obor_id` int(11) NOT NULL,
  `obor_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skola_has_obor`
--

INSERT INTO `skola_has_obor` (`id`, `skola_id`, `obor_id`, `obor_link`) VALUES
(1, 30, 6, 'http://www.gjszlin.cz/gztgm/studijni-obory.htm'),
(2, 21, 2, ''),
(3, 22, 3, ''),
(4, 31, 4, ''),
(5, 24, 5, ''),
(6, 25, 6, ''),
(7, 26, 7, ''),
(8, 27, 8, ''),
(9, 28, 9, ''),
(10, 29, 10, ''),
(11, 30, 11, ''),
(12, 32, 12, ''),
(13, 15, 13, ''),
(14, 16, 14, ''),
(15, 14, 15, ''),
(16, 33, 6, ''),
(17, 34, 6, ''),
(18, 35, 6, ''),
(19, 36, 6, ''),
(20, 37, 6, ''),
(21, 38, 6, ''),
(22, 39, 6, ''),
(23, 40, 6, ''),
(24, 41, 6, ''),
(25, 42, 6, ''),
(26, 43, 6, ''),
(27, 44, 6, ''),
(28, 45, 6, ''),
(29, 46, 6, ''),
(30, 47, 6, ''),
(31, 48, 6, ''),
(32, 49, 6, ''),
(33, 50, 6, ''),
(34, 21, 11, ''),
(35, 22, 11, ''),
(36, 23, 11, ''),
(37, 24, 11, ''),
(38, 25, 11, ''),
(39, 26, 11, ''),
(40, 27, 11, ''),
(41, 28, 11, ''),
(42, 29, 11, ''),
(43, 30, 11, ''),
(44, 31, 11, ''),
(45, 27, 50, ''),
(46, 26, 50, ''),
(47, 25, 50, ''),
(48, 24, 50, ''),
(49, 23, 50, ''),
(50, 22, 50, ''),
(51, 21, 50, ''),
(52, 20, 50, ''),
(53, 19, 50, ''),
(54, 25, 32, ''),
(55, 24, 32, ''),
(56, 32, 28, ''),
(57, 20, 7, ''),
(58, 20, 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `typ_oboru`
--

CREATE TABLE `typ_oboru` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typ_oboru`
--

INSERT INTO `typ_oboru` (`id`, `nazev`) VALUES
(0, 'Průmyslový'),
(1, 'Ekonomie'),
(2, 'Ekologie'),
(3, 'Informatika'),
(4, 'Hornictví'),
(5, 'Strojírenství'),
(6, 'Elektrotechnika'),
(7, 'Umělecký'),
(9, 'Hotelnictví'),
(10, 'Chemický'),
(11, 'Gymnázium');

-- --------------------------------------------------------

--
-- Table structure for table `zrizovatel`
--

CREATE TABLE `zrizovatel` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zrizovatel`
--

INSERT INTO `zrizovatel` (`id`, `nazev`) VALUES
(1, 'Privátní sektor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `okres_id` (`okres_id`);

--
-- Indexes for table `obor`
--
ALTER TABLE `obor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `okresy`
--
ALTER TABLE `okresy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skola`
--
ALTER TABLE `skola`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesto_id` (`mesto_id`),
  ADD KEY `zrizovatel_id` (`zrizovatel_id`);

--
-- Indexes for table `skola_has_obor`
--
ALTER TABLE `skola_has_obor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typ_oboru`
--
ALTER TABLE `typ_oboru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zrizovatel`
--
ALTER TABLE `zrizovatel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `obor`
--
ALTER TABLE `obor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `okresy`
--
ALTER TABLE `okresy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skola`
--
ALTER TABLE `skola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `skola_has_obor`
--
ALTER TABLE `skola_has_obor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `zrizovatel`
--
ALTER TABLE `zrizovatel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mesto`
--
ALTER TABLE `mesto`
  ADD CONSTRAINT `okres_id` FOREIGN KEY (`okres_id`) REFERENCES `okresy` (`id`);

--
-- Constraints for table `skola`
--
ALTER TABLE `skola`
  ADD CONSTRAINT `mesto_id` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`id`),
  ADD CONSTRAINT `zrizovatel_id` FOREIGN KEY (`zrizovatel_id`) REFERENCES `zrizovatel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 12:24 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saw2_java`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `alternatif` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `kadaluarsa` double NOT NULL,
  `penggunaan` double NOT NULL,
  `efekSamping` enum('1','2','3','4','5') NOT NULL,
  `bentuk` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id`, `alternatif`, `harga`, `kadaluarsa`, `penggunaan`, `efekSamping`, `bentuk`) VALUES
(1, 'Obat 1', 8500, 90, 14, '4', '3'),
(2, 'Obat 2', 4500, 90, 32, '3', '2'),
(3, 'Obat 3', 4000, 120, 7, '3', '2'),
(4, 'Obat 4', 4000, 120, 32, '3', '3'),
(5, 'Obat 5', 10000, 90, 30, '3', '5'),
(6, 'Obat 6', 15000, 300, 30, '3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_saw`
--

CREATE TABLE `hasil_saw` (
  `id` int(11) NOT NULL,
  `alternatif` varchar(50) NOT NULL,
  `bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `bobot` double NOT NULL,
  `label` enum('cost','benefit') NOT NULL DEFAULT 'benefit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kriteria`, `bobot`, `label`) VALUES
(1, 'namaObat', 0.2, 'cost'),
(2, 'harga', 0.25, 'benefit'),
(3, 'kadaluarsa', 0.2, 'benefit'),
(4, 'penggunaan', 0.125, 'benefit'),
(7, 'efekSamping', 0.25, 'benefit'),
(8, 'bentuk', 0.15, 'benefit');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_wp`
--

CREATE TABLE `kriteria_wp` (
  `id_kriteria` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bobot` double NOT NULL,
  `kepentingan` int(11) NOT NULL,
  `label` enum('cost','benefit') NOT NULL DEFAULT 'benefit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kriteria_wp`
--

INSERT INTO `kriteria_wp` (`id_kriteria`, `nama`, `bobot`, `kepentingan`, `label`) VALUES
(1, 'namaObat', 0.25, 5, 'benefit'),
(2, 'harga', 0.2, 4, 'benefit'),
(3, 'kadaluarsa', 0.25, 5, 'benefit'),
(4, 'penggunaan', 0.15, 4, 'benefit'),
(7, 'efekSamping', 0.2, 4, 'benefit'),
(8, 'bentuk', 0.2, 2, 'benefit');

-- --------------------------------------------------------

--
-- Table structure for table `normalisasi`
--

CREATE TABLE `normalisasi` (
  `id` int(11) NOT NULL,
  `id_alternatif` int(11) DEFAULT NULL,
  `harga` double NOT NULL,
  `kadaluarsa` double NOT NULL,
  `penggunaan` double NOT NULL,
  `efekSamping` double NOT NULL,
  `bentuk` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_saw`
--
ALTER TABLE `hasil_saw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `kriteria_wp`
--
ALTER TABLE `kriteria_wp`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hasil_saw`
--
ALTER TABLE `hasil_saw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kriteria_wp`
--
ALTER TABLE `kriteria_wp`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `normalisasi`
--
ALTER TABLE `normalisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

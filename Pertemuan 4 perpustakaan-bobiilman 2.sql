-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 08:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan-bobiilman`
--

-- --------------------------------------------------------

--
-- Create the database
--

CREATE DATABASE IF NOT EXISTS `perpustakaan-bobiilman` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `perpustakaan-bobiilman`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(255) NOT NULL,
  `Penerbit` varchar(255) NOT NULL,
  `TahunTerbit` date NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `JumlahStok` int(11) NOT NULL,
  PRIMARY KEY (`BukuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `DendaID` int(11) NOT NULL AUTO_INCREMENT,
  `MahasiswaID` int(11) NOT NULL,
  `PeminjamanID` int(11) NOT NULL,
  `JumlahDenda` decimal(10,2) NOT NULL,
  `TanggalDenda` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`DendaID`),
  FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa`(`MahasiswaID`) ON DELETE CASCADE,
  FOREIGN KEY (`PeminjamanID`) REFERENCES `peminjaman`(`PeminjamanID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `MahasiswaID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `TanggalDaftar` date NOT NULL,
  PRIMARY KEY (`MahasiswaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT,
  `MahasiswaID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `TanggalPinjam` date NOT NULL,
  `TanggalKembali` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`PeminjamanID`),
  FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa`(`MahasiswaID`) ON DELETE CASCADE,
  FOREIGN KEY (`BukuID`) REFERENCES `buku`(`BukuID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pustakawan`
--

CREATE TABLE `pustakawan` (
  `PustakawanID` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `TanggalBergabung` date NOT NULL,
  PRIMARY KEY (`PustakawanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

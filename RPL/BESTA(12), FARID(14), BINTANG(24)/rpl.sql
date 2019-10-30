-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Apr 2019 pada 05.01
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `KODE` varchar(10) NOT NULL,
  `NAMA` varchar(30) DEFAULT NULL,
  `NIK_MANAJER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`KODE`, `NAMA`, `NIK_MANAJER`) VALUES
('111A', 'Agus Sulaini', '00001'),
('111B', 'Bambang Bagus', '00002'),
('111C', 'Sulistyo Abdi', '00003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `KODE` varchar(10) DEFAULT NULL,
  `NIK` varchar(20) NOT NULL,
  `NAMA` varchar(30) DEFAULT NULL,
  `TANGGAL_LAHIR` date DEFAULT NULL,
  `JENIS_KELAMIN` tinyint(1) DEFAULT NULL,
  `ALAMAT` varchar(100) DEFAULT NULL,
  `NOMOR_TELEPON` decimal(12,0) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `GAJI` varchar(40) DEFAULT NULL,
  `DEPARTEMEN_KODE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`KODE`, `NIK`, `NAMA`, `TANGGAL_LAHIR`, `JENIS_KELAMIN`, `ALAMAT`, `NOMOR_TELEPON`, `EMAIL`, `GAJI`, `DEPARTEMEN_KODE`) VALUES
('111A', '123', 'besta', '2019-04-03', 1, 'jalan aja', '8136731', 'bestaa2@gmail.com', '9000000', '123'),
('111B', '321', 'farid', '2019-04-11', 2, 'jalan kuurasa', '8126337', 'fariiiddddg@gmail.com', '90129333', '321');

-- --------------------------------------------------------

--
-- Struktur dari tabel `klien`
--

CREATE TABLE `klien` (
  `NOMOR` int(11) NOT NULL,
  `NAMA` varchar(30) DEFAULT NULL,
  `ALAMAT` varchar(100) DEFAULT NULL,
  `JENIS` tinyint(1) DEFAULT NULL,
  `NOMOR_TELEPON` decimal(12,0) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `klien`
--

INSERT INTO `klien` (`NOMOR`, `NAMA`, `ALAMAT`, `JENIS`, `NOMOR_TELEPON`, `EMAIL`) VALUES
(1111, 'Mustopa Sulis', 'Jl. kembang kertas', 1, '999999999999', 'Mustofa@gmail.com'),
(1112, 'Sumaryo Mamang', 'Jl. kenangan mantan', 2, '81277722266', 'mamanggg@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penugasan`
--

CREATE TABLE `penugasan` (
  `NOMORPROYEK` int(11) NOT NULL,
  `NIK` varchar(20) DEFAULT NULL,
  `TOTAL_JAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penugasan`
--

INSERT INTO `penugasan` (`NOMORPROYEK`, `NIK`, `TOTAL_JAM`) VALUES
(1, '123', 10),
(2, '321', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `proyek`
--

CREATE TABLE `proyek` (
  `NOMOR` int(11) DEFAULT NULL,
  `NOMOR_PROYEK` int(11) NOT NULL,
  `NAMA` varchar(30) DEFAULT NULL,
  `DESKRIPSI` text,
  `TANNGAL_MULAI` date DEFAULT NULL,
  `TANGGAL_SELESAI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `proyek`
--

INSERT INTO `proyek` (`NOMOR`, `NOMOR_PROYEK`, `NAMA`, `DESKRIPSI`, `TANNGAL_MULAI`, `TANGGAL_SELESAI`) VALUES
(1111, 1, 'bigg', 'buruan', '2019-04-03', '2019-04-30'),
(1112, 2, 'farid', '1 jam mas', '2019-04-01', '2019-04-30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`KODE`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`),
  ADD KEY `FK_PENYERAHAN` (`KODE`);

--
-- Indeks untuk tabel `klien`
--
ALTER TABLE `klien`
  ADD PRIMARY KEY (`NOMOR`);

--
-- Indeks untuk tabel `penugasan`
--
ALTER TABLE `penugasan`
  ADD PRIMARY KEY (`NOMORPROYEK`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indeks untuk tabel `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`NOMOR_PROYEK`),
  ADD UNIQUE KEY `NOMOR` (`NOMOR`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `FK_PENYERAHAN` FOREIGN KEY (`KODE`) REFERENCES `departemen` (`KODE`),
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `penugasan` (`NIK`);

--
-- Ketidakleluasaan untuk tabel `proyek`
--
ALTER TABLE `proyek`
  ADD CONSTRAINT `proyek_ibfk_1` FOREIGN KEY (`NOMOR`) REFERENCES `klien` (`NOMOR`),
  ADD CONSTRAINT `proyek_ibfk_2` FOREIGN KEY (`NOMOR_PROYEK`) REFERENCES `penugasan` (`NOMORPROYEK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2019 pada 09.34
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(2) NOT NULL,
  `nama_brg` varchar(20) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `berat` int(2) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_brg`, `warna`, `berat`, `harga`) VALUES
('P1', 'Mur', 'Merah', 12, 1000),
('P2', 'Baut', 'Hijau', 17, 1200),
('P3', 'Sekrup', 'Kuning', 14, 2000),
('P4', 'Paku', 'Hitam', 8, 800),
('P5', 'Engsel', 'Biru', 18, 1500),
('P6', 'Palu', 'Hitam', 25, 2500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `kode_sales` varchar(10) NOT NULL,
  `nama_sales` varchar(20) NOT NULL,
  `status` int(2) NOT NULL,
  `kota` varchar(10) NOT NULL,
  `hobby` varchar(50) DEFAULT 'CODING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`kode_sales`, `nama_sales`, `status`, `kota`, `hobby`) VALUES
('S100', 'Siti', 10, 'MALANG', 'CODING'),
('S101', 'Amat', 20, 'Semarang', 'CODING'),
('S102', 'Bambang', 30, 'Jakarta', 'CODING'),
('S103', 'Untung', 40, 'Jakarta', 'CODING'),
('S104', 'Farid', 50, 'Palembang', 'CODING');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipping`
--

CREATE TABLE `shipping` (
  `kode_sales` varchar(10) NOT NULL,
  `kode_brg` varchar(2) NOT NULL,
  `qty` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shipping`
--

INSERT INTO `shipping` (`kode_sales`, `kode_brg`, `qty`) VALUES
('S100', 'P2', 200),
('S100', 'P3', 400),
('S100', 'P4', 200),
('S100', 'P5', 100),
('S100', 'P6', 100),
('S101', 'P2', 400),
('S102', 'P2', 200),
('S103', 'P2', 200),
('S103', 'P4', 300),
('S103', 'P4', 400);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`kode_sales`);

--
-- Indeks untuk tabel `shipping`
--
ALTER TABLE `shipping`
  ADD KEY `kode_sales` (`kode_sales`),
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`kode_sales`) REFERENCES `sales` (`kode_sales`),
  ADD CONSTRAINT `shipping_ibfk_2` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

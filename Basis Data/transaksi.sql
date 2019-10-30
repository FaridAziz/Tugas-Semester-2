-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 06:11 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transaksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `alamat_admin` text NOT NULL,
  `no_hp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `alamat_admin`, `no_hp`) VALUES
('ADM01', 'Jamet', 'Gedung putih', 62812232);

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `stock` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jenis_barang`, `stock`) VALUES
('B1', 'Iphone 6', 'Handphone', 10),
('B10', 'Ipad Pro', 'Tablet', 2),
('B2', 'Iphone 6+', 'Handphone', 7),
('B3', 'Iphone 6S', 'Handphone', 5),
('B4', 'Iphone 5s', 'Handphone', 4),
('B5', 'Lightning Cable', 'Perlengkapan', 20),
('B6', 'Adaptor Charger', 'Perlengkapan', 15),
('B7', 'Iphone 7', 'Handphone', 6),
('B8', 'Iphone 7+', 'Handphone', 9),
('B9', 'Macbook Pro', 'Laptop', 3);

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang`
--

CREATE TABLE `detail_barang` (
  `nama_barang` varchar(100) NOT NULL,
  `jumlah_barang` int(100) NOT NULL,
  `kualitas_barang` text NOT NULL,
  `harga_barang` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_barang`
--

INSERT INTO `detail_barang` (`nama_barang`, `jumlah_barang`, `kualitas_barang`, `harga_barang`) VALUES
('Iphone 6', 1010, 'Baru', 100000),
('Iphone 6+', 7, 'Baru', 3500000),
('Iphone 6S', 5, 'Baru', 4000000),
('Iphone 5s', 4, 'Bekas', 1500000),
('Lightning Cable', 20, 'Baru', 300000),
('Adaptor Charger', 15, 'Baru', 400000),
('Iphone 7', 6, 'Baru', 7000000),
('Iphone 7+', 9, 'Baru', 8000000),
('Macbook Pro', 3, 'Bekas', 24000000),
('Ipad Pro', 2, 'Bekas', 11000000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_user`
--

CREATE TABLE `detail_user` (
  `id_user` int(10) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `alamat_user` text NOT NULL,
  `no_rekening` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_user`
--

INSERT INTO `detail_user` (`id_user`, `nama_user`, `alamat_user`, `no_rekening`) VALUES
(171, 'Aryo', 'Malang', 6969696),
(172, 'Mohamad Bintang', 'Tulungagung', 1212312),
(173, 'Farid Aziz', 'Jakarta Selatan', 56451114),
(174, 'Besta Alfidi', 'Magetan', 56432132),
(175, 'Fardi Wicaksono', 'Jakarta Timur', 88456123),
(176, 'Falah Ahmad', 'Kepanjen', 9985621),
(177, 'Elep Syihan', 'Mondokoro', 96321456),
(178, 'Mahendra Fir', 'Singosari', 21231658),
(179, 'Minggar Putra', 'Probolinggo', 23659812),
(180, 'M. Rahmat', 'Malang', 78985612);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) NOT NULL,
  `jenis_pembayaran` enum('Indomaret','Alfamaret','BCA','BRI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `jenis_pembayaran`) VALUES
('P1', 'T1', 'Indomaret'),
('P10', 'T10', 'BRI'),
('P2', 'T2', 'Indomaret'),
('P3', 'T3', 'BCA'),
('P4', 'T4', 'BCA'),
('P5', 'T5', 'Indomaret'),
('P6', 'T6', 'BRI'),
('P7', 'T7', 'BRI'),
('P8', 'T8', 'BCA'),
('P9', 'T9', 'Alfamaret');

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` int(10) NOT NULL,
  `id_transaksi` varchar(10) NOT NULL,
  `alamat_user` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`id_pengiriman`, `id_transaksi`, `alamat_user`) VALUES
(545421, 'T5', 'Jakarta Timur'),
(551215, 'T3', 'Jakarta Selatan'),
(1451671, 'T1', 'Kebumen'),
(2013654, 'T10', 'Malang'),
(2121548, 'T6', 'Kepanjen'),
(4548452, 'T4', 'Magetan'),
(6321459, 'T9', 'Probolinggo'),
(6545451, 'T2', 'Tulungagung'),
(8789745, 'T7', 'Mondoroko'),
(21321564, 'T8', 'Singosari');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `id_sender` varchar(10) NOT NULL,
  `nama_sender` varchar(100) NOT NULL,
  `alamat_sender` text NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `tanggal_kirim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`id_sender`, `nama_sender`, `alamat_sender`, `nama_barang`, `tanggal_kirim`) VALUES
('S6', 'Meteor Cell', 'Jakarta Timur', 'Adaptor Charger', '2019-05-03'),
('S10', 'Platinum', 'Magetan', 'Ipad Pro', '2019-05-05'),
('S4', 'PT. Polinema', 'Malang', 'Iphone 5s', '2019-05-02'),
('S1', 'Pt.Polinema', 'suhat', 'Iphone 6', '2019-05-01'),
('S2', 'Black Cell', 'Malang', 'Iphone 6+', '2019-05-01'),
('S3', 'Black Cell', 'Malang', 'Iphone 6S', '2019-05-02'),
('S7', 'Platinum', 'Magetan', 'Iphone 7', '2019-05-01'),
('S8', 'Platinum', 'Magetan', 'Iphone 7+', '2019-05-01'),
('S5', 'Meteor Cell', 'Jakarta Timur', 'Lightning Cable', '2019-05-03'),
('S9', 'Black Cell', 'Malang', 'Macbook Pro', '2019-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stock` int(100) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id_transaksi`, `id_user`, `nama_barang`, `stock`, `tanggal_transaksi`) VALUES
('T1', 171, 'Iphone 6', 2, '2019-05-01'),
('T10', 180, 'Iphone 7', 3, '2019-05-01'),
('T2', 172, 'Iphone 6S', 3, '2019-05-02'),
('T3', 173, 'Macbook Pro', 1, '2019-05-07'),
('T4', 174, 'Iphone 7+', 2, '2019-05-01'),
('T5', 175, 'Iphone 6', 10, '2019-05-01'),
('T6', 176, 'Lightning Cable', 10, '2019-05-03'),
('T7', 177, 'Adaptor Charger', 10, '2019-05-03'),
('T8', 178, 'Macbook Pro', 1, '2019-05-07'),
('T9', 179, 'Ipad Pro', 1, '2019-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `password`, `email`) VALUES
(171, 'aaa4', '9f.aryosatyo@gmail.com'),
(172, 'asdf', 'bintang9@gmail.com'),
(173, 'asdr', 'farid3@gmail.com'),
(174, 'sadh', 'besta9@gmail.com'),
(175, 'dsfs', 'fardi8@gmail.com'),
(176, 'hjhj', 'falah0@gmail.com'),
(177, 'jklo', 'elep@gmail.com'),
(178, 'nbjs', 'hendraa@gmail.com'),
(179, 'oklh', 'minggar@gmail.com'),
(180, 'gdfr', 'mrahmat@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `nama_barang` (`nama_barang`);

--
-- Indexes for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD KEY `nama_barang` (`nama_barang`);

--
-- Indexes for table `detail_user`
--
ALTER TABLE `detail_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`nama_barang`);

--
-- Indexes for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `nama_barang` (`nama_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id_pengiriman` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21321565;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`nama_barang`) REFERENCES `sender` (`nama_barang`);

--
-- Constraints for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`nama_barang`) REFERENCES `barang` (`nama_barang`);

--
-- Constraints for table `detail_user`
--
ALTER TABLE `detail_user`
  ADD CONSTRAINT `detail_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_6` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi_barang` (`id_transaksi`);

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi_barang` (`id_transaksi`);

--
-- Constraints for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD CONSTRAINT `transaksi_barang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `transaksi_barang_ibfk_3` FOREIGN KEY (`nama_barang`) REFERENCES `barang` (`nama_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

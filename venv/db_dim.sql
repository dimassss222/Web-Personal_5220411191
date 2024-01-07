-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Nov 2023 pada 13.32
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akun`
--

CREATE TABLE `tbl_akun` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_akun`
--

INSERT INTO `tbl_akun` (`id`, `nama`, `username`, `password`, `email`) VALUES
(1, 'dimmm', 'dimm_nug', 'dimas2312', 'dn335976@gmail.com'),
(2, 'DIMAS ANUGRAH PUTRA ALFARIZQY', 'bimm_bimmm', 'qwerty123', 'dimznug22@gmail.com'),
(3, 'arrrr', 'sky', 'qwe123', 'dn335976@gmail.com'),
(4, 'mis', 'ar', '123', 'dddd@gmail.com'),
(5, 'ANDRA', 'irja', 'qweasd', 'sdsdasda@gmail.com'),
(6, 'sss', 'abc', 'qwerty123', 'dasdasda@gmail.com'),
(7, 'za', 'za', '123', 'azaza@gmail.com'),
(8, 'asep', 'asep', '123', 'asep@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pesananuser`
--

CREATE TABLE `tbl_pesananuser` (
  `nama` varchar(255) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `ukuran` int(50) NOT NULL,
  `harga` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_akun`
--
ALTER TABLE `tbl_akun`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_akun`
--
ALTER TABLE `tbl_akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

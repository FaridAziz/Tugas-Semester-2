CREATE DATABASE Nyoba;

use Nyoba

CREATE TABLE Barang(
	ID_Barang varchar(50) not null, 
	Nama_Barang varchar(225) not null, 
	Tanggal_terima datetime not null, 
	Stok_barang int null default 0, 
	constraint PK_Barang primary key
	(ID_Barang)
	)

CREATE TABLE Pembelian( 
 ID_Pembeli varchar(50) not null, 
 ID_Barang varchar(50) null , 
 Tanggal_Beli datetime not null,
 Nama_Pembeli varchar (60) not null, 
 Jumlah_Pembelian int null , 
 constraint PK_Pembelian primary key 
 (ID_Pembeli) 
 ) 

ALTER TABLE Pembelian 
 ADD CONSTRAINT 
 FK_Pembelian_RELATION_Barang foreign 
 key (ID_Barang) 
 REFERENCES Barang (ID_Barang)

ALTER TABLE Pembelian 
 ADD Alamat_Pembeli varchar(70)

ALTER TABLE Pembelian 
 DROP COLUMN Nama_Pembeli

ALTER TABLE Pembelian
DROP CONSTRAINT FK_Pembelian_RELATION_Barang

DROP TABLE Barang

create database Mahasiswa

use Mahasiswa

create table Jurusan(
	KodJur varchar(50) not null, 
	NamaJur varchar(50) not null, 
	Ketua_Jurusan varchar(50) not null, 
	constraint PK_Jursan primary key
	(kodJur)
	)

create table Biodata(
	NoMhs varchar(50) not null, 
	KodJur varchar(50) not null, 
	Nama varchar(50) not null, 
	Nilai int not null, 
	Alamat varchar(60) not  null, 
	JenKel varchar(1), 
	constraint FK_Biodata primary key(NoMhs))

alter table Biodata
	add constraint
	FK_Biodata_RELATION_Jurusan
	foreign key (kodJur)
	REFERENCES Jurusan (kodJur)

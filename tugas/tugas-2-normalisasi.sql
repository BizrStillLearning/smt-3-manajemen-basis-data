create database perpustakaan;

use perpustakaan;

create table peminjam (
    id_peminjam varchar(10),
    nama varchar(50),
    alamat varchar(50),
    primary key (id_peminjam)
);

create table buku (
    kode_buku varchar(10),
    judul_buku varchar(100),
    kategori varchar(50),
    tarif int,
    primary key (kode_buku)
);

create table peminjaman (
    id_peminjaman int,
    id_peminjam varchar(10),
    kode_buku varchar(10),
    tgl_pinjam date,
    tanggal_kembali date,
    primary key (id_peminjaman),
    foreign key (id_peminjam) references peminjam(id_peminjam),
    foreign key (kode_buku) references buku(kode_buku)
);

insert into peminjam values
('PJ001', 'Dora', 'Nongsa'),
('PJ002', 'Nana', 'Nongsa'),
('PJ003', 'Nana', 'Batu Aji');

insert into buku values
('PJK01', 'Belajar Pajak', 'Accounting', 1000),
('NV01', 'Merah Putih', 'Novel', 2000),
('NV02', 'Bendera', 'Novel', 2000),
('KW01', 'Merah Putih', 'Kewarganegaraan', 1000);

insert into peminjaman values
(1, 'PJ001', 'PJK01', '2026-07-01', '2026-07-03'),
(2, 'PJ001', 'NV01', '2026-07-12', '2026-07-13'),
(3, 'PJ002', 'PJK01', '2026-07-04', '2026-07-05'),
(4, 'PJ003', 'NV01', '2026-07-01', '2026-07-02'),
(5, 'PJ003', 'NV02', '2026-07-01', '2026-07-05'),
(6, 'PJ003', 'KW01', '2026-07-02', '2026-07-04');



select
    peminjaman.id_peminjaman,
    peminjam.id_peminjam,
    peminjam.nama,
    buku.kode_buku,
    buku.judul_buku,
    buku.kategori,
    peminjaman.tgl_pinjam,
    peminjaman.tanggal_kembali,
    buku.tarif,
    peminjam.alamat
from peminjaman
join peminjam
on peminjaman.id_peminjam = peminjam.id_peminjam
join buku
on peminjaman.kode_buku = buku.kode_buku;

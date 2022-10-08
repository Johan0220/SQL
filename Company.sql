
create database Company
go
use Company
go
create table LoaiSP(
	IDLSP int primary key identity,
	MaLoaiSP varchar(10) not null,
	TenLoaiSP nvarchar(255) not null,
)


create table SanPham(
	IDSP int primary key identity, 
	MaSoSP varchar(20),
	NgaySX datetime not null,
	IDLSP int not null, constraint fk_LoaiSP foreign key(IDLSP) references LoaiSP(IDLSP) on delete cascade
)
create table NhanVien(
	MaNV int primary key,
	TenNV nvarchar(20) not null,
)
drop table QLSP
alter table QLSP drop constraint fk_qlsp
create table QLSP(
	MaQL int primary key,
	MaNV int not null, constraint fk_nvql foreign key(MaNV) references NhanVien(MaNV) on delete cascade,
	IDSP int not null, constraint fk_qlsp foreign key(IDSP) references SanPham(IDSP) on delete cascade
)

alter table SanPham
drop constraint fk_LoaiSP
drop table SanPham
insert into LoaiSP values('Z37E','Máy tính sách tay Z37');
insert into SanPham values('Z37 111111','12/12/09',1);
insert into NhanVien values('987688','Nguyễn Văn An',1);
select * from LoaiSP;
select * from SanPham;
select * from NhanVien;
select * from LoaiSP order by TenLoaiSP;
select * from Nhanvien order by TenNV;
select * from LoaiSP where MaLoaiSP = 'Z37E';

 



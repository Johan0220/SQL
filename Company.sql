
create database Company
go
use Company
go
create table LoaiSP(
	IDLSP int primary key identity,
	MaLoaiSP varchar(10) not null,
	TenLoaiSP varchar(255) not null,
)


create table SanPham(
	IDSP int primary key identity, 
	MaSoSP varchar(20),
	NgaySX datetime not null,
	IDLSP int not null, constraint fk_LoaiSP foreign key(IDLSP) references LoaiSP(IDLSP) on delete cascade
)
create table NhanVien(
	MaNV int primary key,
	TenNV varchar(20) not null,
	IDSP int not null, constraint fk_SP foreign key(IDSP) references SanPham(IDSP) on delete cascade
)
insert into LoaiSP values('Z37','Máy tính sách tay Z37');
insert into SanPham values('Z37 111111','12/12/09',1);
insert into NhanVien values('987688','Nguyễn Văn An',1);
select * from LoaiSP
select *




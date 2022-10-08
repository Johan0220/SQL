Create database DangKyThueBao
go
use DangKyThueBao
go
create table KhachHang(
	SoCMND varchar(9) primary key check(SoCMND not like '[%^0-9%]'),
	TenKH nvarchar(20) not null,
	DiaChi nvarchar(50) not null,
)
create table ThueBao(
	SoTB varchar(10) primary key check(SoTb not like '[%^0-9%]'),
	LoaiTB nvarchar(10) not null,
	NgayDK datetime,
	SoCMND varchar(9), 
	constraint fk_KH foreign key(SoCMND) references KhachHang(SoCMND)
)
--alter table ThueBao drop constraint fk_KH;
--drop table ThueBao;
--drop table KhachHang;
insert into KhachHang values('123456789',N'Nguyễn Nguyệt Nga',N'Hà Nội');
insert into ThueBao values('123456789',N'Trả Trước','12/12/02','123456789');
select * from KhachHang;
select * from ThueBao;
select * from ThueBao where SoTB like '0123456789';
select * from KhachHang where SoCMND like '123456789';
select SoTB from ThueBao where SoCMND like '123456789';
select SoTB from ThueBao where NgayDK = '12/12/02';
select SoTB from ThueBao where SoCMND in 
	(select SoCMND from KhachHang where DiaChi like N'Hà Nội');
select count(SoCMND) from KhachHang;
select count(SoTB) from ThueBao where NgayDK = '12/12/09';
create view KH_TB as
select KhachHang.TenKH, KhachHang.SoCMND, KhachHang.DiaChi, ThueBao.SoTB, ThueBao.LoaiTB, ThueBao.NgayDK 
from KhachHang right join ThueBao on KhachHang.SoCMND = ThueBao.SoCMND;
select * from KH_TB;
alter table ThueBao
alter column NgayDK datetime NOT NULL;
alter table ThueBao
add constraint check_age check(NgayDK < getdate() or NgayDK = getdate());
alter table ThueBao
add constraint check_number_first check(SoTB not like '09%');
alter table ThueBao
add SoDiemThuong int;










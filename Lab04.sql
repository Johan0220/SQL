create database Lab04
go
use Lab04
go
create table PhongBan(
	MaPB varchar(7) primary key,
	TenPB nvarchar(50) not null
)
create table NhanVien(
	MaNV varchar(7) primary key,
	TenNV nvarchar(50) not null,
	NgaySinh datetime not null check(NgaySinh < getdate()),
	SoCMND char(9) not null check(SoCMND not like '%[^0-9]%'),
	GioiTinh char(1) not null check(GioiTinh not like'%F,M%'),
	DiaChi nvarchar(100) not null,
	NgayVaoLam datetime not null default(getdate()), 
	MaPB varchar(7), constraint fk_PB foreign key(MaPB) references PhongBan(MaPB),
	constraint check_age check (datediff(year,NgaySinh,NgayVaoLam) >20)
)

create table LuongDA(
	MaDA varchar(8),
	MaNV varchar(7),
	NgayNhan date not null,
	SoTien money check (SoTien > 0),
	primary key (MaDA, MaNV),
	constraint fk_NV foreign key(MaNV) references NhanVien(MaNV),
)
insert into PhongBan values ('1','Ten Phong Ban');
insert into NhanVien values ('1', 'Nguyen Van A','2000/04/10','090343849','F','Dong Da, HN','1');
insert into LuongDA values ('1A', '1','2002/10/10','2000');

select * from PhongBan
select * from NhanVien
select * from LuongDA

insert into PhongBan values ('2','Ten Phong Ban 2');
insert into NhanVien values ('2', 'Nguyen Van B','2000/04/10','090343453','F','Dong Da, HP','2');
insert into LuongDA values ('2A', '2','2022/10/10','3000');
delete from LuongDA where MaNV = '1'
SELECT * FROM LuongDA,NhanVien,PhongBan

SELECT * FROM NhanVien WHERE GioiTinh like 'f'

SELECT MaDA FROM LuongDA


SELECT TenNV, SUM(SoTien) AS 'Tong Luong'
FROM NhanVien,LuongDA 
where TenNV like 'Nguyen Van A'
GROUP BY TenNV


SELECT * FROM NhanVien WHERE MaPB IN
	(SELECT MaPB FROM PhongBan WHERE TenPB like 'Ten Phong Ban');

SELECT SoTien FROM LuongDA WHERE MaNV IN
	(SELECT MaNV FROM NhanVien WHERE MaPB IN
		(SELECT MaPB FROM PhongBan WHERE TenPB like 'Ten Phong Ban'));



SELECT Count(MaNV) AS 'TongNV' FROM NhanVien WHERE MaPB 
IN
(SELECT MaPB FROM PhongBan WHERE TenPB = 'Ten Phong Ban');


SELECT TenNV FROM NhanVien WHERE MaNV
IN
(SELECT MaNV FROM LuongDA)


SELECT TenPB FROM PhongBan WHERE MaPB
IN
(SELECT MaPB FROM NhanVien WHERE MaPB = (SELECT max(MaPB) FROM NhanVien))

SELECT SUM(SoTien) as'tongnv' FROM LuongDA where MaNV
IN
(SELECT MaNV FROM NhanVien WHERE MaPB
IN
(SELECT MaPB FROM PhongBan WHERE TenPB like 'Ten Phong Ban 2'));

SELECT SUM(SoTien) as'TongLuong' FROM LuongDA where MaNV
IN
(SELECT MaNV FROM NhanVien WHERE SoCMND like '%9')

SELECT MaNv,TenNV FROM NhanVien WHERE MaNV
IN
(SELECT MaNV FROM LuongDA WHERE SoTien = (SELECT MAX(SoTien) FROM LuongDA));



SELECT TenNV FROM NhanVien WHERE GioiTinh = 'F' and MaPB
IN
(SELECT MaPB FROM PhongBan WHERE TenPB like 'Ten Phong Ban') and MaNV
IN
(SELECT MaNV FROM LuongDA WHERE SoTien > 120)


	select TenPB,sum(sotien) as 'TongLuongPB'
	from (LuongDA inner join NhanVien on LuongDA.MaNV = NhanVien.MaNV) 
	right join PhongBan on NhanVien.MaPB=PhongBan.MaPB group by TenPB


	select LuongDA.MaDA,count(LuongDA.MaDA) as 'Nguoi Tham Gia' from LuongDA 
	group by LuongDA.MaDA having count(LuongDA.MaDA)>1

SELECT * FROM NhanVien WHERE TenNV like 'N%'




SELECT * FROM NhanVien
left Join  LuongDA ON
NhanVien.MaNV = LuongDA.MaNV  WHERE MaDA is null


DELETE FROM LuongDA WHERE MaDA like '1A'


DELETE FROM LuongDA WHERE SoTien = 2000000

update LuongDA set SoTien = SoTien / 100 * 10 where MaDA = '1A';

delete from NhanVien WHERE TenNV = 
(SELECT TenNV FROM NhanVien
left Join  LuongDA ON
NhanVien.MaNV = LuongDA.MaNV  WHERE MaDA is null)




GO
CREATE DATABASE Assignment_06
GO
USE Assignment_06
GO

CREATE TABLE Sach(
	MaSach varchar(6) PRIMARY KEY,
	TenSach nvarchar(50),
	TacGia varchar(20),
	NDTT nvarchar(225),
	NamXB date not null,
	LanXB int not null,
	GiaBan money not null,
	SoLuong int not null,
	LoaiSach nvarchar(50) not null
);

CREATE TABLE NXB(
	TenNXB nvarchar(30) primary key,
	DiaChiNXB nvarchar(50) not null,
	MaSach varchar(6),
	CONSTRAINT fk_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

INSERT INTO Sach VALUES('B001',N'Trí Tuệ Do Thái','Eran Katz',N'Người Do Thái','2010-01-01',1,79000,100,N'Khoa Học Xã Hội');
INSERT INTO NXB VALUES(N'Tri Thức',N'Hà Nội','B001');
--alter table NXB drop constraint fk_Sach
--drop table NXB
SELECT * FROM Sach;
SELECT * FROM NXB;

SELECT * FROM Sach WHERE NamXB > '2008-01-01';

SELECT TOP 3 TenSach,GiaBan FROM Sach

SELECT * FROM Sach WHERE TenSach like N'%Tin Học%';
SELECT TenSach FROM Sach WHERE TenSach like 'T%'
ORDER BY TenSach DESC;

SELECT TenSach FROM Sach WHERE MaSach IN
	(SELECT MaSach FROM NXB WHERE TenNXB like N'%Tri thức%');SELECT * FROM NXB WHERE MaSach IN
		(SELECT MaSach FROM Sach WHERE TenSach like N'%Trí tuệ Do Thái%');

SELECT Sach.MaSach,TenSach,NamXB,TenNXB,LoaiSach FROM Sach 
JOIN NXB ON Sach.MaSach = NXB.MaSach;

SELECT TenSach,GiaBan FROM Sach WHERE GiaBan = (SELECT MAX(GiaBan) FROM Sach);

SELECT TenSach,SoLuong FROM Sach WHERE SoLuong = (SELECT MAX(SoLuong) FROM Sach)

SELECT TenSach,TacGia FROM Sach WHERE TacGia like 'Eran Katz';

UPDATE Sach SET GiaBan = GiaBan - (GiaBan/100*10) WHERE NamXB < '2008-01-01'

SELECT count(TenSach) as TongDauSach, TenNXB FROM Sach
INNER JOIN NXB ON Sach.MaSach = NXB.MaSach
GROUP BY TenNXB;

SELECT LoaiSach, count(MaSach) as TongDauSach  FROM Sach
GROUP BY LoaiSach;

CREATE INDEX id_TenSach
ON Sach (TenSach);


CREATE VIEW vie_inf
AS
SELECT Sach.MaSach,TenSach,TacGia,TenNXB,GiaBan FROM Sach
JOIN NXB ON
Sach.MaSach = NXB.MaSach;
drop view view_all
SELECT * FROM vie_inf
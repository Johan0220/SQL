create database LabView
go
use LabView
go
create table Customers(
	CustomerID int primary key identity,
	CustomerName varchar(50) not null,
	Address varchar(100) not null,
	Phone varchar(12) not null
)


create table Book(
	BookCode int primary key,
	Category varchar(50),
	Author varchar(50) not null,
	Publisher varchar(50) not null,
	Title varchar(100) not null,
	Price int not null,
	InStore int not null,
)
create table BookSold(
	BookSoldID int primary key identity,
	CustomerID int not null,
	BookCode int not null,
	Date datetime not null,
	Price int not null,
	Amount int not null,
	constraint fk_Book foreign key(BookCode) references Book(BookCode),
	constraint fk_Customer foreign key(CustomerID) references Customers(CustomerID)
)

--alter table BookSold drop constraint fk_Books
--alter table BookSold drop constraint fk_Customer
--drop table BookSold
--drop table Customers

insert into Customers values('John','23 New York','123456789');
insert into Customers values('Jame','12 Cafornia','234567890');
insert into Customers values('Adam','42 Sanfansico','345678901');
insert into Customers values('Eva','34 Texas','456789012');
insert into Customers values('Brain','34 Washington','567890123');



insert into Book values('1','History','Jack','HarperCollins','Vietnamese war crimes','50','73');
insert into Book values('2','Kids','Jay','Pearson','Baby sark','60','63');
insert into Book values('3','Horror','Jony','RELX Group','Valac','45','34');
insert into Book values('4','Medical','Beck','ThomsonReuters','Doctor','55','98');
insert into Book values('5','Teen','Born','Wolters Kluwer','18 year old','30','32');

select * from Customers 

insert into BookSold values('1','1','2020/02/08','12','34');
insert into BookSold values('2','2','2020/01/01','14','23');
insert into BookSold values('3','3','2019/09/07','10','22');
insert into BookSold values('4','4','2020/05/04','12','44');
insert into BookSold values('5','5','2019/02/09','14','34');
insert into BookSold values('6','1','2022/05/02','19','21');
insert into BookSold values('7','2','2022/03/04','15','10');
insert into BookSold values('8','3','2019/07/08','16','16');
insert into BookSold values('9','4','2020/01/03','17','21');
insert into BookSold values('10','5','2022/11/10','13','11');

create view Solder as
	select Book.BookCode,Title,Book.Price,Amount from Book left join 
	BookSold on Book.BookCode = BookSold.BookCode
select * from Solder

create view Customer_Sell as
	select Customers.CustomerID,CustomerName,Address,Amount 
	from Customers inner join
	BookSold on BookSold.CustomerID = Customers.CustomerID
select * from Customer_Sell

create view Befor as
	select Customers.CustomerID, CustomerName,Address,Title, Date from Customers
	left join BookSold on BookSold.CustomerID = Customers.CustomerID
	left join Book on Book.BookCode = BookSold.BookCode where datediff(month,Date,getdate())<1

CREATE VIEW  Total_amout
AS
SELECT CustomerName,SUM(BookSold.Amount * BookSold.Price) as Total_Money FROM Customers
JOIN BookSold ON
BookSold.CustomerID = Customers.CustomerID
Group By CustomerName

select * from Total_amout
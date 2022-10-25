CREATE DATABASE AZBank
GO

USE AZBank
GO

--2
CREATE TABLE Customer(
	CustomerID INT PRIMARY KEY,
	Name nvarchar(50),
	City nvarchar(50),
	Country nvarchar(50),
	Phone nvarchar(50),
	Email nvarchar(50),
)

CREATE TABLE CustomerAccount(
	AccountNumber CHAR(9) PRIMARY KEY,
	CustomerID INT NOT NULL,
	Balance MONEY NOT NULL,
	MinAccount MONEY,
	CONSTRAINT fk_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE CustomerTransaction(
	TransactionID INT PRIMARY KEY,
	AccountNumber CHAR(9),
	TransactionDate SMALLDATETIME,
	Amount MONEY,
	DepositorWithdraw BIT,
	CONSTRAINT fk_Cus_Acc FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber)
)

--3
INSERT INTO Customer VALUES ('1','Nguyen Quang Huy','Ha Noi','Viet Nam','0324567849','nguyenhuy@gmail.com');
INSERT INTO CustomerAccount VALUES ('123456789','1','3500','5000');
INSERT INTO CustomerTransaction VALUES ('1','123456789','2019/02/03','3000','1');

INSERT INTO Customer VALUES ('2','Nguyen Quang Khanh','Thai Nguyen','Viet Nam','0324560348','quangkhanh@gmail.com');
INSERT INTO CustomerAccount VALUES ('123456790','2','3900','5000');
INSERT INTO CustomerTransaction VALUES ('2','123456790','2019/04/23','3500','1');

INSERT INTO Customer VALUES ('3','Nguyen Hai Huyen','Ha Noi','Viet Nam','0324563405','haihuyen123@gmail.com');
INSERT INTO CustomerAccount VALUES ('123456700','3','2000','5000');
INSERT INTO CustomerTransaction VALUES ('3','123456700','2019/10/04','3700','1');

--4
SELECT * FROM Customer WHERE City LIKE 'Ha Noi'

--5
SELECT Name,Phone,Email,AccountNumber,Balance FROM Customer
JOIN CustomerAccount ON
Customer.CustomerId = CustomerAccount.CustomerId

--6
ALTER TABLE CustomerTransaction
ADD CONSTRAINT ck_CheckWithdraw
CHECK (DepositorWithdraw > 0 AND DepositorWithdraw <= 1000000);

--7
CREATE VIEW vCustomerTransactions
AS
SELECT Name,CustomerAccount.AccountNumber,TransactionDate,Amount,DepositorWithdraw FROM Customer
JOIN CustomerAccount ON
Customer.CustomerId = CustomerAccount.CustomerId
JOIN CustomerTransaction ON
CustomerTransaction.AccountNumber = CustomerAccount.AccountNumber;
--
SELECT * FROM vCustomerTransactions
IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example6')
DROP DATABASE Example6
GO
CREATE DATABASE Example6
USE Example6
GO
create table Student(
	StuID int PRIMARY KEY  NOT NULL,
	S_FName varchar(20) not null,
	S_LName varchar(30) not null
)
alter table Student alter column S_FName varchar(30)
CREATE table Course (
	CID int PRIMARY KEY NOT NULL,
	C_Name varchar(30) not null
)

alter table Course add Faclty_LName varchar(30);
alter table Course alter column Faclty_LName varchar not null;
select * from Course
create table Course_Grades(
	CGID int primary key not null,
	Semester char(4) not null,
	CID int not null,
	StuID int not null,
	Grade char(2) not null
	constraint fk_course foreign key(CID) references Course(CID),
	constraint fk_stu foreign key(StuID) references Student(StuID)
)
insert into Student(StuID,S_FName,S_LName) values(12345,'Chris','Rock');
insert into Student(StuID,S_FName,S_LName) values(23456,'Chris','Farley');
insert into Student(StuID,S_FName,S_LName) values(34567,'David','Spade');
insert into Student(StuID,S_FName,S_LName) values(45678,'Liz','Lemon');
insert into Student(StuID,S_FName,S_LName) values(56789,'Jack','Donaghy');
insert into Course(CID,C_Name) values(101001,'Intro to Computers');
insert into Course(CID,C_Name) values(101002,'Programming');
insert into Course(CID,C_Name) values(101003,'Databases');
insert into Course(CID,C_Name) values(101004,'Websites');
insert into Course(CID,C_Name) values(101005,'IS Management');
insert into Course_Grades(CGID,Semester,CID,StuID,Grade) values(2010101,'SP10',101005,34567,'D+');
insert into Course_Grades(CGID,Semester,CID,StuID,Grade) values(2010308,'FA10',101005,34567,'A-');
insert into Course_Grades(CGID,Semester,CID,StuID,Grade) values(2010309,'FA10',101001,45678,'B+');
insert into Course_Grades(CGID,Semester,CID,StuID,Grade) values(2011308,'FA11',101003,23456,'B-');
insert into Course_Grades(CGID,Semester,CID,StuID,Grade) values(2012206,'SU12',101002,56789,'A+');
update Course
set C_Name = 'Intro to Wizardry',Faclty_LName ='Potter'
where CID = 101001;
exec sp_rename 'Course.C_Name', 'Course_Name', 'COLUMN';
select *from Course;
delete from Course where CID = '101004';
drop table Student;
delete from Course;
ALTER TABLE Course_Grades
drop constraint CID
GO
create database Aptech
go
use Aptech
go
create table Class(
	ClassID int primary key,
	ClassName char(6) not null,
	Teacher varchar(30),
	TimeSlot varchar(30) not null,
	Class int,
	Lab int,
)
create unique index MyClusteredIndex
on Class(ClassName)
with (pad_index = on,fillfactor = 70, ignore_dup_key = on);

create nonclustered index TeacherIndex
on class(Teacher);

drop index TeacherIndex
on Class;

create index MyClusteredIndex
on Class(Classname)
with(drop_existing = on,allow_row_locks = on, allow_page_locks = on, maxdop = 2);

create nonclustered index TeacherIndex
on class(Class,Lab);

EXEC sys.sp_helpindex N'Class';
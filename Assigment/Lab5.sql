use ART_GALLERY
go

drop table Materials
drop table Helpers
drop table Distribuitor

create table Materials(
Matid int primary key,
Description varchar(50),
Price int --a2
)


create table Helpers(
Hid int primary key,
HDescription varchar(50),
HPrice int --b2
)

create table Distribuitor(
Did int primary key,
Matid int foreign key references Materials(Matid),
Hid int foreign key references Helpers(Hid)
)


insert into Materials values (1,'Lala',120),(2,'Pampam',670)
insert into Helpers values (1,'Harnic',456),(2,'Ok',345)
insert into Distribuitor values (1,1,1),(2,2,2)

--a

--index scan clustered

select * from Materials
order by Matid

--index seek clustered

select * from Materials
where Matid=2
order by Matid

--index scan nonnclustered

if exists (Select name from sys.indexes where name=N'N_idx_Description')
	drop index N_index_Description on Materials
go

create nonclustered index N_idx_Description on Materials(Description);
go

--index seek nonclustered

select Description
from Materials
where Description='Lala'
go

--key lookup

select *
from Materials with(index=2)
where Description like '%L'

--b

select * 
from Helpers
where HPrice=400

if exists (select name from sys.indexes where name=N'N_idx_Price')
	drop index N_idx_Price on Helpers;
go
create nonclustered index N_idx_Price on Helpers(HPrice);
go

set nocount on;
go
set SHOWPLAN_ALL on;
go

select * from Helpers where HPrice between 200 and 500;
go 

set SHOWPLAN_ALL off 
go

--c

create view test
as
select m.Description, m.Price, h.HDescription, h.HPrice 
from Materials m inner join Distribuitor d on m.Matid=d.Matid
inner join Helpers h on h.Hid=d.Hid
where m.Price between 200 and 500 or h.HPrice between 200 and 500
go

select * from test

if exists (select name from sys.indexes where name=N'N_idx_Name')
	drop index N_idx_Name on Materials 
go
create nonclustered index N_idx_Name on Materials(Description);
go

select m.Description 
from Materials m inner join Distribuitor d on m.Matid=d.Matid
inner join Helpers h on h.Hid=d.Hid
where Price between 200 and 500 or HPrice between 200 and 500

exec sp_helpindex 'Materials'








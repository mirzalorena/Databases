create database test
go

--create tables 

create table Users(
	Uid int primary key,
	UName varchar(50) unique )

create table Currencies(
	Cid int primary key,
	Cname varchar(50),
	Country varchar(50) )

create table Products( 
	Pid int primary key,
	PName varchar(50),
	Price int ,
	Cid int foreign key references Currencies(Cid) )

create table Banknotes(
	Bid int primary key,
	Value int,
	Cid int foreign key references Currencies(Cid) )

create table Transactions(
	Tid int primary key,
	Uid int foreign key references Users(Uid),
	Date date,
	Time time
	)

create table BanknotesList(
	Bid int foreign key references Banknotes(Bid),
	Tid int foreign key references Transactions(Tid),
	--NrOfBanknotes int,
	Constraint pk_BL primary key (Bid,Tid) )

--insert stuff in all of them

insert into Users values (1,'Marcel'),(2,'Ana')
insert into Currencies values (1,'Leu','Romania'),(2,'HUF','Hungary')
insert into Products values (1,'Lala',10,1),(2,'Pam pam',25,2)
insert into Banknotes values (1,10,1),(2,67,2)
insert into Transactions values (1,1,'1978-02-10','14:00:00'), (2,2,'1978-02-15','17:00:00')
insert into BanknotesList values (1,1) , (2,2)

select * from Users
select * from Currencies
select * from Products
select * from Banknotes
select * from Transactions
select * from BanknotesList

--2
alter procedure deleteUser 
	@UserName varchar(50)
as
begin 
		declare @Uid int 
		set @Uid = (select U.Uid from Users U where U.UName=@UserName)
		if @Uid is not null 
		begin 
			declare @Tid int 
			set @Tid =(select T.Tid from Transactions T where T.Uid=@Uid)
			delete from BanknotesList
			where BanknotesList.Tid=Tid

			delete from Transactions
			where Transactions.Uid=@Uid


			delete from Users
			where Users.Uid=@Uid
		end

		if @Uid is null 
		begin 
			print 'Lala'
			return 1
		end
end

exec deleteUser 'Marcel' 
select * from Users
exec deleteUser 'Mara'

insert into Users values (3,'Cori'),(4,'Miau')
insert into Transactions values (3,2,'1978-02-10','14:00:00'), (4,3,'1978-02-15','17:00:00')
insert into Products values (3,'Lal',10,1)

--3
create or alter view CurrencyProductsView
as
	select Currencies.Cname, count(Products.Cid) as nr
	from Currencies
	left join Products on Products.Cid=Currencies.Cid
	group by Currencies.Cname
	
go

select * from CurrencyProductsView

--4

alter function MostActiveUsers()
returns table 
as 
	return 
		select top 2 Users.UName, count(Transactions.Uid) as nr from Users
		left join Transactions on Transactions.Uid=Users.Uid
		group by Users.UName
		
go

select * 
from MostActiveUsers()




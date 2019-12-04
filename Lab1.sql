
drop database if exists ART_GALLERY
create database ART_GALLERY
go
use ART_GALLERY
go

create table Movements(
Mid int primary key,
movement_description varchar(50) NOT NULL)

create table Artists(
Aid int primary key,
Mid int foreign key references Movements(Mid),
name varchar(50),
date_of_birth DATE)

create table Categories(
Cid int primary key,
description varchar(50))

create table Paintings_Status(
Sid int primary key,
description varchar(50))

create table Paintings(
Pid int primary key,
Aid int foreign key references Artists(Aid),
Cid int foreign key references Categories(Cid),
Sid int foreign key references Paintings_Status(Sid),
title varchar(50),
price int,
description varchar(50))

create table Exhibitions(
Eid int primary key,
date_start date,
date_end date)

create table ArtistsExhibitions(
Aid int foreign key references Artists(Aid),
Eid int foreign key references Exhibitions(Eid),
constraint pk_ArtistsExhibitions primary key(Aid,Eid))

create table Events_Workshops(
EWid int primary key,
Aid int foreign key references Artists(Aid),
name varchar(50),
ew_date date)

create table Art_Loans(
ALid int primary key,
Aid int foreign key references Artists(Aid),
due_date date)

create table Sponsors(
Spid int primary key identity,
sponsor_name varchar(50))

create table Sponsorships(
Spid int foreign key references Sponsors(Spid),
EWid int foreign key references Events_Workshops(EWid),
constraint pk_Sponsorships primary key(Spid,EWid))

create table Customers(
Cid int primary key,
Pid int foreign key references Paintings(Pid),
name varchar(50),
payment_method varchar(50))






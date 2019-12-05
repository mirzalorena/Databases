use ART_GALLERY
go

Select * from Paintings
select * from Movements
select * from ArtistsExhibitions
select * from Paintings_Status
select * from Sketches

--modify the type of a column
CREATE procedure version_up_1
as
begin 

Alter table Paintings
Alter column price int NOT NULL

Select * from Paintings

end

create procedure version_down_1
as
begin

alter table Paintings
drop column price

select * from Paintings

end

-- add/remove a column

Create procedure version_up_2
as
begin

--add a column

Alter table Movements
Add Dob date

select * from Movements

end

create procedure version_up_21
as
begin

--add a column

Alter table Movements
Add Date_end date

select * from Movements

end

create procedure version_down_2
as
begin

--remove a column

Alter table Movements
Drop column Dob

select * from Movements

end

-- add/remove a default constraint 

create procedure version_up_3
as
begin

--add a default constraint

Alter table Paintings 
Add constraint df_700 default 700 for price

select * from Paintings

end

create procedure version_down_3
as
begin

--remove a default constraint

alter table Paintings 
drop constraint df_700

select * from Paintings

end

--add/remove a primary key

create procedure version_up_4
as
begin

--remove a primary key

alter table ArtistsExhibitions
drop constraint pk_ArtistsExhibitions

select * from ArtistsExhibitions

end

create procedure version_down_4
as
begin

--add a primary key

Alter table ArtistsExhibitions
Add constraint pk_ArtistsExhibitions PRIMARY KEY(Aid)

select * from ArtistsExhibitions

end

--add/remove a candidate key

create procedure version_up_5
as
begin

--add a candidate key

Alter table Movements
add constraint uk_Movements unique(Mid)

select * from Movements

end

create procedure version_down_5
as
begin

--remove a candidate key

alter table Movements
drop constraint uk_Movements

select * from Movements

end


--add/remove a foreign key

create procedure version_up_6
as
begin

--add a foreign key

Alter table Paintings
add constraint fk_Paintings foreign key(Cid) references Categories(Cid)

select * from Paintings

end

execute version_up_6

--remove a foreign key

create procedure version_down_6
as
begin

alter table Paintings
drop constraint fk_Paintings

select * from Paintings

end

execute version_down_6


--create/remove a table

create procedure version_up_7
as
begin

--create a table

create table Sketches(
Skid int not null primary key,
Title varchar(50) not null
);

select * from Sketches

end

create procedure version_down_7
as
begin

--remove a table

drop table Sketches

end







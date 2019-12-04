use ART_GALLERY
go

-- insert in Movements
insert into Movements(Mid,movement_description) values (1,'Modern Art')
insert into Movements(Mid,movement_description) values (2,'Baroc')
--insert into Movements(Mid,movement_description) values (3,NULL)

select * from Movements

-- insert in Artists
insert into Artists(Aid,Mid,name,date_of_birth) values (1,1,'Dana Soare','1978-02-10')
insert into Artists(Aid,Mid,name,date_of_birth) values (2,2,'Marius Nicoara','1986-10-05')
insert into Artists(Aid,Mid,name,date_of_birth) values (3,1,'Maria Pana','1947-05-07')

select * from Artists

--insert in  Categories
insert into Categories(Cid,description) values (1,'Drawing')
insert into Categories(Cid, description) values (2,'Abstract Art')
insert into Categories(Cid, description) values (3,'Digital')

select * from Categories

--insert in Paitings_Status
insert into Paintings_Status(Sid,description) values (1,'Preservation')
insert into Paintings_Status(Sid,description) values (2,'To sell')

select * from Paintings_Status

--insert in Paintings
insert into Paintings(Pid,Aid,Cid,Sid,title,price,description) values (1,3,1,1,'Empty',560,'static nature')
insert into Paintings(Pid,Aid,Cid,Sid,title,price,description) values (2,2,2,2,'SomethingOrNothing',790,'abstract woman')
insert into Paintings(Pid,Aid,Cid,Sid,title,price,description) values (3,3,1,2,'Emeralda',679,'lala')
insert into Paintings(Pid,Aid,Cid,Sid,title,price,description) values (4,2,2,2,'Erasmus',900,'pam pam')

select * from Paintings

--insert in Exhibitions
insert into Exhibitions(Eid,date_start,date_end) values (1,'2019-08-07','2019-09-09')
insert into Exhibitions(Eid, date_start,date_end) values (2,'2020-01-01','2020-02-01')

select * from Exhibitions

--insert in ArtistsExhibitions
insert into ArtistsExhibitions(Aid,Eid) values (1,1)
insert into ArtistsExhibitions(Aid, Eid) values (2,2)

select * from ArtistsExhibitions
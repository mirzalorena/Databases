use ART_GALLERY
go

--update Artists
UPDATE Artists
set date_of_birth='1976-09-09'
where name Like 'Dana Soare'OR Aid>2
Select * from Artists

UPDATE Artists
set name='Ana Marandio'
where Aid>2 and Name Like 'Maria Pana'
Select * from Artists

--update Movements
UPDATE Movements
set movement_description='New'
where Mid>=2
Select * from Movements

--update Categories
UPDATE Categories
set description='new'
where Cid IS NOT NULL
select * from Categories

--update Paintings
UPDATE Paintings
set description='expensive'
where price between 700 and 800
Select * from Paintings

UPDATE Paintings
set description='not that expensive'
where price in (500, 560,600)
Select * from Paintings




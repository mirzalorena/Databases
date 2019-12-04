use ART_GALLERY
go

--in operator

--the artists with paintings having price>700
Select p.Aid, p.price
From Paintings p
where price>700 and p.Aid in (Select a.Aid From Artists a)

--the artists with paintings that have status 1
Select p.Aid, p.title
From Paintings p
where Sid=1 and p.Aid in (Select a.Aid from Artists a)

--exists operator

--the artists having paintings with price>600
Select p.Aid, p.price
From Paintings p
Where Price>600 and EXISTS (Select * from Artists a where a.Aid=p.Aid)

--artists having paintings with category 2
Select p.Aid, p.title
from Paintings p
where Cid=2 and EXISTS (select * from Artists a where a.Aid=p.Aid)

--from operator

--artists having paintings with price>800
select X.Aid, X.price
From (Select a.Aid, p.title, p.price
	from Artists a inner join Paintings p ON a.Aid=p.Aid
	where price>800) X

--artists having paintings with category 1
select X.Aid, X.title
from( select a.Aid,p.title, p.Cid
	from Artists a inner join Paintings p on a.Aid=p.Aid
	where Cid=1) X


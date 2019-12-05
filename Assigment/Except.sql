use ART_GALLERY
go

--paintings that have the title starting with E but not have the price>700

Select distinct p1.title
From Paintings p1
where title like 'E_%'
Except
Select p2.title
From Paintings p2
where price>700
order by p1.title

--artists that have the name starting with M, but not have the aid 2

Select a1.name
From Artists a1
where name like 'M_%'
EXCEPT Select a2.name
From Artists a2
where aid=2
order by a1.name
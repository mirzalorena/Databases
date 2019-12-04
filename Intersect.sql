use ART_GALLERY
go

--the paintings that have the title starting with t and have the price > 600

Select distinct Paintings.title
From Paintings
Where title like 'E_%'
INTERSECT
Select Paintings.title
From Paintings
Where price>600
Order by Paintings.title

--paintings having the status 1 and description not null

select Paintings.title
From Paintings
where Sid='1'
Intersect
select Paintings.title
From Paintings
where description is not null
order by Paintings.title


use ART_GALLERY
go

--select top 2 paintings that have title starting with E and price>500
Select top 2 *
from Paintings
where title like 'E_%' or price>500

--paintings that have title starting with E and price>500
Select *
From Paintings
Where title like 'E_%'
UNION
Select * 
From Paintings
where price>500

--paintings that have title starting with E and price between 600 and 700
Select *
From Paintings
Where title like 'E_%'
UNION ALL
Select * 
From Paintings
where price between 600 and 700


use ART_GALLERY
go

--delete Artists
Delete from Artists
where name Like 'Dana Soare' or Aid=1
Select * from Artists

--delete Paintings
Delete from Paintings
where price between 700 and 800
Select * from Paintings
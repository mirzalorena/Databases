use ART_GALLERY
go

select *
from Artists a inner join Paintings p on
a.Aid=p.Aid

select *
from Artists a right outer join Paintings p on
a.Aid=p.Aid

select *
from Artists a left outer join Paintings p on
a.Aid=p.Aid

select *
from Artists a full outer join Paintings p on
a.Aid=p.Aid

select distinct *
from Artists a inner join Paintings p on a.Aid=p.Aid
inner join Categories c on c.Cid=p.Cid

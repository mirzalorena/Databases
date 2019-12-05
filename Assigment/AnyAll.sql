use ART_GALLERY
go

--all==max
select p.title,p.price
from Paintings p
where p.price>ALL(Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)

select p.title,p.price
from Paintings p
where p.price>(select MAX(p1.price)
						from Paintings p1
						where p.Pid=p1.Pid)

--any==min
select p.title,p.price
from Paintings p
where p.price>ANY(Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)

select p.title,p.price
from Paintings p
where p.price>(select MIN(p1.price)
						from Paintings p1
						where p.Pid=p1.Pid)

--all==not in
select p.title,p.price
from Paintings p
where p.price<>ALL(Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)
select p.title,p.price
from Paintings p
where p.price not in(Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)

--any==in
select p.title,p.price
from Paintings p
where p.price=ANY(Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)

select TOP 2 p.title,p.price
from Paintings p
where p.price in (Select p1.price
					from Paintings p1
					where p.Pid=p1.Pid)

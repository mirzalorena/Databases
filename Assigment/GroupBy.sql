use ART_GALLERY
go

--group paintings by artist+avg price
select a.Aid, AVG(price)
from Artists a inner join Paintings p on
a.Aid=p.Aid
Group by a.Aid

--for each artist the average price if >=800
select a.Aid, AVG(p.price)
from Artists a inner join Paintings p on
a.Aid=p.Aid
group by a.Aid
having AVG(p.price)>=800

--for each artist the average price if Mid>1
select a.Mid, AVG(p.price) as average
from Artists a inner join Paintings p on
a.Aid=p.Aid
group by a.Mid
having a.Mid>1

--for each exhibition the start and end if it starts and ends in 2019
select e.date_start,e.date_end
from Exhibitions e
group by e.date_start, e.date_end
having e.date_start like '2019_%' and e.date_end like '2019_%'



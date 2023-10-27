select count(*) as set_total_num, year
from (
	select *
	from sets
	where 1950<=sets.year and sets.year<=2017
	)
group by year
order by set_total_num desc
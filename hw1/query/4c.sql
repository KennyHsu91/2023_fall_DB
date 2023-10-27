with cnt(name, theme_num) as(
	select themes.name, count(*)
	from sets, themes
	where sets.theme_id=themes.id
	group by themes.id
)
select name, theme_num
from cnt
order by theme_num desc
limit 1
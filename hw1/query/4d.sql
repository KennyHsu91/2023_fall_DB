select themes.name, avg(sets.num_parts) as avg_num_part
from sets join themes
on sets.theme_id=themes.id
group by themes.id
order by avg_num_part asc
select count(*) as cnt, cn
from(
select distinct inventory_parts.part_num  , colors.name as cn
from inventory_parts, colors
where inventory_parts.color_id=colors.id
order by  inventory_parts.part_num
)
group by cn
order by cnt desc
limit 10
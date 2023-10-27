with qu(in_id,qu_sum,part_num,colorname) as
(
	select
		inventory_parts.inventory_id,
		sum(inventory_parts.quantity),
		inventory_parts.part_num,
		colors.name
	from inventory_parts, colors
	where inventory_parts.color_id = colors.id
	group by 
		colors.id,
		inventory_parts.inventory_id,
		inventory_parts.part_num
),
	t_q(t_id,t_n , cname ,total) as
(
		select 
			sets.theme_id as t_id,
			themes.name as t_n,
			qu.colorname as cname,
			sum(qu.qu_sum) as total
		from qu,inventories,sets,themes
		where 
			qu.in_id=inventories.id and 
			inventories.set_num=sets.set_num and 
			sets.theme_id = themes.id
		group by sets.theme_id, qu.colorname, themes.name
		order by themes.name asc
	)
, maxtotal (m_id,max_tot)as
(
	select t_id, max(total) as max_tot
	from t_q
	group by t_id
)
select t_q.t_n, t_q.cname
from t_q inner join maxtotal on t_q.t_id=maxtotal.m_id and t_q.total = maxtotal.max_tot
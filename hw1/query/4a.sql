select sets.name as sets_name, themes.name as themes_name
from sets join themes
on sets.theme_id = themes.id
where sets.year = 2017
select REVERSE(LEFT(REVERSE(name),LOCATE(' ',REVERSE(name)))) as kind
, count(*) as count
from street
group by kind
order by kind
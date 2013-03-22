select "!ERR!" as status
, x.house_num
, street.name
, CONCAT("claimed by ",GROUP_CONCAT(x.agency order by x.agency separator " and ")) as agencies
from resident_base x
  join resident_base y on (y.agency<>x.agency and y.street_id=x.street_id and y.house_num=x.house_num)
  join street on (street.id=x.street_id)
group by x.house_num,x.street_id
order by street.name,x.house_num,x.agency
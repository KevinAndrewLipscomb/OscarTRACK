-- --
--
-- Commented lines may be uncommented to help resolve disputes later.  They should remain commented when generating data for the detection-assistant.xls spreadsheet.
--
-- --
select "!ERR!" as status
-- , x.name as x_name
-- , y.name as y_name
, x.house_num
, street.name as street
, CONCAT("claimed by ",GROUP_CONCAT(DISTINCT x.agency order by x.agency separator ' and ')) as agencies
-- , IF(x.id_in_agency_system is not null,x.id_in_agency_system,y.id_in_agency_system) as constituent
from resident_base x
  join resident_base y on (y.agency<>x.agency and y.street_id=x.street_id and y.house_num=x.house_num)
  join street on (street.id=x.street_id)
group by x.house_num,x.street_id
order by street.name,x.house_num,x.agency

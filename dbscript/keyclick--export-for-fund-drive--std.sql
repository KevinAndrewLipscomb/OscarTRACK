select CONCAT('KI-',resident_base.id,IF(id_in_agency_system is not null,CONCAT('  X-',id_in_agency_system),'')) as id_clause
, IFNULL(resident_base.name,"TO OUR FRIENDS AT") as name
, 'OR CURRENT RESIDENT' as catchall_line
, IF(
      street.name = "PO BOX"
    ,
      concat(street.name,' ',house_num)
    ,  
      concat(house_num,' ',street.name)
    )
    as address
, city.name as city
, state.abbreviation as state
from resident_base
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
where resident_base.id > 0
  and agency = "VBVRS"                                       -- ADJUST THIS
order by state.abbreviation,city.name,street.name,house_num

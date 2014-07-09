select resident_base.id as contactid
, resident_base.name as name
, IF(
      street.name = "PO BOX"
    ,
      concat(street.name,' ',house_num)
    ,  
      concat(house_num,' ',REPLACE(street.name,' LDNG',' LNDG'))
    )
    as address
, city.name as city
, state.abbreviation as state
from donation
  join resident_base using (id)
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
where resident_base.id > 0
  and date > '2014-05-13'                                      -- ADJUST!
  and agency = 'KVRS'                                          -- ADJUST!
order by state.abbreviation, city.name, street.name, house_num
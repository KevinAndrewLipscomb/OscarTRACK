select resident_base.id as id
, IFNULL(resident_base.name,"TO OUR FRIENDS AT") as name
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
  join donation on (donation.id=resident_base.id)
where resident_base.id > 0
  and agency = "KVRS"                                        -- ADJUST THIS
group by donation.id
  having sum(amount) > 0
order by state.abbreviation,city.name,street.name,house_num
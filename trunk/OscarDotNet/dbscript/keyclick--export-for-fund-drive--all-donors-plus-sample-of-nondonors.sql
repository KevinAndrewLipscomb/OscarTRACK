select CONCAT('KI-',resident_base_id,IF(id_in_agency_system is not null,CONCAT('  X-',id_in_agency_system),'')) as id_clause
, IFNULL(resident_base_name,"TO OUR FRIENDS AT") as name
, 'OR CURRENT RESIDENT' as catchall_line
, IF(
      street.name = "PO BOX"
    ,
      concat(street.name,' ',resident_base_house_num)
    ,  
      concat(resident_base_house_num,' ',street.name)
    )
    as address
, city.name as city
, state.abbreviation as state
from
  (
    (
    select resident_base.id as resident_base_id
    , resident_base.name as resident_base_name
    , resident_base.street_id as resident_base_street_id
    , resident_base.house_num as resident_base_house_num
    , resident_base.id_in_agency_system as id_in_agency_system
    from resident_base
      join donation on (donation.id=resident_base.id)
    where resident_base.id > 0
      and agency = "KVRS"                                                 -- ADJUST THIS
    group by donation.id
      having sum(amount) > 0
    )
  UNION
    (
    select resident_base.id as resident_base_id
    , resident_base.name as resident_base_name
    , resident_base.street_id as resident_base_street_id
    , resident_base.house_num as resident_base_house_num
    , NULL as id_in_agency_system
    from resident_base
      join street on (street.id=resident_base.street_id)
      join city on (city.id=street.city_id)
    where resident_base.id > 0
      and agency = "KVRS"                                                 -- ADJUST THIS
      and resident_base.id not in (select id from donation)
      and city.name = "VIRGINIA BEACH"                                    -- ADJUST THIS
    order by rand()
    limit 10384                                                           -- ADJUST THIS
    )
  )
  as the_union
  join street on (street.id=resident_base_street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
order by state.abbreviation,city.name,street.name,resident_base_house_num

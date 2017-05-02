select agency,address,city,state from 
  (
  select agency
  , concat(house_num," ",street.name) as address
  , city.name as city
  , state.abbreviation as state
  , house_num
  , street.name as street
  from resident_base
    join street on (street.id=resident_base.street_id)
    join city on (city.id=street.city_id)
    join state on (state.id=city.state_id)
  where resident_base.id > 0
    and street.name <> "PO BOX"
    and city.name = "VIRGINIA BEACH"
    and agency in ("OPVRS","DCVRS","CBVRS","PACHVRS","CVRS","KVRS","VBVRS")
  order by RAND()
  limit 10000
  ) as sample
order by state,city,street,house_num,agency

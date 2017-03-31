SELECT DISTINCT IFNULL(resident_base.name,"TO OUR FRIENDS AT") as name
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
FROM donation
  join resident_base on (resident_base.id=donation.id)
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
WHERE date > DATE_ADD(CURDATE(),INTERVAL -1 YEAR)
  and agency = 'KVRS'
  and resident_base.id > 0
group by resident_base.id
order by sum(amount) desc
LIMIT 1000

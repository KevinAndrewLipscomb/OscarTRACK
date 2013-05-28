SELECT DISTINCT IFNULL(resident_base.name,"CURRENT RESIDENT") as name
, concat(house_num,' ',street.name) as address1
, city.name as city
, state.abbreviation as state
FROM donation
  join resident_base on (resident_base.id=donation.id)
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
WHERE date > DATE_ADD(CURDATE(),INTERVAL -1 YEAR)
order by amount desc
LIMIT 1000
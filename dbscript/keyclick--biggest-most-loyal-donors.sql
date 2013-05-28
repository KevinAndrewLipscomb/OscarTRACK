SELECT sum(amount) as sum
, count(donation.date) as loyalty
, resident_base.name
, house_num
, street.name as street
, city.name as city
, state.abbreviation as state
FROM donation
  join resident_base on (resident_base.id=donation.id)
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
where donation.id > 0
  and date >= SUBDATE(CURDATE(),interval 5 year)
  and agency = "KVRS"
  and resident_base.name not like "%*LIFEMEM*%"
group by donation.id
order by sum desc,loyalty desc
limit 350
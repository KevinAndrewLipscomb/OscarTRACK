select distinct r1.house_num
 , street.name
 , city.name
 , state.abbreviation
 , r1.id as r1_id,r1.name as r1_name,r1.year_of_last_appeal_to_become_a_donor as r1_appeal
from resident_base r1
  inner join resident_base r2 on(r2.house_num=r1.house_num and r2.street_id=r1.street_id)
  join street on (street.id=r1.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
where r1.id <> r2.id
order by r1.street_id,house_num,r1.id

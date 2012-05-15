START TRANSACTION
;
SET @current_year := '2012'
;
SET @threshold := '2010'
;
select resident_base.id
, IFNULL(resident_base.name,'CURRENT RESIDENT') as name
, IF(
      street.name = "PO BOX"
    ,
      concat(street.name,' ',house_num)
    ,  
      concat(house_num,' ',street.name)
    )
    as address1
, city.name as city
, state.abbreviation as state
from resident_base
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
where resident_base.id > 0
  and agency = 'KVRS'
  and (year_of_last_appeal_to_become_a_donor is null or year_of_last_appeal_to_become_a_donor < @threshold)
order by state,city,street.name,house_num,id
;
update resident_base
set year_of_last_appeal_to_become_a_donor = @current_year
where (year_of_last_appeal_to_become_a_donor is not null and year_of_last_appeal_to_become_a_donor < @threshold)
;
COMMIT
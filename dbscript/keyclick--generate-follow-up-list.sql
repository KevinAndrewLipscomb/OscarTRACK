SELECT resident_base.id
, IFNULL(resident_base.name,"CURRENT RESIDENT") as name
, concat(house_num,' ',street.name) as address1
, city.name as city
, state.abbreviation as state
FROM resident_base
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
  LEFT JOIN recent_donation on (recent_donation.id=resident_base.id)
WHERE recent_donation.id IS NULL
  and agency='KVRS'
  and 
    (
      year_of_last_appeal_to_become_a_donor is null
    or
      year_of_last_appeal_to_become_a_donor = "2012"  -- UPDATE THE YEAR
    )
  and resident_base.id <> 0
order by state,city,street.name,house_num
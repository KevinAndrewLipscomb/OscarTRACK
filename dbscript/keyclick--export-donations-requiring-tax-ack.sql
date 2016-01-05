select resident_base.name
, IF(street.name = 'PO BOX',concat(street.name,' ',house_num),concat(house_num,' ',street.name)) as address
, city.name
, state.abbreviation as state
, IFNULL(GROUP_CONCAT(email_address),'') as email_address
, amount
, date
, method
, IFNULL(in_mem_of,'') as in_mem_of
, IFNULL(note,'') as note
, entered_by
, per_clerk_seq_num
, timestamp
from resident_base
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
  join donation on (donation.id=resident_base.id)
  left join web_donor on (web_donor.resident_id=resident_base.id)
where agency = 'KVRS'                                                                                       -- !ADJUST!
  and resident_base.id > 0
  and amount >= 250.00
  and date between '2015-01-01' and '2016-01-01'                                                            -- !ADJUST!
group by entered_by,per_clerk_seq_num
order by resident_base.name, date, timestamp

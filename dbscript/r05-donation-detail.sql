select resident_base.name
, concat(house_num,' ',street.name) as address
, amount
, date
, entered_by
, timestamp
from resident_base
  join street on (street.id=resident_base.street_id)
  join donation on (donation.id=resident_base.id)
where agency = 'PACHVRS'
  and timestamp > '2013-07-10 11:15'
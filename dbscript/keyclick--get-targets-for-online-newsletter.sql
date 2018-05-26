select *
from web_donor
  join resident_base on (resident_base.id=web_donor.resident_id)
where agency = 'KVRS'
  and resident_id > 0
  and not be_unsubscribed_from_marketing
order by email_address
--
-- update web_donor
-- set be_unsubscribed_from_marketing = TRUE
-- where email_address = ''

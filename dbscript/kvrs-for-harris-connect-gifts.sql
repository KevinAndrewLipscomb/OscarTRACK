select donation.id as UniqueID
, amount as GiftAmount
, DATE_FORMAT(date,'%m/%d/%Y') as GiftDate
, null as GiftFund
, null as GiftAppealCode
, resident_base.name as GiftFullName
from donation
  join resident_base using (id)
where resident_base.id > 0
  and agency = "KVRS"
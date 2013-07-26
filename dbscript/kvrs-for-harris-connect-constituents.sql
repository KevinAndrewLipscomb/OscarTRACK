select resident_base.id as ID
, null as IMPORTID
, null as DOB
, null as SEX_CODE
, DATE_FORMAT(max(resident_journal.timestamp),'%m/%d/%Y') as DATE_UPD
, resident_base.name as FULLNAME
, null as SALUTATION
, null as PREFIX
, null as FIRST
, null as MIDDLE
, null as LAST
, null as SUFFIX
, null as M_FIRST
, null as M_MIDDLE
, null as M_LAST
, null as SP_PREFIX
, null as SP_FIRST
, null as SP_MIDDLE
, null as SP_LAST
, null as SP_SUFFIX
, null as SP_FULLNAME
, null as SP_DEC
, concat(house_num,' ',street.name) as R_STRT1
, null as R_STRT2
, null as R_STRT3
, city.name as R_CITY
, state.abbreviation as R_STATE
, 'USA' as R_COUNTRY
, null as R_ZIP
, null as PHONE1
, null as PHONE1_TYPE
, null as PHONE2
, null as PHONE2_TYPE
, email_address as E_MAIL
, null as E_MAIL2
from resident_base
  left join resident_journal using(id)
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
  left join web_donor on (web_donor.resident_id=resident_base.id)
where resident_base.id > 0
  and agency = "KVRS"
group by resident_base.id
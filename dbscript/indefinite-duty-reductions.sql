select agency.short_designator
, last_name
, first_name
, cad_num
from member
  join agency on (agency.id=member.agency_id)
  join enrollment_history on (enrollment_history.member_id=member.id)
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
where enrollment_level.description like 'Reduced (%)'
  and end_date is null
order by agency.short_designator, last_name, first_name, cad_num
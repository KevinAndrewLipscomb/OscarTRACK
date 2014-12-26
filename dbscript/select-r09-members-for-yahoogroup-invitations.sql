select CONCAT(first_name,' ',last_name,' <',email_address,'>')
from member
  join enrollment_history on (enrollment_history.member_id=member.id)
where agency_id = 9
  and enrollment_history.end_date is null
  and enrollment_history.level_code in
    (
    select code
    from enrollment_level
    where pecking_order <= 90
    )
  and email_address not like '%@yahoo.com'
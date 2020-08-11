select email_address
from member
  join enrollment_history on (enrollment_history.member_id=member.id)
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
where enrollment_level.pecking_order < 85
  and enrollment_level.pecking_order not in (63,83)
  and enrollment_history.end_date is null
  and member_id not in (select member_id from uniform_issuance where catalog_id = 130) -- 2-1-F-Reusable half-face respirator
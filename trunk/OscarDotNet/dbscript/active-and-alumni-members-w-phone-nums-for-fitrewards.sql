select concat_ws(
  ",",
  cad_num,
  first_name,
  last_name,
  "",
  "",
  "",
  "",
  "",
  "USA",
  IFNULL(email_address,""),
  phone_num,
  "",
  IF(enrollment_level.description = "Retired","Alumni","Active")
  )
  as value
from member
  join enrollment_history on
    (
      enrollment_history.member_id=member.id
    and
      (
        (enrollment_history.start_date <= CURDATE())
      and
        (
          (enrollment_history.end_date is null)
        or
          (enrollment_history.end_date >= LAST_DAY(CURDATE()))
        )
      )
    )
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
where cad_num is not null
  and cad_num not like "9%"
  and phone_num is not NULL
  and enrollment_level.description in ("Applicant","Associate","Regular","Life","Tenured","Atypical","Recruit","Admin","Reduced (1)","Reduced (2)","Reduced (3)","SpecOps","Transferring","Suspended","New trainee","Retired")
order by cad_num
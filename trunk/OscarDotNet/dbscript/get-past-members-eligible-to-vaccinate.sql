select last_name
, first_name
, cad_num
, short_designator as agency
, medical_release_code_description_map.description as medical_release_description
, enrollment_level.description as enrollment
, (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service
, email_address
, phone_num
, IFNULL(concat(phone_num,'@',sms_gateway.hostname),'') as sms_target
from member
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
  join enrollment_history on
    (
      enrollment_history.member_id=member.id
    and
      (
        (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 0 MONTH))
      and
        (
          (enrollment_history.end_date is null)
        or
          (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 0 MONTH)))
        )
      )
    )
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
  join agency on (agency.id=member.agency_id)
  left join sms_gateway on (sms_gateway.id=member.phone_service_id)
where 1=1
  and enrollment_level.description in ('Unknown','Resigned','Retired','Disabled')
  and medical_release_code_description_map.description in ('EMT-ST','EMT-E','AEMT','EMT-CT','EMT-I','EMT-P','EMT-P-RSI','Physician')
order by last_name, first_name, cad_num
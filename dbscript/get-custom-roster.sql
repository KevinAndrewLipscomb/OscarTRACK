select last_name
, first_name
, cad_num
, section_num
, medical_release_code_description_map.description as medical_release_description
, if(be_driver_qualified,'Yes','No') as be_driver_qualified
, enrollment_level.description as enrollment
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
        (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))
      and
        (
          (enrollment_history.end_date is null)
        or
          (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))
        )
      )
    )
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
  left join sms_gateway on (sms_gateway.id=member.phone_service_id)
where agency_id = 9
  and enrollment_level.description in ('Applicant','Associate','EDP','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Recruit','Admin','Reduced (1)','Reduced (2)','Reduced (3)','SpecOps','Transferring','Suspended','New trainee') 
order by last_name, first_name, cad_num
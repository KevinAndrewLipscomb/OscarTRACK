select cad_num as 'Employee ID'
, first_name as 'First Name'
, last_name as 'Last Name'
, email_address as 'Email'
, cad_num as 'User Name'
, 'user' as 'Crew Role'
, 'Main Division' as 'Division'
, 'TRUE' as 'Status'
, phone_num as 'Phone'
from member
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
where agency_id = 9
  and enrollment_level.description in ('Applicant','Associate','EDP','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Recruit','Admin','Reduced (1)','Reduced (2)','Reduced (3)','SpecOps','Transferring','Suspended','New trainee') 
order by last_name, first_name, cad_num
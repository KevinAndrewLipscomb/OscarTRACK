select agency.short_designator
 , concat(member.first_name,' ',member.last_name) as name
 , cad_num
 , IF(medical_release_code_description_map.pecking_order >= 20,'YES','no') as be_released
 , ((condensed_schedule_assignment.member_id is not null) or IF(enrollment_level.description <> 'Atypical',FALSE,NULL)) as be_compliant
 , if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))),num_obliged_shifts,num_shifts) as obliged
 , IFNULL(sum(be_selected),0) as assigned
 , IFNULL(sum(be_selected),0) - if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))),num_obliged_shifts,num_shifts)as balance
from member
  join agency on (agency.id=member.agency_id)
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
  join enrollment_history on
    (
      enrollment_history.member_id=member.id
    and
      (
        (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))
      and
        (
          (enrollment_history.end_date is null)
        or
          (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))
        )
      )
    )
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
  left join leave_of_absence on
    (
      leave_of_absence.member_id=member.id
    and
      (
        (leave_of_absence.start_date is null)
      or
        (
          (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))
        and
          (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))
        )
      )
    )
  left join
    (select distinct member_id from schedule_assignment where MONTH(nominal_day) = MONTH(CURDATE()) + 1) as condensed_schedule_assignment on (condensed_schedule_assignment.member_id=member.id)
  left join schedule_assignment on (schedule_assignment.member_id=member.id and MONTH(nominal_day) = MONTH(CURDATE()) + 1)
where
  (
    ((MONTH(nominal_day) = MONTH(CURDATE()) + 1) or (nominal_day is null))
  and
    (
      (
        enrollment_level.description in ('Recruit','Associate','Regular','Life','Tenured','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')
      and
        if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',2,num_shifts)) > 0
      )
    or
      (enrollment_level.description = 'Atypical')
    )
  and
    (agency.id <> 0)
  )
group by member.id
order by member.agency_id,be_released desc,last_name,first_name,cad_num
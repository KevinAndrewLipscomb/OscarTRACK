SELECT cad_num
  , last_name
  , first_name
  , start_date
  , end_date
  FROM member left join leave_of_absence on (leave_of_absence.member_id=member.id)
  WHERE start_date <= '2006-12-01'
    and end_date >= '2006-12-31'
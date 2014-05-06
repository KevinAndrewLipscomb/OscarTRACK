SELECT case_num
, time_initialized
, address
, assignment
, description
FROM field_situation
  join field_situation_impression on (field_situation_impression.id=field_situation.impression_id)
order by case_num desc, field_situation.id desc
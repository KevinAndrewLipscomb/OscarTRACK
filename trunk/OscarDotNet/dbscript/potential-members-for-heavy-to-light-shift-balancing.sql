select CONCAT(last_name,' ',first_name) as member
, heavy.comment as comment
from schedule_assignment heavy
  join shift heavy_shift on (heavy_shift.id=heavy.shift_id)
  join member on (member.id=heavy.member_id)
  join schedule_assignment light on (light.member_id=heavy.member_id)
  join shift light_shift on (light_shift.id=light.shift_id)
where member.agency_id <> 0
  and heavy.nominal_day = '2019-08-27'                                                        -- !!! ADJUST !!!
  and heavy_shift.name = 'NIGHT'                                                               -- !!! ADJUST !!!
  and heavy.be_selected
  and NOT light.be_selected
  and light.nominal_day = '2019-08-26'                                                        -- !!! ADJUST !!!
  and light_shift.name = 'NIGHT'                                                               -- !!! ADJUST !!!
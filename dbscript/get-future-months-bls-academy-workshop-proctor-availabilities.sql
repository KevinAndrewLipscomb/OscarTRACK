SELECT nominal_day
, name
, last_name
, first_name
, cad_num
, phone_num
, email_address
FROM special_event_avail
  join special_event_shift on (special_event_shift.id=special_event_avail.shift_id)
  join special_event on (special_event.id=special_event_shift.special_event_id)
  join oscardotnetdb.member m on (m.id=special_event_avail.odnmid)
where special_event.description like 'BLS Academy % workshop %'
  and MONTH(nominal_day) in (MONTH(ADDDATE(CURDATE(),INTERVAL 1 MONTH)),MONTH(ADDDATE(CURDATE(),INTERVAL 2 MONTH)))
  and m.be_bls_academy_proctor
order by nominal_day, name, cad_num
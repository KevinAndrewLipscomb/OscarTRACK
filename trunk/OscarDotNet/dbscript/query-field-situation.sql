select id
, incident_date
, incident_num
, incident_address
, reduced.call_sign
, DATE_FORMAT(time_initialized,'%H:%i') as time_initialized
, DATE_FORMAT(time_of_alarm,'%H:%i') as time_of_alarm
, DATE_FORMAT(time_enroute,'%H:%i') as time_enroute
, DATE_FORMAT(time_on_scene,'%H:%i') as time_onscene
, DATE_FORMAT(time_transporting,'%H:%i') as time_transporting
, DATE_FORMAT(time_at_hospital,'%H:%i') as time_at_hospital
, DATE_FORMAT(time_available,'%H:%i') as time_available
from cad_record detail inner join
  (
  SELECT call_sign
  , max(incident_num) as max_incident_num
  FROM cad_record
  where call_sign not in ('ARSN','EYES','FAST','FIGP','MISC')
  group by call_sign
  )
  as reduced
    on (reduced.call_sign=detail.call_sign and reduced.max_incident_num=detail.incident_num)
where time_available is null
order by incident_num desc, id desc
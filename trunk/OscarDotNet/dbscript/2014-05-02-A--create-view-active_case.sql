START TRANSACTION
;
drop view if exists active_case
;
create view active_case as
SELECT id
, incident_date as date
, max(incident_num) as case_num
, incident_address as address
, call_sign as unit
, DATE_FORMAT(time_initialized,'%H:%i') as init
, DATE_FORMAT(time_of_alarm,'%H:%i') as alarm
, DATE_FORMAT(time_enroute,'%H:%i') as enrt
, DATE_FORMAT(time_on_scene,'%H:%i') as onsc
, DATE_FORMAT(time_transporting,'%H:%i') as tprt
, DATE_FORMAT(time_at_hospital,'%H:%i') as hosp
, DATE_FORMAT(time_available,'%H:%i') as avbl
FROM cad_record
where time_available is null
  and call_sign not in ('ARSN','EYES','FAST','FIGP','MISC')
group by call_sign
order by incident_num desc, id desc
;
COMMIT
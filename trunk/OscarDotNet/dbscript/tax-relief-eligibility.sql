select cad_num
, last_name
, first_name
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020),1) as 2020_duty_hours
, FORMAT(((select num_shifts from enrollment_level where code = jan_code) + (select num_shifts from enrollment_level where code = feb_code) + (select num_shifts from enrollment_level where code = mar_code) + (select num_shifts from enrollment_level where code = apr_code) + (select num_shifts from enrollment_level where code = may_code) + (select num_shifts from enrollment_level where code = jun_code) + (select num_shifts from enrollment_level where code = jul_code) + (select num_shifts from enrollment_level where code = aug_code) + (select num_shifts from enrollment_level where code = sep_code) + (select num_shifts from enrollment_level where code = oct_code) + (select num_shifts from enrollment_level where code = nov_code) + (select num_shifts from enrollment_level where code = dec_code))*12,1) as 2020_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020),1)/FORMAT(((select num_shifts from enrollment_level where code = jan_code) + (select num_shifts from enrollment_level where code = feb_code) + (select num_shifts from enrollment_level where code = mar_code) + (select num_shifts from enrollment_level where code = apr_code) + (select num_shifts from enrollment_level where code = may_code) + (select num_shifts from enrollment_level where code = jun_code) + (select num_shifts from enrollment_level where code = jul_code) + (select num_shifts from enrollment_level where code = aug_code) + (select num_shifts from enrollment_level where code = sep_code) + (select num_shifts from enrollment_level where code = oct_code) + (select num_shifts from enrollment_level where code = nov_code) + (select num_shifts from enrollment_level where code = dec_code))*12,1)),'%') as 2020_pct
, (select description from enrollment_level where code = jan_code) as jan_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 1),1) as jan_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = jan_code)*12,1) as jan_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 1),1)/FORMAT((select num_shifts from enrollment_level where code = jan_code)*12,1)),'%') as jan_pct
, (select description from enrollment_level where code = feb_code) as feb_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 2),1) as feb_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = feb_code)*12,1) as feb_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 2),1)/FORMAT((select num_shifts from enrollment_level where code = feb_code)*12,1)),'%') as feb_pct
, (select description from enrollment_level where code = mar_code) as mar_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 3),1) as mar_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = mar_code)*12,1) as mar_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 3),1)/FORMAT((select num_shifts from enrollment_level where code = mar_code)*12,1)),'%') as mar_pct
, (select description from enrollment_level where code = apr_code) as apr_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 4),1) as apr_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = apr_code)*12,1) as apr_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 4),1)/FORMAT((select num_shifts from enrollment_level where code = apr_code)*12,1)),'%') as apr_pct
, (select description from enrollment_level where code = may_code) as may_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 5),1) as may_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = may_code)*12,1) as may_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 5),1)/FORMAT((select num_shifts from enrollment_level where code = may_code)*12,1)),'%') as may_pct
, (select description from enrollment_level where code = jun_code) as jun_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 6),1) as jun_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = jun_code)*12,1) as jun_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 6),1)/FORMAT((select num_shifts from enrollment_level where code = jun_code)*12,1)),'%') as jun_pct
, (select description from enrollment_level where code = jul_code) as jul_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 7),1) as jul_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = jul_code)*12,1) as jul_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 7),1)/FORMAT((select num_shifts from enrollment_level where code = jul_code)*12,1)),'%') as jul_pct
, (select description from enrollment_level where code = aug_code) as aug_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 8),1) as aug_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = aug_code)*12,1) as aug_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 8),1)/FORMAT((select num_shifts from enrollment_level where code = aug_code)*12,1)),'%') as aug_pct
, (select description from enrollment_level where code = sep_code) as sep_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 9),1) as sep_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = sep_code)*12,1) as sep_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 9),1)/FORMAT((select num_shifts from enrollment_level where code = sep_code)*12,1)),'%') as sep_pct
, (select description from enrollment_level where code = oct_code) as oct_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 10),1) as oct_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = oct_code)*12,1) as oct_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 10),1)/FORMAT((select num_shifts from enrollment_level where code = oct_code)*12,1)),'%') as oct_pct
, (select description from enrollment_level where code = nov_code) as nov_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 11),1) as nov_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = nov_code)*12,1) as nov_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 11),1)/FORMAT((select num_shifts from enrollment_level where code = nov_code)*12,1)),'%') as nov_pct
, (select description from enrollment_level where code = dec_code) as dec_enrollment
, FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 12),1) as dec_duty_hours
, FORMAT((select num_shifts from enrollment_level where code = dec_code)*12,1) as dec_obligation
, CONCAT(ROUND(100*FORMAT((select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) from schedule_assignment where member_id = subquery.member_id and YEAR(nominal_day) = 2020 and MONTH(nominal_day) = 12),1)/FORMAT((select num_shifts from enrollment_level where code = dec_code)*12,1)),'%') as dec_pct
from
  (
  select member.id as member_id
  , cad_num
  , last_name
  , first_name
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-01-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jan_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-02-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as feb_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-03-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as mar_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-04-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as apr_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-05-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as may_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-06-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jun_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-07-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jul_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-08-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as aug_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-09-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as sep_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-10-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as oct_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-11-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as nov_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-12-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as dec_code
  from member
  order by last_name, first_name, cad_num
  )
  as subquery
where (jan_code is not null and jan_code <> 23)
  or (feb_code is not null and feb_code <> 23)
  or (mar_code is not null and mar_code <> 23)
  or (apr_code is not null and apr_code <> 23)
  or (may_code is not null and may_code <> 23)
  or (jun_code is not null and jun_code <> 23)
  or (jul_code is not null and jul_code <> 23)
  or (aug_code is not null and aug_code <> 23)
  or (sep_code is not null and sep_code <> 23)
  or (oct_code is not null and oct_code <> 23)
  or (nov_code is not null and nov_code <> 23)
  or (dec_code is not null and dec_code <> 23)

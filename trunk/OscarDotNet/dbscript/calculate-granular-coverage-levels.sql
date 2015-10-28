--
-- Graph into distinct columns
--
select nominal_day
, FORMAT(SUM(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as a1
, FORMAT(SUM(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as a2
, FORMAT(SUM(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as a3
, FORMAT(SUM(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as a4
, FORMAT(SUM(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as b1
, FORMAT(SUM(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as b2
, FORMAT(SUM(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as b3
, FORMAT(SUM(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as b4
, FORMAT(SUM(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as c1
, FORMAT(SUM(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as c2
, FORMAT(SUM(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as c3
, FORMAT(SUM(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as c4
, FORMAT(SUM(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1
, FORMAT(SUM(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d2
, FORMAT(SUM(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d3
, FORMAT(SUM(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d4
, FORMAT(SUM(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as e1
, FORMAT(SUM(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as e2
, FORMAT(SUM(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as e3
, FORMAT(SUM(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as e4
, FORMAT(SUM(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as f1
, FORMAT(SUM(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as f2
, FORMAT(SUM(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as f3
, FORMAT(SUM(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as f4
, FORMAT(SUM(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as g1
, FORMAT(SUM(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as g2
, FORMAT(SUM(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as g3
, FORMAT(SUM(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as g4
, FORMAT(SUM(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as h1
, FORMAT(SUM(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as h2
, FORMAT(SUM(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as h3
, FORMAT(SUM(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as h4
, FORMAT(SUM(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as i1
, FORMAT(SUM(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as i2
, FORMAT(SUM(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as i3
, FORMAT(SUM(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as i4
, FORMAT(SUM(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as j1
, FORMAT(SUM(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as j2
, FORMAT(SUM(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as j3
, FORMAT(SUM(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as j4
, FORMAT(SUM(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as k1
, FORMAT(SUM(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as k2
, FORMAT(SUM(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as k3
, FORMAT(SUM(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as k4
, FORMAT(SUM(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as l1
, FORMAT(SUM(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as l2
, FORMAT(SUM(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as l3
, FORMAT(SUM(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as l4
from schedule_assignment
  join shift on (shift.id=schedule_assignment.shift_id)
  join member on (member.id=schedule_assignment.member_id)
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
where medical_release_code_description_map.pecking_order >= 20
  and be_selected
  and post_id < 200
  and MONTH(nominal_day) = MONTH(CURDATE())
  and shift_id = 1
group by nominal_day

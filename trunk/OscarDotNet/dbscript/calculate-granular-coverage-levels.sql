--
-- Graph into distinct columns
--
select muster_to_logon_timespan
, muster_to_logoff_timespan
, SUM(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as a1
, SUM(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as a2
, SUM(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as a3
, SUM(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as a4
, SUM(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as b1
, SUM(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as b2
, SUM(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as b3
, SUM(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as b4
, SUM(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as c1
, SUM(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as c2
, SUM(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as c3
, SUM(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as c4
, SUM(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as d1
, SUM(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as d2
, SUM(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as d3
, SUM(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as d4
, SUM(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as e1
, SUM(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as e2
, SUM(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as e3
, SUM(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as e4
, SUM(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as f1
, SUM(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as f2
, SUM(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as f3
, SUM(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as f4
, SUM(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as g1
, SUM(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as g2
, SUM(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as g3
, SUM(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as g4
, SUM(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as h1
, SUM(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as h2
, SUM(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as h3
, SUM(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as h4
, SUM(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as i1
, SUM(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as i2
, SUM(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as i3
, SUM(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as i4
, SUM(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as j1
, SUM(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as j2
, SUM(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as j3
, SUM(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as j4
, SUM(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as k1
, SUM(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as k2
, SUM(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as k3
, SUM(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as k4
, SUM(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as l1
, SUM(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as l2
, SUM(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as l3
, SUM(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2 as l4
from schedule_assignment
  join shift on (shift.id=schedule_assignment.shift_id)
  join member on (member.id=schedule_assignment.member_id)
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
where medical_release_code_description_map.pecking_order >= 20
  and be_selected
  and post_id < 200
  and nominal_day = CURDATE()
  and shift_id = 1

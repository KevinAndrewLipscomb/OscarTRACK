--
-- Graph into distinct columns
--
select nominal_day
, d0000,d0015,d0030,d0045,d0100,d0115,d0130,d0145,d0200,d0215,d0230,d0245,d0300,d0315,d0330,d0345,d0400,d0415,d0430,d0445,d0500,d0515,d0530,d0545,d0600,d0615,d0630,d0645,d0700,d0715,d0730,d0745,d0800,d0815,d0830,d0845,d0900,d0915,d0930,d0945,d1000,d1015,d1030,d1045,d1100,d1115,d1130,d1145
, n0000,n0015,n0030,n0045,n0100,n0115,n0130,n0145,n0200,n0215,n0230,n0245,n0300,n0315,n0330,n0345,n0400,n0415,n0430,n0445,n0500,n0515,n0530,n0545,n0600,n0615,n0630,n0645,n0700,n0715,n0730,n0745,n0800,n0815,n0830,n0845,n0900,n0915,n0930,n0945,n1000,n1015,n1030,n1045,n1100,n1115,n1130,n1145
from
  (
  select nominal_day
  , FORMAT(SUM(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0000
  , FORMAT(SUM(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0015
  , FORMAT(SUM(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0030
  , FORMAT(SUM(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0045
  , FORMAT(SUM(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0100
  , FORMAT(SUM(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0115
  , FORMAT(SUM(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0130
  , FORMAT(SUM(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0145
  , FORMAT(SUM(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0200
  , FORMAT(SUM(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0215
  , FORMAT(SUM(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0230
  , FORMAT(SUM(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0245
  , FORMAT(SUM(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0300
  , FORMAT(SUM(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0315
  , FORMAT(SUM(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0330
  , FORMAT(SUM(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0345
  , FORMAT(SUM(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0400
  , FORMAT(SUM(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0415
  , FORMAT(SUM(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0430
  , FORMAT(SUM(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0445
  , FORMAT(SUM(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0500
  , FORMAT(SUM(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0515
  , FORMAT(SUM(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0530
  , FORMAT(SUM(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0545
  , FORMAT(SUM(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0600
  , FORMAT(SUM(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0615
  , FORMAT(SUM(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0630
  , FORMAT(SUM(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0645
  , FORMAT(SUM(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0700
  , FORMAT(SUM(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0715
  , FORMAT(SUM(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0730
  , FORMAT(SUM(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0745
  , FORMAT(SUM(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0800
  , FORMAT(SUM(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0815
  , FORMAT(SUM(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0830
  , FORMAT(SUM(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0845
  , FORMAT(SUM(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0900
  , FORMAT(SUM(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0915
  , FORMAT(SUM(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0930
  , FORMAT(SUM(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d0945
  , FORMAT(SUM(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1000
  , FORMAT(SUM(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1015
  , FORMAT(SUM(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1030
  , FORMAT(SUM(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1045
  , FORMAT(SUM(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1100
  , FORMAT(SUM(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1115
  , FORMAT(SUM(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1130
  , FORMAT(SUM(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as d1145
  from schedule_assignment
    join shift on (shift.id=schedule_assignment.shift_id)
    join member on (member.id=schedule_assignment.member_id)
    join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
  where medical_release_code_description_map.pecking_order >= 20
    and be_selected
    and post_id < 200
    and MONTH(nominal_day) = MONTH(CURDATE())
    and shift.name = 'DAY'
  group by nominal_day
  )
  as granular_coverage_levels_day
join
  (
  select nominal_day
  , FORMAT(SUM(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0000
  , FORMAT(SUM(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0015
  , FORMAT(SUM(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0030
  , FORMAT(SUM(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0045
  , FORMAT(SUM(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0100
  , FORMAT(SUM(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0115
  , FORMAT(SUM(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0130
  , FORMAT(SUM(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0145
  , FORMAT(SUM(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0200
  , FORMAT(SUM(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0215
  , FORMAT(SUM(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0230
  , FORMAT(SUM(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0245
  , FORMAT(SUM(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0300
  , FORMAT(SUM(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0315
  , FORMAT(SUM(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0330
  , FORMAT(SUM(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0345
  , FORMAT(SUM(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0400
  , FORMAT(SUM(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0415
  , FORMAT(SUM(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0430
  , FORMAT(SUM(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0445
  , FORMAT(SUM(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0500
  , FORMAT(SUM(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0515
  , FORMAT(SUM(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0530
  , FORMAT(SUM(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0545
  , FORMAT(SUM(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0600
  , FORMAT(SUM(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0615
  , FORMAT(SUM(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0630
  , FORMAT(SUM(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0645
  , FORMAT(SUM(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0700
  , FORMAT(SUM(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0715
  , FORMAT(SUM(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0730
  , FORMAT(SUM(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0745
  , FORMAT(SUM(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0800
  , FORMAT(SUM(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0815
  , FORMAT(SUM(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0830
  , FORMAT(SUM(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0845
  , FORMAT(SUM(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0900
  , FORMAT(SUM(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0915
  , FORMAT(SUM(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0930
  , FORMAT(SUM(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n0945
  , FORMAT(SUM(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1000
  , FORMAT(SUM(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1015
  , FORMAT(SUM(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1030
  , FORMAT(SUM(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1045
  , FORMAT(SUM(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1100
  , FORMAT(SUM(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1115
  , FORMAT(SUM(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1130
  , FORMAT(SUM(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1145
  from schedule_assignment
    join shift on (shift.id=schedule_assignment.shift_id)
    join member on (member.id=schedule_assignment.member_id)
    join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
  where medical_release_code_description_map.pecking_order >= 20
    and be_selected
    and post_id < 200
    and MONTH(nominal_day) = MONTH(CURDATE())
    and shift.name = 'NIGHT'
  group by nominal_day
  )
  as granular_coverage_levels_night
using (nominal_day)

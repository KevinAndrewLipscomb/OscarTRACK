--
-- Graph into distinct columns
--
select nominal_day
, a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,d1,d2,d3,d4,e1,e2,e3,e4,f1,f2,f3,f4,g1,g2,g3,g4,h1,h2,h3,h4,i1,i2,i3,i4,j1,j2,j3,j4,k1,k2,k3,k4,l1,l2,l3,l4
, m1,m2,m3,m4,n1,n2,n3,n4,o1,o2,o3,o4,p1,p2,p3,p4,q1,q2,q3,q4,r1,r2,r3,r4,s1,s2,s3,s4,t1,t2,t3,t4,u1,u2,u3,u4,v1,v2,v3,v4,w1,w2,w3,w4,x1,x2,x3,x4
from
  (
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
    and shift.name = 'DAY'
  group by nominal_day
  )
  as granular_coverage_levels_day
join
  (
  select nominal_day
  , FORMAT(SUM(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as m1
  , FORMAT(SUM(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as m2
  , FORMAT(SUM(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as m3
  , FORMAT(SUM(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as m4
  , FORMAT(SUM(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n1
  , FORMAT(SUM(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n2
  , FORMAT(SUM(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n3
  , FORMAT(SUM(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as n4
  , FORMAT(SUM(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as o1
  , FORMAT(SUM(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as o2
  , FORMAT(SUM(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as o3
  , FORMAT(SUM(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as o4
  , FORMAT(SUM(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as p1
  , FORMAT(SUM(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as p2
  , FORMAT(SUM(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as p3
  , FORMAT(SUM(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as p4
  , FORMAT(SUM(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as q1
  , FORMAT(SUM(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as q2
  , FORMAT(SUM(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as q3
  , FORMAT(SUM(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as q4
  , FORMAT(SUM(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as r1
  , FORMAT(SUM(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as r2
  , FORMAT(SUM(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as r3
  , FORMAT(SUM(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as r4
  , FORMAT(SUM(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as s1
  , FORMAT(SUM(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as s2
  , FORMAT(SUM(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as s3
  , FORMAT(SUM(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as s4
  , FORMAT(SUM(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as t1
  , FORMAT(SUM(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as t2
  , FORMAT(SUM(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as t3
  , FORMAT(SUM(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as t4
  , FORMAT(SUM(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as u1
  , FORMAT(SUM(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as u2
  , FORMAT(SUM(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as u3
  , FORMAT(SUM(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as u4
  , FORMAT(SUM(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as v1
  , FORMAT(SUM(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as v2
  , FORMAT(SUM(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as v3
  , FORMAT(SUM(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as v4
  , FORMAT(SUM(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as w1
  , FORMAT(SUM(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as w2
  , FORMAT(SUM(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as w3
  , FORMAT(SUM(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as w4
  , FORMAT(SUM(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as x1
  , FORMAT(SUM(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as x2
  , FORMAT(SUM(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as x3
  , FORMAT(SUM(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan))/2,1) as x4
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

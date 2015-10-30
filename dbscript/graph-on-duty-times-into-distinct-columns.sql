--
-- Graph into distinct columns
--
select muster_to_logon_timespan
, muster_to_logoff_timespan
, IF(muster_to_logon_timespan <= CAST('000000' AS TIME) AND CAST('000000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0000
, IF(muster_to_logon_timespan <= CAST('003000' AS TIME) AND CAST('003000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0030
, IF(muster_to_logon_timespan <= CAST('010000' AS TIME) AND CAST('010000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0100
, IF(muster_to_logon_timespan <= CAST('013000' AS TIME) AND CAST('013000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0130
, IF(muster_to_logon_timespan <= CAST('020000' AS TIME) AND CAST('020000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0200
, IF(muster_to_logon_timespan <= CAST('023000' AS TIME) AND CAST('023000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0230
, IF(muster_to_logon_timespan <= CAST('030000' AS TIME) AND CAST('030000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0300
, IF(muster_to_logon_timespan <= CAST('033000' AS TIME) AND CAST('033000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0330
, IF(muster_to_logon_timespan <= CAST('040000' AS TIME) AND CAST('040000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0400
, IF(muster_to_logon_timespan <= CAST('043000' AS TIME) AND CAST('043000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0430
, IF(muster_to_logon_timespan <= CAST('050000' AS TIME) AND CAST('050000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0500
, IF(muster_to_logon_timespan <= CAST('053000' AS TIME) AND CAST('053000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0530
, IF(muster_to_logon_timespan <= CAST('060000' AS TIME) AND CAST('060000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0600
, IF(muster_to_logon_timespan <= CAST('063000' AS TIME) AND CAST('063000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0630
, IF(muster_to_logon_timespan <= CAST('070000' AS TIME) AND CAST('070000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0700
, IF(muster_to_logon_timespan <= CAST('073000' AS TIME) AND CAST('073000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0730
, IF(muster_to_logon_timespan <= CAST('080000' AS TIME) AND CAST('080000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0800
, IF(muster_to_logon_timespan <= CAST('083000' AS TIME) AND CAST('083000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0830
, IF(muster_to_logon_timespan <= CAST('090000' AS TIME) AND CAST('090000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0900
, IF(muster_to_logon_timespan <= CAST('093000' AS TIME) AND CAST('093000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s0930
, IF(muster_to_logon_timespan <= CAST('100000' AS TIME) AND CAST('100000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s1000
, IF(muster_to_logon_timespan <= CAST('103000' AS TIME) AND CAST('103000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s1030
, IF(muster_to_logon_timespan <= CAST('110000' AS TIME) AND CAST('110000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s1100
, IF(muster_to_logon_timespan <= CAST('113000' AS TIME) AND CAST('113000' AS TIME) < muster_to_logoff_timespan,'X',' ') as s1130
from schedule_assignment
  join shift on (shift.id=schedule_assignment.shift_id)
where nominal_day = CURDATE()
  and shift.name = 'DAY'

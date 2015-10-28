--
-- Graph into distinct columns
--
select muster_to_logon_timespan
, muster_to_logoff_timespan
, CONCAT
    (
    IF(ADDTIME(shift.start,'000000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'001500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'003000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'004500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'010000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'011500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'013000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'014500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'020000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'021500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'023000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'024500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'030000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'031500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'033000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'034500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'040000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'041500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'043000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'044500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'050000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'051500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'053000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'054500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'060000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'061500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'063000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'064500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'070000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'071500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'073000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'074500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'080000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'081500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'083000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'084500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'090000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'091500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'093000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'094500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'100000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'101500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'103000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'104500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'110000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'111500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'113000') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' '),
    IF(ADDTIME(shift.start,'114500') BETWEEN ADDTIME(shift.start,muster_to_logon_timespan) AND ADDTIME(shift.start,muster_to_logoff_timespan),'*',' ')
    )
from schedule_assignment
  join shift on (shift.id=schedule_assignment.shift_id)
where nominal_day = CURDATE()
  and shift_id = 1

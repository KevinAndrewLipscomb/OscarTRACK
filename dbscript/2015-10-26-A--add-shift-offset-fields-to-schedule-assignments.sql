START TRANSACTION
;
ALTER TABLE `schedule_assignment` 
  ADD COLUMN `muster_to_logon_timespan` TIME(0) NOT NULL DEFAULT '00:00:00'
,
  ADD COLUMN `muster_to_logoff_timespan` TIME(0) NOT NULL DEFAULT '12:00:00'
;
COMMIT

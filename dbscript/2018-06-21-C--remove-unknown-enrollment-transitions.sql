START TRANSACTION
;
delete from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = 'Unknown')
;
update enrollment_level
set elaboration = 'Do not use if the member is Transferring.  For Life or Tenured members, use "Retired" unless they have indicated a desire to "divorce" themselves from the organization.'
where description = 'Resigned'
;
update enrollment_level
set elaboration = 'Forced out against own wishes by EMS-1 or corporate resolution, or left without complying with obligations'
where description = 'Dismissed'
;
update enrollment_level
set elaboration = 'Stopped reporting to organization.  Member never gave a clear indication of their intentions.'
where description = 'Unknown'
;
COMMIT

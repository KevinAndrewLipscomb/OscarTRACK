START TRANSACTION
;
update enrollment_level
set elaboration = "Use for chiefs and MD members.  Also use when duty obligation is seasonal (for college students, etc) or otherwise unusual."
where description = "Atypical"
;
update enrollment_level
set elaboration = "Use when member should run 1 shift per month per Exceptions clause in EMS Duty Policy."
where description = "Reduced (1)"
;
update enrollment_level
set elaboration = "Use when member should run 2 shifts per month per Exceptions clause in EMS Duty Policy."
where description = "Reduced (2)"
;
update enrollment_level
set elaboration = "Use when member should run 3 shifts per month per Exceptions clause in EMS Duty Policy."
where description = "Reduced (3)"
;
update enrollment_level
set elaboration = 'Do not use if the member is Transferring.  If the member did not clearly resign verbally or in writing, use "Unknown" instead.  For Life or Tenured members, use "Retired" unless they have indicated a desire to "divorce" themselves from the organization.  If the member could have covered their remaining scheduled duties but opted not to, use "Dismissed".'
where description = "Resigned"

;
COMMIT
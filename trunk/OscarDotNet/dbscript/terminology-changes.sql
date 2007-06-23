START TRANSACTION;

update enrollment_level
set description = 'Unknown'
where code = 16;

update enrollment_level
set elaboration = REPLACE(elaboration,'member disengaged on own accord','member left on own accord')
where code = 12;

update enrollment_level
set elaboration = REPLACE(elaboration,'enrollment','membership')
where code = 21;

update enrollment_level
set elaboration = REPLACE(elaboration,'Disengaged','Unknown');

update enrollment_level
set elaboration = REPLACE(elaboration,'disengaged','unknown');

update enrollment_level
set elaboration = REPLACE(elaboration,'level','status');

COMMIT
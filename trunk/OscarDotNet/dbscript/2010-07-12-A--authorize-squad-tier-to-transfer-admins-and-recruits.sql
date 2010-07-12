START TRANSACTION;

update enrollment_transition
set authorized_tier_id = 2
where authorized_tier_id = 1;

COMMIT
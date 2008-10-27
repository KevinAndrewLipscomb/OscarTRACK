START TRANSACTION;

insert enrollment_transition
set current_level_code = 20,
  valid_next_level_code = 16,
  authorized_tier_id = 2;

delete from enrollment_transition
where valid_next_level_code = 21;

COMMIT
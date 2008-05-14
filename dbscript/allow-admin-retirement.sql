start transaction;

update enrollment_transition
set required_historical_level_code = null
where current_level_code = 1
  and valid_next_level_code = 12;

commit
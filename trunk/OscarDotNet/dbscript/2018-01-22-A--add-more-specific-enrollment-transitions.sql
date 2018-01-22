START TRANSACTION
;
update enrollment_transition
set disallowed_historical_level_code = 3
where current_level_code = 1
  and required_historical_level_code is null
  and disallowed_historical_level_code is null
  and valid_next_level_code = 2
;
COMMIT

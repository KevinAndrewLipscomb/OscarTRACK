START TRANSACTION
;
insert ignore enrollment_transition
select (select code from enrollment_level where description = 'EDP') as current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, valid_next_level_code
, 1 as authorized_tier_id
from enrollment_transition
where current_level_code = (select code from enrollment_level where description = 'Staff')
  and valid_next_level_code not in (select code from enrollment_level where description in ('ALS Intern'))
;
insert ignore enrollment_transition
select current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, (select code from enrollment_level where description = 'EDP') as valid_next_level_code
, 1 as authorized_tier_id
from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = 'Staff')
  and current_level_code not in (select code from enrollment_level where description in ('ALS Intern','New trainee','Reduced (1)','Reduced (2)','Reduced (3)','Unknown'))
;
COMMIT
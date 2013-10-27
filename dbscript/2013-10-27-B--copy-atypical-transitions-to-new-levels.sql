START TRANSACTION
;
insert ignore enrollment_transition
select (select code from enrollment_level where description = "Staff") as current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, valid_next_level_code
, authorized_tier_id
from enrollment_transition
where current_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition
select (select code from enrollment_level where description = "ALS Intern") as current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, valid_next_level_code
, authorized_tier_id
from enrollment_transition
where current_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition
select (select code from enrollment_level where description = "College") as current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, valid_next_level_code
, authorized_tier_id
from enrollment_transition
where current_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition
select current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, (select code from enrollment_level where description = "Staff") as valid_next_level_code
, authorized_tier_id
from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition
select current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, (select code from enrollment_level where description = "ALS Intern") as valid_next_level_code
, authorized_tier_id
from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition
select current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, (select code from enrollment_level where description = "College") as valid_next_level_code
, authorized_tier_id
from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = "Atypical")
;
insert ignore enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values
((select code from enrollment_level where description = "Atypical"),null,null,(select code from enrollment_level where description = "Staff"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "Atypical"),null,null,(select code from enrollment_level where description = "ALS Intern"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "Atypical"),null,null,(select code from enrollment_level where description = "College"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "Staff"),null,null,(select code from enrollment_level where description = "Atypical"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "Staff"),null,null,(select code from enrollment_level where description = "ALS Intern"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "Staff"),null,null,(select code from enrollment_level where description = "College"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "ALS Intern"),null,null,(select code from enrollment_level where description = "Atypical"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "ALS Intern"),null,null,(select code from enrollment_level where description = "Staff"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "ALS Intern"),null,null,(select code from enrollment_level where description = "College"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "College"),null,null,(select code from enrollment_level where description = "Atypical"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "College"),null,null,(select code from enrollment_level where description = "Staff"),(select id from tier where name = "Squad")),
((select code from enrollment_level where description = "College"),null,null,(select code from enrollment_level where description = "ALS Intern"),(select id from tier where name = "Squad"))
;
update enrollment_transition
set required_historical_level_code = valid_next_level_code
where current_level_code = (select code from enrollment_level where description = "Unknown")
  and required_historical_level_code = (select code from enrollment_level where description = "Atypical")
;
COMMIT
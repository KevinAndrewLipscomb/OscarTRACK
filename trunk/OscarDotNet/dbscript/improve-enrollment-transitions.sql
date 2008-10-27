START TRANSACTION;

insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (20,NULL,NULL,16,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,NULL,3,2,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,NULL,4,2,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,3,4,3,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,4,NULL,4,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,NULL,NULL,5,2);
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values (10,NULL,NULL,6,2);

delete from enrollment_transition where valid_next_level_code = 21;

COMMIT
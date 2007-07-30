SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT=0;
START TRANSACTION;

delete from enrollment_level
where description = 'Withdrew application';

insert enrollment_level
set description = 'Withdrew application',
  num_shifts = 0,
  pecking_order = 125,
  elaboration = 'Self-explanatory',
  core_ops_commitment_level_code = 1;

delete from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = 'Withdrew application')
  or current_level_code = (select code from enrollment_level where description = 'Withdrew application');

insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code) values
(17,NULL,NULL,(select code from enrollment_level where description = 'Withdrew application')),
((select code from enrollment_level where description = 'Withdrew application'),NULL,NULL,17);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT=0;
START TRANSACTION;

delete from enrollment_level
where description = 'Suspended';

insert enrollment_level
set description = 'Suspended',
  num_shifts = 0,
  pecking_order = 95,
  elaboration = 'as described in Corrective Action Policy';

delete from enrollment_transition
where valid_next_level_code = 19
  or current_level_code = 19;

insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code) values
(1,NULL,NULL,19),
(2,NULL,NULL,19),
(3,NULL,NULL,19),
(4,NULL,NULL,19),
(5,NULL,NULL,19),
(6,NULL,NULL,19),
(7,NULL,NULL,19),
(8,NULL,NULL,19),
(9,NULL,NULL,19),
(10,NULL,NULL,19),
(18,NULL,NULL,19),
(19,NULL,NULL,1),
(19,2,3,2),
(19,3,4,3),
(19,4,NULL,4),
(19,NULL,NULL,5),
(19,NULL,NULL,6),
(19,2,NULL,7),
(19,2,4,8),
(19,2,3,9),
(19,NULL,NULL,10),
(19,NULL,NULL,11),
(19,3,NULL,12),
(19,NULL,NULL,13),
(19,NULL,NULL,14),
(19,NULL,NULL,15),
(19,NULL,NULL,16),
(19,NULL,NULL,18);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
update enrollment_level
  set elaboration = 'In the process of switching affiliation WITHIN the system.  Temporarily relieves member from duty obligation.'
  where code = 20;
insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code) values
(4,NULL,NULL,20),
(3,NULL,NULL,20),
(2,NULL,NULL,20),
(9,NULL,NULL,20),
(8,NULL,NULL,20),
(7,NULL,NULL,20),
(6,NULL,NULL,20),
(5,NULL,NULL,20),
(18,NULL,NULL,20),
(20,4,NULL,4),
(20,3,4,3),
(20,2,3,2),
(20,2,3,9),
(20,2,4,8),
(20,2,NULL,7),
(20,NULL,NULL,6),
(20,NULL,NULL,5),
(20,NULL,NULL,18),
(20,NULL,NULL,1);
ALTER TABLE officership MODIFY COLUMN `end_date` DATE;
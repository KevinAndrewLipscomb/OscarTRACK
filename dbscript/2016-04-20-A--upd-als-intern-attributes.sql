START TRANSACTION
;
UPDATE `enrollment_level`
SET `num_shifts`='2'
, elaboration = 'Member runs 2 ambulance duties assigned in the normal manner, plus ALS Intern duties assigned by department.'
WHERE description = 'ALS Intern'
;
COMMIT

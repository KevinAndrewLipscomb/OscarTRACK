START TRANSACTION;

INSERT INTO enrollment_level (code, description, num_shifts, pecking_order, elaboration) VALUES
(17, 'Applicant', 0, 88, 'Has submitted an application that has not yet been completely approved.  Has not been issued any kind of ID card.');

INSERT INTO enrollment_transition (current_level_code, required_historical_level_code, disallowed_historical_level_code, valid_next_level_code) VALUES
(17, NULL, NULL, 10);

update enrollment_level
  set elaboration = 'As defined in EMS Duty Policy.  Has been issued a white ID card.'
  where description = 'Regular';

update enrollment_level
  set elaboration = 'Has been issued a red or yellow ID card.'
  where description = 'Recruit';

COMMIT;
START TRANSACTION;

INSERT INTO enrollment_transition (current_level_code, required_historical_level_code, disallowed_historical_level_code, valid_next_level_code) VALUES
(17, NULL, NULL, 13),
(17, NULL, NULL, 14),
(17, NULL, NULL, 16);

COMMIT;
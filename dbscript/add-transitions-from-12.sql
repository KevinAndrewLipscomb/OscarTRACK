START TRANSACTION;

INSERT INTO enrollment_transition
  (current_level_code, required_historical_level_code, disallowed_historical_level_code, valid_next_level_code) VALUES
(16, NULL, NULL, 1),
(16, 2, 3, 2),
(16, 3, 4, 3),
(16, 4, NULL, 4),
(16, 2, NULL, 5),
(16, 5, NULL, 5),
(16, 6, NULL, 6),
(16, 2, NULL, 7),
(16, 2, 4, 8),
(16, 2, 3, 9),
(16, NULL, NULL, 11),
(16, 3, NULL, 12),
(16, NULL, NULL, 13),
(16, 1, NULL, 14),
(16, 2, NULL, 14),
(16, 10, NULL, 14),
(16, NULL, NULL, 15),
(16, 1, NULL, 19),
(16, 2, NULL, 19);

COMMIT
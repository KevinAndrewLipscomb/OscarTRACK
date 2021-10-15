START TRANSACTION
;
ALTER TABLE `member` 
  ADD COLUMN `became_test_candidate_date` DATE NULL
;
COMMIT
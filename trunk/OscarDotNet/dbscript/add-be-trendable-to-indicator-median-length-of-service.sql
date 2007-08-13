START TRANSACTION;

ALTER TABLE indicator_median_length_of_service
ADD COLUMN be_trendable BOOLEAN NOT NULL DEFAULT 0 FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`be_trendable`, `year`, `month`, `be_agency_id_applicable`, `agency_id`);

ALTER TABLE journal
MODIFY COLUMN `action` VARCHAR(4095) NOT NULL;

COMMIT;


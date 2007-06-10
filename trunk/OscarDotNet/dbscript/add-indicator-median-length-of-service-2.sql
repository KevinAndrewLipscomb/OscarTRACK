ALTER TABLE indicator_median_length_of_service
  DROP COLUMN id,
  MODIFY COLUMN agency_id INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN be_agency_id_applicable BOOLEAN NOT NULL AFTER month,
  DROP PRIMARY KEY,
  DROP INDEX year_month_agency_id,
  ADD PRIMARY KEY(year,month,be_agency_id_applicable,agency_id);

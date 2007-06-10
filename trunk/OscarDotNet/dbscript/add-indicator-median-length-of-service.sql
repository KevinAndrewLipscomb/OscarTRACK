-- --------------------------------------------------------

--
-- Table structure for table `indicator_median_length_of_service`
--

DROP TABLE IF EXISTS indicator_median_length_of_service;
CREATE TABLE IF NOT EXISTS indicator_median_length_of_service (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` INTEGER UNSIGNED NOT NULL,
  `month` TINYINT UNSIGNED NOT NULL,
  `agency_id` INTEGER UNSIGNED,
  `m` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY(`id`),
  UNIQUE `year_month_agency_id`(`year`, `month`, `agency_id`)
) ENGINE = InnoDB;


--
-- Constraints for table `indicator_median_length_of_service`
--
ALTER TABLE indicator_median_length_of_service
  ADD CONSTRAINT agency_id FOREIGN KEY agency_id (agency_id) REFERENCES agency (id);

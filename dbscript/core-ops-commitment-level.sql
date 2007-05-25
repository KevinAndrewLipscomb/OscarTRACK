START TRANSACTION;

CREATE TABLE core_ops_commitment_level (
  `code` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE INDEX name(`name`)
)
ENGINE = InnoDB;

insert core_ops_commitment_level (`name`) values
('None'),
('Limited'),
('Standard');

ALTER TABLE enrollment_level
  ADD COLUMN core_ops_commitment_level_code INTEGER UNSIGNED NOT NULL,
  ADD INDEX core_ops_commitment_level_code(core_ops_commitment_level_code);

update enrollment_level set core_ops_commitment_level_code = 1;
update enrollment_level set core_ops_commitment_level_code = 3
  where num_shifts > 0 or num_shifts is null;
update enrollment_level set core_ops_commitment_level_code = 2
  where code = 5
    or code = 6
    or code = 7
    or code = 8
    or code = 9;

ALTER TABLE enrollment_level
  ADD CONSTRAINT FOREIGN KEY (core_ops_commitment_level_code) REFERENCES core_ops_commitment_level (code);

COMMIT;
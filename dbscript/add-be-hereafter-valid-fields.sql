START TRANSACTION;

ALTER TABLE `medical_release_code_description_map`
  ADD COLUMN `be_hereafter_valid` BOOLEAN NOT NULL DEFAULT TRUE,
  ADD INDEX `be_hereafter_valid`(`be_hereafter_valid`);

update medical_release_code_description_map
set be_hereafter_valid = FALSE
where description in ("EMT-ST","EMT-CT");

ALTER TABLE `enrollment_level`
  ADD COLUMN `be_hereafter_valid` BOOLEAN NOT NULL DEFAULT TRUE,
  ADD INDEX `be_hereafter_valid`(`be_hereafter_valid`);

update enrollment_level
set be_hereafter_valid = FALSE
where description = "New trainee";

COMMIT
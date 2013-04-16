START TRANSACTION
;
ALTER TABLE `care_skill`
  ADD COLUMN `tier` TINYINT UNSIGNED NOT NULL DEFAULT 2
,
  ADD INDEX `tier` (`tier` ASC, `description` ASC)
;
update care_skill set description = "Team member assist", tier = 1 where description = "Teamwork"
;
update care_skill set description = "Team leader (AIC)", tier = 1 where description = "Team leadership"
;
COMMIT
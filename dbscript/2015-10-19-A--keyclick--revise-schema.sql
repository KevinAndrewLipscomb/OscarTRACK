START TRANSACTION
;
ALTER TABLE `donation` 
  ADD COLUMN `be_interested_in_patient_care` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0
,
  ADD COLUMN `be_interested_in_support` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0
,
  ADD COLUMN `be_interested_in_volunteering` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0
,
  ADD COLUMN `be_interested_in_bequesting` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0
,
  CHANGE COLUMN `method` `method` ENUM('BIZREPLY', 'INMEMOF', 'UNSOLICITED', 'WEB', 'LOVELETTER') NOT NULL DEFAULT 'BIZREPLY'
;
update donation set be_interested_in_patient_care = TRUE where prospectivity = 'RESCUE'
;
update donation set be_interested_in_support = TRUE where prospectivity = 'SUPPORT'
;
ALTER TABLE `donation` DROP COLUMN prospectivity
;
DROP TABLE `prospectivity`
;
alter table method change column description description VARCHAR(63) NOT NULL DEFAULT ''
;
UPDATE `method` SET `enumeral`='BIZREPLY', `description`='Business Reply to Fund Drive Appeal' WHERE `agency`='KVRS' and`cardinality`='0'
;
update method set cardinality = 4 where cardinality = 3
;
update method set cardinality = 3 where cardinality = 2
;
update method set cardinality = 2 where cardinality = 1
;
INSERT INTO `method` (`agency`, `enumeral`, `description`, `cardinality`) VALUES ('KVRS', 'LOVELETTER', 'Business Reply to Love Letter', '1');
;
update donation set method = 'LOVELETTER' where note like '%love%letter%'
;
COMMIT

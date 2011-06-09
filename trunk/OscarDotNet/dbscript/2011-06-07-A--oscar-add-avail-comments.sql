START TRANSACTION
;
CREATE  TABLE `avail_comment`
  (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `month` enum('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC') NOT NULL DEFAULT 'JAN',
  `last_name` VARCHAR(32) NOT NULL ,
  `first_name` VARCHAR(32) NOT NULL ,
  `timestamp` TIMESTAMP NOT NULL ,
  `coord_agency` enum('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs') NOT NULL DEFAULT 'EMS',
  `shift_designator` enum('d','n') NOT NULL DEFAULT 'd',
  `nominal_day_of_month` TINYINT UNSIGNED NOT NULL DEFAULT '1',
  `comment` VARCHAR(9) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `practical` (`month` ASC, `last_name` ASC, `first_name` ASC, `timestamp` ASC, `coord_agency` ASC, `shift_designator` ASC, `nominal_day_of_month` ASC)
  )
;
COMMIT
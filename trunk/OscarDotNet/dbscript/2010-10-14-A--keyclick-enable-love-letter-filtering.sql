START TRANSACTION;

CREATE  TABLE `scene_visited` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `love_letter_batch_designator` VARCHAR(9) NOT NULL ,
  `address` VARCHAR(63) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `love_letter_batch_designator` (`love_letter_batch_designator` ASC) );

CREATE  TABLE `love_letter_batch` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `designator` VARCHAR(9) NULL ,
  `immune_scene_visits_factor` FLOAT UNSIGNED NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `designator_UNIQUE` (`designator` ASC) );

COMMIT
START TRANSACTION
;
CREATE  TABLE `melodrama`
  (
  `subject_member_id` INT UNSIGNED NOT NULL
  , `object_member_id` INT UNSIGNED NOT NULL
  , `be_friendly` TINYINT(1)  NOT NULL
  , UNIQUE INDEX `subject_member` (`subject_member_id` ASC, `object_member_id` ASC)
  , UNIQUE INDEX `object_member` (`object_member_id` ASC, `subject_member_id` ASC)
  , INDEX `be_friendly` (`be_friendly` ASC)
  , CONSTRAINT `subject_member_id` FOREIGN KEY (`subject_member_id` ) REFERENCES `member` (`id` )
  , CONSTRAINT `object_member_id` FOREIGN KEY (`object_member_id` ) REFERENCES `member` (`id` )
  )
;
COMMIT
START TRANSACTION
;
CREATE  TABLE `efficipay_docket`
  (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `num` BIGINT UNSIGNED NOT NULL ,
  `be_ready_for_review` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `signer_1_member_id` INT UNSIGNED NULL ,
  `signer_2_member_id` INT UNSIGNED NULL ,
  `expiration_date` DATE NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `num` (`num` ASC) ,
  INDEX `be_ready_for_review` (`be_ready_for_review` ASC) ,
  INDEX `signer_1_member_id` (`signer_1_member_id` ASC) ,
  INDEX `signer_2_member_id` (`signer_2_member_id` ASC) ,
  INDEX `expiration_date` (`expiration_date` ASC) ,
  CONSTRAINT `signer_1_member_id` FOREIGN KEY (`signer_1_member_id` ) REFERENCES `member` (`id` ),
  CONSTRAINT `signer_2_member_id` FOREIGN KEY (`signer_2_member_id` ) REFERENCES `member` (`id` )
  )
;
COMMIT
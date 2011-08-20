START TRANSACTION
;
DROP TABLE IF EXISTS `efficipay_docket`
;
CREATE TABLE IF NOT EXISTS `efficipay_docket`
  (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `agency_id` INT UNSIGNED NOT NULL ,
  `num` BIGINT UNSIGNED NOT NULL ,
  `attachment_key` CHAR(19) NOT NULL ,
  `be_ready_for_review` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `signer_1_member_id` INT UNSIGNED NULL ,
  `signer_2_member_id` INT UNSIGNED NULL ,
  `expiration_date` DATE NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `practical` (`agency_id` ASC, `num` ASC) ,
  UNIQUE INDEX `attachment_key` (`attachment_key` ASC) ,
  INDEX `be_ready_for_review` (`be_ready_for_review` ASC) ,
  INDEX `signer_1_member_id` (`signer_1_member_id` ASC) ,
  INDEX `signer_2_member_id` (`signer_2_member_id` ASC) ,
  INDEX `expiration_date` (`expiration_date` ASC) ,
  CONSTRAINT `efficipay_docket_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` ),
  CONSTRAINT `efficipay_docket_signer_1_member_id` FOREIGN KEY (`signer_1_member_id` ) REFERENCES `member` (`id` ),
  CONSTRAINT `efficipay_docket_signer_2_member_id` FOREIGN KEY (`signer_2_member_id` ) REFERENCES `member` (`id` )
  )
;
insert ignore role (name,tier_id,pecking_order) values
("Squad Treasurer",2,24000),
("Squad Bookkeeper",2,24100),
("Squad Check Signer",2,24200)
;
insert ignore privilege (name) values
("create-efficipay-docket"),
("sign-efficipay-docket")
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "create-efficipay-docket"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "create-efficipay-docket"),(select id from role where name = "Squad Treasurer")),
((select id from privilege where name = "create-efficipay-docket"),(select id from role where name = "Squad Bookkeeper")),
((select id from privilege where name = "sign-efficipay-docket"),(select id from role where name = "Squad Check Signer"))
;
COMMIT

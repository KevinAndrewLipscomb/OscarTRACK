START TRANSACTION
;
DROP TABLE IF EXISTS uniform_issuance
;
CREATE TABLE IF NOT EXISTS uniform_issuance
  (
  id SERIAL,
  member_id INTEGER UNSIGNED NOT NULL,
  date DATE NOT NULL,
  catalog_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(id)
  )
  ENGINE = InnoDB
;
ALTER TABLE `uniform_issuance` 
  ADD INDEX `member_id` (`member_id` ASC)
,
  ADD INDEX `catalog_id` (`catalog_id` ASC)
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_issuance` 
  ADD CONSTRAINT `uniform_issuance_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
,
  ADD CONSTRAINT `uniform_issuance_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `uniform_catalog` (`id`)
;
COMMIT

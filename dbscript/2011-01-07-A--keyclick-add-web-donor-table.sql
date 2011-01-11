START TRANSACTION
;
alter table donation drop foreign key donation_id_resident_id
;
ALTER TABLE `donation` CHANGE COLUMN `id` `id` INT NOT NULL DEFAULT '0'
;
ALTER TABLE `resident_base` CHANGE COLUMN `id` `id` INT NOT NULL DEFAULT '0'
;
INSERT INTO `resident_base` (`id`, `name`, year_of_last_appeal_to_become_a_donor, `house_num`, `street_id`) VALUES ('-1', 'SEE-WEB-DONOR-TABLE', NULL, '1', '1')
;
CREATE  TABLE if not exists `web_donor` (
  `id` SERIAL ,
  `email_address` VARCHAR(63) NOT NULL ,
  `resident_id` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email_address` (`email_address` ASC),
  constraint web_donor_resident_id foreign key (resident_id) references resident_base (id)
  )
;
alter table donation
  add CONSTRAINT `donation_id_resident_id` FOREIGN KEY (`id`) REFERENCES `resident_base` (`id`) ON DELETE CASCADE,
  add column web_donor_id bigint unsigned,
  add constraint donation_web_donor_id foreign key (web_donor_id) references web_donor (id) on delete cascade
;
COMMIT

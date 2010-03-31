START TRANSACTION;

ALTER TABLE `resident` ADD COLUMN `year_of_last_appeal_to_become_a_donor` YEAR NULL DEFAULT 2008;

update resident
set year_of_last_appeal_to_become_a_donor = 2009
where id >= 37000;

update resident
set year_of_last_appeal_to_become_a_donor = null
where name like "%*LIFEMEM*%"
  or name like "%*HONMEM*%";

update resident join donation using (id)
set year_of_last_appeal_to_become_a_donor = null;

COMMIT
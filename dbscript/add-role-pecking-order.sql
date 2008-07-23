START TRANSACTION;

ALTER TABLE `role`
  ADD COLUMN `pecking_order` INTEGER UNSIGNED NOT NULL;

update role set name = "Foundation Newsletter Liaison" where name = "Association Newsletter Editor";

update role set pecking_order = 10100 where name = "Department Authority";
update role set pecking_order = 10200 where name = "All-Squad NGO Leader";
update role set pecking_order = 10300 where name = "Department Human Resources Officer";
update role set pecking_order = 10400 where name = "Department BLS ID Coordinator";
update role set pecking_order = 10500 where name = "Department ALS ID Coordinator";
update role set pecking_order = 10600 where name = "Department Scheduler";
update role set pecking_order = 10700 where name = "Department Schedule Auditor";
update role set pecking_order = 10800 where name = "Department Analyst";
update role set pecking_order = 10900 where name = "Foundation Newsletter Liaison";
update role set pecking_order = 11000 where name = "Application Administrator";
update role set pecking_order = 21100 where name = "Squad Commander";
update role set pecking_order = 21200 where name = "Squad Manager";
update role set pecking_order = 21300 where name = "Squad Membership Coordinator";
update role set pecking_order = 21400 where name = "Squad Scheduler";
update role set pecking_order = 21500 where name = "Squad Training Officer";
update role set pecking_order = 21600 where name = "Squad Analyst";
update role set pecking_order = 31700 where name = "Squad Section Sergeant";
update role set pecking_order = 91800 where name = "Member";

ALTER TABLE `role`
  ADD UNIQUE `pecking_order`(`pecking_order`);

COMMIT
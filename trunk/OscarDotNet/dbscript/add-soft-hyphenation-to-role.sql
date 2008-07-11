START TRANSACTION;

ALTER TABLE `role`
  ADD COLUMN `soft_hyphenation_text` VARCHAR(127);

update role set soft_hyphenation_text = "Ap&shy;pli&shy;ca&shy;tion Ad&shy;min&shy;is&shy;tra&shy;tor" where name = "Application Administrator";
update role set soft_hyphenation_text = "De&shy;part&shy;ment Au&shy;thor&shy;i&shy;ty" where name = "Department Authority";
update role set soft_hyphenation_text = "De&shy;part&shy;ment Hu&shy;man Re&shy;sourc&shy;es Of&shy;fi&shy;cer" where name = "Department Human Resources Officer";
update role set soft_hyphenation_text = "De&shy;part&shy;ment BLS ID Co&shy;or&shy;di&shy;na&shy;tor" where name = "Department BLS ID Coordinator";
update role set soft_hyphenation_text = "De&shy;part&shy;ment An&shy;a&shy;lyst" where name = "Department Analyst";
update role set soft_hyphenation_text = "Squad Com&shy;mand&shy;er" where name = "Squad Commander";
update role set soft_hyphenation_text = "Squad Sec&shy;tion Ser&shy;geant" where name = "Squad Section Sergeant";
update role set soft_hyphenation_text = "Squad Train&shy;ing Of&shy;fi&shy;cer" where name = "Squad Training Officer";
update role set soft_hyphenation_text = "Squad Mem&shy;ber&shy;ship Co&shy;or&shy;di&shy;na&shy;tor" where name = "Squad Membership Coordinator";
update role set soft_hyphenation_text = "Squad An&shy;a&shy;lyst" where name = "Squad Analyst";
update role set soft_hyphenation_text = "Mem&shy;ber" where name = "Member";
update role set soft_hyphenation_text = "De&shy;part&shy;ment ALS ID Co&shy;or&shy;di&shy;na&shy;tor" where name = "Department ALS ID Coordinator";
update role set soft_hyphenation_text = "Squad Sched&shy;ul&shy;er" where name = "Squad Scheduler";
update role set soft_hyphenation_text = "De&shy;part&shy;ment Sched&shy;ul&shy;er" where name = "Department Scheduler";
update role set soft_hyphenation_text = "Squad Man&shy;ag&shy;er" where name = "Squad Manager";
update role set soft_hyphenation_text = "As&shy;so&shy;ci&shy;a&shy;tion News&shy;let&shy;ter Ed&shy;i&shy;tor" where name = "Association Newsletter Editor";
update role set soft_hyphenation_text = "De&shy;part&shy;ment Sched&shy;ule Au&shy;di&shy;tor" where name = "Department Schedule Auditor";
update role set soft_hyphenation_text = "All-Squad NGO Lead&shy;er" where name = "All-Squad NGO Leader";

ALTER TABLE `role`
  MODIFY COLUMN `soft_hyphenation_text` VARCHAR(127) NOT NULL;

insert privilege set name = "config-roles-and-matrices";
insert role_privilege_map set
  role_id = (select id from role where name = "Application Administrator"),
  privilege_id = (select id from privilege where name = "config-roles-and-matrices");

COMMIT
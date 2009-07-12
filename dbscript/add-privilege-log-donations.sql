START TRANSACTION;

insert privilege
set name = "log-donations";

insert role
set name = "Fund Drive Donation Recorder",
  tier_id = (select id from tier where name = "Squad"),
  soft_hyphenation_text = "Fund Drive Do&shy;na&shy;tion Re&shy;cor&shy;der",
  pecking_order = 41000;

insert role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Application Administrator"),(select id from privilege where name = "log-donations")),
((select id from role where name = "Fund Drive Donation Recorder"),(select id from privilege where name = "log-donations"));

COMMIT
START TRANSACTION
;
UPDATE `analysis`
SET `sql`='select distinct user_email_addr, timestamp, IFNULL(amount,\'\') as amount, name, address1, city, state, zip from resident_journal join oscardotnetdb.member m on (m.email_address=resident_journal.user_email_addr) where resident_journal.id = 0 and m.agency_id = 9 order by timestamp desc'
WHERE `enumeral`='OUTOFAREA'
  and `agency`='KVRS'
;
UPDATE `analysis`
SET `sql`='select distinct user_email_addr, timestamp, IFNULL(amount,\'\') as amount, name, address1, city, state, zip from resident_journal join oscardotnetdb.member m on (m.email_address=resident_journal.user_email_addr) where resident_journal.id = 0 and m.agency_id = 1 order by timestamp desc'
WHERE `enumeral`='OUTOFAREA'
  and `agency`='OPVRS'
;
COMMIT

START TRANSACTION
;
INSERT INTO `analysis`
set `agency` = 'KVRS'
, `enumeral` = 'OUTOFAREA'
, `position` = 'outofarea'
, `short_description` = 'Out-Of-Area donations'
, `long_description` = ''
, `sql` = 'select distinct user_email_addr, timestamp, name, address1, city, state, zip from resident_journal join oscardotnetdb.member m on (m.email_address=resident_journal.user_email_addr) where resident_journal.id = 0 and m.agency_id = 9 order by timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'OPVRS'
, `enumeral` = 'OUTOFAREA'
, `position` = 'outofarea'
, `short_description` = 'Out-Of-Area donations'
, `long_description` = ''
, `sql` = 'select distinct user_email_addr, timestamp, name, address1, city, state, zip from resident_journal join oscardotnetdb.member m on (m.email_address=resident_journal.user_email_addr) where resident_journal.id = 0 and m.agency_id = 1 order by timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
COMMIT

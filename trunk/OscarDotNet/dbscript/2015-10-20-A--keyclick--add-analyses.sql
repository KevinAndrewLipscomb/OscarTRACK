START TRANSACTION
;
INSERT INTO `analysis`
set `agency` = 'KVRS'
, `enumeral` = 'INTINVOLUNTEERING'
, `position` = 'interest/01'
, `short_description` = 'Returns indicating an interest in Volunteering'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'KVRS\' and be_interested_in_volunteering order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'KVRS'
, `enumeral` = 'INTINBEQUESTING'
, `position` = 'interest/02'
, `short_description` = 'Returns indicating an interest in Bequesting'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'KVRS\' and be_interested_in_bequesting order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'KVRS'
, `enumeral` = 'INTINPATIENTCARE'
, `position` = 'interest/03'
, `short_description` = 'Returns indicating an interest in Patient Care'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'KVRS\' and be_interested_in_patient_care order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'KVRS'
, `enumeral` = 'INTINSUPPORT'
, `position` = 'interest/04'
, `short_description` = 'Returns indicating an interest in Non-emergency Support'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'KVRS\' and be_interested_in_support order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'OPVRS'
, `enumeral` = 'INTINVOLUNTEERING'
, `position` = 'interest/01'
, `short_description` = 'Returns indicating an interest in Volunteering'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'OPVRS\' and be_interested_in_volunteering order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'OPVRS'
, `enumeral` = 'INTINBEQUESTING'
, `position` = 'interest/02'
, `short_description` = 'Returns indicating an interest in Bequesting'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'OPVRS\' and be_interested_in_bequesting order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
INSERT INTO `analysis`
set `agency` = 'OPVRS'
, `enumeral` = 'INTINPATIENTCARE'
, `position` = 'interest/03'
, `short_description` = 'Returns indicating an interest in Patient Care'
, `long_description` = ''
, `sql` = 'select distinct date, resident_base.id as id, resident_base.name, concat(house_num,\' \',street.name) as address, city.name as city, state.abbreviation as state from donation join resident_base on (resident_base.id=donation.id) join street on (street.id=resident_base.street_id) join city on (city.id=street.city_id) join state on (state.id=city.state_id) where agency = \'OPVRS\' and be_interested_in_patient_care order by date desc, timestamp desc'
, `be_avail_as_html` = 'TRUE'
, `be_avail_as_zip` = 'TRUE'
;
COMMIT

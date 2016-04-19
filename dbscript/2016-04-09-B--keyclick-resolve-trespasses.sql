START TRANSACTION
;
delete from resident_base where agency = 'OPVRS' and house_num = '2021' and street_id = (select id from street where name = 'PLEASURE HOUSE RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'))
;
COMMIT
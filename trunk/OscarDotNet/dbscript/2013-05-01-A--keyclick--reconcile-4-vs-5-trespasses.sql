START TRANSACTION
;
delete from resident_base where agency = 'PACHVRS' and house_num = '2353' and street_id = (select id from street where name = 'ROOKERY WAY' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
;
COMMIT
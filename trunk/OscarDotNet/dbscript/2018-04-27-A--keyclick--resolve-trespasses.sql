START TRANSACTION
;
delete from resident_base where agency = 'KVRS' and house_num = '4356' and street_id = (select id from street where name = 'ALFRIENDS TRL' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '673' and street_id = (select id from street where name = 'BAKER RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '724' and street_id = (select id from street where name = 'BISHOP DR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '4931' and street_id = (select id from street where name = 'CYPRESS POINT CIR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '952' and street_id = (select id from street where name = 'NEWTOWN RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '4424' and street_id = (select id from street where name = 'SAINT MARK RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '1940' and street_id = (select id from street where name = 'AQUAMARINE DR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '4217' and street_id = (select id from street where name = 'ELBOW RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2132' and street_id = (select id from street where name = 'EVERTON LN' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '3909' and street_id = (select id from street where name = 'INDIAN RIVER RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '3909' and street_id = (select id from street where name = 'KIWANIS CT' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2811' and street_id = (select id from street where name = 'LOVELINESS CT' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2228' and street_id = (select id from street where name = 'MARGARET DR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '852' and street_id = (select id from street where name = 'RINGFIELD RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2192' and street_id = (select id from street where name = 'ROCK LAKE LOOP' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2824' and street_id = (select id from street where name = 'STILL BREEZE CT' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '3909' and street_id = (select id from street where name = 'SUNSTREAM PKWY' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '111' and street_id = (select id from street where name = '88TH ST' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
;
COMMIT

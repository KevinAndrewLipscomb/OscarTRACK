delete from resident_base where agency = 'KVRS' and house_num = '4500' and street_id = (select id from street where name = 'ABBEY CT' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '628' and street_id = (select id from street where name = 'AUBREY DR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '4440' and street_id = (select id from street where name = 'N WITCHDUCK RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '5601' and street_id = (select id from street where name = 'RYCROFT CT' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '5336' and street_id = (select id from street where name = 'SUMMER CRES' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '2361' and street_id = (select id from street where name = 'SANTA FE DR' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '3137' and street_id = (select id from street where name = 'WINTERBERRY LN' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'KVRS' and house_num = '3953' and street_id = (select id from street where name = 'WINWICK WAY' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'PACHVRS' and house_num = '3269' and street_id = (select id from street where name = 'COLECHESTER RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'PACHVRS' and house_num = '3020' and street_id = (select id from street where name = 'SANDPIPER RD' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
delete from resident_base where agency = 'PACHVRS' and house_num = '324' and street_id = (select id from street where name = 'TEAL CRES' and city_id = (select id from city where name = 'VIRGINIA BEACH'));
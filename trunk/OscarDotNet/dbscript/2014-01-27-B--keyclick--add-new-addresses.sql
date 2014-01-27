START TRANSACTION
;
--
-- In vbgov.com/maps, be sure to do a search by street name (without street type or directional) to see what matches come up.
--
-- The templates are:
--   insert ignore street set city_id = (select id from city where name = ''), name = ''
--   insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, '', (select id from street where name = ''), '' from (select @id := max(id) from resident_base) as init
--
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SALEM SPRINGS WY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4313' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4317' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4321' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4325' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4329' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4332' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4336' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4340' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4344' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4348' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4349' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4352' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4353' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4357' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4361' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4365' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4369' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4412' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4416' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4420' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4424' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4428' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4429' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4432' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4433' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4437' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4441' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4445' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4449' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4452' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4456' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4460' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4464' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4468' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4469' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4472' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4473' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4476' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4477' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4480' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4481' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4484' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SALEM SPRINGS WY'), '4485' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SPRINGWATER CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1600' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1601' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1604' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1605' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1608' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1609' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1612' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1613' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1616' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1620' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1624' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1628' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1632' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGWATER CT'), '1636' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SPRINGS EDGE CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1700' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1704' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1708' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1712' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1716' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1717' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1720' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1721' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1724' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1725' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1728' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPRINGS EDGE CT'), '1729' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'WYND CREST WY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1528' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1536' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1537' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1541' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1545' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1548' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1549' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1553' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1557' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1560' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1561' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1572' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1577' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1581' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1585' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1588' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1589' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1592' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1596' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1600' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1604' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1608' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1612' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1616' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1620' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1624' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1628' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1632' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1636' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1637' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1641' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1644' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1645' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1649' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1652' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1653' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1657' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1664' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1665' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1669' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1672' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1673' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1677' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1681' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1685' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1688' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1689' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1692' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'WYND CREST WY'), '1696' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CALISTOGA CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CALISTOGA CT'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'NAPA CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'NAPA CT'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SONOMA CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SONOMA CT'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'GLEN ELLERT CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4404' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4408' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4412' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4416' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GLEN ELLERT CT'), '4417' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'LAKEVILLE CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4404' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4408' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4412' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4416' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LAKEVILLE CT'), '4417' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'POPE VALLEY CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4404' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4408' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4412' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4416' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'POPE VALLEY CT'), '4417' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'YOUNTVILLE CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1500' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1501' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1504' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1505' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1508' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1509' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1513' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'YOUNTVILLE CT'), '1517' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CHATEAU RUN'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1500' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1501' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1504' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1505' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1508' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CHATEAU RUN'), '1509' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'TWIN FERN CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '200' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '201' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '204' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '205' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '208' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '209' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '212' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TWIN FERN CT'), '213' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'GENERAL CLARK CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '309' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GENERAL CLARK CT'), '313' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'JONATHANS COVE CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '400' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '401' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '417' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE CT'), '421' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'JONATHANS COVE DR'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6309' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6313' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6317' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6324' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6325' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6332' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6336' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6340' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6360' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6364' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6368' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'JONATHANS COVE DR'), '6375' from (select @id := max(id) from resident_base) as init
;
COMMIT
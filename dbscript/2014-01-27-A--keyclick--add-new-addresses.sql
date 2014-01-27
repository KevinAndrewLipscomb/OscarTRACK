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
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'ELDERBERRY LN'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4337' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4341' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4345' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4349' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4353' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ELDERBERRY LN'), '4357' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'BUTTONBUSH WY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BUTTONBUSH WY'), '1601' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BUTTONBUSH WY'), '1605' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BUTTONBUSH WY'), '1609' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BUTTONBUSH WY'), '1613' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CATTAIL LN'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4313' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4316' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4317' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4320' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4321' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4329' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4333' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4337' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CATTAIL LN'), '4341' from (select @id := max(id) from resident_base) as init
;
COMMIT
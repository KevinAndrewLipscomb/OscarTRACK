START TRANSACTION
;
--
-- In www.vbgov.com/map, be sure to do a search by street name (without street type or directional) to see what matches come up.
--
-- The templates are:
--   insert ignore street set city_id = (select id from city where name = ''), name = ''
--   insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, '', (select id from street where name = ''), '' from (select @id := max(id) from resident_base) as init
--
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4300' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4301' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4304' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4308' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4309' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4317' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4332' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4333' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4345' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4349' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4353' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4401' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4417' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4421' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4425' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4429' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4433' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4436' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4440' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4441' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'DANALI LN'), '4444' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'KELLER CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2608' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2609' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2612' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2613' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2616' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2617' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KELLER CT'), '2620' from (select @id := max(id) from resident_base) as init
;
COMMIT

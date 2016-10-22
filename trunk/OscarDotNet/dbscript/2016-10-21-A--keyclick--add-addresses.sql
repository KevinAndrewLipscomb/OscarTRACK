START TRANSACTION
;
--
-- In www.vbgov.com/map, be sure to do a search by street name (without street type or directional) to see what matches come up.
--
-- The templates are:
--   insert ignore street set city_id = (select id from city where name = ''), name = ''
--   insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = ''), '' from (select @id := max(id) from resident_base) as init
--
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'LEGACY WAY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5425' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5433' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5437' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5441' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5445' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5453' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5457' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5461' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5465' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5501' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5505' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5509' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5513' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5516' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5517' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5520' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5521' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5524' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5528' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5529' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5532' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5533' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5536' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5537' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '5541' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '921' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '933' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '945' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LEGACY WAY'), '957' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SAFE HARBOUR WAY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5400' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5401' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5404' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5405' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5408' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5409' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5412' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5413' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5416' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5420' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5425' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5428' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5429' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5432' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5433' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5436' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5437' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5440' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5441' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5445' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5448' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5452' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5456' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5457' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5460' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5461' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5464' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5465' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5468' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'SAFE HARBOUR WAY'), '5469' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'MERIWEATHER WAY'
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'TIERRA ROJA DR'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5628' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5632' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5648' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5652' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5661' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5669' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5685' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5689' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'TIERRA ROJA DR'), '5693' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'EMMY PL'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'EMMY PL'), '5604' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'EMMY PL'), '5605' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'EMMY PL'), '5608' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'EMMY PL'), '5609' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'JAX PL'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'JAX PL'), '5612' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'JAX PL'), '5616' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'JAX PL'), '5620' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'LONE HOLLY LN'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5609' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5633-104' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5633-102' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5641-102' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5641-104' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5649-204' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5649-102' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5672-201' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5672-101' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5672-203' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'LONE HOLLY LN'), '5672-303' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'ELM GROVE CT'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'ELM GROVE CT'), '500' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'ELM GROVE CT'), '501' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'ELM GROVE CT'), '508' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'DCVRS', (select id from street where name = 'ELM GROVE CT'), '509' from (select @id := max(id) from resident_base) as init
;
COMMIT

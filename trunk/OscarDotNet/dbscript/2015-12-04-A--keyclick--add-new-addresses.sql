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
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CITRINE AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4817' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4821' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4837' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4841' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4857' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4861' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4909' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4913' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4929' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4933' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4949' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CITRINE AVE'), '4953' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'KASHMIR AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KASHMIR AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KASHMIR AVE'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'KASHMIR AVE'), '220' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'LUNA AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LUNA AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LUNA AVE'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LUNA AVE'), '221' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'GNEISS AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GNEISS AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'GNEISS AVE'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'COLTAN AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'COLTAN AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'COLTAN AVE'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'COLTAN AVE'), '220' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'MICA AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'MICA AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'MICA AVE'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'MICA AVE'), '221' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CRYSTALLINE PL'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CRYSTALLINE PL'), '4809' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CRYSTALLINE PL'), '4813' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CRYSTALLINE PL'), '4825' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'TRAVERTINE AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4813' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4817' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4821' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4825' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4828' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4829' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4833' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4841' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4845' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4849' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4852' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4853' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4856' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4861' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4865' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4869' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4873' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4877' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4881' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4884' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4888' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4901' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4905' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4909' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4913' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4917' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4921' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4924' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4928' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4929' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4931' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4933' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4935' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4937' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4939' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4941' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4943' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4945' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4947' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4949' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4951' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4960' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4964' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'TRAVERTINE AVE'), '4984' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'LARIMAR AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '1' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '212' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '214' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '218' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '220' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '222' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '224' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '225' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '226' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '228' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '230' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '261' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '265' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '269' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '273' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'LARIMAR AVE'), '277' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'SPINEL ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4900' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4904' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4908' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4912' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4916' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4920' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'SPINEL ST'), '4924' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'ALMANDINE AVE'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '14' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4800' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4804' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4808' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4812' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4816' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4820' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4828' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4832' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4836' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4840' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4844' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4852' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4856' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4860' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4864' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4868' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4876' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4880' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4884' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4888' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4892' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4896' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4904' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4908' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4912' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4916' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4920' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4924' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4928' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4932' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4936' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4940' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4944' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4948' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4952' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4956' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4957' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4960' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4964' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4968' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4969' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4972' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4973' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4976' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4977' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4980' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4981' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4984' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'ALMANDINE AVE'), '4985' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'FELDSPAR ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '209' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '213' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '221' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '225' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '229' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '233' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '237' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '241' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '245' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '249' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '253' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '256' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '257' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '260' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '261' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '264' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '265' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '268' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '269' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '272' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '273' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '276' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '277' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '280' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '281' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '284' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '285' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '288' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'FELDSPAR ST'), '289' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CARNELIAN WAY'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4801' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4805' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4809' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4813' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4817' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN WAY'), '4821' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'CARNELIAN ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '208' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '212' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '216' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '220' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '228' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '232' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '233' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '236' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '237' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '240' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '241' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '244' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '245' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '248' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '249' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '252' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '253' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '256' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '257' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '260' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'CARNELIAN ST'), '261' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'VERDE ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '13' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '11' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '12' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '209' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '213' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '217' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '220' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '221' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '224' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '225' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '228' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '229' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '232' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '233' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '236' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '237' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '240' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '241' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '244' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'VERDE ST'), '245' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'BLEECKER ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BLEECKER ST'), '5305' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BLEECKER ST'), '5312' from (select @id := max(id) from resident_base) as init
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BLEECKER ST'), '5332' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'BOWERY ST'
;
insert ignore resident_base (id,agency,street_id,house_num) select @id := @id + 1 as id, 'KVRS', (select id from street where name = 'BOWERY ST'), '120' from (select @id := max(id) from resident_base) as init
;
insert ignore street set city_id = (select id from city where name = 'VIRGINIA BEACH'), name = 'BARROW ST'
;
COMMIT

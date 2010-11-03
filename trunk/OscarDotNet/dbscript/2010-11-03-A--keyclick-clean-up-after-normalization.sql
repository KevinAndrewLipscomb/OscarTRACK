START TRANSACTION
;
ALTER TABLE `resident_base` ADD PRIMARY KEY (`id`) ;
;
ALTER TABLE `donation` DROP FOREIGN KEY `donation_id_resident_id`
;
delete from donation where id not in (select id from resident_base)
;
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_id_resident_id` FOREIGN KEY (`id` ) REFERENCES `resident_base` (`id` )
    ON DELETE CASCADE
;
drop table if exists resident
;
drop table if exists rod_by_addr
;
drop table if exists rod_by_name
;
drop table if exists resident_follow_up
;
create or replace view resident as
SELECT resident_base.id as id
 , resident_base.name as name
 , IF(street.name = 'PO BOX',
     concat(street.name,' ',house_num),
     concat(IF(house_num is null,'',concat(house_num,' ')),street.name)
     ) as address1
 , city.name as city
 , state.abbreviation as state
 , NULL as zip
 , agency
 , year_of_last_appeal_to_become_a_donor
FROM `resident_base`
  join street on (street.id=street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
order by resident_base.id
;
drop view `resident2`
;
COMMIT
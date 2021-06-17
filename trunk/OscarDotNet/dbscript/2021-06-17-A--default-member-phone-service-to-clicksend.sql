START TRANSACTION
;
update member
set phone_service_id = '8'
where phone_num is not null
  and phone_service_id is null
;
ALTER TABLE `member` CHANGE COLUMN `phone_service_id` `phone_service_id` BIGINT UNSIGNED NULL DEFAULT '8'
;
COMMIT
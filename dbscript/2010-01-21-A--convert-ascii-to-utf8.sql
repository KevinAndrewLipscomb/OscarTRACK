-- select concat("alter table ",table_name," convert to character set utf8 collate utf8_general_ci;") as command from information_schema.tables
-- where table_schema ="oscardotnetdb_d"
--   and table_collation <> "utf8_general_ci"


START TRANSACTION;

alter table chassis_make convert to character set utf8 collate utf8_general_ci;
alter table chassis_model convert to character set utf8 collate utf8_general_ci;
alter table custom_make convert to character set utf8 collate utf8_general_ci;
alter table custom_model convert to character set utf8 collate utf8_general_ci;
alter table fuel convert to character set utf8 collate utf8_general_ci;
alter table vehicle convert to character set utf8 collate utf8_general_ci;
alter table vehicle_down_nature convert to character set utf8 collate utf8_general_ci;
alter table vehicle_kind convert to character set utf8 collate utf8_general_ci;
alter table vehicle_quarters convert to character set utf8 collate utf8_general_ci;
alter table vehicle_quarters_history convert to character set utf8 collate utf8_general_ci;
alter table vehicle_usability_history convert to character set utf8 collate utf8_general_ci;

COMMIT
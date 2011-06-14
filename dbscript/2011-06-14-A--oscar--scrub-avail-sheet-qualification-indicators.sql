START TRANSACTION
;
update avail_sheet a set be_third = IF((select pecking_order < 20 from oscardotnetdb.member join oscardotnetdb.medical_release_code_description_map on (oscardotnetdb.medical_release_code_description_map.code=oscardotnetdb.member.medical_release_code) where id = a.odnmid),"TRUE","FALSE")
, be_nondriver = IF((select be_driver_qualified from oscardotnetdb.member where id = a.odnmid),"FALSE","TRUE")
, be_needing_driver = IF((select pecking_order > 20 from oscardotnetdb.member join oscardotnetdb.medical_release_code_description_map on (oscardotnetdb.medical_release_code_description_map.code=oscardotnetdb.member.medical_release_code) where id = a.odnmid),"TRUE","FALSE")
, timestamp = a.timestamp
;
COMMIT
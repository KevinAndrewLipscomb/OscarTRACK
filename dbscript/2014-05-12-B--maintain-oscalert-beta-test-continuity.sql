START TRANSACTION
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'AT&T') where phone_num = '7576428668'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Verizon Wireless') where phone_num = '7572883398'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Verizon Wireless') where phone_num = '7576357702'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Verizon Wireless') where phone_num = '7572749476'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Verizon Wireless') where phone_num = '7573762155'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'nTelos') where phone_num = '7572862269'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Sprint') where phone_num = '7578228375'
;
update member set phone_service_id = (select id from sms_gateway where carrier_name = 'Sprint') where phone_num = '7575817208'
;
COMMIT
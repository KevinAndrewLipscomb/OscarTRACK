START TRANSACTION
;
update member
set email_address = concat(replace(replace(replace(concat(first_name,last_name),".","")," ",""),_latin1'�',""),"@frompaper2web.com")
;
update user
set password_reset_email_address = concat(username,"@frompaper2web.com")
;
update sms_gateway
set hostname = concat("Host",id,".frompaper2web.com")
;
COMMIT
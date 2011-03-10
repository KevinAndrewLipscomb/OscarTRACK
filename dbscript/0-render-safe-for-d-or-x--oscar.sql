START TRANSACTION
;
update ignore authority
set email_addr = concat(replace(left(email_addr,41),"@",""),"@frompaper2web.com")
;
update ignore avail_sheet
set email_addr = concat(replace(left(email_addr,41),"@","-at-"),"@frompaper2web.com"),
  timestamp = timestamp
;
update ignore daily_report_recipient
set email_address = concat(replace(left(email_address,41),"@","-at-"),"@frompaper2web.com")
;
update ignore trusted_user
set email_address = concat(replace(left(email_address,41),"@","-at-"),"@frompaper2web.com")
;
COMMIT
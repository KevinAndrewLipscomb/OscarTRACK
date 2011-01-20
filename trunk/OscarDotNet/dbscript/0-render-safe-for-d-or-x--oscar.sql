START TRANSACTION
;
update authority
set email_addr = concat(replace(left(email_addr,45),"@",""),"@frompaper2web.com")
;
update avail_sheet
set email_addr = concat(replace(email_addr,"@","-at-"),"@frompaper2web.com"),
  timestamp = timestamp
;
update daily_report_recipient
set email_address = concat(replace(email_address,"@","-at-"),"@frompaper2web.com")
;
update trusted_user
set email_address = concat(replace(email_address,"@","-at-"),"@frompaper2web.com")
;
COMMIT
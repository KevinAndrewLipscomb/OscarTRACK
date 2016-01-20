START TRANSACTION
;
update user
set email_addr = concat(replace(replace(replace(email_addr,"@",""),".","")," ",""),"@frompaper2web.com")
;
update web_donor
set email_address = concat(replace(email_address,"@","."),"@frompaper2web.com")
;
COMMIT

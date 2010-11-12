START TRANSACTION;

update user
set email_addr = concat(replace(replace(replace(email_addr,"@",""),".","")," ",""),"@frompaper2web.com");

COMMIT
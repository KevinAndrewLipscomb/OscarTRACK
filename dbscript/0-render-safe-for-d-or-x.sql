START TRANSACTION;

update member
set email_address = concat(first_name,last_name,"@frompaper2web.com");

update user
set password_reset_email_address = concat(username,"@frompaper2web.com");

COMMIT
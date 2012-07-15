START TRANSACTION
;
update member
set email_address = REPLACE(email_address,"@rescue14.com","@vbvrs.com")
where email_address like "%@rescue14.com"
;
update user
set password_reset_email_address = REPLACE(password_reset_email_address,"@rescue14.com","@vbvrs.com")
where password_reset_email_address like "%@rescue14.com"
;
COMMIT
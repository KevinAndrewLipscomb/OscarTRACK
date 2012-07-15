START TRANSACTION
;
update authority
set email_addr = REPLACE(email_addr,"@rescue14.com","@vbvrs.com")
where email_addr like "%@rescue14.com"
;
update trusted_user
set email_address = REPLACE(email_address,"@rescue14.com","@vbvrs.com")
where email_address like "%@rescue14.com"
;
COMMIT
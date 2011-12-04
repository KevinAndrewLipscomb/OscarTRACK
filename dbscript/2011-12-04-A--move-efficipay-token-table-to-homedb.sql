START TRANSACTION
;
rename table oscardotnetdb.efficipay_token to homedb.efficipay_token
;
delete from role_privilege_map where privilege_id = (select id from privilege where name = "config-efficipay-tokens")
;
delete from privilege where name = "config-efficipay-tokens"
;
COMMIT
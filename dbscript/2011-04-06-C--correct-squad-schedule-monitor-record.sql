START TRANSACTION
;
update role set tier_id = 2
, pecking_order = 21450
where name = "Squad Schedule Monitor"
;
COMMIT
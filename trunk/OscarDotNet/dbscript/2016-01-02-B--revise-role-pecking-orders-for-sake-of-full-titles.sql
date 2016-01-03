START TRANSACTION
;
update ignore role set pecking_order = 27000 where name = 'Squad Rescue Council Representative'
;
update ignore role set pecking_order = 27100 where name = 'Squad Rescue Council Alternate'
;
update ignore role set pecking_order = 28000 where name = 'Squad Analyst'
;
COMMIT

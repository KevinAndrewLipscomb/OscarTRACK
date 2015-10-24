START TRANSACTION
;
UPDATE `analysis`
SET `sql`='SELECT id,name,address1,city,state FROM resident_follow_up limit 0,25000'
WHERE `agency`='KVRS'
  and`enumeral`='RODFOLUP1'
;
UPDATE `analysis`
SET `sql`='SELECT id,name,address1,city,state  FROM resident_follow_up limit 25000,25000'
WHERE `agency`='KVRS'
  and`enumeral`='RODFOLUP2'
;
COMMIT

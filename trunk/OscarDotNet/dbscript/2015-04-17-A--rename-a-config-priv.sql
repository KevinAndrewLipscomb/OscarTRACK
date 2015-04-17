START TRANSACTION
;
update privilege set name = 'config-cad-objects' where name = 'config-incident-natures'
;
COMMIT
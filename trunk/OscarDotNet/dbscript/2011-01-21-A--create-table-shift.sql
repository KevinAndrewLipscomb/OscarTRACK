START TRANSACTION
;
DROP TABLE IF EXISTS shift
;
CREATE TABLE IF NOT EXISTS shift (
  id SERIAL,
  start TIME NOT NULL,
  end TIME NOT NULL,
  name VARCHAR(31) NOT NULL,
  pecking_order SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (start,end),
  UNIQUE (name),
  UNIQUE (pecking_order)
)
ENGINE = InnoDB
;
insert ignore shift (pecking_order,start,end,name) values
(10000,"06:00","18:00","DAY")
 , (30000,"18:00","06:00","NIGHT")
 , (12000,"06:00","12:00","MORNING")
 , (20000,"12:00","18:00","AFTERNOON")
 , (40000,"18:00","00:00","EVENING")
 , (50000,"00:00","06:00","GRAVEYARD")
 , (14000,"06:00","14:00","1ST POWER")
 , (16000,"10:00","18:00","2ND POWER")
;
ALTER TABLE `journal` CHANGE COLUMN `action` `action` TEXT NOT NULL
;
COMMIT
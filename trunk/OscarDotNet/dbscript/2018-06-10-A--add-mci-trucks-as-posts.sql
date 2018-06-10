START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_active,be_ems_post,door_code,be_ok_to_nag,be_ok_to_send_duty_reminders) values
(801,'Y01','MCI 1','MCI Truck 1',TRUE,TRUE,'4,2,3,1',FALSE,TRUE),
(821,'Y21','MCI 21','MCI Truck 21',TRUE,TRUE,'1,5 (back door only)',FALSE,TRUE)  
;
COMMIT

START TRANSACTION
;
update field_situation_impression set elaboration = 'OSCALERT: Standby case, <address/>. No action needed. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'Standby'
;
update field_situation_impression set elaboration = 'OSCALERT: Typical case, <address/>. No action needed. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'Typical'
;
update field_situation_impression set elaboration = 'OSCALERT: ALS case, <address/>. SAFETY *UNKNOWN*. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'AlsEms'
;
update field_situation_impression set elaboration = 'OSCALERT: MrtCall, <address/>. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'MrtCall'
;
update field_situation_impression set elaboration = 'OSCALERT: SarCall, <address/>. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'SarCall'
;
update field_situation_impression set elaboration = 'OSCALERT: AirportAlert or equiv, <address/>. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'AirportAlert'
;
update field_situation_impression set elaboration = 'OSCALERT: Ambulance needed. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'AmbNeeded'
;
update field_situation_impression set elaboration = 'OSCALERT: Need ALS, <address/>. SAFETY *UNKNOWN*. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'AlsNeeded'
;
update field_situation_impression set elaboration = 'OSCALERT: CardiacArrestAlsNeeded, <address/>. SAFETY *UNKNOWN*. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'CardiacArrestAlsNeeded'
;
update field_situation_impression set elaboration = 'OSCALERT: Multiple calls holding for ALS. ALS to your stations. http://v.gd/7bfLG6' where description = 'MultAlsHolds'
;
update field_situation_impression set elaboration = 'OSCALERT: Need ambulance at a Cardiac Arrest. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'CardiacArrestAmbNeeded'
;
update field_situation_impression set elaboration = 'OSCALERT: Multiple calls holding for ambulances. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MultAmbHolds'
;
update field_situation_impression set elaboration = 'OSCALERT: WorkingFire or equiv, <address/>. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'WorkingFire'
;
update field_situation_impression set elaboration = 'OSCALERT: VBFD has multiple working incidents. EMS 1st response reduced. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'FireSurge'
;
update field_situation_impression set elaboration = 'OSCALERT: VBFD has a 2-alarm fire or equiv. EMS 1st response reduced. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'TwoAlarmFire'
;
update field_situation_impression set elaboration = 'OSCALERT: VBFD has a major fire incident. EMS 1st response reduced. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MajorFireIncident'
;
update field_situation_impression set elaboration = 'OSCALERT: VBFD has a MULTI-alarm fire or equiv. EMS 1st response reduced. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MultiAlarmFire'
;
update field_situation_impression set elaboration = 'OSCALERT: Trap or equiv, <address/>. http://v.gd/7bfLG6 Assgnmt=<assignment/>.' where description = 'Trap'
;
update field_situation_impression set elaboration = 'OSCALERT: Small MCI case active. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MciSmall'
;
update field_situation_impression set elaboration = 'OSCALERT: Medium MCI case active. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MciMedium'
;
update field_situation_impression set elaboration = 'OSCALERT: Large MCI case active. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MciLarge'
;
update field_situation_impression set elaboration = 'OSCALERT: Huge MCI case active. Volunteers to your stations. http://v.gd/7bfLG6' where description = 'MciHuge'
;
COMMIT
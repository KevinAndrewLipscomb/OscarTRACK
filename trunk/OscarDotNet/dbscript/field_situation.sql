select incident_num as case_num
, incident_address as address
, GROUP_CONCAT(call_sign order by list_order,call_sign) as assignment
, DATE_FORMAT(TIMESTAMP(incident_date,time_initialized),'%Y-%m-%d %H:%i') as time_initialized
, sum(call_sign REGEXP '^[[:digit:]]+[[:upper:]]+') as num_ambulances
, sum(call_sign REGEXP '^Z[[:digit:]]+') as num_zone_cars
, sum(call_sign REGEXP '^SQ[[:digit:]]+P?') as num_squad_trucks
, sum(call_sign REGEXP '^EMS[[:digit:]]+') as num_supervisors
, sum(call_sign REGEXP '^HOLD[[:digit:]]+') as num_holds
, sum(call_sign REGEXP '^HZC[[:digit:]]+') as num_hzcs
, sum(call_sign REGEXP '^LG[[:alnum:]]+') as num_lifeguards
, sum(call_sign REGEXP '^MCI[[:digit:]]+') as num_mci_trucks
, sum(call_sign REGEXP '^MRTK[[:digit:]]+') as num_mrtks
, sum(call_sign REGEXP '^RB[[:digit:]]+') as num_rbs
, sum(call_sign REGEXP '^TAC[[:digit:]]+') as num_tacs
, sum(call_sign REGEXP '^BAT[[:digit:]]+') as num_bats
, sum(call_sign REGEXP '^CAR[[:digit:]]*') as num_cars
, sum(call_sign REGEXP '^N?E[[:digit:]]+P?') as num_engines
, sum(call_sign REGEXP '^FBOA[[:digit:]]+') as num_fboas
, sum(call_sign REGEXP '^FRSQ[[:digit:]]+P?') as num_frsqs
, sum(call_sign REGEXP '^HAZ[[:digit:]]+P?') as num_hazs
, sum(call_sign REGEXP '^L[[:digit:]]+P?') as num_ladders
, sum(call_sign REGEXP '^SAFE[[:digit:]]+') as num_safes
, sum(call_sign REGEXP '^SUP[[:digit:]]+') as num_sups
, sum(call_sign REGEXP '^T[[:digit:]]+P?') as num_tankers
, sum(call_sign = 'EMTALS') as be_emt_als
, sum(call_sign = 'ETBY') as be_etby
, sum(call_sign = 'MRT') as be_mrt
, sum(call_sign = 'PIO') as be_pio
, sum(call_sign = 'PU') as be_pu
, sum(call_sign REGEXP '^R[[:digit:]]+') as be_rescue_area
, sum(call_sign = 'SQTM') as be_sqtm
, sum(call_sign = 'FTBY') as be_ftby
, sum(call_sign = 'MIRT') as be_mirt
, sum(call_sign = 'STECH') as be_stech
from
  (
  select incident_date
  , incident_num
  , incident_address
  , reduced.call_sign as call_sign
  , IF(reduced.call_sign in ('EMTALS','ETBY','FTBY','MIRT','MRT','SQTM'),0,
       IF(reduced.call_sign REGEXP 'R[[:digit:]]+',10, -- rescue area
          IF(reduced.call_sign REGEXP 'TAC[[:digit:]]+',20, -- tactical channel
             IF(reduced.call_sign REGEXP 'E[[:digit:]]+P?',30, -- engine
                IF(reduced.call_sign REGEXP 'NE[[:digit:]]+P?',40, -- navy engine
	           IF(reduced.call_sign REGEXP 'L[[:digit:]]+P?',50, -- ladder
                      IF(reduced.call_sign REGEXP 'FRSQ[[:digit:]]+P?',60, -- fire squad
                         IF(reduced.call_sign REGEXP 'T[[:digit:]]+P?',70, -- tanker
                            IF(reduced.call_sign REGEXP 'HAZ[[:digit:]]+P?',80, -- hazmat truck
                               IF(reduced.call_sign REGEXP 'BTRK[[:digit:]]+',90, -- brush truck
                                  IF(reduced.call_sign REGEXP 'SQ[[:digit:]]+P?',100, -- squad truck
                                     IF(reduced.call_sign REGEXP '[[:digit:]]+[[:upper:]]+',110, -- ambulance
                                        IF(reduced.call_sign REGEXP 'NR[[:digit:]]+.*',120, -- navy rescue
                                           IF(reduced.call_sign REGEXP 'HOLD[[:digit:]]+',130, -- holding for ambulance
                                              IF(reduced.call_sign REGEXP 'Z[[:digit:]]+',140, -- zone car
                                                 IF(reduced.call_sign REGEXP 'HZC[[:digit:]]+',150, -- holding for zone car
                                                    IF(reduced.call_sign REGEXP 'EMS[[:digit:]]+',160, -- EMS supervisor or chief
                                                       IF(reduced.call_sign REGEXP 'BRIG[[:digit:]]+',170, -- brigade chief
                                                          IF(reduced.call_sign REGEXP 'BAT[[:digit:]]+',180, -- battalion chief
                                                             IF(reduced.call_sign REGEXP 'CAR[[:digit:]]*',190, -- fire >=div chief
                                                                200 -- anybody else, alphabetically
                                                                )
                                                             )
                                                          )
                                                       )
                                                    )
                                                 )
                                              )
                                           )
                                        )
                                     )
                                  )
                               )
                            )
                         )
                      )
                   )
                )
             )
          )
       ) as list_order
  , DATE_FORMAT(time_initialized,'%H:%i') as time_initialized
  , DATE_FORMAT(time_of_alarm,'%H:%i') as time_of_alarm
  , DATE_FORMAT(time_enroute,'%H:%i') as time_enroute
  , DATE_FORMAT(time_on_scene,'%H:%i') as time_onscene
  , DATE_FORMAT(time_transporting,'%H:%i') as time_transporting
  , DATE_FORMAT(time_at_hospital,'%H:%i') as time_at_hospital
  from cad_record detail inner join
    (
    SELECT call_sign
    , max(incident_num) as max_incident_num
    FROM cad_record
    where call_sign not in ('ARSN','EYES','FAST','FIGP','MISC')
    group by call_sign
    )
    as reduced
      on (reduced.call_sign=detail.call_sign and reduced.max_incident_num=detail.incident_num)
  where time_available is null
  )
  as active_case_assignment
group by incident_num
order by incident_num desc
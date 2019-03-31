START TRANSACTION
;
insert indicator_commensuration
SELECT year
, 5 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_commensuration
where year = 2011
  and month = 4
;
insert indicator_commensuration
SELECT year
, 9 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_commensuration
where year = 2011
  and month = 8
;
insert indicator_core_ops_size
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_core_ops_size
where year = 2018
  and month = 3
;
insert indicator_crew_shifts_forecast
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_crew_shifts_forecast
where year = 2018
  and month = 3
;
insert indicator_fleet_tracking_participation
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_fleet_tracking_participation
where year = 2018
  and month = 3
;
insert indicator_median_length_of_service
SELECT be_trendable
, year
, 4 as month
, be_agency_id_applicable
, agency_id
, m
FROM indicator_median_length_of_service
where year = 2018
  and month = 3
;
insert indicator_monthly_vehicles_up_and_current
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_monthly_vehicles_up_and_current
where year = 2018
  and month = 3
;
insert indicator_num_members_in_pipeline
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_num_members_in_pipeline
where year = 2018
  and month = 3
;
insert indicator_standard_enrollment
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_standard_enrollment
where year = 2018
  and month = 3
;
insert indicator_third_slot_saturation
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_third_slot_saturation
where year = 2018
  and month = 3
;
insert indicator_utilization
SELECT year
, 4 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_utilization
where year = 2018
  and month = 3
;
COMMIT
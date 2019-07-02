START TRANSACTION
;
insert indicator_fleet_tracking_participation
SELECT year
, 7 as month
, be_agency_id_applicable
, agency_id
, value
FROM indicator_fleet_tracking_participation
where year = 2019
  and month = 6
;
COMMIT
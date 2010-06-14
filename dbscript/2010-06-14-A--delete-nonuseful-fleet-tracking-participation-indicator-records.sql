START TRANSACTION;

delete from indicator_fleet_tracking_participation
where agency_id = 0
  and be_agency_id_applicable;

COMMIT
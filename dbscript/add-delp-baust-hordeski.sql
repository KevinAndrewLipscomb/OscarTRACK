START TRANSACTION;

insert ignore member
set last_name = "DELP",
  first_name = "ERNIE",
  email_address = "edelp@vbgov.com",
  medical_release_code = (select code from medical_release_code_description_map where description = "EMT-P"),
  agency_id = 0,
  be_driver_qualified = TRUE,
  section_num = 0;
insert ignore member
set last_name = "BAUST",
  first_name = "DAVID",
  email_address = "dbaust@vbgov.com",
  medical_release_code = (select code from medical_release_code_description_map where description = "EMT-P"),
  agency_id = 0,
  be_driver_qualified = TRUE,
  section_num = 0;
insert ignore member
set last_name = "HORDESKI",
  first_name = "JIM",
  email_address = "jhordesk@vbgov.com",
  medical_release_code = (select code from medical_release_code_description_map where description = "EMT-I"),
  agency_id = 0,
  be_driver_qualified = TRUE,
  section_num = 0;

COMMIT
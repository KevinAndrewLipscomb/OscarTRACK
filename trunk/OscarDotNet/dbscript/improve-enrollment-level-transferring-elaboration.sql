START TRANSACTION;

update enrollment_level
set elaboration = "In the process of switching affiliation WITHIN the system.  Temporarily relieves member from duty obligation, so any current leave of absence will automatically be curtailed, any future ones will automatically be canceled, and no new leaves will be allowed."
where description = "Transferring";

COMMIT
update enrollment_level set description = 'Dismissed' where description = 'Expelled';

insert enrollment_level
  set description = 'Transferring',
    num_shifts = 0,
    pecking_order = 81,
    elaboration = 'In the process of switching affiliation WITHIN the system.  Temporarily relieves member from duty obligation.';
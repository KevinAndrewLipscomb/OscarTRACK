START TRANSACTION
;
insert ignore enrollment_level (description,pecking_order,elaboration,core_ops_commitment_level_code) values
("Staff",63,"Use for paid department employees and Brigade Chiefs and above.",(select code from core_ops_commitment_level where name = "Limited")),
("ALS Intern",65,"Duties are assigned by department while member pursues release at an ALS level.",(select code from core_ops_commitment_level where name = "Limited")),
("College",67,"Participates in college student program.",(select code from core_ops_commitment_level where name = "Limited"))
;
update enrollment_level
set elaboration = "Use when duty obligation is seasonal or otherwise unusual."
where description = "Atypical"
;
COMMIT
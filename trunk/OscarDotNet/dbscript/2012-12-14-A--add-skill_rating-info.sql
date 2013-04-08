START TRANSACTION
;
insert ignore skill_rating (designator,description) values
("?","Performed, NEEDS RATING"),
("X","NOT performed or observed")
;
ALTER TABLE `skill_rating`
  ADD COLUMN `for_evaluatee_both_evaluator_condition` TINYINT(1) NOT NULL DEFAULT 0
,
  ADD COLUMN `pecking_order` TINYINT UNSIGNED NOT NULL DEFAULT 0
,
  ADD INDEX `for_evaluatee_both_evaluator_condition` (`for_evaluatee_both_evaluator_condition` ASC)
;
update skill_rating set for_evaluatee_both_evaluator_condition = -1 where description = "Performed, NEEDS RATING"
;
update skill_rating set for_evaluatee_both_evaluator_condition = 0 where description = "Skill observed but not performed"
;
update skill_rating set for_evaluatee_both_evaluator_condition = 1 where description in
  (
    "Needs remediation"
  ,
    "Guidance given"
  ,
    "Performs independently"
  ,
    "NOT performed or observed"
  )
;
update skill_rating set pecking_order = 025 where designator = "X"
;
update skill_rating set pecking_order = 065 where designator = "O"
;
update skill_rating set pecking_order = 105 where designator = "?"
;
update skill_rating set pecking_order = 145 where designator = "R"
;
update skill_rating set pecking_order = 185 where designator = "G"
;
update skill_rating set pecking_order = 225 where designator = "I"
;
COMMIT
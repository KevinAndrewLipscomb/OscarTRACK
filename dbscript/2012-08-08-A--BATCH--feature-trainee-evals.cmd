@REM $Id$
@REM
set base_db_name=oscardotnetdb
set the_host=localhost
set the_user=root
if "%1"=="d" set db_instance=%base_db_name%_d
if "%1"=="x" set db_instance=%base_db_name%_x
if "%1"=="p" set db_instance=%base_db_name%
echo on
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-A--create-table-care_skill.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-B--create-table-driver_skill.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-C--create-table-patient_age_unit.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-D--create-table-patient_encounter_level.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-E--create-table-skill_rating.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-F--add-config-eval-attributes.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-08-G--create-table-eval_status.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-09-D--create-table-eval.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-09-E--create-table-driver_skill_rating.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-09-F--create-table-patient_encounter.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-08-09-G--create-table-care_skill_rating.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-12-10-A--add-guid-field-to-patient_encounter.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2012-12-14-A--add-skill_rating-info.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2013-01-14-A--add-lock-flags-and-third-rebuttal-to-eval.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2013-02-07-A--add-see-scope-evals-privs.sql
pause

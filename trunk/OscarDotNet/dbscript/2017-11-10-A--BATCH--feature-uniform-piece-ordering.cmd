@REM $Id$
@REM
set base_db_name=oscardotnetdb
set the_host=localhost
set the_user=root
if "%1"=="d" set db_instance=%base_db_name%_d
if "%1"=="x" set db_instance=%base_db_name%_x
if "%1"=="p" set db_instance=%base_db_name%
echo on
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-K--create-table-rank.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-J--create-table-uniform_catalog.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-I--create-table-uniform_piece_color.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-H--create-table-uniform_piece_model.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-G--create-table-uniform_piece_make.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-F--create-table-uniform_piece_vendor.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-E--create-table-uniform_option_category.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-D--create-table-rank_group.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-B--create-table-uniform_piece.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-A--create-table-uniform_class.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-C--create-table-uniform_priority.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-10-L--establish-relationships.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <2017-11-16-A--populate-tables.sql
pause

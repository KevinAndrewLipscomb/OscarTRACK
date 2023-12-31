@REM $Id$
@REM
set base_db_name=oscardotnetdb
set the_host=localhost
set the_user=root
if "%COMPUTERNAME%"=="FP2W-BRAVO" goto :OPS
if "%COMPUTERNAME%"=="alpha" goto :OPS
if "%COMPUTERNAME%"=="WIN-O968FBUMJDS" goto :OPS
if "%1"=="x" set the_host=elm.phpwebhosting.com
if "%1"=="x" set the_user=kalipso5
:OPS
if "%1"=="d" set db_instance=%base_db_name%_d
if "%1"=="x" set db_instance=%base_db_name%_x
if "%1"=="p" set db_instance=%base_db_name%
echo on
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="drop schema %db_instance%"
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="create schema %db_instance%"
c:\cygwin\bin\sed --file=%USERPROFILE%\Documents\script\scrub-mysqldump-for-refresh-%1.sed %USERPROFILE%\Documents\SANDBOX\vocational\kalipso-infogistics\db-dump\%base_db_name%.sql | mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance%
if "%db_instance%"=="%base_db_name%" goto :END
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% <0-render-safe-for-d-or-x.sql
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% --execute="drop view avail_sheet"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% --execute="drop view if exists avail_comment"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% --execute="create view avail_sheet as select * from oscar_%1.avail_sheet"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=%db_instance% --execute="create view avail_comment as select * from oscar_%1.avail_comment"
:END
pause

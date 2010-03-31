@REM $Id$
@REM
set the_host=localhost
set the_user=root
if "%1"=="x" set the_host=lego.phpwebhosting.com
if "%1"=="x" set the_user=kalipso
echo on
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="drop schema keyclick_%1"
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="create schema keyclick_%1"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=keyclick_%1 <"%USERPROFILE%\My Documents\SANDBOX\vocational\kalipso-infogistics\db-dump\keyclick.sql"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=keyclick_%1 <0-render-safe-for-d-or-x--keyclick.sql

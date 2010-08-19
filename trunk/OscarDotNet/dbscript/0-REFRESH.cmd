@REM $Id$
@REM
set the_host=localhost
set the_user=root
if "%1"=="x" set the_host=elm.phpwebhosting.com
if "%1"=="x" set the_user=kalipso5
echo on
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="drop schema oscardotnetdb_%1"
mysql --host=%the_host% --user=%the_user% --password=%2 --execute="create schema oscardotnetdb_%1"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=oscardotnetdb_%1 <"%USERPROFILE%\my-documents\SANDBOX\vocational\kalipso-infogistics\db-dump\oscardotnetdb.sql"
mysql --host=%the_host% --user=%the_user% --password=%2 --database=oscardotnetdb_%1 <0-render-safe-for-d-or-x.sql

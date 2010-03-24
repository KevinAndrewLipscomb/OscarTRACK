@REM $Id$
@REM
mysql --user=root --password=%1 --execute="drop schema oscardotnetdb_d; create schema oscardotnetdb_d"
mysql --user=root --password=%1 --database=oscardotnetdb_d <"%USERPROFILE%\My Documents\SANDBOX\vocational\kalipso-infogistics\db-dump\oscardotnetdb.sql"
mysql --user=root --password=%1 --database=oscardotnetdb_d <0-render-safe-for-d-or-x.sql

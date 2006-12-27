REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\OscarDotNet"
start /max explorer /e,/select,C:\Inetpub\wwwroot\OscarDotNet\.svn
start /max explorer ftp://ftp.frompaper2web.com/ssl/OSCAR_x
start /max OscarDotNet.bdsproj
start "" /max "C:\Program Files\MySQL\MySQL Query Browser 1.1\MySQLQueryBrowser.exe"

REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\OscarDotNet"
start /max explorer /e,/select,C:\Inetpub\wwwroot\OscarDotNet\.svn
start /max explorer ftp://ftp.frompaper2web.com/ssl/OscarDotNet_x
start /max explorer ftp://frompaper2web.win.aplus.net/WWWROOT/OscarTRACK/
start /max OscarDotNet.dproj
start "" /max "C:\Program Files\MySQL\MySQL Tools for 5.0\MySQLQueryBrowser.exe"

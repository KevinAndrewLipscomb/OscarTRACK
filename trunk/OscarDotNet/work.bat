REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\OscarDotNet"
start /max explorer /e,/select,C:\Inetpub\wwwroot\OscarDotNet\.svn
start /max explorer ftp://kalipso:@frompaper2web.com/ssl/OscarDotNet_x
start /max OscarDotNet.sln
start "" /max "C:\Program Files\MySQL\MySQL Workbench 5.2 CE\MySQLWorkbench.exe"

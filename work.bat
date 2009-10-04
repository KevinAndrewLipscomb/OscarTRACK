REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\OscarDotNet"
start /max explorer /e,/select,C:\Inetpub\wwwroot\OscarDotNet\.svn
start "" /max "C:\Program Files\FileZilla FTP Client\filezilla.exe" --site=0/ftp.frompaper2web.com\/ssl/OscarDotNet_x
start "" /max "C:\Program Files\FileZilla FTP Client\filezilla.exe" --site=0/frompaper2web.win.aplus.net\/WWWROOT/OscarTRACK/
start /max OscarDotNet.sln
start "" /max "C:\Program Files\MySQL\MySQL Tools for 5.0\MySQLQueryBrowser.exe"

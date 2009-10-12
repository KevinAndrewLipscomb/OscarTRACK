REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\OscarDotNet"
start /max explorer /e,/select,C:\Inetpub\wwwroot\OscarDotNet\.svn
start "" /max "C:\Program Files\WinSCP\WinSCP.exe" alentus.com/ssl/OscarDotNet_x
start "" /max "C:\Program Files\WinSCP\WinSCP.exe" aplus.net/OscarTRACK/
start /max OscarDotNet.sln
start "" /max "C:\Program Files\MySQL\MySQL Tools for 5.0\MySQLQueryBrowser.exe"

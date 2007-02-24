@REM
@REM $Id$
@REM
@rmdir ready-to-deploy /s /q
@xcopy C:\Inetpub\wwwroot\OscarDotNet\*.asax ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\*.aspx ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\*.config ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\*.pdf ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\bin\*.* ready-to-deploy\bin /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\noninteractive\*.crontab ready-to-deploy\noninteractive /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\noninteractive\*.aspx ready-to-deploy\noninteractive /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\protected\*.asax ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\protected\*.aspx ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\protected\*.config ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\protected\image ready-to-deploy\protected\image /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\resource ready-to-deploy\resource /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\usercontrol\app\*.aspx ready-to-deploy\usercontrol\app /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\OscarDotNet\usercontrol\ki\*.aspx ready-to-deploy\usercontrol\ki /a /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Data.Provider.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Data.Common.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Delphi.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\CoreLab\Bdp\MySql\BDS4\CoreLab.Bdp.MySql.dll" ready-to-deploy\bin /m /i /k /y /z

@REM
@REM $Id$
@REM
@rmdir ready-to-deploy /s /q
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\*.asax ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\*.aspx ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\*.config ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\*.pdf ready-to-deploy /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\bin\*.* ready-to-deploy\bin /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\noninteractive\*.crontab ready-to-deploy\noninteractive /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\noninteractive\*.aspx ready-to-deploy\noninteractive /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\*.asax ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\*.aspx ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\*.config ready-to-deploy\protected /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\image ready-to-deploy\protected\image /m /i /k /y /z
@xcopy C:\Inetpub\wwwroot\KiAspdotnetFramework\resource ready-to-deploy\resource /m /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Data.Provider.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Data.Common.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\Common Files\Borland Shared\BDS\Shared Assemblies\4.0\Borland.Delphi.dll" ready-to-deploy\bin /m /i /k /y /z
@xcopy "C:\Program Files\CoreLab\Bdp\MySql\BDS4\CoreLab.Bdp.MySql.dll" ready-to-deploy\bin /m /i /k /y /z

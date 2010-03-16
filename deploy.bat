@REM
@REM $Id$
@REM
@rmdir ready-to-deploy /s /q
@REM      sourcedir-----------------------------------------------------------destdir----------------------------------------------[files]---quals---------filter--------
@robocopy C:\Inetpub\wwwroot\OscarDotNet                                      ready-to-deploy                                      *.asax    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet                                      ready-to-deploy                                      *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet                                      ready-to-deploy                                      *.pdf     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\bin                                  ready-to-deploy\bin                                  *.dll     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\bin                                  ready-to-deploy\bin                                  *.pdb     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\bin                                  ready-to-deploy\bin                                  *.TTF     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\css                                  ready-to-deploy\css                                            /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\doc                                  ready-to-deploy\doc                                  *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\noninteractive                       ready-to-deploy\noninteractive                       *.crontab /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\noninteractive                       ready-to-deploy\noninteractive                       *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\noninteractive\template\notification ready-to-deploy\noninteractive\template\notification           /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected                            ready-to-deploy\protected                            *.asax    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected                            ready-to-deploy\protected                            *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected                            ready-to-deploy\protected                            *.config  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected\image                      ready-to-deploy\protected\image                                /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected\image\dynamic              ready-to-deploy\protected\image\dynamic              *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\protected\template\notification      ready-to-deploy\protected\template\notification                /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\resource                             ready-to-deploy\resource                                       /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\template\notification                ready-to-deploy\template\notification                          /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\usercontrol\app                      ready-to-deploy\usercontrol\app                      *.ascx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\usercontrol\ki                       ready-to-deploy\usercontrol\ki                       *.ascx    /A /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\OscarDotNet\usercontrol\ki\image                 ready-to-deploy\usercontrol\ki\image                           /A /np /ns /z | qgrep "New "
@pause
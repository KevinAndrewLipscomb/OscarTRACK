library OscarDotNet;

{%AspWebConfigContainer 'Web.config'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Data.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Drawing.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Web.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.XML.dll'}
{%DelphiDotNetAssemblyCompiler 'c:\program files\common files\borland shared\bds\shared assemblies\4.0\Borland.Data.Provider.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Windows.Forms.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Design.dll'}
{%DelphiDotNetAssemblyCompiler 'c:\program files\common files\borland shared\bds\shared assemblies\4.0\Borland.Data.Common.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\mscorlib.dll'}
{%File 'schema.sql'}
{%ConfigurationCompiler 'unpublished.config'}
{%File 'testdata.sql'}
{%AspFolderContainer 'protected'}
{%AspFolderContainer 'component'}
{%AspFolderContainer 'component\biz'}
{%AspFolderContainer 'component\db'}
{%AspMarkupContainer 'Default.aspx'}
{%AspMarkupContainer 'Global.asax'}
{%AspMarkupContainer 'new_password.aspx'}
{%AspMarkupContainer 'protected\change_email_address.aspx'}
{%AspMarkupContainer 'protected\change_password.aspx'}
{%AspMarkupContainer 'protected\squad_commander_overview.aspx'}
{%AspMarkupContainer 'protected\profile.aspx'}
{%AspMarkupContainer 'protected\department_staffer_overview.aspx'}
{%AspMarkupContainer 'protected\member_overview.aspx'}
{%AspWebConfigContainer 'protected\Web.config'}
{%AspMarkupContainer 'salogin.aspx'}
{%AspMarkupContainer 'login.aspx'}
{%AspFolderContainer 'protected\scratch'}
{%AspFolderContainer 'protected\image'}
{%AspFolderContainer 'dbscript'}
{%AspMarkupContainer 'exception.aspx'}
{%AspMarkupContainer 'timeout.aspx'}
{%DelphiDotNetAssemblyCompiler 'lib\ki\ki.dll'}
{%File 'noninteractive\.crontab'}
{%AspMarkupContainer 'noninteractive\milestone_sweep.aspx'}
{%AspMarkupContainer 'protected\member_detail.aspx'}

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  Class_biz_user in 'component\biz\Class_biz_user.pas',
  Class_biz_accounts in 'component\biz\Class_biz_accounts.pas',
  Class_biz_members in 'component\biz\Class_biz_members.pas',
  Class_db_user in 'component\db\Class_db_user.pas',
  Class_db in 'component\db\Class_db.pas',
  Class_db_accounts in 'component\db\Class_db_accounts.pas',
  Class_db_members in 'component\db\Class_db_members.pas',
  Default in 'Default.pas' {Default.TWebForm_Default: ki_web_ui.page_class},
  Global in 'Global.pas' {Global.TGlobal: System.Web.HttpApplication},
  salogin in 'salogin.pas' {salogin.TWebForm_salogin: ki_web_ui.page_class},
  new_password in 'new_password.pas' {new_password.TWebForm_new_password: ki_web_ui.page_class},
  change_email_address in 'protected\change_email_address.pas' {change_email_address.TWebForm_change_email_address: ki_web_ui.page_class},
  change_password in 'protected\change_password.pas' {change_password.TWebForm_change_password: ki_web_ui.page_class},
  squad_commander_overview in 'protected\squad_commander_overview.pas' {squad_commander_overview.TWebForm_squad_commander_overview: ki_web_ui.page_class},
  profile in 'protected\profile.pas' {profile.TWebForm_profile: ki_web_ui.page_class},
  department_staffer_overview in 'protected\department_staffer_overview.pas' {department_staffer_overview.TWebForm_department_staffer_overview: ki_web_ui.page_class},
  member_overview in 'protected\member_overview.pas' {member_overview.TWebForm_member_overview: ki_web_ui.page_class},
  Class_biz_department_staffers in 'component\biz\Class_biz_department_staffers.pas',
  Class_db_department_staffers in 'component\db\Class_db_department_staffers.pas',
  login in 'login.pas' {login.TWebForm_login: ki_web_ui.page_class},
  exception in 'exception.pas' {exception.TWebForm_exception: ki_web_ui.page_class},
  timeout in 'timeout.pas' {timeout.TWebForm_timeout: system.web.ui.page},
  milestone_sweep in 'noninteractive\milestone_sweep.pas' {milestone_sweep.TWebForm_milestone_sweep: system.web.ui.page},
  Class_biz_milestones in 'component\biz\Class_biz_milestones.pas',
  Class_db_milestones in 'component\db\Class_db_milestones.pas',
  Class_biz_agencies in 'component\biz\Class_biz_agencies.pas',
  Class_db_agencies in 'component\db\Class_db_agencies.pas',
  appcommon in 'appcommon.pas',
  member_detail in 'protected\member_detail.pas' {member_detail.TWebForm_member_detail: ki_web_ui.page_class};

const ID = '$Id$';

//
// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyDescription('')]
[assembly: AssemblyConfiguration('')]
[assembly: AssemblyCompany('')]
[assembly: AssemblyProduct('')]
[assembly: AssemblyCopyright('')]
[assembly: AssemblyTrademark('')]
[assembly: AssemblyCulture('')]

// The Delphi compiler controls the AssemblyTitleAttribute via the ExeDescription.
// You can set this in the IDE via the Project Options.
// Manually setting the AssemblyTitle attribute below will override the IDE
// setting.
// [assembly: AssemblyTitle('')]


//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers
// by using the '*' as shown below:

[assembly: AssemblyVersion('1.0.*')]

//
// In order to sign your assembly you must specify a key to use. Refer to the
// Microsoft .NET Framework documentation for more information on assembly signing.
//
// Use the attributes below to control which key is used for signing.
//
// Notes:
//   (*) If no key is specified, the assembly is not signed.
//   (*) KeyName refers to a key that has been installed in the Crypto member
//       Provider (CSP) on your machine. KeyFile refers to a file which contains
//       a key.
//   (*) If the KeyFile and the KeyName values are both specified, the
//       following processing occurs:
//       (1) If the KeyName can be found in the CSP, that key is used.
//       (2) If the KeyName does not exist and the KeyFile does exist, the key
//           in the KeyFile is installed into the CSP and used.
//   (*) In order to create a KeyFile, you can use the sn.exe (Strong Name) utility.
//       When specifying the KeyFile, the location of the KeyFile should be
//       relative to the project output directory which is
//       %Project Directory%\bin\<configuration>. For example, if your KeyFile is
//       located in the project directory, you would specify the AssemblyKeyFile
//       attribute as [assembly: AssemblyKeyFile('..\\..\\mykey.snk')]
//   (*) Delay Signing is an advanced option - see the Microsoft .NET Framework
//       documentation for more information on this.
//
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile('')]
[assembly: AssemblyKeyName('')]

begin
end.

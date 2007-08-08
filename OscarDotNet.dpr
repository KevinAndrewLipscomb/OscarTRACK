library OscarDotNet;

{%AspWebConfigContainer 'Web.config'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Data.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Drawing.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Web.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.XML.dll'}
{%DelphiDotNetAssemblyCompiler 'c:\program files\common files\borland shared\bds\shared assemblies\4.0\Borland.Data.Provider.dll'}
{%DelphiDotNetAssemblyCompiler 'lib\ki\ki.dll'}
{%AspMarkupContainer 'Global.asax'}
{%AspMarkupContainer 'Default.aspx'}
{%AspMarkupContainer 'exception.aspx'}
{%AspMarkupContainer 'login.aspx'}
{%AspMarkupContainer 'new_user_registration.aspx'}
{%AspMarkupContainer 'remind_username.aspx'}
{%AspMarkupContainer 'salogin.aspx'}
{%AspMarkupContainer 'timeout.aspx'}
{%AspMarkupContainer 'protected\add_member.aspx'}
{%AspMarkupContainer 'protected\add_new_enrollment_status.aspx'}
{%AspMarkupContainer 'protected\change_email_address.aspx'}
{%AspMarkupContainer 'protected\change_member_driver_qualification.aspx'}
{%AspMarkupContainer 'protected\change_member_email_address.aspx'}
{%AspMarkupContainer 'protected\change_member_medical_release_level.aspx'}
{%AspMarkupContainer 'protected\change_member_section.aspx'}
{%AspMarkupContainer 'protected\change_password.aspx'}
{%AspMarkupContainer 'protected\enrollment_detail.aspx'}
{%AspMarkupContainer 'protected\grant_leave.aspx'}
{%AspMarkupContainer 'protected\leave_detail.aspx'}
{%AspMarkupContainer 'protected\member_detail.aspx'}
{%AspMarkupContainer 'protected\officership_detail.aspx'}
{%AspMarkupContainer 'protected\overview.aspx'}
{%AspMarkupContainer 'protected\profile.aspx'}
{%AspMarkupContainer 'noninteractive\milestone_sweep.aspx'}
{%AspMarkupContainer 'noninteractive\daily_tasks.aspx'}
{%AspMarkupContainer 'usercontrol\ki\UserControl_drop_down_date.ascx'}
{%AspMarkupContainer 'usercontrol\ki\UserControl_print_div.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_roster.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_establish_membership.ascx'}
{%AspMarkupContainer 'protected\establish_membership_trouble.aspx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_precontent.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_postcontent.ascx'}
{%AspMarkupContainer 'noninteractive\report_monthly_core_ops_roster.aspx'}
{%AspMarkupContainer 'noninteractive\report_monthly_current_roster.aspx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_common_header_bar.ascx'}
{%AspMarkupContainer 'noninteractive\report_monthly_in_class_roster.aspx'}
{%AspMarkupContainer 'noninteractive\report_monthly_trainee_roster.aspx'}
{%AspMarkupContainer 'noninteractive\report_monthly_recruit_awaiting_class_roster.aspx'}
{%AspMarkupContainer 'noninteractive\report_monthly_applicant_roster.aspx'}
{%AspMarkupContainer 'noninteractive\statement_member_status.aspx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_ranked_core_ops_size.ascx'}
{%AspMarkupContainer 'noninteractive\report_monthly_core_ops_dashboard.aspx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_ranked_crew_shifts_forecast.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_ranked_utilization.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_ranked_standard_enrollment.ascx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_ranked_length_of_service.ascx'}
{%AspMarkupContainer 'protected\change_member_agency.aspx'}
{%AspMarkupContainer 'protected\change_leave.aspx'}
{%AspMarkupContainer 'protected\change_cad_num.aspx'}
{%AspMarkupContainer 'protected\change_name.aspx'}
{%AspMarkupContainer 'usercontrol\app\UserControl_member_binder.ascx'}
{%DelphiDotNetAssemblyCompiler 'bin\Microsoft.Web.UI.WebControls.dll'}
{%AspMarkupContainer 'usercontrol\app\UserControl_dashboard_binder.ascx'}

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  Global in 'Global.pas' {Global.TGlobal: System.Web.HttpApplication},
  Default in 'Default.pas' {Default.TWebForm_Default: ki_web_ui.page_class},
  exception in 'exception.pas' {exception.TWebForm_exception: ki_web_ui.page_class},
  login in 'login.pas' {login.TWebForm_login: ki_web_ui.page_class},
  salogin in 'salogin.pas' {salogin.TWebForm_salogin: ki_web_ui.page_class},
  timeout in 'timeout.pas' {timeout.TWebForm_timeout: system.web.ui.page},
  Class_biz_user in 'component\biz\Class_biz_user.pas',
  Class_biz_accounts in 'component\biz\Class_biz_accounts.pas',
  Class_biz_agencies in 'component\biz\Class_biz_agencies.pas',
  Class_biz_department_staffers in 'component\biz\Class_biz_department_staffers.pas',
  Class_biz_enrollment in 'component\biz\Class_biz_enrollment.pas',
  Class_biz_leave in 'component\biz\Class_biz_leave.pas',
  Class_biz_leaves in 'component\biz\Class_biz_leaves.pas',
  Class_biz_medical_release_levels in 'component\biz\Class_biz_medical_release_levels.pas',
  Class_biz_milestones in 'component\biz\Class_biz_milestones.pas',
  Class_biz_officerships in 'component\biz\Class_biz_officerships.pas',
  Class_biz_scheduled_tasks in 'component\biz\Class_biz_scheduled_tasks.pas',
  Class_db_user in 'component\db\Class_db_user.pas',
  Class_db in 'component\db\Class_db.pas',
  Class_db_accounts in 'component\db\Class_db_accounts.pas',
  Class_db_agencies in 'component\db\Class_db_agencies.pas',
  Class_db_department_staffers in 'component\db\Class_db_department_staffers.pas',
  Class_db_enrollment in 'component\db\Class_db_enrollment.pas',
  Class_db_leaves in 'component\db\Class_db_leaves.pas',
  Class_db_medical_release_levels in 'component\db\Class_db_medical_release_levels.pas',
  Class_db_milestones in 'component\db\Class_db_milestones.pas',
  Class_db_officerships in 'component\db\Class_db_officerships.pas',
  Class_db_trail in 'component\db\Class_db_trail.pas',
  add_member in 'protected\add_member.pas' {add_member.TWebForm_add_member: ki_web_ui.page_class},
  add_new_enrollment_status in 'protected\add_new_enrollment_status.pas' {add_new_enrollment_status.TWebForm_add_new_enrollment_status: ki_web_ui.page_class},
  change_email_address in 'protected\change_email_address.pas' {change_email_address.TWebForm_change_email_address: ki_web_ui.page_class},
  change_member_driver_qualification in 'protected\change_member_driver_qualification.pas' {change_member_driver_qualification.TWebForm_change_member_driver_qualification: ki_web_ui.page_class},
  change_member_email_address in 'protected\change_member_email_address.pas' {change_member_email_address.TWebForm_change_member_email_address: ki_web_ui.page_class},
  change_member_medical_release_level in 'protected\change_member_medical_release_level.pas' {change_member_medical_release_level.TWebForm_change_member_medical_release_level: ki_web_ui.page_class},
  change_password in 'protected\change_password.pas' {change_password.TWebForm_change_password: ki_web_ui.page_class},
  enrollment_detail in 'protected\enrollment_detail.pas' {enrollment_detail.TWebForm_enrollment_detail: ki_web_ui.page_class},
  grant_leave in 'protected\grant_leave.pas' {grant_leave.TWebForm_grant_leave: ki_web_ui.page_class},
  leave_detail in 'protected\leave_detail.pas' {leave_detail.TWebForm_leave_detail: ki_web_ui.page_class},
  member_detail in 'protected\member_detail.pas' {member_detail.TWebForm_member_detail: ki_web_ui.page_class},
  officership_detail in 'protected\officership_detail.pas' {officership_detail.TWebForm_officership_detail: ki_web_ui.page_class},
  profile in 'protected\profile.pas' {profile.TWebForm_profile: ki_web_ui.page_class},
  milestone_sweep in 'noninteractive\milestone_sweep.pas' {milestone_sweep.TWebForm_milestone_sweep: system.web.ui.page},
  daily_tasks in 'noninteractive\daily_tasks.pas' {daily_tasks.TWebForm_daily_tasks: system.web.ui.page},
  UserControl_drop_down_date in 'usercontrol\ki\UserControl_drop_down_date.pas' {UserControl_drop_down_date.TWebUserControl_drop_down_date: ki_web_ui.usercontrol_class},
  change_member_section in 'protected\change_member_section.pas' {change_member_section.TWebForm_change_member_section: ki_web_ui.page_class},
  Class_biz_sections in 'component\biz\Class_biz_sections.pas',
  Class_biz_notifications in 'component\biz\Class_biz_notifications.pas',
  UserControl_print_div in 'usercontrol\ki\UserControl_print_div.pas' {UserControl_print_div.TWebUserControl_print_div: ki_web_ui.usercontrol_class},
  UserControl_roster in 'usercontrol\app\UserControl_roster.pas' {UserControl_roster.TWebUserControl_roster: ki_web_ui.usercontrol_class},
  remind_username in 'remind_username.pas' {remind_username.TWebForm_remind_username: ki_web_ui.page_class},
  new_user_registration in 'new_user_registration.pas' {new_user_registration.TWebForm_new_user_registration: ki_web_ui.page_class},
  overview in 'protected\overview.pas' {overview.TWebForm_overview: ki_web_ui.page_class},
  Class_biz_members in 'component\biz\Class_biz_members.pas',
  Class_db_members in 'component\db\Class_db_members.pas',
  Class_biz_users in 'component\biz\Class_biz_users.pas',
  Class_db_users in 'component\db\Class_db_users.pas',
  appcommon in 'appcommon.pas',
  UserControl_establish_membership in 'usercontrol\app\UserControl_establish_membership.pas' {UserControl_establish_membership.TWebUserControl_establish_membership: ki_web_ui.usercontrol_class},
  establish_membership_trouble in 'protected\establish_membership_trouble.pas' {establish_membership_trouble.TWebForm_establish_membership_trouble: ki_web_ui.page_class},
  UserControl_precontent in 'usercontrol\app\UserControl_precontent.pas' {UserControl_precontent.TWebUserControl_precontent: ki_web_ui.usercontrol_class},
  UserControl_postcontent in 'usercontrol\app\UserControl_postcontent.pas' {UserControl_postcontent.TWebUserControl_postcontent: ki_web_ui.usercontrol_class},
  Class_db_notifications in 'component\db\Class_db_notifications.pas',
  report_monthly_core_ops_roster in 'noninteractive\report_monthly_core_ops_roster.pas' {report_monthly_core_ops_roster.TWebForm_report_monthly_core_ops_roster: system.web.ui.page},
  report_monthly_current_roster in 'noninteractive\report_monthly_current_roster.pas' {report_monthly_current_roster.TWebForm_report_monthly_current_roster: system.web.ui.page},
  UserControl_common_header_bar in 'usercontrol\app\UserControl_common_header_bar.pas' {UserControl_common_header_bar.TWebUserControl_common_header_bar: ki_web_ui.usercontrol_class},
  report_monthly_in_class_roster in 'noninteractive\report_monthly_in_class_roster.pas' {report_monthly_in_class_roster.TWebForm_report_monthly_in_class_roster: system.web.ui.page},
  report_monthly_trainee_roster in 'noninteractive\report_monthly_trainee_roster.pas' {report_monthly_trainee_roster.TWebForm_report_monthly_trainee_roster: system.web.ui.page},
  report_monthly_recruit_awaiting_class_roster in 'noninteractive\report_monthly_recruit_awaiting_class_roster.pas' {report_monthly_recruit_awaiting_class_roster.TWebForm_report_monthly_recruit_awaiting_class_roster: system.web.ui.page},
  report_monthly_applicant_roster in 'noninteractive\report_monthly_applicant_roster.pas' {report_monthly_applicant_roster.TWebForm_report_monthly_applicant_roster: system.web.ui.page},
  statement_member_status in 'noninteractive\statement_member_status.pas' {statement_member_status.TWebForm_statement_member_status: system.web.ui.page},
  UserControl_ranked_core_ops_size in 'usercontrol\app\UserControl_ranked_core_ops_size.pas' {UserControl_ranked_core_ops_size.TWebUserControl_ranked_core_ops_size: ki_web_ui.usercontrol_class},
  report_monthly_core_ops_dashboard in 'noninteractive\report_monthly_core_ops_dashboard.pas' {report_monthly_core_ops_dashboard.TWebForm_report_monthly_core_ops_dashboard: system.web.ui.page},
  UserControl_ranked_crew_shifts_forecast in 'usercontrol\app\UserControl_ranked_crew_shifts_forecast.pas' {UserControl_ranked_crew_shifts_forecast.TWebUserControl_ranked_crew_shifts_forecast: ki_web_ui.usercontrol_class},
  UserControl_ranked_utilization in 'usercontrol\app\UserControl_ranked_utilization.pas' {UserControl_ranked_utilization.TWebUserControl_ranked_utilization: ki_web_ui.usercontrol_class},
  UserControl_ranked_standard_enrollment in 'usercontrol\app\UserControl_ranked_standard_enrollment.pas' {UserControl_ranked_standard_enrollment.TWebUserControl_ranked_standard_enrollment: ki_web_ui.usercontrol_class},
  UserControl_ranked_length_of_service in 'usercontrol\app\UserControl_ranked_length_of_service.pas' {UserControl_ranked_length_of_service.TWebUserControl_ranked_length_of_service: ki_web_ui.usercontrol_class},
  Class_biz_indicator_median_length_of_service in 'component\biz\Class_biz_indicator_median_length_of_service.pas',
  Class_db_indicator_median_length_of_service in 'component\db\Class_db_indicator_median_length_of_service.pas',
  change_member_agency in 'protected\change_member_agency.pas' {change_member_agency.TWebForm_change_member_agency: ki_web_ui.page_class},
  change_leave in 'protected\change_leave.pas' {change_leave.TWebForm_change_leave: ki_web_ui.page_class},
  change_cad_num in 'protected\change_cad_num.pas' {change_cad_num.TWebForm_change_cad_num: ki_web_ui.page_class},
  change_name in 'protected\change_name.pas' {change_name.TWebForm_change_name: ki_web_ui.page_class},
  UserControl_member_binder in 'usercontrol\app\UserControl_member_binder.pas' {UserControl_member_binder.TWebUserControl_member_binder: ki_web_ui.usercontrol_class},
  UserControl_dashboard_binder in 'usercontrol\app\UserControl_dashboard_binder.pas' {UserControl_dashboard_binder.TWebUserControl_dashboard_binder: ki_web_ui.usercontrol_class};

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
//   (*) KeyName refers to a key that has been installed in the Crypto Service
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

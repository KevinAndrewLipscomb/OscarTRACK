library OscarDotNet;

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  Class_biz_user in 'component\biz\Class_biz_user.pas',
  Class_biz_accounts in 'component\biz\Class_biz_accounts.pas',
  Class_biz_agencies in 'component\biz\Class_biz_agencies.pas',
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
  Class_db_enrollment in 'component\db\Class_db_enrollment.pas',
  Class_db_leaves in 'component\db\Class_db_leaves.pas',
  Class_db_medical_release_levels in 'component\db\Class_db_medical_release_levels.pas',
  Class_db_milestones in 'component\db\Class_db_milestones.pas',
  Class_db_officerships in 'component\db\Class_db_officerships.pas',
  Class_db_trail in 'component\db\Class_db_trail.pas',
  Class_biz_sections in 'component\biz\Class_biz_sections.pas',
  Class_biz_notifications in 'component\biz\Class_biz_notifications.pas',
  Class_biz_members in 'component\biz\Class_biz_members.pas',
  Class_db_members in 'component\db\Class_db_members.pas',
  Class_biz_users in 'component\biz\Class_biz_users.pas',
  Class_db_users in 'component\db\Class_db_users.pas',
  appcommon in 'appcommon.pas',
  Class_db_notifications in 'component\db\Class_db_notifications.pas',
  Class_biz_indicator_median_length_of_service in 'component\biz\Class_biz_indicator_median_length_of_service.pas',
  Class_db_indicator_median_length_of_service in 'component\db\Class_db_indicator_median_length_of_service.pas',
  Class_biz_data_conditions in 'component\biz\Class_biz_data_conditions.pas',
  Default in 'Default.pas',
  exception in 'exception.pas',
  Global in 'Global.pas',
  login in 'login.pas' {login.TWebForm_login: ki_web_ui.page_class},
  new_user_registration in 'new_user_registration.pas',
  remind_username in 'remind_username.pas',
  salogin in 'salogin.pas',
  overview in 'protected\overview.pas' {overview.TWebForm_overview: ki_web_ui.page_class},
  add_member in 'protected\add_member.pas' {add_member.TWebForm_add_member: ki_web_ui.page_class},
  add_new_enrollment_status in 'protected\add_new_enrollment_status.pas',
  change_cad_num in 'protected\change_cad_num.pas',
  change_email_address in 'protected\change_email_address.pas',
  change_leave in 'protected\change_leave.pas',
  change_member_agency in 'protected\change_member_agency.pas',
  change_member_driver_qualification in 'protected\change_member_driver_qualification.pas',
  change_member_email_address in 'protected\change_member_email_address.pas',
  change_member_medical_release_level in 'protected\change_member_medical_release_level.pas' {change_member_medical_release_level.TWebForm_change_member_medical_release_level: ki_web_ui.page_class},
  change_member_section in 'protected\change_member_section.pas',
  change_name in 'protected\change_name.pas',
  change_password in 'protected\change_password.pas',
  enrollment_detail in 'protected\enrollment_detail.pas' {enrollment_detail.TWebForm_enrollment_detail: ki_web_ui.page_class},
  establish_membership_trouble in 'protected\establish_membership_trouble.pas',
  grant_leave in 'protected\grant_leave.pas' {grant_leave.TWebForm_grant_leave: ki_web_ui.page_class},
  leave_detail in 'protected\leave_detail.pas' {leave_detail.TWebForm_leave_detail: ki_web_ui.page_class},
  member_detail in 'protected\member_detail.pas' {member_detail.TWebForm_member_detail: ki_web_ui.page_class},
  officership_detail in 'protected\officership_detail.pas' {officership_detail.TWebForm_officership_detail: ki_web_ui.page_class},
  UserControl_user in 'usercontrol\app\UserControl_user.pas',
  UserControl_about in 'usercontrol\app\UserControl_about.pas' {UserControl_about.TWebUserControl_about: ki_web_ui.usercontrol_class},
  UserControl_agency in 'usercontrol\app\UserControl_agency.pas' {UserControl_agency.TWebUserControl_agency: ki_web_ui.usercontrol_class},
  UserControl_commensuration in 'usercontrol\app\UserControl_commensuration.pas',
  UserControl_common_header_bar in 'usercontrol\app\UserControl_common_header_bar.pas',
  UserControl_config_binder in 'usercontrol\app\UserControl_config_binder.pas' {UserControl_config_binder.TWebUserControl_config_binder: ki_web_ui.usercontrol_class},
  UserControl_current_indicators in 'usercontrol\app\UserControl_current_indicators.pas' {UserControl_current_indicators.TWebUserControl_current_indicators: ki_web_ui.usercontrol_class},
  UserControl_dashboard_binder in 'usercontrol\app\UserControl_dashboard_binder.pas' {UserControl_dashboard_binder.TWebUserControl_dashboard_binder: ki_web_ui.usercontrol_class},
  UserControl_establish_membership in 'usercontrol\app\UserControl_establish_membership.pas',
  UserControl_member_binder in 'usercontrol\app\UserControl_member_binder.pas' {UserControl_member_binder.TWebUserControl_member_binder: ki_web_ui.usercontrol_class},
  UserControl_postcontent in 'usercontrol\app\UserControl_postcontent.pas' {UserControl_postcontent.TWebUserControl_postcontent: ki_web_ui.usercontrol_class},
  UserControl_precontent in 'usercontrol\app\UserControl_precontent.pas' {UserControl_precontent.TWebUserControl_precontent: ki_web_ui.usercontrol_class},
  UserControl_ranked_commensuration in 'usercontrol\app\UserControl_ranked_commensuration.pas',
  UserControl_ranked_core_ops_size in 'usercontrol\app\UserControl_ranked_core_ops_size.pas',
  UserControl_ranked_crew_shifts_forecast in 'usercontrol\app\UserControl_ranked_crew_shifts_forecast.pas',
  UserControl_ranked_length_of_service in 'usercontrol\app\UserControl_ranked_length_of_service.pas' {UserControl_ranked_length_of_service.TWebUserControl_ranked_length_of_service: ki_web_ui.usercontrol_class},
  UserControl_ranked_num_members_in_pipeline in 'usercontrol\app\UserControl_ranked_num_members_in_pipeline.pas',
  UserControl_ranked_standard_enrollment in 'usercontrol\app\UserControl_ranked_standard_enrollment.pas',
  UserControl_ranked_utilization in 'usercontrol\app\UserControl_ranked_utilization.pas' {UserControl_ranked_utilization.TWebUserControl_ranked_utilization: ki_web_ui.usercontrol_class},
  UserControl_roster in 'usercontrol\app\UserControl_roster.pas' {UserControl_roster.TWebUserControl_roster: ki_web_ui.usercontrol_class},
  UserControl_serial_indicator_commensuration in 'usercontrol\app\UserControl_serial_indicator_commensuration.pas' {UserControl_serial_indicator_commensuration.TWebUserControl_serial_indicator_commensuration: ki_web_ui.usercontrol_class},
  UserControl_serial_indicator_length_of_service in 'usercontrol\app\UserControl_serial_indicator_length_of_service.pas',
  UserControl_serial_indicator_num_core_ops_members in 'usercontrol\app\UserControl_serial_indicator_num_core_ops_members.pas' {UserControl_serial_indicator_num_core_ops_members.TWebUserControl_serial_indicator_num_core_ops_members: ki_web_ui.usercontrol_class},
  UserControl_serial_indicator_num_members_in_pipeline in 'usercontrol\app\UserControl_serial_indicator_num_members_in_pipeline.pas',
  UserControl_serial_indicator_potential_crew_shifts in 'usercontrol\app\UserControl_serial_indicator_potential_crew_shifts.pas',
  UserControl_serial_indicator_standard_enrollment in 'usercontrol\app\UserControl_serial_indicator_standard_enrollment.pas',
  UserControl_serial_indicator_utilization in 'usercontrol\app\UserControl_serial_indicator_utilization.pas',
  UserControl_serial_indicators_binder in 'usercontrol\app\UserControl_serial_indicators_binder.pas',
  UserControl_print_div in 'usercontrol\ki\UserControl_print_div.pas' {UserControl_print_div.TWebUserControl_print_div: ki_web_ui.usercontrol_class},
  UserControl_bread_crumb_trail in 'usercontrol\ki\UserControl_bread_crumb_trail.pas',
  UserControl_config_welcome in 'usercontrol\ki\UserControl_config_welcome.pas' {UserControl_config_welcome.TWebUserControl_config_welcome: ki_web_ui.usercontrol_class},
  UserControl_drop_down_date in 'usercontrol\ki\UserControl_drop_down_date.pas' {UserControl_drop_down_date.TWebUserControl_drop_down_date: ki_web_ui.usercontrol_class},
  statement_member_status in 'noninteractive\statement_member_status.pas',
  daily_tasks in 'noninteractive\daily_tasks.pas' {daily_tasks.TWebForm_daily_tasks: system.web.ui.page},
  milestone_sweep in 'noninteractive\milestone_sweep.pas',
  report_monthly_applicant_roster in 'noninteractive\report_monthly_applicant_roster.pas' {report_monthly_applicant_roster.TWebForm_report_monthly_applicant_roster: system.web.ui.page},
  report_monthly_core_ops_dashboard in 'noninteractive\report_monthly_core_ops_dashboard.pas' {report_monthly_core_ops_dashboard.TWebForm_report_monthly_core_ops_dashboard: system.web.ui.page},
  report_monthly_core_ops_roster in 'noninteractive\report_monthly_core_ops_roster.pas' {report_monthly_core_ops_roster.TWebForm_report_monthly_core_ops_roster: system.web.ui.page},
  report_monthly_current_roster in 'noninteractive\report_monthly_current_roster.pas',
  report_monthly_in_class_roster in 'noninteractive\report_monthly_in_class_roster.pas',
  report_monthly_recruit_awaiting_class_roster in 'noninteractive\report_monthly_recruit_awaiting_class_roster.pas',
  report_monthly_trainee_roster in 'noninteractive\report_monthly_trainee_roster.pas',
  report_monthly_per_agency_serial_indicators in 'noninteractive\report_monthly_per_agency_serial_indicators.pas' {report_monthly_per_agency_serial_indicators.TWebForm_report_monthly_per_agency_serial_indicators: system.web.ui.page},
  serial_indicator_control_chart in 'serial_indicator_control_chart.pas' {serial_indicator_control_chart.TWebForm1: system.web.ui.page},
  Class_biz_role_member_map in 'component\biz\Class_biz_role_member_map.pas',
  Class_db_role_member_map in 'component\db\Class_db_role_member_map.pas',
  UserControl_roles_and_matrices_binder in 'usercontrol\ki\UserControl_roles_and_matrices_binder.pas' {UserControl_roles_and_matrices_binder.TWebUserControl_roles_and_matrices_binder: ki_web_ui.usercontrol_class},
  Class_biz_roles in 'component\biz\Class_biz_roles.pas',
  Class_db_roles in 'component\db\Class_db_roles.pas',
  UserControl_role_member_matrix in 'usercontrol\app\UserControl_role_member_matrix.pas' {UserControl_role_member_matrix.TWebUserControl_role_member_matrix: ki_web_ui.usercontrol_class},
  Class_biz_role_privilege_map in 'component\biz\Class_biz_role_privilege_map.pas',
  Class_biz_privileges in 'component\biz\Class_biz_privileges.pas',
  Class_biz_role_notification_map in 'component\biz\Class_biz_role_notification_map.pas',
  UserControl_role_privilege_matrix in 'usercontrol\ki\UserControl_role_privilege_matrix.pas' {UserControl_role_privilege_matrix.TWebUserControl_role_privilege_matrix: ki_web_ui.usercontrol_class},
  UserControl_role_notification_matrix in 'usercontrol\ki\UserControl_role_notification_matrix.pas' {UserControl_role_notification_matrix.TWebUserControl_role_notification_matrix: ki_web_ui.usercontrol_class},
  Class_db_role_notification_map in 'component\db\Class_db_role_notification_map.pas',
  Class_db_role_privilege_map in 'component\db\Class_db_role_privilege_map.pas',
  Class_db_privileges in 'component\db\Class_db_privileges.pas',
  Class_biz_tiers in 'component\biz\Class_biz_tiers.pas',
  Class_db_tiers in 'component\db\Class_db_tiers.pas',
  UserControl_role in 'usercontrol\app\UserControl_role.pas' {UserControl_role.TWebUserControl_role: ki_web_ui.usercontrol_class};

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

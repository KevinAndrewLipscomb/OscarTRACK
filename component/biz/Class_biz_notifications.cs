using Class_biz_agencies;
using Class_biz_members;
using Class_biz_roles;
using Class_biz_user;
using Class_biz_users;
using Class_biz_vehicle_down_natures;
using Class_biz_vehicle_quarters;
using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using Class_db_notifications;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Web;

namespace Class_biz_notifications
{
    public static class Class_biz_notifications_Static
    {
        public static char[] BreakChars = new char[3 + 1] {Convert.ToChar(k.SPACE),Convert.ToChar(k.TAB),Convert.ToChar(k.HYPHEN),Convert.ToChar(0)};
    } // end Class_biz_notifications

    public class TClass_biz_notifications
    {
        private string application_name = String.Empty;
        private TClass_db_notifications db_notifications = null;
        private string host_domain_name = String.Empty;
        private string runtime_root_fullspec = String.Empty;
        //Constructor  Create()
        public TClass_biz_notifications() : base()
        {
            // TODO: Add any constructor code here
            application_name = ConfigurationManager.AppSettings["application_name"];
            db_notifications = new TClass_db_notifications();
            host_domain_name = ConfigurationManager.AppSettings["host_domain_name"];
            runtime_root_fullspec = ConfigurationManager.AppSettings["runtime_root_fullspec"];
        }
        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_notifications.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Notification --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public void BindTallies(object DataGrid_for_cycle, object DataGrid_for_lifetime)
        {
            db_notifications.BindTallies(DataGrid_for_cycle, DataGrid_for_lifetime);
        }

        public void CycleTallies()
        {
            db_notifications.CycleTallies();
        }

        private delegate string IssueForAgencyChange_Merge(string s);
        public void IssueForAgencyChange(string member_id, string first_name, string last_name, string cad_num, string old_agency_medium_designator, string new_agency_medium_designator)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForAgencyChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<old_agency_medium_designator/>", old_agency_medium_designator)
                .Replace("<new_agency_medium_designator/>", new_agency_medium_designator);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/agency_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("agency-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueAmbulanceFleetConditionAlarm_Merge(string s);
        public void IssueAmbulanceFleetConditionAlarm()
          {
          IssueAmbulanceFleetConditionAlarm_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name);
            };
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/ambulance_fleet_condition_alarm_on.txt"));
          k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], db_notifications.TargetOfAboutAgency("ambulance-fleet-condition-change"), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
          template_reader.Close();
          }

        private delegate string IssueAmbulanceFleetConditionAlert_Merge(string s);
        public void IssueAmbulanceFleetConditionAlert()
          {
          IssueAmbulanceFleetConditionAlert_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name);
            };
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/ambulance_fleet_condition_alert_on.txt"));
          k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], db_notifications.TargetOfAboutAgency("ambulance-fleet-condition-change"), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
          template_reader.Close();
          }

        private delegate string IssueForCadNumChange_Merge(string s);
        public void IssueForCadNumChange(string member_id, string first_name, string last_name, string cad_num)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForCadNumChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/cad_num_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("cad-num-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForDriverQualificationChange_Merge(string s);
        public void IssueForDriverQualificationChange(string member_id, string first_name, string last_name, string cad_num, bool be_driver_qualified)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForDriverQualificationChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<be_driver_qualified/>", k.YesNoOf(be_driver_qualified));
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/driver_qualification_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("driver-qualification-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForFailureToThriveDemotion_Merge(string s);
        public void IssueForFailureToThriveDemotion(string member_id, string first_name, string last_name, string cad_num)
        {
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForFailureToThriveDemotion_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<member_id/>", member_id)
                .Replace("<department_member_status_coordinator/>", ConfigurationManager.AppSettings["department_member_status_coordinator"]);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/failure_to_thrive_demotion.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("failure-to-thrive-demotion", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForForgottenUsername_Merge(string s);
        public void IssueForForgottenUsername(string email_address, string username, string client_host_name)
        {
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForForgottenUsername_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<client_host_name/>", client_host_name)
                .Replace("<email_address/>", client_host_name)
                .Replace("<username/>", username);
              };

            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/username_reminder.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], email_address, Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForLeaveChanged_Merge(string s);
        public void IssueForLeaveChanged(string member_id, string first_name, string last_name, string cad_num, string old_start_month, string old_end_month, string old_kind_of_leave, string old_num_obligated_shifts, string old_note, string new_start_month, string new_end_month, string new_kind_of_leave, string new_num_obligated_shifts, string new_note, string change_indicator_start_month, string change_indicator_end_month, string change_indicator_kind_of_leave, string change_indicator_num_obliged_shifts, string change_indicator_note)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForLeaveChanged_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<old_start_month/>", old_start_month)
                .Replace("<old_end_month/>", old_end_month)
                .Replace("<old_kind_of_leave/>", old_kind_of_leave)
                .Replace("<old_num_obligated_shifts/>", old_num_obligated_shifts)
                .Replace("<old_note/>", old_note)
                .Replace("<new_start_month/>", new_start_month)
                .Replace("<new_end_month/>", new_end_month)
                .Replace("<new_kind_of_leave/>", new_kind_of_leave)
                .Replace("<new_num_obligated_shifts/>", new_num_obligated_shifts)
                .Replace("<new_note/>", new_note)
                .Replace("<change_indicator_start_month/>", change_indicator_start_month)
                .Replace("<change_indicator_end_month/>", change_indicator_end_month)
                .Replace("<change_indicator_kind_of_leave/>", change_indicator_kind_of_leave)
                .Replace("<change_indicator_num_obliged_shifts/>", change_indicator_num_obliged_shifts)
                .Replace("<change_indicator_note/>", change_indicator_note);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_changed.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("leave-modified", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForLeaveDeleted_Merge(string s);
        public void IssueForLeaveDeleted(string member_id, string first_name, string last_name, string cad_num, string start_month, string end_month, string kind_of_leave, string num_obligated_shifts, string note)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForLeaveDeleted_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<start_month/>", start_month)
                .Replace("<end_month/>", end_month)
                .Replace("<kind_of_leave/>", kind_of_leave)
                .Replace("<num_obligated_shifts/>", num_obligated_shifts)
                .Replace("<note/>", note);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_deleted.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("leave-deleted", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForLeaveGranted_Merge(string s);
        public void IssueForLeaveGranted(string member_id, string first_name, string last_name, string cad_num, string start_month, string end_month, string kind_of_leave, string num_obligated_shifts, string note)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForLeaveGranted_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<start_month/>", start_month)
                .Replace("<end_month/>", end_month)
                .Replace("<kind_of_leave/>", kind_of_leave)
                .Replace("<num_obligated_shifts/>", num_obligated_shifts)
                .Replace("<note/>", note);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_granted.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("leave-granted", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForLeaveEndingSoon_Merge(string s);
        public void IssueForLeaveEndingSoon(string member_id, string first_name, string last_name, string cad_num)
        {
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForLeaveEndingSoon_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<member_id/>", member_id);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_ending_soon.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("leave-ending-soon", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForLeaveExpiredYesterday_Merge(string s);
        public void IssueForLeaveExpiredYesterday(string member_id, string first_name, string last_name, string cad_num)
        {
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForLeaveExpiredYesterday_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<member_id/>", member_id);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_expired_yesterday.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("leave-expired", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForMedicalReleaseLevelChange_Merge(string s);
        public void IssueForMedicalReleaseLevelChange(string member_id, string first_name, string last_name, string cad_num, string medical_release_level)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForMedicalReleaseLevelChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<medical_release_level/>", medical_release_level);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/medical_release_level_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("medical-release-level-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForMemberAdded_Merge(string s);
        public void IssueForMemberAdded(string member_id, string first_name, string last_name, string cad_num, string medical_release_level, bool be_driver_qualified, string agency_name, string email_address, string enrollment_date, string enrollment_level, string phone_num)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForMemberAdded_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<medical_release_level/>", medical_release_level)
                .Replace("<be_driver_qualified/>", k.YesNoOf(be_driver_qualified))
                .Replace("<agency_name/>", agency_name)
                .Replace("<email_address/>", email_address)
                .Replace("<enrollment_date/>", enrollment_date)
                .Replace("<enrollment_level/>", enrollment_level)
                .Replace("<phone_num/>", k.FormatAsNanpPhoneNum(phone_num));
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_added.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], email_address + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("member-added", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForMemberNameChange_Merge(string s);
        public void IssueForMemberNameChange(string member_id, string cad_num, string old_first_name, string old_last_name, string new_first_name, string new_last_name)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForMemberNameChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<cad_num/>", cad_num)
                .Replace("<old_first_name/>", old_first_name)
                .Replace("<old_last_name/>", old_last_name)
                .Replace("<new_first_name/>", new_first_name)
                .Replace("<new_last_name/>", new_last_name);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_name_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("member-name-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForMembershipEstablishmentTrouble_Merge(string s);
        public void IssueForMembershipEstablishmentTrouble(string full_name, string explanation)
        {
            string user_email_address = k.EMPTY;
            TClass_biz_user biz_user;
            StreamReader template_reader;

            IssueForMembershipEstablishmentTrouble_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<full_name/>", full_name.ToUpper())
                .Replace("<user_email_address/>", user_email_address)
                .Replace("<explanation/>", k.WrapText(explanation, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
              };

            biz_user = new TClass_biz_user();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/membership_establishment_trouble.txt"));
            user_email_address = biz_user.EmailAddress();
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["membership_establishment_liaison"] + k.COMMA + ConfigurationManager.AppSettings["application_name"] + "-appadmin@" + host_domain_name, Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForNeedsEnrollmentReview_Merge(string s);
        public void IssueForNeedsEnrollmentReview(string member_id, string first_name, string last_name, string cad_num, string old_level, string medical_release_level)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForNeedsEnrollmentReview_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<old_level/>", old_level)
                .Replace("<medical_release_level/>", medical_release_level);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/needs_enrollment_review.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("needs-enrollment-review", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForNewEnrollmentLevel_Merge(string s);
        public void IssueForNewEnrollmentLevel(string member_id, string first_name, string last_name, string cad_num, string new_level, string effective_date, string note)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForNewEnrollmentLevel_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<cad_num/>", cad_num)
                .Replace("<effective_date/>", effective_date)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<member_id/>", member_id)
                .Replace("<new_level/>", new_level)
                .Replace("<note/>", note);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/new_enrollment_level.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("new-enrollment-level", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForPhoneNumChange_Merge(string s);
        public void IssueForPhoneNumChange(string member_id, string first_name, string last_name, string cad_num, string agency_name, string phone_num)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForPhoneNumChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<agency_name/>", agency_name)
                .Replace("<phone_num/>", k.FormatAsNanpPhoneNum(phone_num));
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/phone_num_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("phone-num-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForRoleChange_Merge(string s);
        public void IssueForRoleChange(string member_id, string role_id, bool be_granted)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            string agency_name = k.EMPTY;
            TClass_biz_agencies biz_agencies;
            TClass_biz_members biz_members;
            TClass_biz_roles biz_roles;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            string cad_num = k.EMPTY;
            string changed = k.EMPTY;
            string first_name = k.EMPTY;
            string last_name = k.EMPTY;
            string role_name = k.EMPTY;
            StreamReader template_reader;
            string to_or_from = k.EMPTY;

            IssueForRoleChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<changed/>", changed)
                .Replace("<to_or_from/>", to_or_from)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<agency_name/>", agency_name)
                .Replace("<role_name/>", role_name)
                .Replace("<runtime_root_fullspec/>", runtime_root_fullspec);
              };

            biz_agencies = new TClass_biz_agencies();
            biz_members = new TClass_biz_members();
            biz_roles = new TClass_biz_roles();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            agency_name = biz_agencies.MediumDesignatorOf(biz_members.AgencyIdOfId(member_id));
            cad_num = biz_members.CadNumOfMemberId(member_id);
            if (be_granted)
            {
                changed = "granted";
                to_or_from = "to";
            }
            else
            {
                changed = "removed";
                to_or_from = "from";
            }
            first_name = biz_members.FirstNameOfMemberId(member_id);
            last_name = biz_members.LastNameOfMemberId(member_id);
            role_name = biz_roles.NameOfId(role_id);
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/role_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("role-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForSectionChange_Merge(string s);
        public void IssueForSectionChange(string member_id, string first_name, string last_name, string cad_num, string agency_name, string section_num)
        {
            string actor = k.EMPTY;
            string actor_email_address = k.EMPTY;
            string actor_member_id;
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForSectionChange_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<actor/>", actor)
                .Replace("<actor_email_address/>", actor_email_address)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<agency_name/>", agency_name)
                .Replace("<section_num/>", section_num);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/section_change.txt"));
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("section-change", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

        private delegate string IssueForSeniorityPromotion_Merge(string s);
        public void IssueForSeniorityPromotion(string member_id, string first_name, string last_name, string cad_num, string new_level)
        {
            TClass_biz_members biz_members;
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForSeniorityPromotion_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<member_id/>", member_id)
                .Replace("<new_level/>", new_level);
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/seniority_promotion.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("seniority-promotion", member_id), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForTemporaryPassword_Merge(string s);
        public void IssueForTemporaryPassword(string username, string client_host_name, string temporary_password)
        {
            TClass_biz_user biz_user;
            TClass_biz_users biz_users;
            StreamReader template_reader;

            IssueForTemporaryPassword_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<client_host_name/>", client_host_name)
                .Replace("<temporary_password/>", temporary_password);
              };

            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/temporary_password.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_users.PasswordResetEmailAddressOfUsername(username), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string IssueForVehicleDownNoteAppended_Merge(string s);
        public void IssueForVehicleDownNoteAppended(string vehicle_id, string down_comment)
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleDownNoteAppended_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<down_comment/>", k.WrapText(down_comment, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_down_note_appended.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssueForVehicleMarkedDown_Merge(string s);
        public void IssueForVehicleMarkedDown(string vehicle_id, DateTime time_went_down, string nature_id, string mileage, string down_comment)
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicle_down_natures = new TClass_biz_vehicle_down_natures();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleMarkedDown_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<time_went_down/>", time_went_down.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<nature/>", biz_vehicle_down_natures.ElaborationOf(nature_id))
              .Replace("<mileage/>", mileage)
              .Replace("<down_comment/>", k.WrapText(down_comment, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_marked_down.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssueForVehicleMarkedUp_Merge(string s);
        public void IssueForVehicleMarkedUp(string vehicle_id, DateTime time_came_up, string down_comment, string up_comment)
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleMarkedDown_Merge Merge = delegate (string s)
            {
            var WRAPTEXT_INSERT_STRING = k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6);
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<time_came_up/>", time_came_up.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<down_comment/>", k.WrapText(down_comment, WRAPTEXT_INSERT_STRING, Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])))
              .Replace("<up_comment/>", k.WrapText(up_comment, WRAPTEXT_INSERT_STRING, Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_marked_up.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-status-change","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssueForVehicleQuartersChange_Merge(string s);
        public void IssueForVehicleQuartersChange(string vehicle_id, string quarters_id, DateTime effective_datetime, string mileage, string note)
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicle_quarters = new TClass_biz_vehicle_quarters();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleMarkedDown_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<quarters_designator/>", biz_vehicle_quarters.MediumDashLongDesignatorOfId(quarters_id))
              .Replace("<effective_datetime/>", effective_datetime.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<mileage/>", mileage)
              .Replace("<note/>", k.WrapText(note, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_quarters_change.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-quarters-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-quarters-change","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssueMemberStatusStatement_Merge(string s);
        public void IssueMemberStatusStatement(string email_address, string first_name, string last_name, string cad_num, string agency, string section_num, string medical_release_description, string be_driver_qualified, string enrollment, string length_of_service, string kind_of_leave, string obliged_shifts, string phone_num)
        {
            StreamReader template_reader;

            IssueMemberStatusStatement_Merge Merge = delegate (string s)
              {
              return s
                .Replace("<application_name/>", application_name)
                .Replace("<host_domain_name/>", host_domain_name)
                .Replace("<first_name/>", first_name)
                .Replace("<last_name/>", last_name)
                .Replace("<cad_num/>", cad_num)
                .Replace("<agency/>", agency)
                .Replace("<section_num/>", section_num)
                .Replace("<medical_release_description/>", medical_release_description)
                .Replace("<be_driver_qualified/>", be_driver_qualified)
                .Replace("<enrollment/>", enrollment)
                .Replace("<length_of_service/>", length_of_service)
                .Replace("<kind_of_leave/>", kind_of_leave)
                .Replace("<obliged_shifts/>", obliged_shifts)
                .Replace("<phone_num/>", k.FormatAsNanpPhoneNum(phone_num));
              };

            template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_status_statement.txt"));
            // from
            // to
            // subject
            // body
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], email_address, Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
            template_reader.Close();
        }

        private delegate string RetractAmbulanceFleetConditionAlarm_Merge(string s);
        public void RetractAmbulanceFleetConditionAlarm()
          {
          RetractAmbulanceFleetConditionAlarm_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name);
            };
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/ambulance_fleet_condition_alarm_off.txt"));
          k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], db_notifications.TargetOfAboutAgency("ambulance-fleet-condition-change"), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
          template_reader.Close();
          }

        private delegate string RetractAmbulanceFleetConditionAlert_Merge(string s);
        public void RetractAmbulanceFleetConditionAlert()
          {
          RetractAmbulanceFleetConditionAlert_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name);
            };
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/ambulance_fleet_condition_alert_off.txt"));
          k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], db_notifications.TargetOfAboutAgency("ambulance-fleet-condition-change"), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()));
          template_reader.Close();
          }

        public string TargetOfAboutAgency(string name)
          {
          return TargetOfAboutAgency(name,k.EMPTY);
          }
        public string TargetOfAboutAgency(string name, string agency_id)
        {
            string result;
            result = db_notifications.TargetOfAboutAgency(name, agency_id);
            return result;
        }

    } // end TClass_biz_notifications

}


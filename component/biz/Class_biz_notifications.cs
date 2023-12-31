using Class_biz_agencies;
using Class_biz_chassis_models;
using Class_biz_custom_models;
using Class_biz_evals;
using Class_biz_fuels;
using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_roles;
using Class_biz_schedule_assignments;
using Class_biz_shifts;
using Class_biz_user;
using Class_biz_users;
using Class_biz_vehicle_down_natures;
using Class_biz_vehicle_kinds;
using Class_biz_vehicle_quarters;
using Class_biz_vehicles;
using Class_db_notifications;
using kix;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

namespace Class_biz_notifications
  {

  public static class Class_biz_notifications_Static
    {
    private static readonly char[] the_break_chars = new char[2 + 1] { Convert.ToChar(k.SPACE), Convert.ToChar(k.TAB), Convert.ToChar(0) };
    public static char[] BreakChars()
      {
      return the_break_chars;
      }
    }

  public class TClass_biz_notifications
    {
        private readonly string application_name = k.EMPTY;
        private readonly TClass_db_notifications db_notifications = null;
        private readonly string host_domain_name = k.EMPTY;
        private readonly string last_day_of_month_to_submit_schedule_availabilities = k.EMPTY;
        private readonly string runtime_root_fullspec = k.EMPTY;

        public TClass_biz_notifications() : base()
        {
            // TODO: Add any constructor code here
            application_name = ConfigurationManager.AppSettings["application_name"];
            db_notifications = new TClass_db_notifications();
            host_domain_name = ConfigurationManager.AppSettings["host_domain_name"];
            last_day_of_month_to_submit_schedule_availabilities = ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"];
            runtime_root_fullspec = ConfigurationManager.AppSettings["runtime_root_fullspec"];
        }


    internal void AnalyzeForNotificationComms
      (
      string[] user_notification_string_array,
      string selected_notification_name,
      ref bool be_scope_cross_agency,
      out bool be_notification_held_by_user,
      out bool be_scope_change_allowable
      )
      {
      be_notification_held_by_user = Array.IndexOf(user_notification_string_array,selected_notification_name) > -1;
      be_scope_cross_agency = (be_notification_held_by_user) && be_scope_cross_agency;
      be_scope_change_allowable = be_notification_held_by_user;
      }

    internal bool BeOkToAllowNotificationCommsQuickMessaging
      (
      bool has_user_quickmessage_priv,
      bool be_notification_held_by_user,
      bool be_any_notification_holders
      )
      {
      return
        (
          (
            has_user_quickmessage_priv
          ||
            be_notification_held_by_user
          )
        &&
          be_any_notification_holders
        );
      }

    public bool Bind
      (
      string partial_name,
      object target,
      string member_id = k.EMPTY
      )
      {
      return db_notifications.Bind(partial_name,target,member_id);
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

    public bool Get(string name)
      {
      return db_notifications.Get(name);
      }

    internal void IncrementEventTallyOnly(string name)
      {
      db_notifications.IncrementTallies(name);
      }

    private delegate string IssueExternalForGeneralDeparture_Merge(string s);
    public void IssueExternalForNonFutureGeneralDeparture // *Future* general departures are reported as part of daily_tasks.aspx.cs.
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string new_level,
      string effective_date,
      string note
      )
      {
      string actor = k.EMPTY;
      string actor_email_address = k.EMPTY;
      string actor_member_id;
      TClass_biz_members biz_members;
      TClass_biz_user biz_user;
      TClass_biz_users biz_users;
      StreamReader template_reader;

      IssueExternalForGeneralDeparture_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", "EMS " + actor)
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
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/new_enrollment_level.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:ConfigurationManager.AppSettings["external-general-departure-notification-target"],
        subject:"EMS member " + Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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

        private delegate string IssueForAvailabilitiesOverdue_Merge(string s);
        public void IssueForAvailabilitiesOverdue(string member_id)
          {
          //
          IssueForAvailabilitiesOverdue_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<last_day_of_month_to_submit_schedule_availabilities/>",last_day_of_month_to_submit_schedule_availabilities);
            };
          //
          var biz_members = new TClass_biz_members();
          var member_email_address = biz_members.EmailAddressOf(member_id);
          if (member_email_address.Length > 0)
            {
            var biz_agencies = new TClass_biz_agencies();
            var biz_role_member_map = new TClass_biz_role_member_map();
            var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/availabilities_overdue.txt"));
            k.SmtpMailSend
              (
              ConfigurationManager.AppSettings["sender_email_address"],
              member_email_address,
              Merge(template_reader.ReadLine()),
              Merge(template_reader.ReadToEnd()),
              false,
              k.EMPTY,
              k.EMPTY,
              biz_role_member_map.EmailTargetOfAppropriateScheduler(biz_members.AgencyIdOfId(member_id))
              );
            template_reader.Close();
            }
          }

        private delegate string IssueForAvailabilitiesDueSoon_Merge(string s);
        public void IssueForAvailabilitiesDueSoon(string member_id)
          {
          //
          IssueForAvailabilitiesDueSoon_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<last_day_of_month_to_submit_schedule_availabilities/>",last_day_of_month_to_submit_schedule_availabilities);
            };
          //
          var biz_members = new TClass_biz_members();
          var member_email_address = biz_members.EmailAddressOf(member_id);
          if (member_email_address.Length > 0)
            {
            var biz_agencies = new TClass_biz_agencies();
            var biz_role_member_map = new TClass_biz_role_member_map();
            var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/availabilities_due_soon.txt"));
            k.SmtpMailSend
              (
              ConfigurationManager.AppSettings["sender_email_address"],
              member_email_address,
              Merge(template_reader.ReadLine()),
              Merge(template_reader.ReadToEnd()),
              false,
              k.EMPTY,
              k.EMPTY,
              biz_role_member_map.EmailTargetOfAppropriateScheduler(biz_members.AgencyIdOfId(member_id))
              );
            template_reader.Close();
            }
          }

        private delegate string IssueForAvailabilitiesDueToday_Merge(string s);
        public void IssueForAvailabilitiesDueToday(string member_id)
          {
          //
          IssueForAvailabilitiesDueToday_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name);
            };
          //
          var biz_members = new TClass_biz_members();
          var member_email_address = biz_members.EmailAddressOf(member_id);
          if (member_email_address.Length > 0)
            {
            var biz_agencies = new TClass_biz_agencies();
            var biz_role_member_map = new TClass_biz_role_member_map();
            var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/availabilities_due_today.txt"));
            k.SmtpMailSend
              (
              ConfigurationManager.AppSettings["sender_email_address"],
              member_email_address,
              Merge(template_reader.ReadLine()),
              Merge(template_reader.ReadToEnd()),
              false,
              k.EMPTY,
              k.EMPTY,
              biz_role_member_map.EmailTargetOfAppropriateScheduler(biz_members.AgencyIdOfId(member_id))
              );
            template_reader.Close();
            }
          }

    private delegate string IssueForBlsAcademyProctorQualificationChange_Merge(string s);
    public void IssueForBlsAcademyProctorQualificationChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      bool be_bls_academy_proctor
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      var actor_member_id = k.EMPTY;

      IssueForBlsAcademyProctorQualificationChange_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<be_bls_academy_proctor/>", k.YesNoOf(be_bls_academy_proctor));
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/bls_academy_proctor_qualification_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("bls-academy-proctor-qualification-change", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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

        private delegate string IssueForDeath_Merge(string s);
        internal void IssueForDeath
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string effective_date,
          string note
          )
          {
          var actor = k.EMPTY;
          var actor_email_address = k.EMPTY;
          var actor_member_id = k.EMPTY;

          IssueForDeath_Merge Merge = delegate (string s)
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
              .Replace("<note/>", note);
            };

          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
          actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/death.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("new-enrollment-level", member_id),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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

    private delegate string IssueForDriverRestricted_Merge(string s);
    internal void IssueForDriverRestricted
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

      IssueForDriverRestricted_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<cad_num/>", cad_num)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/driver_restricted.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("established-driving-privileges-revoked", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

        private delegate string IssueForEfficiPayDocketNeedsFinalImprint_Merge(string s);
        internal void IssueForEfficiPayDocketNeedsFinalImprint
          (
          string agency_id,
          string check_num
          )
          {
          TClass_biz_members biz_members;
          TClass_biz_user biz_user;
          StreamReader template_reader;

          IssueForEfficiPayDocketNeedsFinalImprint_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<check_num/>", check_num)
              ;
            };

          biz_members = new TClass_biz_members();
          biz_user = new TClass_biz_user();
          template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/efficipay-docket-needs-final-imprint.txt"));
          k.SmtpMailSend
            (
            from: ConfigurationManager.AppSettings["sender_email_address"],
            to: db_notifications.TargetOfAboutAgency(name: "efficipay-docket-signed-and-countersigned", agency_id: agency_id),
            subject: Merge(template_reader.ReadLine()),
            message_string: Merge(template_reader.ReadToEnd())
            );
          template_reader.Close();
          }

        private delegate string IssueForEfficiPayDocketReadyForReview_Merge(string s);
        internal void IssueForEfficiPayDocketReadyForReview
          (
          string agency_id,
          string check_num
          )
          {
          string actor = k.EMPTY;
          string actor_email_address = k.EMPTY;
          string actor_member_id;
          TClass_biz_members biz_members;
          TClass_biz_user biz_user;
          TClass_biz_users biz_users;
          StreamReader template_reader;

          IssueForEfficiPayDocketReadyForReview_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", actor)
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<check_num/>", check_num)
              ;
            };

          biz_members = new TClass_biz_members();
          biz_user = new TClass_biz_user();
          biz_users = new TClass_biz_users();
          actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
          actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
          template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/efficipay-docket-needs-review.txt"));
          k.SmtpMailSend
            (
            from: ConfigurationManager.AppSettings["sender_email_address"],
            to: actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency(name: "efficipay-docket-ready-for-review", agency_id: agency_id),
            subject: Merge(template_reader.ReadLine()),
            message_string: Merge(template_reader.ReadToEnd()),
            be_html: false,
            cc: k.EMPTY,
            bcc: k.EMPTY,
            reply_to: actor_email_address
            );
          template_reader.Close();
          }

    private delegate string IssueForElectiveDeparture_Merge(string s);
    public void IssueForElectiveDeparture
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string new_level,
      string effective_date,
      string note
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

      IssueForElectiveDeparture_Merge Merge = delegate (string s)
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
          .Replace("<note/>", note)
          .Replace("<exit_survey_url/>", ConfigurationManager.AppSettings["exit_survey_url"])
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/elective_departure.txt"));
      //
      // These statements are a kludge to account for the way non-released personnel are tracked (as owned by EMS, then by section_num, instead of by agency as for all other personnel).
      //
      var additional_target_string = k.EMPTY;
      if (!biz_members.BeReleased(member_id))
        {
        additional_target_string = k.COMMA + db_notifications.TargetOfAboutAgency
          (
          name:"elective-departure",
          agency_id:biz_members.SectionOf(biz_members.Summary(member_id)) // KLUDGE: Pass section num as agency_id
          );
        }
      //
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id)
        + k.COMMA + actor_email_address
        + k.COMMA + db_notifications.TargetOf(name:"elective-departure",member_id:member_id)
        + additional_target_string,
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

    private delegate string IssueForMemberEmailAddressChange_Merge(string s);
    public void IssueForMemberEmailAddressChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string agency_name,
      string member_email_address
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      string actor_member_id;

      IssueForMemberEmailAddressChange_Merge Merge = delegate (string s)
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
          .Replace("<member_email_address/>", member_email_address)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_email_address_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:member_email_address + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("member-email-address-change", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

        private delegate string IssueForEvalArchived_Merge(string s);
        internal void IssueForEvalArchived
          (
          string eval_id,
          DateTime nominal_day,
          string shift_name,
          string post_designator,
          string post_cardinality,
          string vehicle_name,
          string evaluatee_name,
          string evaluatee_member_id,
          string evaluator_name,
          string evaluator_member_id
          )
          {

          IssueForEvalArchived_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<eval_id/>", eval_id)
              .Replace("<nominal_day/>", nominal_day.ToString("ddd yyyy-MM-dd"))
              .Replace("<shift_name/>", shift_name)
              .Replace("<post_designator/>", post_designator)
              .Replace("<post_cardinality/>", post_cardinality)
              .Replace("<vehicle_name/>", vehicle_name)
              .Replace("<evaluatee_name/>", evaluatee_name)
              .Replace("<evaluator_name/>", evaluator_name)
              ;
            };

          var biz_members = new TClass_biz_members();
          var template_reader = File.OpenText(path:HttpContext.Current.Server.MapPath(path:"template/notification/eval_archived.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:biz_members.EmailAddressOf(evaluator_member_id) + k.COMMA + db_notifications.TargetOf("eval-archived",evaluator_member_id),
              // Provide evaluatEE_member_id to above TargetOf when dept returns to tracking Students, Oriented Students, and BLS Interns via the agency attribute rather than the section attribute.
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd()),
            be_html:false,
            cc:biz_members.EmailAddressOf(evaluatee_member_id)
            );
          template_reader.Close();
          }

        private delegate string IssueForEvalNeedsAicInput_Merge(string s);
        internal void IssueForEvalNeedsAicInput
          (
          string eval_id,
          DateTime nominal_day,
          string shift_name,
          string post_designator,
          string post_cardinality,
          string vehicle_name,
          string evaluatee_name,
          string evaluatee_member_id,
          string evaluator_member_id
          )
          {

          IssueForEvalNeedsAicInput_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<eval_id/>", eval_id)
              .Replace("<nominal_day/>", nominal_day.ToString("ddd yyyy-MM-dd"))
              .Replace("<shift_name/>", shift_name)
              .Replace("<post_designator/>", post_designator)
              .Replace("<post_cardinality/>", post_cardinality)
              .Replace("<vehicle_name/>", vehicle_name)
              .Replace("<evaluatee_name/>", evaluatee_name)
              ;
            };

          var biz_members = new TClass_biz_members();
          var template_reader = File.OpenText(path:HttpContext.Current.Server.MapPath(path:"../noninteractive/template/notification/eval_needs_aic_input.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:biz_members.EmailAddressOf(evaluator_member_id),
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd()),
            be_html:false,
            cc:biz_members.EmailAddressOf(evaluatee_member_id)
            );
          template_reader.Close();
          }

    private delegate string IssueForEvalNeedsEvaluateeRebuttal_Merge(string s);
        internal void IssueForEvalNeedsEvaluateeRebuttal
          (
          string eval_id,
          DateTime nominal_day,
          string shift_name,
          string post_designator,
          string post_cardinality,
          string vehicle_name,
          string evaluator_name,
          string evaluatee_member_id
          )
          {

          IssueForEvalNeedsEvaluateeRebuttal_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<eval_id/>", eval_id)
              .Replace("<nominal_day/>", nominal_day.ToString("ddd yyyy-MM-dd"))
              .Replace("<shift_name/>", shift_name)
              .Replace("<post_designator/>", post_designator)
              .Replace("<post_cardinality/>", post_cardinality)
              .Replace("<vehicle_name/>", vehicle_name)
              .Replace("<evaluator_name/>", evaluator_name)
              ;
            };

          var biz_members = new TClass_biz_members();
          var template_reader = File.OpenText(path:HttpContext.Current.Server.MapPath(path:"../noninteractive/template/notification/eval_needs_evaluatee_rebuttal.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:biz_members.EmailAddressOf(evaluatee_member_id),
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd())
            );
          template_reader.Close();
          }

        private delegate string IssueForEvalStalled_Merge(string s);
        internal void IssueForEvalStalled
          (
          string eval_id,
          bool be_stalled_by_evaluatee
          )
          {
          var biz_members = new TClass_biz_members();
          var biz_shifts = new TClass_biz_shifts();
          //
          var aic_member_id = k.EMPTY;
          var nominal_day = DateTime.MinValue;
          var shift_id = k.EMPTY;
          var third_member_id = k.EMPTY;
          var time_in = DateTime.MinValue;
          //
          IssueForEvalStalled_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<eval_id/>",eval_id)
              .Replace("<evaluatee_first_name/>",biz_members.FirstNameOfMemberId(third_member_id))
              .Replace("<evaluatee_last_name/>",biz_members.LastNameOfMemberId(third_member_id))
              .Replace("<evaluatee_cad_num/>",biz_members.CadNumOfMemberId(third_member_id))
              .Replace("<nominal_day/>",nominal_day.ToString("yyyy-MM-dd"))
              .Replace("<shift/>",biz_shifts.NameOf(shift_id))
              .Replace("<time_in/>",time_in.ToString("HH:mm"))
              .Replace("<evaluator_first_name/>",biz_members.FirstNameOfMemberId(aic_member_id))
              .Replace("<evaluator_last_name/>",biz_members.LastNameOfMemberId(aic_member_id))
              .Replace("<evaluator_cad_num/>",biz_members.CadNumOfMemberId(aic_member_id))
              ;
            };
          //
          var dummy_bool = false;
          var dummy_datetime = DateTime.MinValue;
          var dummy_int_sign_range = new k.int_sign_range();
          var dummy_string = k.EMPTY;
          new TClass_biz_evals().Get
            (
            id:eval_id,
            third_member_id:out third_member_id,
            nominal_day:out nominal_day,
            shift_id:out shift_id,
            post_id:out dummy_string,
            post_cardinality:out dummy_string,
            vehicle_id:out dummy_string,
            aic_member_id:out aic_member_id,
            alt_aic_reason:out dummy_string,
            time_in:out time_in,
            time_out:out dummy_datetime,
            discussions:out dummy_string,
            aic_ok_with_third_progress_null_false_true_condition:out dummy_int_sign_range,
            aic_ok_with_third_release_null_false_true_condition:out dummy_int_sign_range,
            third_ok_with_progress_null_false_true_condition:out dummy_int_sign_range,
            third_ok_with_release_null_false_true_condition:out dummy_int_sign_range,
            comments_on_driving:out dummy_string,
            miles_driven_routine:out dummy_string,
            miles_driven_emergency:out dummy_string,
            road_conditions:out dummy_string,
            aic_ok_with_third_being_driver_null_false_true_condition:out dummy_int_sign_range,
            third_ok_with_being_driver_null_false_true_condition:out dummy_int_sign_range,
            status_id:out dummy_string,
            be_locked_by_third_initially:out dummy_bool,
            be_locked_by_aic:out dummy_bool,
            third_rebuttal:out dummy_string
            );
          var target_email_address = biz_members.EmailAddressOf((be_stalled_by_evaluatee ? third_member_id : aic_member_id));
          if (target_email_address.Length > 0)
            {
            var biz_agencies = new TClass_biz_agencies();
            var biz_role_member_map = new TClass_biz_role_member_map();
            var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/eval_stalled.txt"));
            k.SmtpMailSend
              (
              from:ConfigurationManager.AppSettings["sender_email_address"],
              to:target_email_address,
              subject:Merge(template_reader.ReadLine()),
              message_string:Merge(template_reader.ReadToEnd()),
              be_html:false,
              cc:k.EMPTY,
              bcc:k.EMPTY,
              reply_to:biz_role_member_map.EmailTargetOf("Department BLS ID Coordinator","EMS")
              );
            template_reader.Close();
            }
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

    private delegate string IssueForFlightMedicQualificationChange_Merge(string s);
    public void IssueForFlightMedicQualificationChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      bool be_flight_medic
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      var actor_member_id = k.EMPTY;

      IssueForFlightMedicQualificationChange_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<be_flight_medic/>", k.YesNoOf(be_flight_medic));
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/flight_medic_qualification_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("flight-medic-qualification-change", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
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
    public void IssueForLeaveChanged
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string old_start_month,
      string old_end_month,
      string old_kind_of_leave,
      string old_num_obligated_shifts,
      string old_note,
      string new_start_month,
      string new_end_month,
      string new_kind_of_leave,
      string new_num_obligated_shifts,
      string new_note,
      string change_indicator_start_month,
      string change_indicator_end_month,
      string change_indicator_kind_of_leave,
      string change_indicator_num_obliged_shifts,
      string change_indicator_note,
      bool be_interactive = true
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

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

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = (be_interactive ? biz_members.IdOfUserId(biz_user.IdNum()) : k.EMPTY);
      actor = (be_interactive ? biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id) : k.EMPTY);
      actor_email_address = (be_interactive ? biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum()) : k.EMPTY);
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/leave_changed.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("leave-modified", member_id) + (be_interactive ? k.COMMA + actor_email_address : k.EMPTY),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

    private delegate string IssueForLeaveClearedImmediately_Merge(string s);
    internal void IssueForLeaveClearedImmediately
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

      IssueForLeaveClearedImmediately_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<cad_num/>", cad_num)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/medical_leave_cleared.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("leave-modified", member_id) + k.COMMA + actor_email_address,
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        reply_to:actor_email_address
        );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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
        public void IssueForLeaveEndingSoon
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string kind_of_leave
          )
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
                .Replace("<member_id/>", member_id)
                .Replace("<kind_of_leave/>", kind_of_leave)
                .Replace("<last_day_of_month_to_submit_schedule_availabilities/>", ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"])
                ;
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
        public void IssueForLeaveExpiredYesterday
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string kind_of_leave
          )
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
                .Replace("<member_id/>", member_id)
                .Replace("<kind_of_leave/>", kind_of_leave)
                ;
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

    private delegate string IssueForMarineMedicQualificationChange_Merge(string s);
    public void IssueForMarineMedicQualificationChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      bool be_marine_medic
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      var actor_member_id = k.EMPTY;

      IssueForMarineMedicQualificationChange_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<be_marine_medic/>", k.YesNoOf(be_marine_medic));
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.Roles()[0] + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/marine_medic_qualification_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("marine-medic-qualification-change", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

    private delegate string IssueForMedicalLeaveAutomaticallyExtendedIntoNextMonth_Merge(string s);
    internal void IssueForMedicalLeaveAutomaticallyExtendedIntoNextMonth
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num
      )
      {
      IssueForLeaveChanged_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          ;
        };

      var biz_members = new TClass_biz_members();
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/medical_leave_extended.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + db_notifications.TargetOf("leave-modified", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false
        );
      template_reader.Close();
      }

    private delegate string IssueForMedicalReleaseLevelChange_Merge(string s);
    public void IssueForMedicalReleaseLevelChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string medical_release_level,
      string cross_agency_id = k.EMPTY
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

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
          .Replace("<medical_release_level/>", medical_release_level)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/medical_release_level_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id)
        + k.COMMA + actor_email_address
        + k.COMMA + db_notifications.TargetOf("medical-release-level-change", member_id)
        + (cross_agency_id.Length > 0 ? k.COMMA + db_notifications.TargetOfAboutAgency(name:"medical-release-level-change",agency_id:cross_agency_id) : k.EMPTY),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

        private delegate string IssueForMemberAdded_Merge(string s);
        public void IssueForMemberAdded
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string medical_release_level,
          bool be_driver_qualified,
          string agency_name,
          string email_address,
          string enrollment_date,
          string enrollment_level,
          string phone_num,
          string phone_service,
          string section_num
          )
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
                .Replace("<phone_num/>", k.FormatAsNanpPhoneNum(phone_num))
                .Replace("<phone_service/>", phone_service)
                .Replace("<section_num/>", section_num)
                ;
              };

            biz_members = new TClass_biz_members();
            biz_user = new TClass_biz_user();
            biz_users = new TClass_biz_users();
            actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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

        private delegate string IssueForMemberLengthOfServiceChange_Merge(string s);
        internal void IssueForMemberLengthOfServiceChange
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string years_subtracted,
          string months_subtracted,
          string days_subtracted,
          decimal new_length_of_service,
          string rationale
          )
          {
          var actor = k.EMPTY;
          var actor_email_address = k.EMPTY;

          IssueForMemberLengthOfServiceChange_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>",application_name)
              .Replace("<host_domain_name/>",host_domain_name)
              .Replace("<actor/>",actor)
              .Replace("<actor_email_address/>",actor_email_address)
              .Replace("<first_name/>",first_name)
              .Replace("<last_name/>",last_name)
              .Replace("<cad_num/>",cad_num)
              .Replace("<years_subtracted/>",years_subtracted)
              .Replace("<months_subtracted/>",months_subtracted)
              .Replace("<days_subtracted/>",days_subtracted)
              .Replace("<new_length_of_service/>",new_length_of_service.ToString("F4"))
              .Replace
                (
                oldValue:"<rationale/>",
                newValue:k.WrapText
                  (
                  t:rationale,
                  insert_string:k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6),
                  break_char_array:Class_biz_notifications_Static.BreakChars(),
                  max_line_len:short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])
                  )
);
            };

          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
          actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_length_of_service_change.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("member-length-of-service-change",member_id),
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd()),
            be_html:
            false,
            cc:k.EMPTY,
            bcc:k.EMPTY,
            reply_to:actor_email_address
            );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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

        private delegate string IssueForMembershipEstablishmentBlocked_Merge(string s);
        public void IssueForMembershipEstablishmentBlocked
          (
          string username,
          string user_id,
          string claimed_role_name,
          string claimed_member_name,
          string claimed_member_id,
          string claimed_member_email_address
          )
          {
          var user_email_address = k.EMPTY;
          IssueForMembershipEstablishmentBlocked_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>",application_name)
              .Replace("<host_domain_name/>",host_domain_name)
              .Replace("<username/>",username)
              .Replace("<user_id/>",user_id)
              .Replace("<user_email_address/>",user_email_address)
              .Replace("<claimed_role_name/>",claimed_role_name)
              .Replace("<claimed_member_name/>",claimed_member_name)
              .Replace("<claimed_member_id/>",claimed_member_id)
              .Replace("<claimed_member_email_address/>",claimed_member_email_address);
            };
          var biz_user = new TClass_biz_user();
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/membership_establishment_blocked.txt"));
          user_email_address = biz_user.EmailAddress();
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            ConfigurationManager.AppSettings["application_name"] + "-appadmin@" + host_domain_name + k.COMMA + ConfigurationManager.AppSettings["sysadmin_sms_address"],
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            user_email_address
            );
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
                .Replace("<explanation/>", k.WrapText(explanation, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
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

        private delegate string IssueForMembershipReestablishment_Merge(string s);
        internal void IssueForMembershipReestablishment(string saved_member_email_address, string username, string new_email_address)
          {
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/membership_reestablishment.txt"));

          IssueForMembershipReestablishment_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<username/>", username)
              .Replace("<new_email_address/>", new_email_address);
            };

          k.SmtpMailSend
            (
            // from
            ConfigurationManager.AppSettings["sender_email_address"],
            // to
            saved_member_email_address,
            // subject
            Merge(template_reader.ReadLine()),
            // body
            Merge(template_reader.ReadToEnd())
            );
          template_reader.Close();
          }

        private delegate string IssueForGripeSubmission_Merge(string s);
        internal void IssueForGripeSubmission
          (
          string vehicle_id,
          string down_comment
          )
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForGripeSubmission_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<description/>", k.WrapText(down_comment, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/gripe_submission.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("gripe-submission", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("gripe-submission","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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
        public void IssueForNewEnrollmentLevel
          (
          string member_id,
          string first_name,
          string last_name,
          string cad_num,
          string new_level,
          string effective_date,
          string note
          )
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
            actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
            template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/new_enrollment_level.txt"));
            //
            // These statements are a kludge to account for the way non-released personnel are tracked (as owned by EMS, then by section_num, instead of by agency as for all other personnel).
            //
            var additional_target_string = k.EMPTY;
            if (!biz_members.BeReleased(member_id))
              {
              additional_target_string = k.COMMA + db_notifications.TargetOfAboutAgency
                (
                name:"new-enrollment-level",
                agency_id:biz_members.SectionOf(biz_members.Summary(member_id)) // KLUDGE: Pass section num as agency_id
                );
              }
            //
            k.SmtpMailSend
              (
              from:ConfigurationManager.AppSettings["sender_email_address"],
              to:biz_members.EmailAddressOf(member_id)
              + k.COMMA + actor_email_address
              + k.COMMA + db_notifications.TargetOf("new-enrollment-level", member_id)
              + additional_target_string,
              subject:Merge(template_reader.ReadLine()),
              message_string:Merge(template_reader.ReadToEnd()),
              be_html:false,
              cc:k.EMPTY,
              bcc:k.EMPTY,
              reply_to:actor_email_address
              );
            template_reader.Close();
          }

        private delegate string IssueForNewVehicle_Merge(string s);
        internal void IssueForNewVehicle
          (
          string agency_id,
          string name,
          string kind_id,
          string bumper_number,
          string model_year,
          string chassis_model_id,
          string custom_model_id,
          string vin,
          string fuel_id,
          string license_plate,
          string purchase_price,
          string target_pm_mileage,
          DateTime dmv_inspection_due,
          bool be_four_or_all_wheel_drive
          )
          {
          var biz_agencies = new TClass_biz_agencies();
          var biz_chassis_models = new TClass_biz_chassis_models();
          var biz_custom_models = new TClass_biz_custom_models();
          var biz_fuels = new TClass_biz_fuels();
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicle_kinds = new TClass_biz_vehicle_kinds();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForNewVehicle_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<agency/>",biz_agencies.ShortDesignatorOf(agency_id) + k.SPACE_HYPHEN_SPACE + biz_agencies.LongDesignatorOf(agency_id))
              .Replace("<name/>",name)
              .Replace("<kind/>",biz_vehicle_kinds.DescriptionOf(kind_id))
              .Replace("<bumper_number/>",bumper_number)
              .Replace("<model_year/>",model_year)
              .Replace("<chassis_model/>",biz_chassis_models.DescriptionOf(chassis_model_id))
              .Replace("<custom_model/>",biz_custom_models.DescriptionOf(custom_model_id))
              .Replace("<vin/>",vin)
              .Replace("<fuel/>",biz_fuels.DescriptionOf(fuel_id))
              .Replace("<license_plate/>",license_plate)
              .Replace("<purchase_price/>",purchase_price)
              .Replace("<target_pm_mileage/>",target_pm_mileage)
              .Replace("<dmv_inspection_due/>",dmv_inspection_due.ToString("yyyy-MM"))
              .Replace("<be_four_or_all_wheel_drive/>",be_four_or_all_wheel_drive.ToString())
              ;
            };

          var biz_vehicles = new TClass_biz_vehicles();
          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_added.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-added",agency_id) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-added","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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
            actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
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
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("role-change",member_id,role_name), Merge(template_reader.ReadLine()), Merge(template_reader.ReadToEnd()), false, k.EMPTY, k.EMPTY, actor_email_address);
            template_reader.Close();
        }

    private delegate string IssueForSectionChange_Merge(string s);
    public void IssueForSectionChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string agency_name,
      string section_num
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;

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
          .Replace("<section_num/>", section_num)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/section_change.txt"));
      //
      // These statements are a kludge to account for the way non-released personnel are tracked (as owned by EMS, then by section_num, instead of by agency as for all other personnel).
      //
      var additional_target_string = k.EMPTY;
      if (!biz_members.BeReleased(member_id))
        {
        additional_target_string = k.COMMA + db_notifications.TargetOfAboutAgency
          (
          name:"section-change",
          agency_id:section_num // KLUDGE: Pass section_num as agency_id
          );
        }
      //
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id)
        + k.COMMA + actor_email_address
        + k.COMMA + db_notifications.TargetOf
            (
            name:"section-change",
            member_id:member_id
            )
        + additional_target_string,
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        reply_to:actor_email_address
        );
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

    private delegate string IssueForSeniorityPromotionEarlyWarning_Merge(string s);
    internal void IssueForSeniorityPromotionEarlyWarning
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string current_level,
      string subject_email_address,
      string subject_phone_number
      )
      {
      IssueForSeniorityPromotionEarlyWarning_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<member_id/>", member_id)
          .Replace("<current_level/>", current_level)
          .Replace("<subject_email_address/>",subject_email_address)
          .Replace("<subject_phone_number/>",subject_phone_number)
          ;
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/seniority_promotion_early_warning.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:db_notifications.TargetOf("seniority-promotion-early-warning", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd())
        );
      template_reader.Close();
      }

    private delegate string IssueForSquadTruckTeamQualificationChange_Merge(string s);
    public void IssueForSquadTruckTeamQualificationChange
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      bool be_on_squad_truck_team
      )
      {
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      var actor_member_id = k.EMPTY;

      IssueForSquadTruckTeamQualificationChange_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", actor)
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<first_name/>", first_name)
          .Replace("<last_name/>", last_name)
          .Replace("<cad_num/>", cad_num)
          .Replace("<be_on_squad_truck_team/>", k.YesNoOf(be_on_squad_truck_team));
        };

      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/squad_truck_team_qualification_change.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_members.EmailAddressOf(member_id) + k.COMMA + actor_email_address + k.COMMA + db_notifications.TargetOf("squad-truck-team-qualification-change", member_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
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

    private delegate string IssueForThirdReleased_Merge(string s);
    public void IssueForThirdReleased
      (
      string member_id,
      string first_name,
      string last_name,
      string cad_num,
      string medical_release_level,
      string cross_agency_id = k.EMPTY
      )
      {
      var biz_members = new TClass_biz_members();
      //
      var actor = k.EMPTY;
      var actor_email_address = k.EMPTY;
      var member_email_address = biz_members.EmailAddressOf(member_id);
      var member_phone_num = biz_members.PhoneNumOf(member_id);

      IssueForThirdReleased_Merge Merge = delegate (string s)
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
          .Replace("<released_member_email_address/>", member_email_address)
          .Replace("<released_member_phone_num/>", k.FormatAsNanpPhoneNum(member_phone_num))
          ;
        };

      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      actor = biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id);
      actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/third-released.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:member_email_address
        + k.COMMA + actor_email_address
        + k.COMMA + db_notifications.TargetOf("third-released", member_id)
        + (cross_agency_id.Length > 0 ? k.COMMA + db_notifications.TargetOfAboutAgency(name:"third-released",agency_id:cross_agency_id) : k.EMPTY),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        be_html:false,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:actor_email_address
        );
      template_reader.Close();
      }

        private delegate string IssueForUpcomingDuty_Merge(string s);
        internal void IssueForUpcomingDuty(string schedule_assignment_id)
          {
          var biz_agencies = new TClass_biz_agencies();
          var biz_members = new TClass_biz_members();
          var biz_role_member_map = new TClass_biz_role_member_map();
          var biz_schedule_assignments = new TClass_biz_schedule_assignments();
          var biz_shifts = new TClass_biz_shifts();
          //
          var dummy_bool = false;
          var dummy_datetime = DateTime.MinValue;
          var dummy_string = k.EMPTY;
          //
          var comment = k.EMPTY;
          var member_id = k.EMPTY;
          var nominal_day = DateTime.MinValue;
          var partner_list = k.EMPTY;
          var post_id = k.EMPTY;
          var post_cardinality = k.EMPTY;
          var shift_id = k.EMPTY;
          biz_schedule_assignments.Get(schedule_assignment_id,out nominal_day,out shift_id,out post_id,out post_cardinality,out dummy_string,out member_id,out dummy_bool,out comment,out partner_list);
          var nominal_day_string = nominal_day.ToString("dddd dd MMMM yyyy");
          //
          var shift_name = k.EMPTY;
          var shift_start = DateTime.MinValue;;
          biz_shifts.Get(shift_id,out shift_start,out dummy_datetime,out shift_name,out dummy_string);
          //
          var door_code = k.EMPTY;
          var post_medium_designator = k.EMPTY;
          var post_long_designator = k.EMPTY;
          var address = k.EMPTY;
          biz_agencies.Get
            (
            id:post_id,
            short_designator:out dummy_string,
            medium_designator:out post_medium_designator,
            long_designator:out post_long_designator,
            be_active:out dummy_bool,
            keyclick_enumerator:out dummy_string,
            oscar_classic_enumerator:out dummy_string,
            be_ems_post:out dummy_bool,
            door_code:out door_code,
            be_ok_to_nag:out dummy_bool,
            be_ok_to_send_duty_reminders:out dummy_bool,
            address:out address,
            be_keyclick_enabled:out dummy_bool,
            be_efficipay_enabled:out dummy_bool
            );
          //
          var member_agency_id = biz_members.AgencyIdOfId(member_id);
          var rsvp_target = k.EMPTY;
          //
          // Set up any RSVP to include cognizant authority for the assigned post.
          //
          var agency_id_responsible_for_post = biz_agencies.IdResponsibleForPost(post_id);
          rsvp_target += k.SPACE + biz_role_member_map.EmailTargetOfAgencyIdList((agency_id_responsible_for_post == "0" ? "Department Chief Scheduler" : "Squad Commander"),agency_id_responsible_for_post) + k.SPACE;
          //
          // Set up any RSVP to include cognizant authority for the member.
          //
          if (biz_members.BeDriverQualifiedOfId(member_id) || biz_members.BeReleased(member_id))
            {
            rsvp_target += k.SPACE + biz_role_member_map.EmailTargetOf("Department Chief Scheduler","EMS") + k.SPACE
            + k.SPACE + biz_role_member_map.EmailTargetOfAgencyIdList("Squad Commander",member_agency_id) + k.SPACE;
            }
          else
            {
            rsvp_target += k.SPACE + biz_role_member_map.EmailTargetOfAgencyIdList((member_agency_id == "0" ? "Department BLS ID Coordinator" : "Squad Training Officer"),member_agency_id);
            }
          //
          var post_elaboration = k.EMPTY;
          if (post_medium_designator.StartsWith("Rescue "))
            {
            post_elaboration += " - " + post_long_designator + k.NEW_LINE
            + (new String(Convert.ToChar(k.SPACE), 3)) + address + k.NEW_LINE
            + (new String(Convert.ToChar(k.SPACE), 3)) + "Google map: http://google.com/maps?q=" + HttpUtility.UrlEncode(address + ", VIRGINIA BEACH, VA");
            }

          IssueForUpcomingDuty_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<comment/>",(comment.Length == 0 ? "(none)" : comment))
              .Replace("<door_code/>",door_code)
              .Replace("<first_name/>",biz_members.FirstNameOfMemberId(member_id))
              .Replace("<urlpathencoded_nominal_day_and_shift/>",HttpUtility.UrlPathEncode(nominal_day_string + k.SPACE + shift_name))
              .Replace("<nominal_day/>",nominal_day_string)
              .Replace("<partner_list/>",(partner_list.Length > 0 ? partner_list.Replace(k.COMMA_SPACE,k.NEW_LINE + (new String(Convert.ToChar(k.SPACE), 3))) : "(no one)"))
              .Replace("<post_elaboration/>",post_elaboration)
              .Replace("<post_medium_designator/>",post_medium_designator)
              .Replace("<post_cardinality/>",post_cardinality)
              .Replace("<shift_name/>",shift_name)
              .Replace("<shift_start/>",shift_start.ToString("HH:mm"))
              .Replace("<rsvp_target/>",rsvp_target.Trim().Replace(k.SPACE + k.SPACE,k.SPACE).Replace(k.SPACE,k.COMMA))
              .Replace("<agency_short_designator/>",biz_agencies.ShortDesignatorOf(agency_id_responsible_for_post))
              ;
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/upcoming_duty_reminder.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            biz_members.EmailAddressOf(member_id),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            ConfigurationManager.AppSettings["bouncer_email_address"]
            );
          template_reader.Close();
          }

        private delegate string IssueForVehicleAppointment_Merge(string s);
        internal void IssueForVehicleAppointment
          (
          string vehicle_name,
          string vehicle_agency_id,
          string vehicle_agency_designator,
          string where,
          string when,
          string comment
          )
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleAppointment_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", vehicle_name)
              .Replace("<where/>", where.ToUpper())
              .Replace("<when/>", when.ToUpper())
              .Replace("<comment/>", k.WrapText(comment.ToUpper(), k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])))
              .Replace("<agency/>", vehicle_agency_designator)
              ;
            };

          var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_appointment.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled",vehicle_agency_id),
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd()),
            be_html:false,
            cc: db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled","0"),
            bcc:k.EMPTY,
            reply_to:actor_email_address
            );
          template_reader.Close();
          }

    private delegate string IssueForVehicleDeploymentGuidanceChanged_Merge(string s);
    internal void IssueForVehicleDeploymentGuidanceChanged
      (
      string vehicle_id,
      string old_deployment_guidance,
      string new_deployment_guidance
      )
      {
      var biz_members = new TClass_biz_members();
      var biz_user = new TClass_biz_user();
      var biz_users = new TClass_biz_users();
      var biz_vehicles = new TClass_biz_vehicles();
      //
      var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

      IssueForVehicleDeploymentGuidanceChanged_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
          .Replace("<actor_email_address/>", actor_email_address)
          .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
          .Replace("<old_deployment_guidance/>", old_deployment_guidance)
          .Replace("<new_deployment_guidance/>", new_deployment_guidance);
        };

      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_deployment_guidance_changed.txt"));
      k.SmtpMailSend
        (
        ConfigurationManager.AppSettings["sender_email_address"],
        actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-deployment-guidance-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-deployment-guidance-change","0"),
        Merge(template_reader.ReadLine()),
        Merge(template_reader.ReadToEnd()),
        false,
        k.EMPTY,
        k.EMPTY,
        actor_email_address
        );
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
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<down_comment/>", k.WrapText(down_comment, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
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

        private delegate string IssueForVehicleKindChanged_Merge(string s);
        internal void IssueForVehicleKindChanged
          (
          string vehicle_id,
          string old_kind_id,
          string new_kind_id
          )
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicle_kinds = new TClass_biz_vehicle_kinds();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleKindChanged_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<old_kind/>", biz_vehicle_kinds.DescriptionOf(old_kind_id))
              .Replace("<new_kind/>", biz_vehicle_kinds.DescriptionOf(new_kind_id));
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_kind_changed.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-kind-change", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-kind-change","0"),
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
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<time_went_down/>", time_went_down.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<nature/>", biz_vehicle_down_natures.ElaborationOf(nature_id))
              .Replace("<mileage/>", mileage)
              .Replace("<down_comment/>", k.WrapText(down_comment, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
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
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<time_came_up/>", time_came_up.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<down_comment/>", k.WrapText(down_comment, WRAPTEXT_INSERT_STRING, Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])))
              .Replace("<up_comment/>", k.WrapText(up_comment, WRAPTEXT_INSERT_STRING, Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
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
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<quarters_designator/>", biz_vehicle_quarters.MediumDashLongDesignatorOfId(quarters_id))
              .Replace("<effective_datetime/>", effective_datetime.ToString("yyyy-MM-dd HH:mm"))
              .Replace("<mileage/>", mileage)
              .Replace("<note/>", k.WrapText(note, k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])));
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

        private delegate string IssueForVehicleReady_Merge(string s);
        internal void IssueForVehicleReady
          (
          string vehicle_name,
          string vehicle_agency_id,
          string vehicle_agency_designator,
          string where,
          string comment
          )
          {
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          var biz_vehicles = new TClass_biz_vehicles();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssueForVehicleReady_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<actor/>", biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<vehicle_name/>", vehicle_name)
              .Replace("<where/>", where.ToUpper())
              .Replace("<comment/>", k.WrapText(comment.ToUpper(), k.NEW_LINE + new string(Convert.ToChar(k.SPACE),3), Class_biz_notifications_Static.BreakChars(), short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"])))
              .Replace("<agency/>", vehicle_agency_designator)
              ;
            };

          var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/vehicle_ready_email.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:actor_email_address + k.COMMA + db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled",vehicle_agency_id),
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd()),
            be_html:false,
            cc: db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled","0"),
            bcc:k.EMPTY,
            reply_to:actor_email_address
            );
          template_reader.Close();
          }

    private delegate string IssueLoveLetterReport_Merge(string s);
    internal void IssueLoveLetterReport
      (
      IEnumerable<string> love_letter_targets,
      string agency_id
      )
      {

      IssueLoveLetterReport_Merge Merge = delegate (string s)
        {
        return s
          .Replace("<application_name/>", application_name)
          .Replace("<host_domain_name/>", host_domain_name)
          .Replace("<agency/>", new TClass_biz_agencies().KeyclickEnumeratorOf(agency_id))
          .Replace("<love_letter_targets/>", love_letter_targets.Count() > 0 ? string.Join("\n",love_letter_targets) : "(none)")
          ;
        };

      var biz_role_member_map = new TClass_biz_role_member_map();
      var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("~/cloudmailin/template/notification/love_letter_report.txt"));
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:biz_role_member_map.EmailTargetOfAgencyIdList("Squad Fund Drive Coordinator",agency_id),
        subject:Merge(template_reader.ReadLine()),
        message_string:Merge(template_reader.ReadToEnd()),
        cc:biz_role_member_map.EmailTargetOfAgencyIdList("Squad President",agency_id) + k.COMMA + biz_role_member_map.EmailTargetOfAgencyIdList("Squad Vice President",agency_id)
        );
      template_reader.Close();
      }

        private delegate string IssueMemberStatusStatement_Merge(string s);
        public void IssueMemberStatusStatement
          (
          string email_address,
          string first_name,
          string last_name,
          string cad_num,
          string agency,
          string section_num,
          string medical_release_description,
          string be_driver_qualified,
          string enrollment,
          string length_of_service,
          string kind_of_leave,
          string obliged_shifts,
          string phone_num,
          string phone_service,
          string role_list
          )
          {
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
              .Replace("<phone_num/>", k.FormatAsNanpPhoneNum(phone_num))
              .Replace("<phone_service/>", phone_service)
              .Replace("<role_list/>", role_list)
              .Replace("<last_day_of_month_to_submit_schedule_availabilities/>", ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"])
              ;
            };

          var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/member_status_statement.txt"));
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address"],
            to:email_address,
            subject:Merge(template_reader.ReadLine()),
            message_string:Merge(template_reader.ReadToEnd())
            );
          template_reader.Close();
          }

        private delegate string IssueGripeSheetReview_Merge(string s);
        public void IssueGripeSheetReview
          (
          string vehicle_id,
          string log
          )
          {
          var biz_vehicles = new TClass_biz_vehicles();

          IssueForVehicleMarkedDown_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<host_domain_name/>", host_domain_name)
              .Replace("<vehicle_name/>", biz_vehicles.NameOfId(vehicle_id))
              .Replace("<log/>", log);
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/gripe_sheet_review.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            db_notifications.TargetOfAboutAgency("gripe-sheet-review", biz_vehicles.AgencyIdOfId(vehicle_id)) + k.COMMA + db_notifications.TargetOfAboutAgency("gripe-sheet-review","0"),
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY
            );
          template_reader.Close();
          }

        private delegate string IssuePayPalDonationAcknowledgmentToDonorOutOfArea_Merge(string s);
        internal void IssuePayPalDonationAcknowledgmentToDonorOutOfArea
          (
          string agency_keyclick_enumerator,
          string amount_donated,
          string donor_name,
          DateTime donation_date,
          string donor_email_address
          )
          {
          var biz_agencies = new TClass_biz_agencies();
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssuePayPalDonationAcknowledgmentToDonorOutOfArea_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<actor/>", biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<agency_keyclick_enumerator/>", agency_keyclick_enumerator)
              .Replace("<agency_long_designator/>", biz_agencies.LongDesignatorOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<agency_web_address/>", biz_agencies.WebAddressOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<amount_donated/>", amount_donated)
              .Replace("<donor_name/>", donor_name)
              .Replace("<donation_date/>", donation_date.ToString("D"))
              ;
            };

          var template_reader = File.OpenText(HttpContext.Current.Server.MapPath("template/notification/acknowledgment-to-paypal-donor-out-of-area.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            donor_email_address,
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssuePayPalDonationAcknowledgmentToDonorRecognized_Merge(string s);
        internal void IssuePayPalDonationAcknowledgmentToDonorRecognized
          (
          string agency_keyclick_enumerator,
          string amount_donated,
          string donor_name,
          DateTime donation_date,
          string donor_email_address,
          string resident_name,
          string resident_house_num_and_street,
          string resident_city,
          string resident_state
          )
          {
          var biz_agencies = new TClass_biz_agencies();
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssuePayPalDonationAcknowledgmentToDonorRecognized_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<actor/>", biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<agency_keyclick_enumerator/>", agency_keyclick_enumerator)
              .Replace("<agency_long_designator/>", biz_agencies.LongDesignatorOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<agency_web_address/>", biz_agencies.WebAddressOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<amount_donated/>", amount_donated)
              .Replace("<donor_name/>", donor_name)
              .Replace("<donation_date/>", donation_date.ToString("D"))
              .Replace("<resident_name/>", resident_name)
              .Replace("<resident_house_num_and_street/>", resident_house_num_and_street)
              .Replace("<resident_city/>", resident_city)
              .Replace("<resident_state/>", resident_state)
              ;
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/acknowledgment-to-paypal-donor-recognized.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            donor_email_address,
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
          template_reader.Close();
          }

        private delegate string IssuePayPalDonationAcknowledgmentToDonorUnrecognized_Merge(string s);
        internal void IssuePayPalDonationAcknowledgmentToDonorUnrecognized
          (
          string agency_keyclick_enumerator,
          string amount_donated,
          string donor_name,
          DateTime donation_date,
          string donor_email_address
          )
          {
          var biz_agencies = new TClass_biz_agencies();
          var biz_members = new TClass_biz_members();
          var biz_user = new TClass_biz_user();
          var biz_users = new TClass_biz_users();
          //
          var actor_member_id = biz_members.IdOfUserId(biz_user.IdNum());
          var actor_email_address = biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum());

          IssuePayPalDonationAcknowledgmentToDonorRecognized_Merge Merge = delegate (string s)
            {
            return s
              .Replace("<application_name/>", application_name)
              .Replace("<actor/>", biz_members.FirstNameOfMemberId(actor_member_id) + k.SPACE + biz_members.LastNameOfMemberId(actor_member_id))
              .Replace("<actor_email_address/>", actor_email_address)
              .Replace("<agency_keyclick_enumerator/>", agency_keyclick_enumerator)
              .Replace("<agency_long_designator/>", biz_agencies.LongDesignatorOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<agency_web_address/>", biz_agencies.WebAddressOfKeyclickEnumerator(agency_keyclick_enumerator))
              .Replace("<amount_donated/>", amount_donated)
              .Replace("<donor_name/>", donor_name)
              .Replace("<donation_date/>", donation_date.ToString("D"))
              ;
            };

          var template_reader = System.IO.File.OpenText(HttpContext.Current.Server.MapPath("template/notification/acknowledgment-to-paypal-donor-unrecognized.txt"));
          k.SmtpMailSend
            (
            ConfigurationManager.AppSettings["sender_email_address"],
            donor_email_address,
            Merge(template_reader.ReadLine()),
            Merge(template_reader.ReadToEnd()),
            false,
            k.EMPTY,
            k.EMPTY,
            actor_email_address
            );
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


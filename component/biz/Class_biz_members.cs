using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_notifications;
using Class_biz_role_member_map;
using Class_biz_roles;
using Class_biz_user;
using Class_db_leaves;
using Class_db_members;
using Class_db_sms_gateways;
using Class_db_users;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_members
  {

  public class TClass_biz_members
    {

        private readonly TClass_biz_agencies biz_agencies = null;
        private readonly TClass_biz_enrollment biz_enrollment = null;
        private readonly TClass_biz_medical_release_levels biz_medical_release_levels = null;
        private readonly TClass_biz_notifications biz_notifications = null;
        private readonly TClass_biz_roles biz_roles = null;
        private readonly TClass_biz_user biz_user = null;
        private readonly TClass_db_leaves db_leaves = null;
        private readonly TClass_db_members db_members = null;
        private readonly TClass_db_sms_gateways db_sms_gateways = null;
        private readonly TClass_db_users db_users = null;

        public static readonly Exception GUEST_OVERFLOW = new Exception("Cannot exceed guest designator Z9Z9Z9.");

        public TClass_biz_members() : base()
        {
            db_leaves = new TClass_db_leaves();
            db_members = new TClass_db_members();
            db_sms_gateways = new TClass_db_sms_gateways();
            db_users = new TClass_db_users();
            biz_agencies = new TClass_biz_agencies();
            biz_enrollment = new TClass_biz_enrollment();
            biz_medical_release_levels = new TClass_biz_medical_release_levels();
            biz_notifications = new TClass_biz_notifications();
            biz_roles = new TClass_biz_roles();
            biz_user = new TClass_biz_user();
        }

        public bool Add
          (
          string first_name,
          string last_name,
          string cad_num,
          string medical_release_code,
          bool be_driver_qualified,
          string agency_id,
          string email_address,
          DateTime enrollment_date,
          string enrollment_level = k.EMPTY,
          string phone_num = k.EMPTY,
          string phone_service_id = k.EMPTY,
          string section_num = k.EMPTY
          )
          {
            bool result;
            result = false;
            if (!db_members.BeKnown(first_name, last_name, cad_num))
            {
                if (phone_num.Length == 7)
                {
                    phone_num = "757" + phone_num;
                }
                db_members.Add
                  (
                  first_name,
                  last_name,
                  cad_num,
                  uint.Parse(medical_release_code),
                  be_driver_qualified,
                  uint.Parse(agency_id),
                  email_address,
                  enrollment_date,
                  uint.Parse(enrollment_level),
                  phone_num,
                  phone_service_id,
                  section_num
                  );
                var enrollment_description = biz_enrollment.DescriptionOf(enrollment_level);
                if (!new ArrayList {"Observer","Guest Provider"}.Contains(enrollment_description))
                  {
                  biz_notifications.IssueForMemberAdded
                    (
                    db_members.IdOfFirstnameLastnameCadnum(first_name, last_name, cad_num),
                    first_name,
                    last_name,
                    cad_num,
                    biz_medical_release_levels.DescriptionOf(medical_release_code),
                    be_driver_qualified,
                    biz_agencies.MediumDesignatorOf(agency_id) + k.SPACE_HYPHEN_SPACE + biz_agencies.LongDesignatorOf(agency_id),
                    email_address,
                    enrollment_date.ToString("dd MMMM yyyy"),
                    enrollment_description,
                    phone_num,
                    db_sms_gateways.CarrierNameOfId(id:phone_service_id),
                    section_num
                    );
                  }
                result = true;
            }
            return result;
          }

    public string AgencyIdOf(object summary)
      {
      return db_members.AgencyIdOf(summary);
      }

        public string AgencyOf(object summary)
        {
            string result;
            result = db_members.AgencyOf(summary);
            return result;
        }

        public string AgencyIdOfId(string id)
        {
            string result;
            result = db_members.AgencyIdOfId(id);
            return result;
        }

        internal bool BeAlsForLegacyOscarPurposes(string id)
          {
          return biz_medical_release_levels.BeCodeAlsForLegacyOscarPurposes(db_members.MedicalReleaseLevelCodeOf(id));
          }

    internal string FirstReleaseAsAnAicDateOf(object summary)
      {
      return db_members.FirstReleaseAsAnAicDateOf(summary);
      }

    public bool BeAuthorizedTierOrSameAgency(string subject_member_id, string object_member_id)
        {
            bool result;
            result = (HighestTierOf(subject_member_id) == "1") || (AgencyIdOfId(subject_member_id) == AgencyIdOfId(object_member_id));
            return result;
        }

        internal bool BeDriverQualifiedOfId(string id)
          {
          return db_members.BeDriverQualifiedOfId(id);
          }

        public bool BeDriverQualifiedOf(object summary)
        {
            bool result;
            result = db_members.BeDriverQualifiedOf(summary);
            return result;
        }

    public bool BeFlightMedicQualifiedOf(object summary)
      {
      return db_members.BeFlightMedicQualifiedOf(summary);
      }

    public bool BeMarineMedicQualifiedOf(object summary)
      {
      return db_members.BeMarineMedicQualifiedOf(summary);
      }

        internal bool BeOkToDefaultAgencyFilterToAll
          (
          bool be_ok_to_see_all_squads,
          string[] roles
          )
          {
          return be_ok_to_see_all_squads && (int.Parse(biz_roles.TierOfName(roles[0])) == 1);
          }

        internal bool BePast(object summary)
          {
          return biz_enrollment.BePastDescription(EnrollmentOf(summary));
          }

        internal bool BeReleased(string id)
          {
          return biz_medical_release_levels.BeReleased(biz_medical_release_levels.PeckCodeOf(db_members.MedicalReleaseLevelCodeOf(id)));
          }

        internal bool BeRoleHolder(string id)
          {
          return db_members.BeRoleHolder(id);
          }

        internal bool BeRoleHolderBySharedSecret
          (
          string cad_num,
          out string claimed_role_name,
          out string claimed_member_name,
          out string claimed_member_id,
          out string claimed_member_email_address
          )
          {
          return db_members.BeRoleHolderBySharedSecret(cad_num,out claimed_role_name,out claimed_member_name,out claimed_member_id,out claimed_member_email_address);
          }

    public bool BeSquadTruckTeamQualifiedOf(object summary)
      {
      return db_members.BeSquadTruckTeamQualifiedOf(summary);
      }

        public bool BeTransferring(object summary)
          {
          return (EnrollmentOf(summary) == "Transferring");
          }

        public bool BeUserAuthorizedToEditEnrollments(string subject_member_id, object summary, bool has_edit_enrollments, bool has_edit_enrollments_nonreleased_ops_members_only)
          {
          return
              (BeAuthorizedTierOrSameAgency(subject_member_id, IdOf(summary)) || BeTransferring(summary) || BePast(summary))
            &&
              (has_edit_enrollments || (has_edit_enrollments_nonreleased_ops_members_only && (!BeDriverQualifiedOf(summary) || !biz_medical_release_levels.BeReleased(PeckCodeOf(summary)))));
          }

        public bool BeValidProfile(string id)
        {
            bool result;
            result = db_members.BeValidProfile(id);
            return result;
        }

    internal bool BeBlsAcademyProctorQualifiedOf(object summary)
      {
      return db_members.BeBlsAcademyProctorQualifiedOf(summary);
      }

    internal void BindActivityLookbackBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      k.subtype<int> extent,
      string agency_filter
      )
      {
      db_members.BindActivityLookbackBaseDataList(sort_order,be_sort_order_ascending,target,extent,agency_filter);
      }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal, string selected_value)
        {
            db_members.BindCurrentDirectToListControl(target, agency_filter, unselected_literal, selected_value);
        }

        public void BindCurrentDirectToListControl(object target)
        {
            BindCurrentDirectToListControl(target, k.EMPTY);
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter)
        {
            BindCurrentDirectToListControl(target, agency_filter, "-- Member --");
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal)
        {
            BindCurrentDirectToListControl(target, agency_filter, unselected_literal, k.EMPTY);
        }

        internal void BindEvaluateesDirectToListControl
          (
          object target,
          string unselected_literal,
          string selected_value
          )
          {
          db_members.BindEvaluateesDirectToListControl(target,unselected_literal,selected_value);
          }

        internal void BindEvaluateesDirectToListControl(object target, string unselected_literal)
          {
          BindEvaluateesDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
          }
        internal void BindEvaluateesDirectToListControl(object target)
          {
          BindEvaluateesDirectToListControl(target,"-- Evaluatee --");
          }

        internal void BindEvaluatorsDirectToListControl
          (
          object target,
          string unselected_literal,
          string selected_value
          )
          {
          db_members.BindEvaluatorsDirectToListControl(target,unselected_literal,selected_value);
          }
        internal void BindEvaluatorsDirectToListControl(object target, string unselected_literal)
          {
          BindEvaluatorsDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
          }
        internal void BindEvaluatorsDirectToListControl(object target)
          {
          BindEvaluatorsDirectToListControl(target,"-- Evaluator --");
          }

        public void BindRankedCoreOpsSize(object target, bool do_log)
        {
            db_members.BindRankedCoreOpsSize(target, do_log);
        }

        public void BindRankedCoreOpsSize(object target)
        {
            BindRankedCoreOpsSize(target, true);
        }

        public void BindRankedCrewShiftsForecast(object target, bool do_log)
        {
            db_members.BindRankedCrewShiftsForecast(target, do_log);
        }

        public void BindRankedCrewShiftsForecast(object target)
        {
            BindRankedCrewShiftsForecast(target, true);
        }

        public void BindRankedFleetTrackingParticipation
          (
          object target,
          bool do_log
          )
          {
          db_members.BindRankedFleetTrackingParticipation(target, do_log);
          }
        public void BindRankedFleetTrackingParticipation(object target)
          {
          BindRankedFleetTrackingParticipation(target, true);
          }

        public void BindRankedNumMembersInPipeline(object target, bool do_log)
        {
            db_members.BindRankedNumMembersInPipeline(target, do_log);
        }

        public void BindRankedNumMembersInPipeline(object target)
        {
            BindRankedNumMembersInPipeline(target, true);
        }

        public void BindRankedStandardEnrollment(object target, bool do_log)
        {
            db_members.BindRankedStandardEnrollment(target, do_log);
        }

        public void BindRankedStandardEnrollment(object target)
        {
            BindRankedStandardEnrollment(target, true);
        }

        public void BindRankedThirdSlotSaturation(object target, bool do_log)
        {
            db_members.BindRankedThirdSlotSaturation(target, do_log);
        }

        public void BindRankedThirdSlotSaturation(object target)
        {
            BindRankedThirdSlotSaturation(target, true);
        }

        public void BindRankedUtilization(object target, bool do_log)
        {
            db_members.BindRankedUtilization(target, do_log);
        }

        public void BindRankedUtilization(object target)
        {
            BindRankedUtilization(target, true);
        }

    public void BindRoster
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string relative_month,
      string agency_filter,
      Class_biz_enrollment.filter_type enrollment_filter = Class_biz_enrollment.filter_type.CURRENT,
      Class_biz_leave.filter_type leave_filter = Class_biz_leave.filter_type.NONE,
      Class_biz_medical_release_levels.filter_type med_release_level_filter = Class_biz_medical_release_levels.filter_type.ALL,
      uint section_filter = 0,
      bool running_only_filter = false,
      bool do_hide_staff_filter = false
      )
      {
      db_members.BindRoster(sort_order,be_sort_order_ascending,target,relative_month,agency_filter,enrollment_filter,leave_filter,med_release_level_filter,section_filter,running_only_filter,do_hide_staff_filter);
      }

    internal void BindScheduleAssignmentsAuditBaseDataList
      (
      string sort_order,
      bool be_sort_ascending,
      object target,
      k.subtype<int> relative_month,
      string agency_filter,
      string release_filter,
      bool do_limit_to_compliant,
      bool do_limit_to_unused_availability,
      string max_balance_hours_filter
      )
      {
      db_members.BindScheduleAssignmentsAuditBaseDataList(sort_order,be_sort_ascending,target,relative_month,agency_filter,release_filter,do_limit_to_compliant,do_limit_to_unused_availability,max_balance_hours_filter);
      }

        public void BindSpecialForRankedLengthOfService(object target)
        {
            db_members.BindSpecialForRankedLengthOfService(target);
        }

        internal void BindSpecialRequestBaseDataList
          (
          string sort_order,
          bool be_sort_order_ascending,
          object target,
          string agency_filter,
          string release_filter,
          k.subtype<int> relative_month
          )
          {
          db_members.BindSpecialRequestBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,release_filter,relative_month);
          }

        public string CadNumOf(object summary)
        {
            string result;
            result = db_members.CadNumOf(summary);
            return result;
        }

        public string CadNumOfMemberId(string member_id)
        {
            string result;
            result = db_members.CadNumOfMemberId(member_id);
            return result;
        }

    public Queue CurrentMemberEmailAddressesQueue
      (
      string agency_short_designator = k.EMPTY,
      bool be_core_ops_only = false,
      string enrollment_level = k.EMPTY
      )
      {
      return db_members.CurrentMemberEmailAddresses(agency_short_designator,be_core_ops_only,enrollment_level);
      }

    public string CurrentMemberEmailAddressesString
      (
      string agency_short_designator = k.EMPTY,
      bool be_core_ops_only = false,
      string enrollment_level = k.EMPTY
      )
      {
      var current_member_email_addresses = k.EMPTY;
      var q = CurrentMemberEmailAddressesQueue
        (
        agency_short_designator:agency_short_designator,
        be_core_ops_only:be_core_ops_only,
        enrollment_level:enrollment_level
        );
      var q_count = new k.int_nonnegative(q.Count);
      for (var i = new k.int_positive(); i.val <= q_count.val; i.val++ )
        {
        current_member_email_addresses = current_member_email_addresses + q.Dequeue().ToString() + k.COMMA_SPACE;
        }
      return (current_member_email_addresses + k.SPACE).TrimEnd(new char[] {Convert.ToChar(k.COMMA), Convert.ToChar(k.SPACE)});
      }

        internal string EfficipaySignatureIdentifierOf(string id)
          {
          return db_members.EfficipaySignatureIdentifierOf(id);
          }

        public string EmailAddressOf(string member_id)
        {
            string result;
            result = db_members.EmailAddressOf(member_id);
            return result;
        }

        public string EnrollmentOf(object summary)
        {
            string result;
            result = db_members.EnrollmentOf(summary);
            return result;
        }

        public string EnrollmentOfMemberId(string member_id)
        {
            string result;
            result = db_members.EnrollmentOfMemberId(member_id);
            return result;
        }

        internal string EquivalentLengthOfServiceStartDateOf(object summary)
          {
          return db_members.EquivalentLengthOfServiceStartDateOf(summary);
          }

        public string FirstNameOf(object summary)
        {
            string result;
            result = db_members.FirstNameOf(summary);
            return result;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.FirstNameOfMemberId(member_id);
            return result;
        }

    internal void GetOscalertThresholdsAndSubscriptions
      (
      object summary,
      out string oscalert_threshold_general,
      out string oscalert_threshold_als,
      out bool do_oscalert_for_trap,
      out bool do_oscalert_for_airport_alert,
      out bool do_oscalert_for_mrt,
      out bool do_oscalert_for_sart
      )
      {
      db_members.GetOscalertThresholdsAndSubscriptions
        (
        summary,
        out oscalert_threshold_general,
        out oscalert_threshold_als,
        out do_oscalert_for_trap,
        out do_oscalert_for_airport_alert,
        out do_oscalert_for_mrt,
        out do_oscalert_for_sart
        );
      }

        public void GetProfile(string id, out string name, out bool be_valid_profile)
        {
            db_members.GetProfile(id, out name, out be_valid_profile);
        }

    internal void GetSmsInfoOfId
      (
      string id,
      out string email_address,
      out string phone_num_digits,
      out string carrier_name
      )
      {
      db_members.GetSmsInfoOfId
        (
        id:id,
        email_address:out email_address,
        phone_num_digits: out phone_num_digits,
        carrier_name: out carrier_name
        );
      }

    public string HighestTierOf
      (
      string id,
      bool be_for_scheduling = false
      )
      {
      return db_members.HighestTierOf(id,be_for_scheduling);
      }

        public string IdOf(object summary)
        {
            string result;
            result = db_members.IdOf(summary);
            return result;
        }

        public string IdOfAppropriateRoleHolder(string role_name, string agency_short_designator)
        {
            string result;
            if (agency_short_designator != "EMS")
            {
                result = db_members.IdOfRoleHolderAtAgency(role_name, agency_short_designator);
            }
            else
            {
                result = db_members.IdOfRoleHolder(role_name);
            }
            return result;
        }

    internal string IdOfEmailAddress(string email_address)
      {
      return db_members.IdOfEmailAddress(email_address);
      }

        public string IdOfUserId(string user_id)
        {
            string result;
            result = db_members.IdOfUserId(user_id);
            return result;
        }

        public bool InitiateTransfer
          (
          DateTime effective_date,
          string note,
          object summary
          )
          {
          var be_transfer_initiated = false;
          if (biz_enrollment.SetLevel(biz_enrollment.CodeOf("Transferring"),effective_date,note,IdOf(summary),summary))
            {
            db_leaves.CurtailOnEffectiveDate
              (
              member_id:IdOf(summary),
              effective_date:effective_date,
              due_to_phrase:"initiation of transfer"
              );
            be_transfer_initiated = true;
            }
          return be_transfer_initiated;
          }

        public string LastNameOf(object summary)
        {
            string result;
            result = db_members.LastNameOf(summary);
            return result;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.LastNameOfMemberId(member_id);
            return result;
        }

    private delegate void MakeAvailabilitySubmissionDeadlineRelatedNotifications_Issue(string email_address);
    internal void MakeAvailabilitySubmissionDeadlineRelatedNotifications()
      {
      var days_until_deadline = new k.subtype<int>(-30,30);
      days_until_deadline.val = int.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"]) - DateTime.Now.Day;
      if ((new ArrayList() {0,1,7}).Contains(days_until_deadline.val) || (days_until_deadline.val < 0))
        {
        //
        MakeAvailabilitySubmissionDeadlineRelatedNotifications_Issue Issue;
        if (days_until_deadline.val > 0)
          {
          Issue = biz_notifications.IssueForAvailabilitiesDueSoon;
          }
        else if (days_until_deadline.val == 0)
          {
          Issue = biz_notifications.IssueForAvailabilitiesDueToday;
          }
        else
          {
          Issue = biz_notifications.IssueForAvailabilitiesOverdue;
          }
        //
        var member_id_q = db_members.HoldoutQueue(be_before_deadline:(days_until_deadline.val >= 0));
        var member_id_q_count = member_id_q.Count;
        for (var i = new k.subtype<int>(0,member_id_q_count); i.val < member_id_q_count; i.val++)
          {
          Issue(member_id_q.Dequeue().ToString());
          }
        }
      }

        internal void MakeMemberStatusStatements()
          {
          db_members.MakeMemberStatusStatements();
          }

        public string MedicalReleaseLevelOf(object summary)
        {
            string result;
            result = db_members.MedicalReleaseLevelOf(summary);
            return result;
        }

        public string MedicalReleaseLevelOfMemberId(string member_id)
        {
            string result;
            result = db_members.MedicalReleaseLevelOfMemberId(member_id);
            return result;
        }

        public string NamesSimilarTo(string first_name, string last_name, string separator)
        {
            string result;
            result = db_members.NamesSimilarTo(first_name, last_name, separator);
            return result;
        }

    internal string NextGuestDesignator()
      {
      var next_guest_designator = "A0A0A0";
      var last_assigned_guest_designator = db_members.LastAssignedGuestDesignator();
      if (last_assigned_guest_designator == "Z9Z9Z9")
        {
        throw GUEST_OVERFLOW;
        }
      if (last_assigned_guest_designator.Length > 0)
        {
        var be_done = false;
        for (var i = new k.int_nonnegative(next_guest_designator.Length); i.val > 0 && !be_done; i.val--)
          {
          if (new ArrayList {'9','Z'}.Contains(last_assigned_guest_designator[i.val - 1]))
            {
            next_guest_designator = last_assigned_guest_designator.Substring(0,i.val - 1) + (i.val % 2 == 0 ? '0' : 'A');
            }
          else
            {
            next_guest_designator = last_assigned_guest_designator.Substring(0,i.val - 1) + Convert.ToChar(last_assigned_guest_designator[i.val - 1] + 1) + next_guest_designator.Substring(i.val);
            be_done = true;
            }
          }
        }
      return next_guest_designator;
      }

        public k.int_nonnegative NumTapouts1MonthAgoOf(object summary)
          {
          return db_members.NumTapouts1MonthAgoOf(summary);
          }

        public k.int_nonnegative NumTapouts2MonthsAgoOf(object summary)
          {
          return db_members.NumTapouts2MonthsAgoOf(summary);
          }

        public k.int_nonnegative NumTapouts3MonthsAgoOf(object summary)
          {
          return db_members.NumTapouts3MonthsAgoOf(summary);
          }

    internal string OfficerTargetForReportCommandedMemberScheduleDetail
      (
      bool be_virgin_watchbill,
      bool do_send_member_sched_details_to_dept_chief_scheduler,
      string member_agency_id,
      string other_agency_ids,
      string squad_scheduler_target,
      string member_id
      )
      {
      var biz_role_member_map = new TClass_biz_role_member_map(); // kept local to avoid a stack overflow due to circular dependency
      //
      var officer_target_for_report_commanded_member_schedule_detail = k.EMPTY;
      //
      var squad_schedule_monitor_target = biz_role_member_map.EmailTargetOf("Squad Schedule Monitor",biz_agencies.ShortDesignatorOf(member_agency_id));
      if (squad_schedule_monitor_target.Length > 0)
        {
        squad_schedule_monitor_target = k.COMMA + squad_schedule_monitor_target;
        }
      var other_squad_schedule_coordinator_target = biz_role_member_map.EmailTargetOfAgencyIdList("Squad Scheduler",other_agency_ids);
      if (other_squad_schedule_coordinator_target.Length > 0)
        {
        other_squad_schedule_coordinator_target = k.COMMA + other_squad_schedule_coordinator_target;
        }
      var other_squad_schedule_monitor_target = biz_role_member_map.EmailTargetOfAgencyIdList("Squad Schedule Monitor",other_agency_ids);
      if (other_squad_schedule_monitor_target.Length > 0)
        {
        other_squad_schedule_monitor_target = k.COMMA + other_squad_schedule_monitor_target;
        }
      if (!be_virgin_watchbill)
        {
        officer_target_for_report_commanded_member_schedule_detail = (do_send_member_sched_details_to_dept_chief_scheduler || (member_agency_id != "0") ? squad_scheduler_target : k.EMPTY)
        + squad_schedule_monitor_target
        + other_squad_schedule_coordinator_target
        + other_squad_schedule_monitor_target
        + k.COMMA + biz_role_member_map.EmailTargetOf((BeReleased(member_id) ? (do_send_member_sched_details_to_dept_chief_scheduler ? "Department Chief Scheduler" : k.EMPTY) : "Department Jump Seat Scheduler"), "EMS");
        }
      return officer_target_for_report_commanded_member_schedule_detail;
      }

        public string OverallFleetTrackingParticipation()
          {
          return db_members.OverallFleetTrackingParticipation();
          }

        public string PhoneNumOf(string member_id)
        {
            string result;
            result = db_members.PhoneNumOf(member_id);
            return result;
        }

    internal string PhoneNumOfSummary(object summary)
      {
      return db_members.PhoneNumOfSummary(summary);
      }

    public string PhoneServiceIdOf(object summary)
      {
      return db_members.PhoneServiceIdOf(summary);
      }

    public string PhoneServiceOf(object summary)
      {
      return db_members.PhoneServiceOf(summary);
      }

        public string PeckCodeOf(object summary)
        {
            string result;
            result = db_members.PeckCodeOf(summary);
            return result;
        }

    internal void ProcessCloudmailinRequest
      (
      string from,
      string x_to_header,
      string subject,
      string plain
      )
      {
      var primary_target = k.EMPTY;
      var x_to_header_element_array = k.Safe(x_to_header,k.safe_hint_type.EMAIL_ADDRESS_CSV).Split(separator:new string[] {k.COMMA},options:StringSplitOptions.RemoveEmptyEntries);
      for (var i = new k.subtype<int>(0,x_to_header_element_array.Length); i.val < i.LAST; i.val++)
        {
        if
          (
            x_to_header_element_array[i.val].Contains("group@frompaper2web.com")
          ||
            x_to_header_element_array[i.val].Contains("group@vbrescuecouncil.")
          )
        //then
          {
          var group_selector = x_to_header_element_array[i.val]
            .Replace("group@frompaper2web.com",k.EMPTY)
            .Replace("group@vbrescuecouncil.org",k.EMPTY)
            .Replace("group@vbrescuecouncil.com",k.EMPTY);
          //
          if (group_selector.ToUpper() == "MD2")
            {
            primary_target += CurrentMemberEmailAddressesString(enrollment_level:"EDP") + CurrentMemberEmailAddressesString(enrollment_level:"ResDoc");
            }
          }
        else
          {
          primary_target += x_to_header_element_array[i.val];
          }
        primary_target += k.COMMA;
        }
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:primary_target,
        subject:subject,
        message_string:"-- From " + from + " [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE
        + k.NEW_LINE
        + plain,
        be_html:false,
        cc:ConfigurationManager.AppSettings["md2group_cc_target"],
        bcc:from,
        reply_to:from
        );
      }

        public string RetentionOf(object summary)
        {
            string result;
            result = db_members.RetentionOf(summary);
            return result;
        }

        public string SectionOf(object summary)
        {
            string result;
            result = db_members.SectionOf(summary);
            return result;
        }

    public void SetAgency
      (
      string old_agency_id,
      string new_agency_id,
      object summary
      )
      {
      db_members.SetAgency(new_agency_id, summary);
      db_members.SetSection
        (
        section_num:"0",
        summary:summary
        );
      var member_id = IdOf(summary);
      biz_notifications.IssueForAgencyChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(old_agency_id), biz_agencies.MediumDesignatorOf(new_agency_id));
      }

    internal void SetBlsAcademyProctorQualification
      (
      bool be_bls_academy_proctor,
      object summary)
      {
      db_members.SetBlsAcademyProctorQualification(be_bls_academy_proctor, summary);
      biz_notifications.IssueForBlsAcademyProctorQualificationChange(IdOf(summary), FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), be_bls_academy_proctor);
      }

        public bool SetCadNum(string cad_num, object summary)
        {
            bool result;
            result = false;
            if (!db_members.BeKnown(cad_num))
            {
                db_members.SetCadNum(cad_num, summary);
                biz_notifications.IssueForCadNumChange(db_members.IdOf(summary), db_members.FirstNameOf(summary), db_members.LastNameOf(summary), cad_num);
                result = true;
            }
            return result;
        }

        public void SetDriverQualification(bool be_driver_qualified, object summary)
        {
            var id = IdOf(summary);
            db_members.SetDriverQualification(be_driver_qualified, summary);
            biz_notifications.IssueForDriverQualificationChange(id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), be_driver_qualified);
            //
            if (!be_driver_qualified && BeReleased(id))
              {
              biz_notifications.IssueForDriverRestricted(id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary));
              }
        }

    public void SetEmailAddress
      (
      string id,
      string email_address
      )
      {
      db_members.SetEmailAddress(id, email_address);
      var user_id = UserIdOf(id);
      if ((user_id.Length > 0) && (email_address.Length > 0))
        {
        db_users.SetEmailAddress(user_id,email_address);
        }
      var summary = Summary(member_id:id);
      biz_notifications.IssueForMemberEmailAddressChange
        (
        member_id:id,
        first_name:FirstNameOf(summary),
        last_name:LastNameOf(summary),
        cad_num:CadNumOf(summary),
        agency_name:AgencyOf(summary),
        member_email_address:email_address
        );
      }

    public void SetFlightMedicQualification
      (
      bool be_flight_medic,
      object summary
      )
      {
      db_members.SetFlightMedicQualification(be_flight_medic, summary);
      biz_notifications.IssueForFlightMedicQualificationChange(IdOf(summary), FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), be_flight_medic);
      }

        internal void SetLengthOfService
          (
          string years_subtracted,
          string months_subtracted,
          string days_subtracted,
          decimal length_of_service,
          string rationale,
          object summary
          )
          {
          db_members.SetLengthOfService(length_of_service,summary);
          biz_notifications.IssueForMemberLengthOfServiceChange
            (
            member_id:IdOf(summary),
            first_name:FirstNameOf(summary),
            last_name:LastNameOf(summary),
            cad_num:CadNumOf(summary),
            years_subtracted:years_subtracted,
            months_subtracted:months_subtracted,
            days_subtracted:days_subtracted,
            new_length_of_service:length_of_service,
            rationale:rationale
            );
          }

    public void SetMarineMedicQualification
      (
      bool be_marine_medic,
      object summary
      )
      {
      db_members.SetMarineMedicQualification
        (
        be_marine_medic:be_marine_medic,
        summary:summary
        );
      biz_notifications.IssueForMarineMedicQualificationChange
        (
        member_id:IdOf(summary),
        first_name:FirstNameOf(summary),
        last_name:LastNameOf(summary),
        cad_num:CadNumOf(summary),
        be_marine_medic:be_marine_medic
        );
      }

        public void SetName(string old_first, string old_last, string new_first, string new_last, object summary)
        {
            string member_id;
            db_members.SetName(new_first, new_last, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForMemberNameChange(member_id, CadNumOf(summary), old_first, old_last, new_first, new_last);
        }

        public void SetSection(string section_num, object summary)
        {
            string member_id;
            db_members.SetSection(section_num, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForSectionChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), section_num);
        }

        public bool SetMedicalReleaseCode
          (
          string new_code,
          object summary,
          string enrollment_level_to_force_description,
          DateTime effective_date
          )
          {
          var ok_so_far = true;
          var member_id = IdOf(summary);
          if (enrollment_level_to_force_description.Length > 0)
            {
            ok_so_far = biz_enrollment.SetLevel(biz_enrollment.CodeOf(enrollment_level_to_force_description), effective_date, k.EMPTY, member_id, summary);
            }
          if (ok_so_far)
            {
            var saved_be_under_general_supervision = BeReleased(member_id);
            db_members.SetMedicalReleaseCode(new_code, summary);
            if (BePast(summary))
              {
              db_members.SetOscalertThresholds
                (
                oscalert_threshold_general:k.EMPTY,
                oscalert_threshold_als:k.EMPTY,
                do_clear_subscriptions:true,
                summary:summary
                );
              }
            var section = SectionOf(summary);
            biz_notifications.IssueForMedicalReleaseLevelChange
              (
              member_id:member_id,
              first_name:FirstNameOf(summary),
              last_name:LastNameOf(summary),
              cad_num:CadNumOf(summary),
              medical_release_level:MedicalReleaseLevelOf(summary),
              cross_agency_id:(enrollment_level_to_force_description.Length > 0 && (section != "0") ? section : k.EMPTY)
              );
            if (!saved_be_under_general_supervision && BeReleased(member_id) && (biz_medical_release_levels.DescriptionOf(code:new_code) != "Physician"))
              {
              biz_notifications.IssueForThirdReleased
                (
                member_id:member_id,
                first_name:FirstNameOf(summary),
                last_name:LastNameOf(summary),
                cad_num:CadNumOf(summary),
                medical_release_level:MedicalReleaseLevelOf(summary),
                cross_agency_id:(enrollment_level_to_force_description.Length > 0 && (section != "0") ? section : k.EMPTY)
                );
              }
            }
          return ok_so_far;
          }

    public void SetPhoneNumAndClearCellularProvider
      (
      string phone_num,
      object summary
      )
      {
      if (phone_num.Length == 7)
        {
        phone_num = "757" + phone_num;
        }
      db_members.SetPhoneNumAndClearCellularProvider(phone_num, summary);
      var member_id = IdOf(summary);
      if (member_id.Length > 0)
        {
        biz_notifications.IssueForPhoneNumChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), phone_num);
        }
      }

    internal void SetOscalertSettings
      (
      string phone_service_id,
      string oscalert_threshold_general,
      string oscalert_threshold_als,
      bool do_oscalert_for_trap,
      bool do_oscalert_for_airport_alert,
      bool do_oscalert_for_mrt,
      bool do_oscalert_for_sart,
      object summary
      )
      {
      db_members.SetOscalertSettings(phone_service_id,oscalert_threshold_general,oscalert_threshold_als,do_oscalert_for_trap,do_oscalert_for_airport_alert,do_oscalert_for_mrt,do_oscalert_for_sart,summary);
      }

        public void SetProfile(string id, string name)
        {
            db_members.SetProfile(id, name);
        }

    public void SetSquadTruckTeamQualification
      (
      bool be_on_squad_truck_team,
      object summary
      )
      {
      db_members.SetSquadTruckTeamQualification(be_on_squad_truck_team, summary);
      biz_notifications.IssueForSquadTruckTeamQualificationChange(IdOf(summary), FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), be_on_squad_truck_team);
      }

    internal string SmsTargetOf(string member_id)
      {
      return db_members.SmsTargetOf(member_id);
      }

        public object Summary
          (
          string member_id,
          k.subtype<int> relative_month
          )
          {
          return db_members.Summary(member_id,relative_month.val.ToString());
          }
        public object Summary(string member_id)
          {
          return Summary(member_id,new k.subtype<int>(0,0));
          }

        public string UserAttributionIndicator()
          {
          var actor_member_id = IdOfUserId(biz_user.IdNum());
          return "==v==" + k.SPACE + FirstNameOfMemberId(actor_member_id) + k.SPACE + LastNameOfMemberId(actor_member_id) + k.SPACE + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + k.NEW_LINE;
          }

        public string UserIdOf(string member_id)
        {
            string result;
            result = db_members.UserIdOf(member_id);
            return result;
        }

    } // end TClass_biz_members

}

// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_notifications;
using Class_biz_privileges;
using Class_biz_roles;
using Class_biz_user;
using Class_db_agencies;
using Class_db_role_member_map;
using Class_db_schedule_assignment_logs;
using Class_db_schedule_assignments;
using kix;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.WebControls;

namespace Class_biz_schedule_assignments
  {
  public class TClass_biz_schedule_assignments
    {

    public const int MAX_PER_MONTH = 62;

    private readonly TClass_biz_agencies biz_agencies = null;
    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_notifications biz_notifications = null;
    private readonly TClass_biz_privileges biz_privileges = null;
    private readonly TClass_biz_roles biz_roles = null;
    private readonly TClass_biz_user biz_user = null;
    private readonly TClass_db_agencies db_agencies = null;
    private readonly TClass_db_role_member_map db_role_member_map = null;
    private readonly TClass_db_schedule_assignment_logs db_schedule_assignment_logs = null;
    private readonly TClass_db_schedule_assignments db_schedule_assignments = null;

    private static readonly Object update_lock = new object();

    public TClass_biz_schedule_assignments() : base()
      {
      biz_agencies = new TClass_biz_agencies();
      biz_members = new TClass_biz_members();
      biz_notifications = new TClass_biz_notifications();
      biz_privileges = new TClass_biz_privileges();
      biz_roles = new TClass_biz_roles();
      biz_user = new TClass_biz_user();
      db_agencies = new TClass_db_agencies();
      db_role_member_map = new TClass_db_role_member_map();
      db_schedule_assignment_logs = new TClass_db_schedule_assignment_logs();
      db_schedule_assignments = new TClass_db_schedule_assignments();
      }

    internal bool BeAdventitiousChangeDetected
      (
      string user_id,
      k.subtype<int> relative_month,
      bool be_virgin_watchbill
      )
      {
      return db_schedule_assignments.BeAdventitiousChangeDetected(user_id,relative_month,be_virgin_watchbill);
      }

    internal bool BeFullWatchbillPublishMandatory
      (
      string agency_filter,
      k.subtype<int> relative_month
      )
      {
      return db_schedule_assignments.BeNotificationPendingForAllInScope(agency_filter,relative_month);
      }

    internal bool BeMemberAvailableEitherCanonicalShiftThisNominalDay
      (
      string member_id,
      DateTime nominal_day
      )
      {
      return db_schedule_assignments.BeMemberAvailableEitherCanonicalShiftThisNominalDay(member_id,nominal_day);
      }

    internal bool BeMemberOnMedicalLeaveFor
      (
      string member_id,
      DateTime nominal_day
      )
      {
      return db_schedule_assignments.BeMemberOnMedicalLeaveFor(member_id,nominal_day);
      }

    internal bool BeMemberScheduleDetailFullyEditable
      (
      bool be_partially_editable,
      k.subtype<int> relative_month
      )
      {
      return
        (
          be_partially_editable
        &&
          (
            (relative_month.val == 0)
          ||
            (
              BeOkToWorkOnNextMonthAssignments()
            &&
              BeProposalGeneratedForNextMonth()
            )
          )
        );
      }

    internal bool BeMemberSelectedAfter
      (
      string member_id,
      DateTime date
      )
      {
      return db_schedule_assignments.BeMemberSelectedDuringPeriod(member_id,date,DateTime.MaxValue);
      }

    internal bool BeMemberSelectedDuringFuturePartOfPeriod
      (
      string member_id,
      int relative_start_month,
      int relative_end_month
      )
      {
      var start_mark = DateTime.Now.AddMonths(relative_start_month);
      var period_start = (relative_start_month < 1 ? DateTime.Now : new DateTime(start_mark.Year,start_mark.Month,1));
      //
      var end_mark = DateTime.Today.AddMonths(relative_end_month);
      var period_end = new DateTime(end_mark.Year,end_mark.Month,DateTime.DaysInMonth(end_mark.Year,end_mark.Month));
      //
      return db_schedule_assignments.BeMemberSelectedDuringPeriod(member_id,period_start,period_end);
      }

    internal bool BeOkToAllowMemberScheduleDetailControlMonthSwitch
      (
      bool be_interactive,
      string member_agency_id
      )
      {
      return
        (
          be_interactive
        &&
          !BeFullWatchbillPublishMandatory(member_agency_id,new k.subtype<int>(1,1))
        &&
          BeOkToWorkOnNextMonthAssignments()
        );
      }

    internal bool BeOkToAllowNextMonthAudit(bool be_interactive)
      {
      return
        (
          be_interactive
        &&
          BeProposalGeneratedForNextMonth()
        &&
          BeOkToWorkOnNextMonthAssignments()
        );
      }

    internal bool BeOkToDefaultAgencyFilterToAll
      (
      bool be_user_privileged_to_see_all_squads,
      string[] roles
      )
      {
      return be_user_privileged_to_see_all_squads && (int.Parse(biz_roles.TierOfName(roles[0])) == 1);
      }

    internal bool BeOkToEditPerExclusivityRules
      (
      HttpSessionState session,
      string target_member_agency_id,
      k.subtype<int> relative_month
      )
      {
      var be_from_same_agency = false;
      var be_interactive = (session["mode:report"] == null);
      var be_ok_to_schedule_any_special_agency = false;
      var be_ok_to_schedule_squad_truck_team = k.Has(session["privilege_array"] as string[],"schedule-squad-truck-team");
      var be_ok_to_schedule_volunteer_field_supervisor_team = k.Has(session["privilege_array"] as string[],"schedule-volunteer-field-supervisor-team");
      var be_ok_to_schedule_mci_team = k.Has(session["privilege_array"] as string[],"schedule-mci-team");
      var be_ok_to_schedule_bike_team = k.Has(session["privilege_array"] as string[],"schedule-bike-team");
      var relative_prep_month = DateTime.Today.AddMonths(relative_month.val - 1);
      var user_member_id = k.EMPTY;
      //
      if (be_interactive)
        {
        user_member_id = biz_members.IdOfUserId(biz_user.IdNum());
        be_ok_to_schedule_any_special_agency = biz_privileges.HasForAnySpecialAgency
          (
          member_id:user_member_id,
          privilege_name:"edit-schedule"
          );
        be_from_same_agency = new ArrayList()
          {
          biz_members.AgencyIdOfId(user_member_id),
          db_role_member_map.SoleSpecialAgencyOf("Department Chief Scheduler",user_member_id),
          db_role_member_map.SoleSpecialAgencyOf("Department Scheduler",user_member_id),
          db_role_member_map.SoleSpecialAgencyOf("Department Jump Seat Scheduler",user_member_id)
          }
          .Contains(target_member_agency_id);
        }
      //
      return
        (
          be_interactive
        &&
          (
            k.Has(session["privilege_array"] as string[],"edit-schedule")
          ||
            be_ok_to_schedule_squad_truck_team
          ||
            be_ok_to_schedule_volunteer_field_supervisor_team
          ||
            be_ok_to_schedule_mci_team
          ||
            be_ok_to_schedule_bike_team
          ||
            be_ok_to_schedule_any_special_agency
          ||
            (k.Has(session["privilege_array"] as string[],"edit-schedule-tier-department-only") && be_from_same_agency)
          )
        &&
          (
            be_from_same_agency
          ||
            (
              (
                k.Has(session["privilege_array"] as string[],"see-all-squads")
              ||
                be_ok_to_schedule_squad_truck_team
              ||
                be_ok_to_schedule_volunteer_field_supervisor_team
              ||
                be_ok_to_schedule_mci_team
              ||
                be_ok_to_schedule_bike_team
              ||
                be_ok_to_schedule_any_special_agency
              )
            &&
              (
                !BeFullWatchbillPublishMandatory(target_member_agency_id,relative_month)
              ||
                DateTime.Now > new DateTime
                  (
                  year:relative_prep_month.Year,
                  month:relative_prep_month.Month,
                  day:int.Parse(ConfigurationManager.AppSettings["deadline_day_for_squad_to_publish_schedule"]),
                  hour:int.Parse(ConfigurationManager.AppSettings["deadline_hour_for_squad_to_publish_schedule"]),
                  minute:0,
                  second:0
                  )
              )
            )
          )
        );
      }

    internal bool BeOkToEditPost
      (
      bool has_edit_schedule_priv,
      bool has_edit_schedule_tier_department_only_priv
      )
      {
      return has_edit_schedule_priv || has_edit_schedule_tier_department_only_priv;
      }

    internal bool BeOkToEditScheduleTierDepartmentOnly(string[] privilege_array)
      {
      return (k.Has(privilege_array,"edit-schedule-tier-department-only") && !k.Has(privilege_array,"edit-schedule-liberally"));
      }

    internal bool BeOkToEnableControls
      (
      string post_id,
      bool be_interactive,
      bool be_ok_to_edit_post,
      string agency_id,
      string own_agency,
      bool be_ok_to_edit_schedule_tier_department_only,
      string medical_release_description,
      bool be_ok_to_edit_schedule_liberally,
      bool be_squad_exclusivity_expired,
      bool be_ok_to_schedule_squad_truck_team,
      bool be_ok_to_schedule_volunteer_field_supervisor_team,
      bool be_ok_to_schedule_mci_team,
      bool be_ok_to_schedule_bike_team,
      bool be_ok_to_edit_schedule_for_any_special_agency,
      SortedList<string,bool> be_full_watchbill_publish_mandatory,
      DateTime fundamental_shift_start
      )
      {
      var be_before_guard_hours = fundamental_shift_start >= DateTime.Now.AddHours((new k.int_nonnegative(val:int.Parse(s:ConfigurationManager.AppSettings["num_pre_shift_guard_hours"] ?? "0"))).val);
      return (post_id.Length > 0)
      && be_interactive
      &&
        (
          (
            be_ok_to_edit_post
          &&
            (
              (
                ((agency_id == own_agency) && be_before_guard_hours)
              &&
                (!be_ok_to_edit_schedule_tier_department_only || !Char.IsLower(medical_release_description[0])) // assumes non-released is always lowercase
              )
            ||
              (biz_agencies.BeAgencyResponsibleForPost(own_agency, post_id) && be_before_guard_hours)
            ||
              ((post_id == "0") && be_before_guard_hours)
            ||
              (
                be_ok_to_edit_schedule_liberally
              &&
                (
                  !be_full_watchbill_publish_mandatory[agency_id]
                ||
                  be_squad_exclusivity_expired
                )
              )
            )
          )
        ||
          be_ok_to_schedule_squad_truck_team
        ||
          be_ok_to_schedule_volunteer_field_supervisor_team
        ||
          be_ok_to_schedule_mci_team
        ||
          be_ok_to_schedule_bike_team
        ||
          be_ok_to_edit_schedule_for_any_special_agency
        );
      }

    internal bool BeOkToPublishFullWatchbill
      (
      bool be_user_privileged_to_edit_schedule,
      string member_id,
      string agency_id
      )
      {
      return be_user_privileged_to_edit_schedule && ((biz_members.AgencyIdOfId(member_id) == agency_id) || (biz_roles.BeUserPeckingOrderAtLeast("Application Administrator")));
      }

    internal bool BeOkToSendQuickMessageByShift
      (
      bool be_interactive,
      bool be_ok_to_edit_post,
      bool be_ok_to_send_quickmessage_by_shift
      )
      {
      return be_interactive && (be_ok_to_edit_post || be_ok_to_send_quickmessage_by_shift);
      }

    internal bool BeOkToShowCoverageAssistantLink
      (
      bool be_interactive,
      bool be_selected,
      string post_short_designator,
      bool be_today_or_later
      )
      {
      return
        (
          be_interactive
        &&
          be_selected
        &&
          Regex.IsMatch(input:post_short_designator,pattern:"^(R[0-9]|Z)")
        &&
          be_today_or_later
        );
      }

    internal bool BeOkToWorkOnNextMonthAssignments()
      {
      return (DateTime.Now.Day > uint.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_actually_wait_for_schedule_availabilities"]));
      }

    internal bool BeOkToWorkOnNextMonthAvailabilities()
      {
      return (DateTime.Now.Day > uint.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"]));
      }

    internal bool BePendingNotifications
      (
      k.subtype<int> relative_month,
      string publisher_member_id,
      string publisher_member_agency_id,
      bool be_virgin_watchbill,
      bool be_selected_only
      )
      {
      return db_schedule_assignments.BePendingNotifications(relative_month,publisher_member_id,publisher_member_agency_id,be_virgin_watchbill,be_selected_only);
      }

    internal bool BeProposalGeneratedForNextMonth()
      {
      return db_schedule_assignments.BeProposalGeneratedForNextMonth();
      }

    internal bool BeSelectedAndGuardedOnMemberScheduleDetail
      (
      bool be_selected,
      string on_duty,
      bool be_ok_to_edit_schedule_liberally
      )
      //
      // This logic assumes conditions that are only guaranteed on the member schedule detail control.
      //
      {
      return be_selected
        &&
          (DateTime.Parse(on_duty) < DateTime.Now.AddHours((new k.int_nonnegative(val:int.Parse(s:ConfigurationManager.AppSettings["num_pre_shift_guard_hours"] ?? "0"))).val))
        &&
          !be_ok_to_edit_schedule_liberally;
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_schedule_assignments.Bind(partial_spec, target);
      }

    internal void BindBalancingOpportunities
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string heavy_nominal_day,
      string heavy_shift_name,
      string light_nominal_day,
      string light_shift_name
      )
      {
      db_schedule_assignments.BindBalancingOpportunities(sort_order,be_sort_order_ascending,target,heavy_nominal_day,heavy_shift_name,light_nominal_day,light_shift_name);
      }

    internal void BindBaseDataList
      (
      string agency_filter,
      string release_filter,
      string depth_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      object target,
      ref k.int_nonnegative num_members,
      ref k.decimal_nonnegative num_crew_shifts
      )
      {
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:agency_filter,
        release_filter:release_filter,
        depth_filter:depth_filter,
        relative_month:relative_month,
        nominal_day_filter:nominal_day_filter,
        target:target,
        num_members:ref num_members,
        num_crew_shifts:ref num_crew_shifts,
        do_limit_to_agency_members:false
        );
      }

    internal void BindBaseDataListByShiftForMaag
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string shift_name,
      string nominal_day_filter,
      object target
      )
      {
      db_schedule_assignments.BindBaseDataListByShiftForMaag(agency_filter,relative_month,shift_name,nominal_day_filter,target);
      }

    internal void BindAmbulanceStaffingTimeLineChartBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      DataGrid target,
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter = k.EMPTY
      )
      {
      db_schedule_assignments.BindAmbulanceStaffingTimeLineChartBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,relative_month,nominal_day_filter);
      }

    internal void BindBaseDataListByShiftForQuickMessage
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string shift_name,
      string nominal_day_filter,
      string depth_filter,
      object target,
      string release_filter = k.EMPTY
      )
      {
      db_schedule_assignments.BindBaseDataListByShiftForQuickMessage(agency_filter,relative_month,shift_name,nominal_day_filter,depth_filter,target,release_filter);
      }

    internal void BindInsufficientDriversAlertBaseDataList
      (
      string agency_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      db_schedule_assignments.BindInsufficientDriversAlertBaseDataList(agency_filter,relative_month,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_schedule_assignments.BindDirectToListControl(target);
      }

    internal void BindMemberScheduleDetailBaseDataList
      (
      string member_id,
      k.subtype<int> relative_month,
      string agency_id,
      object target
      )
      {
      db_schedule_assignments.BindMemberScheduleDetailBaseDataList(member_id,relative_month,agency_id,target);
      }

    internal void BindMemberScheduleDetailBaseDataListForIcalendar
      (
      string member_id,
      object target
      )
      {
      db_schedule_assignments.BindMemberScheduleDetailBaseDataListForIcalendar(member_id,target);
      }

    internal void BindPostCardinalityListControl
      (
      string max_post_cardinality,
      DropDownList target,
      string designator
      )
      {
      for (var i = new k.subtype<int>(0,Convert.ToInt16(Convert.ToChar(max_post_cardinality)) - Convert.ToInt16('a') + 1); i.val < i.LAST; i.val++)
        {
        target.Items.Add(new ListItem(Convert.ToString(Convert.ToChar(Convert.ToInt16('a') + i.val)),Convert.ToString(Convert.ToChar(Convert.ToInt16('a') + i.val))));
        }
      target.SelectedValue = designator;
      }

    internal void BindPotentialHelpersBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string schedule_assignment_id
      )
      {
      db_schedule_assignments.BindPotentialHelpersBaseDataList(sort_order,be_sort_order_ascending,target,schedule_assignment_id);
      }

    internal void BindRankedAvailabilitySubmissionCompliance(object target)
      {
      db_schedule_assignments.BindRankedAvailabilitySubmissionCompliance(target);
      }

    internal void BindSubmissionCompliancyBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      string compliancy_filter,
      bool show_transferring_members
      )
      {
      db_schedule_assignments.BindSubmissionCompliancyBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,release_filter,relative_month,compliancy_filter,show_transferring_members);
      }

    internal void BindTimeOffAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      db_schedule_assignments.BindTimeOffAlertBaseDataList(agency_filter,release_filter,relative_month,target);
      }

    internal void BindTimeOnAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      db_schedule_assignments.BindTimeOnAlertBaseDataList(agency_filter,release_filter,relative_month,target);
      }

    internal void BindTravelGapAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target,
      string post_footprint,
      bool be_lineup,
      bool be_for_muster // ignored if not be_lineup
      )
      {
      db_schedule_assignments.BindTravelGapAlertBaseDataList(agency_filter,release_filter,relative_month,target,post_footprint,be_lineup,be_for_muster);
      }

    internal void BindUnexpectedSubmissionsAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      db_schedule_assignments.BindUnexpectedSubmissionsAlertBaseDataList(agency_filter,release_filter,relative_month,target);
      }

    internal string CommentOf(object summary)
      {
      return db_schedule_assignments.CommentOf(summary);
      }

    public bool Delete(string id)
      {
      return db_schedule_assignments.Delete(id);
      }

    internal string ForceAvail
      (
      string member_id,
      DateTime nominal_day,
      string shift_name,
      string agency_id
      )
      {
      return db_schedule_assignments.ForceAvail(member_id,nominal_day,shift_name,agency_id,biz_members.IdOfUserId(biz_user.IdNum()));
      }

    internal bool ForceSelection
      (
      string id,
      bool be_selected
      )
      {
      var force_selection = true;
      //
      if(
          be_selected
        &&
          (
            db_schedule_assignments.BeMemberOnMedicalLeaveFor(id)
          ||
            (
              NominalDayOf(Summary(id)).Month == DateTime.Today.AddMonths(1).Month
            &&
              !BeProposalGeneratedForNextMonth()
            )
          )
        )
      //then
        {
        force_selection = false;
        }
      else
        {
        db_schedule_assignments.ForceSelection(id,be_selected,biz_members.IdOfUserId(biz_user.IdNum()));
        db_schedule_assignment_logs.Enter
          (
          assignment_id:id,
          action:"forced " + (be_selected ? "ON" : "OFF")
          );
        }
      //
      return force_selection;
      }

    public bool Get
      (
      string id,
      out DateTime nominal_day,
      out string shift_id,
      out string post_id,
      out string post_cardinality,
      out string position_id,
      out string member_id,
      out bool be_selected,
      out string comment,
      out string partner_list
      )
      {
      var db_schedule_assignments_get = db_schedule_assignments.Get
        (
        id,
        out nominal_day,
        out shift_id,
        out post_id,
        out post_cardinality,
        out position_id,
        out member_id,
        out be_selected,
        out comment,
        out partner_list
        );
      post_cardinality = Convert.ToString(Convert.ToChar(Convert.ToInt32('a') + int.Parse(post_cardinality) - 1));
      return db_schedule_assignments_get;
      }

    internal void GetAgencyFootprintInfo
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      out string posts,
      out string max_post_cardinality
      )
      {
      db_schedule_assignments.GetAgencyFootprintInfo(agency_filter,relative_month,nominal_day_filter,out posts,out max_post_cardinality);
      }

    internal void GetInfoAboutMemberInMonth
      (
      string member_id,
      k.subtype<int> relative_month,
      ref k.subtype<int> num,
      out DateTime earliest_unselected,
      out DateTime latest_unselected
      )
      {
      db_schedule_assignments.GetInfoAboutMemberInMonth(member_id,relative_month,ref num,out earliest_unselected,out latest_unselected);
      }

    internal void GetMostLikelyForNewEval
      (
      double client_timezone_offset,
      string user_member_id,
      out string most_likely_nominal_day,
      out string most_likely_shift_id,
      out string most_likely_post_id,
      out string most_likely_post_cardinality,
      out string most_likely_time_in,
      out string most_likely_time_out,
      out string most_likely_aic_member_id
      )
      {
      db_schedule_assignments.GetMostLikelyForNewEval
        (
        client_timezone_offset:client_timezone_offset,
        user_member_id:user_member_id,
        most_likely_nominal_day:out most_likely_nominal_day,
        most_likely_shift_id:out most_likely_shift_id,
        most_likely_post_id:out most_likely_post_id,
        most_likely_post_cardinality:out most_likely_post_cardinality,
        most_likely_time_in:out most_likely_time_in,
        most_likely_time_out:out most_likely_time_out,
        most_likely_aic_member_id:out most_likely_aic_member_id
        );
      }

    internal string IdOf(object summary)
      {
      return db_schedule_assignments.IdOf(summary);
      }

    internal void LogAvailabilitySubmissionComplianceData()
      {
      var log = new StreamWriter(path:HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["scratch_folder"] + "/biz_schedule_assignments.log"),append:true);
      log.AutoFlush = true;
      log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.LogAvailabilitySubmissionComplianceData: Calling db_schedule_assignments.Update...");
      db_schedule_assignments.Update
        (
        relative_month:"1",
        be_official:true,
        be_ok_to_work_on_next_month_assignments:false,
        log:log
        );
      log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.LogAvailabilitySubmissionComplianceData: ... Done calling db_schedule_assignments.Update.");
      db_schedule_assignments.LogAvailabilitySubmissionComplianceData();
      log.Close();
      }

    internal void LogCommensurationData()
      {
      using var dummy_basedatalist = new DataGrid();
      var dummy_k_int_nonnegative = new k.int_nonnegative();
      var num_crew_shifts_all = new k.decimal_nonnegative();
      var num_crew_shifts_ems = new k.decimal_nonnegative();
      var num_crew_shifts_r01 = new k.decimal_nonnegative();
      var num_crew_shifts_r02 = new k.decimal_nonnegative();
      var num_crew_shifts_r04 = new k.decimal_nonnegative();
      var num_crew_shifts_r05 = new k.decimal_nonnegative();
      var num_crew_shifts_r06 = new k.decimal_nonnegative();
      var num_crew_shifts_r09 = new k.decimal_nonnegative();
      var num_crew_shifts_r13 = new k.decimal_nonnegative();
      var num_crew_shifts_r14 = new k.decimal_nonnegative();
      var num_crew_shifts_r16 = new k.decimal_nonnegative();
      var num_crew_shifts_r17 = new k.decimal_nonnegative();
      //
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"1",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r01,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"2",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r02,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"4",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r04,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"5",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r05,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"6",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r06,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"9",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r09,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"13",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r13,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"14",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r14,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"16",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r16,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"17",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_r17,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:"0",
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_ems,
        do_limit_to_agency_members:true
        );
      db_schedule_assignments.BindBaseDataList
        (
        agency_filter:k.EMPTY,
        release_filter:"released",
        depth_filter:"1",
        relative_month:new k.subtype<int>(1,1),
        nominal_day_filter:k.EMPTY,
        target:dummy_basedatalist,
        num_members:ref dummy_k_int_nonnegative,
        num_crew_shifts:ref num_crew_shifts_all,
        do_limit_to_agency_members:false
        );
      db_agencies.LogCommensurationData
        (
        num_crew_shifts_r01,
        num_crew_shifts_r02,
        num_crew_shifts_r04,
        num_crew_shifts_r05,
        num_crew_shifts_r06,
        num_crew_shifts_r09,
        num_crew_shifts_r13,
        num_crew_shifts_r14,
        num_crew_shifts_r16,
        num_crew_shifts_r17,
        num_crew_shifts_ems,
        num_crew_shifts_all
        );
      }

    internal void MakeUpcomingDutyNotifications()
      {
      var id_q = db_schedule_assignments.SelectedAndNotifiableWithinFutureHoursIdQueue(24,48);
      var id_q_count = id_q.Count;
      for (var i = new k.subtype<int>(0,id_q_count); i.val < id_q_count; i.val++)
        {
        biz_notifications.IssueForUpcomingDuty(id_q.Dequeue() as string);
        }
      }

    internal void MarkMemberToBeReleased
      (
      string member_id,
      k.subtype<int> relative_month
      )
      {
      db_schedule_assignments.MarkMemberToBeReleased(member_id,relative_month);
      }

    internal string MemberAgencyIdOf(object summary)
      {
      return db_schedule_assignments.MemberAgencyIdOf(summary);
      }

    internal string MemberIdOf(object summary)
      {
      return db_schedule_assignments.MemberIdOf(summary);
      }

    internal string MemberMedicalReleaseLevelOf(object summary)
      {
      return db_schedule_assignments.MemberMedicalReleaseLevelOf(summary);
      }

    internal string MonthlessRenditionOfId(string id)
      {
      var nominal_day = DateTime.MinValue;
      var shift_name = k.EMPTY;
      db_schedule_assignments.GetNominalDayShiftNameOfId(id,out nominal_day,out shift_name);
      return MonthlessRenditionOfNominalDayShiftName(nominal_day,shift_name);
      }

    internal string MonthlessRenditionOfNominalDayShiftName
      (
      DateTime nominal_day,
      string shift_name
      )
      {
      return MonthlessRenditionOfNominalDay(nominal_day) + k.SPACE + shift_name;
      }

    internal string MonthlessRenditionOfNominalDay(DateTime nominal_day)
      {
      return nominal_day.ToString("ddd") + "/" + nominal_day.ToString("dd");
      }

    internal DateTime NominalDayOf(object summary)
      {
      return db_schedule_assignments.NominalDayOf(summary);
      }

    internal k.decimal_nonnegative NumCrewShifts
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name
      )
      {
      return db_schedule_assignments.NumCrewShifts(agency_filter,relative_month,nominal_day_filter,shift_name);
      }

    internal string OverallAvailabilitySubmissionCompliance()
      {
      return db_schedule_assignments.OverallAvailabilitySubmissionCompliance();
      }

    internal string PostCardinalityOf(object summary)
      {
      return db_schedule_assignments.PostCardinalityOf(summary);
      }

    internal string PostDesignatorOf(object summary)
      {
      return db_schedule_assignments.PostDesignatorOf(summary);
      }

    internal string PostIdOf(object summary)
      {
      return db_schedule_assignments.PostIdOf(summary);
      }

    internal void PublishArchivalEndOfMonthWatchbill(string working_directory)
      {
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      k.RunCommandIteratedOverArguments
        (
        "c:\\cygwin\\bin\\wget",
        new ArrayList()
          {
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R01\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R02\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R04\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R05\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R06\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R09\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R13\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R14\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R16\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=R17\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_archival_end_of_month_watchbill.aspx?agency=EMS\""
          },
        working_directory,
        out stdout,
        out stderr
        );
      }

    internal void PublishEndOfMonthAuditReport(string working_directory)
      {
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      k.RunCommandIteratedOverArguments
        (
        "c:\\cygwin\\bin\\wget",
        new ArrayList()
          {
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R01\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R02\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R04\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R05\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R06\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R09\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R13\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R14\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R16\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_schedule_assignments_audit.aspx?agency=R17\""
          },
        working_directory,
        out stdout,
        out stderr
        );
      }

    internal void PublishFullWatchbill
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      bool be_scalable_format_selected,
      string working_directory
      )
      {
      var member_id = biz_members.IdOfUserId(biz_user.IdNum());
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      k.RunCommandIteratedOverArguments
        (
        "c:\\cygwin\\bin\\wget",
        new ArrayList()
          {
          "--output-document=/dev/null --no-check-certificate --background"
          + " --post-data"
          +   "=agency_id=" + agency_filter
          +   "&release_filter=" + release_filter
          +   "&relative_month=" + relative_month.val
          +   "&publisher=\"" + biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(member_id) + k.SPACE + biz_members.LastNameOfMemberId(member_id) + "\""
          +   "&time_triggered=\"" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\""
          + k.SPACE
          + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_commanded_watchbill" + (be_scalable_format_selected ? k.EMPTY : "_maag") + ".aspx\""
          },
        working_directory,
        out stdout,
        out stderr
        );
      }

    private void PublishPendingNotifications
      (
      k.subtype<int> relative_month,
      bool be_virgin_watchbill,
      string working_directory,
      bool be_limited_preview
      )
      {
      var arguments = new ArrayList();
      var member_id_q = new Queue();
      var other_agency_ids_q = new Queue();
      var publisher_member_id = biz_members.IdOfUserId(biz_user.IdNum());
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      db_schedule_assignments.PendingNotificationTargets(relative_month,publisher_member_id,biz_members.AgencyIdOfId(publisher_member_id),be_virgin_watchbill,ref member_id_q,ref other_agency_ids_q);
      var num_targets = member_id_q.Count;
      var member_id = k.EMPTY;
      var other_agency_ids = k.EMPTY;
      for (var i = new k.subtype<int>(0,num_targets); i.val < num_targets; i.val++)
        {
        member_id = (member_id_q.Dequeue() as string);
        other_agency_ids = (other_agency_ids_q.Dequeue() as string);
        arguments.Add
          (
          "--output-document=/dev/null --no-check-certificate"
          + " --post-data"
          +   "=member_id=" + member_id
          +   "&relative_month=" + relative_month.val
          +   "&member_agency_id=" + biz_members.AgencyIdOfId(member_id)
          +   "&other_agency_ids=" + other_agency_ids
          +   "&be_virgin_watchbill=" + be_virgin_watchbill.ToString()
          +   "&publisher=\"" + biz_user.FullTitle() + k.SPACE + biz_members.FirstNameOfMemberId(publisher_member_id) + k.SPACE + biz_members.LastNameOfMemberId(publisher_member_id) + "\""
          +   "&be_limited_preview=" + be_limited_preview.ToString()
          +   "&time_triggered=\"" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\""
          + k.SPACE
          + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_commanded_member_schedule_detail.aspx\""
          );
        member_id_q.Enqueue(member_id);
        other_agency_ids_q.Enqueue(other_agency_ids);
        }
      k.RunCommandIteratedOverArguments("c:\\cygwin\\bin\\wget",arguments,working_directory,out stdout,out stderr);
      if (!be_limited_preview)
        {
        db_schedule_assignments.MarkNotificationsMade(member_id_q,relative_month);
        }
      }
    internal void PublishPendingNotifications(k.subtype<int> relative_month,bool be_virgin_watchbill,string working_directory)
      {
      PublishPendingNotifications(relative_month,be_virgin_watchbill,working_directory,be_limited_preview:false);
      }

    internal void Purge()
      {
      db_schedule_assignments.Purge();
      }

    public void Set
      (
      string id,
      DateTime nominal_day,
      string shift_id,
      string post_id,
      string post_cardinality,
      string position_id,
      string member_id,
      bool be_selected,
      string comment
      )
      {
      db_schedule_assignments.Set
        (
        id,
        nominal_day,
        shift_id,
        post_id,
        post_cardinality,
        position_id,
        member_id,
        be_selected,
        comment
        );
      }

    internal bool SetComment
      (
      string id,
      string comment
      )
      {
      var saved_comment = db_schedule_assignments.CommentOf(db_schedule_assignments.Summary(id));
      var set_comment = db_schedule_assignments.SetComment(id,comment,biz_members.IdOfUserId(biz_user.IdNum()));
      if (comment != saved_comment)
        {
        db_schedule_assignment_logs.Enter
          (
          assignment_id:id,
          action:"set comment from `" + saved_comment + "` to `" + comment + "`"
          );
        }
      return set_comment;
      }

    internal void SetPost
      (
      string id,
      string post_id
      )
      {
      var saved_post = db_schedule_assignments.PostDesignatorOf(db_schedule_assignments.Summary(id));
      var post = biz_agencies.ShortDesignatorOf(post_id);
      if (post != saved_post)
        {
        db_schedule_assignments.SetPost(id,post_id,biz_members.IdOfUserId(biz_user.IdNum()));
        db_schedule_assignment_logs.Enter
          (
          assignment_id:id,
          action:"sent from " + saved_post + " to " + post
          );
        }
      }

    internal void SetPostCardinality
      (
      string id,
      string post_cardinality
      )
      {
      var saved_post_cardinality = db_schedule_assignments.PostCardinalityOf(db_schedule_assignments.Summary(id));
      if (post_cardinality != saved_post_cardinality)
        {
        db_schedule_assignments.SetPostCardinality(id,post_cardinality,biz_members.IdOfUserId(biz_user.IdNum()));
        db_schedule_assignment_logs.Enter
          (
          assignment_id:id,
          action:"set crew from `" + saved_post_cardinality + "` to `" + post_cardinality + "`"
          );
        }
      }

    internal string ShiftNameOf(object summary)
      {
      return db_schedule_assignments.ShiftNameOf(summary);
      }

    internal void SpreadSelections
      (
      bool be_member_released,
      string id_a,
      string id_b,
      string intolerable_gap
      )
      {
      var saved_summary_a = db_schedule_assignments.Summary(id_a);
      var saved_summary_b = db_schedule_assignments.Summary(id_b);
      var saved_spec_a = db_schedule_assignments.PostDesignatorOf(saved_summary_a) + db_schedule_assignments.PostCardinalityOf(saved_summary_a);
      var saved_spec_b = db_schedule_assignments.PostDesignatorOf(saved_summary_b) + db_schedule_assignments.PostCardinalityOf(saved_summary_b);
      var affected_id = db_schedule_assignments.SpreadSelections(be_member_released,id_a,id_b,intolerable_gap,biz_members.IdOfUserId(biz_user.IdNum()));
      if (affected_id.Length > 0)
        {
        var saved_spec = (affected_id == id_a ? saved_spec_a : saved_spec_b);
        db_schedule_assignment_logs.Enter
          (
          assignment_id:affected_id,
          action:"deselected from " + saved_spec + " via Alerts / Time off / AutoFix"
          );
        }
      }

    internal object Summary(string id)
      {
      return db_schedule_assignments.Summary(id);
      }

    internal void SwapSelectedForMemberNextEarlierUnselected(string id)
      {
      var saved_summary = db_schedule_assignments.Summary(id);
      var saved_spec = db_schedule_assignments.PostDesignatorOf(saved_summary) + db_schedule_assignments.PostCardinalityOf(saved_summary);
      db_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(id,biz_members.IdOfUserId(biz_user.IdNum()));
      db_schedule_assignment_logs.Enter
        (
        assignment_id:id,
        action:"deselected from " + saved_spec + " via `Swap with earlier availability`"
        );
      }

    internal void SwapSelectedForMemberNextLaterUnselected(string id)
      {
      var saved_summary = db_schedule_assignments.Summary(id);
      var saved_spec = db_schedule_assignments.PostDesignatorOf(saved_summary) + db_schedule_assignments.PostCardinalityOf(saved_summary);
      db_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(id,biz_members.IdOfUserId(biz_user.IdNum()));
      db_schedule_assignment_logs.Enter
        (
        assignment_id:id,
        action:"deselected from " + saved_spec + " via `Swap with later availability`"
        );
      }

    internal void Update
      (
      string relative_month,
      string working_directory
      )
      {
      lock (update_lock)
        {
        var log = new StreamWriter(path:HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["scratch_folder"] + "/biz_schedule_assignments.log"),append:true);
        log.AutoFlush = true;
        var member_summary = biz_members.Summary(biz_members.IdOfUserId(biz_user.IdNum()));
        log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.Update: Current user is " + biz_members.CadNumOf(member_summary) + k.SPACE + biz_members.FirstNameOf(member_summary) + k.SPACE + biz_members.LastNameOf(member_summary) + "...");
        var be_ok_to_work_on_next_month_assignments = BeOkToWorkOnNextMonthAssignments();
        if (be_ok_to_work_on_next_month_assignments && !BeProposalGeneratedForNextMonth() && (relative_month == "1"))
          {
          log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.Update: Rigging for proposal generation...");
          db_schedule_assignments.RigForProposalGeneration();
          log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.Update: ... Done rigging for proposal generation.");
          }
        log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.Update: Calling db_schedule_assignments.Update...");
        db_schedule_assignments.Update
          (
          relative_month:relative_month,
          be_official:(relative_month == "0") || be_ok_to_work_on_next_month_assignments,
          be_ok_to_work_on_next_month_assignments:be_ok_to_work_on_next_month_assignments,
          log:log
          );
        log.WriteLine(DateTime.Now.ToString("s") + " biz_schedule_assignments.Update: ... Done calling db_schedule_assignments.Update.");
        //
        // Do a publish that only goes to sched coords and doesn't clear the be_notification_pending flag.  This will alert sched coords of new selections automatically made by the Update.
        //
        var relative_month_int = int.Parse(relative_month);
        var relative_month_subtype = new k.subtype<int>(relative_month_int,relative_month_int);
        var be_virgin_watchbill = BeFullWatchbillPublishMandatory(biz_members.AgencyIdOfId(biz_members.IdOf(member_summary)),relative_month_subtype);
        if (!be_virgin_watchbill)
          {
          PublishPendingNotifications(relative_month_subtype,be_virgin_watchbill,working_directory,be_limited_preview:true);
          }
        log.Close();
        }
      }

    } // end TClass_biz_schedule_assignments

  }

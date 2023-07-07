// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_shifts;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace Class_db_schedule_assignments
  {

  [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1051:Do not declare visible instance fields")]
  public class schedule_assignment_summary
    {
    public string id;
    public DateTime nominal_day;
    public string shift_id;
    public string shift_name;
    public TimeSpan shift_start;
    public TimeSpan shift_end;
    public string post_id;
    public string post_designator;
    public string post_cardinality;
    public string member_id;
    public string member_last_name;
    public string member_first_name;
    public string member_cad_num;
    public string member_medical_release_level;
    public string member_agency_id;
    public string member_phone_num;
    public string comment;
    public bool be_selected;
    }

  public class TClass_db_schedule_assignments: TClass_db
    {

    private const string ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_COMMON_SELECT_FROM_WHERE_CLAUSE = "create temporary table assignment_start_and_end_datetimes_sorted_by_member_id"
    + " select member_id"
    + " , medical_release_code_description_map.pecking_order >= 20 as be_member_released"
    + " , schedule_assignment.id as schedule_assignment_id"
    + " , DATE_FORMAT(ADDTIME(ADDTIME(nominal_day,start),muster_to_logon_timespan),'%Y-%m-%d %H:%i') as on_duty"
    + " , DATE_FORMAT(ADDTIME(ADDTIME(nominal_day,start),muster_to_logoff_timespan),'%Y-%m-%d %H:%i') as off_duty"
    + " , post_id"
    + " , comment"
    + " FROM schedule_assignment"
    +   " join shift on (shift.id=schedule_assignment.shift_id)"
    +   " join member on (member.id=schedule_assignment.member_id)"
    +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
    +   " join agency on (agency.id=schedule_assignment.post_id)"
    + " where member_id is not null"
    +   " and be_selected"
    +   " and short_designator <> '003'";

    private const string ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_ORDER_BY_CLAUSE = " order by member_id,nominal_day,start";
    private const string HH_RANGE_PATTERN = "([0-1][0-9]|2[0-4])-([0-1][0-9]|2[0-4])";
    private const string HHMM_RANGE_PATTERN = "([0-1][0-9]|2[0-4])[0-5][0-9]-([0-1][0-9]|2[0-4])[0-5][0-9]";
    private const string POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE = "CAST(CHAR(ASCII('a') + post_cardinality - 1) as CHAR)";

    private readonly TClass_db_shifts db_shifts = null;
    private readonly TClass_db_trail db_trail = null;

    private string CommonBindBaseDataListByShiftSelectClause(string first_name_clause)
      {
      return k.EMPTY
      + " select schedule_assignment.id as schedule_assignment_id"
      + " , short_designator as agency_short_designator"
      + " , IF(be_selected," + POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE + ",'') as post_cardinality"
      + " , watchbill_rendition as medical_release_description"
      + " , concat(last_name,', '," + first_name_clause + ") as name"
      + " , IF(medical_release_code_description_map.pecking_order >= 20,IF(be_driver_qualified,'','Ð'),'') as be_driver_qualified"
      + " , member.agency_id as member_agency_id"
      + " , IFNULL(comment,'') as comment"
      + " , be_challenge"
      + " , be_greenhorns";
      }

    private string CommonBindBaseDataListByShiftFromWhereOrderByClause
      (
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name,
      string agency_filter,
      string depth_filter,
      string release_condition_clause = k.EMPTY
      )
      {
      return k.EMPTY
      + " from schedule_assignment"
      +   " join agency on (agency.id=schedule_assignment.post_id)"
      +   " join member on (member.id=schedule_assignment.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
      +   " join shift on (shift.id=schedule_assignment.shift_id)"
      +   " left join challenge_analysis using (nominal_day,shift_id,post_id,post_cardinality)"
      +   " left join sms_gateway on (sms_gateway.id=member.phone_service_id)"
      + " where TRUE"
      +     (depth_filter.Length > 0 ? " and" + (depth_filter == "0" ? " not" : k.EMPTY) + " be_selected" : k.EMPTY)
      +   " and schedule_assignment.trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
      +   " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'"
      +   " and shift.name = '" + shift_name + "'"
      +     (agency_filter.Length > 0 ? " and ((agency_id = '" + agency_filter + "') or (post_id = '" + agency_filter + "') or (post_id in (select satellite_station_id from agency_satellite_station where agency_id = '" + agency_filter + "')))" : k.EMPTY)
      +     release_condition_clause
      + " order by post_id"
      + " , be_selected desc"
      + " , post_cardinality"
      + " , medical_release_code_description_map.pecking_order desc"
      + " , equivalent_los_start_date";
      }

    private string CommonChallengeAnalysisWhereClause(k.subtype<int> relative_month)
      {
      return k.EMPTY
      + " where medical_release_code_description_map.pecking_order >= 20"
      +   " and (post_id > 0 and post_id < 200)" // Only count ground ambulance assignments.
      +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))";
      }

    private string CommonChallengeAnalysisDropCreateSelectFromClause()
      {
      return k.EMPTY
      + " drop temporary table if exists challenge_analysis"
      + ";"
      + " create temporary table challenge_analysis"
      + " select nominal_day"
      + " , shift_id"
      + " , post_id"
      + " , post_cardinality"
      + " , ("
      +     " (sum(be_selected) = 0)" // No released members to partner with a third
      +   " or"
      +     " (sum(be_selected)%2 = 1)" // Odd number of released members
      +   " or"
      +     " (sum(be_selected and ((medical_release_code_description_map.pecking_order > 20) or ((medical_release_code_description_map.pecking_order >= 20) and (not be_driver_qualified)))) > sum(be_selected and be_driver_qualified))" // Insufficient drivers
      +   " or"
      +     " (sum(be_selected and be_placeholder) > 0)" // Someone scheduled a 'member' who does not actually exist (like 'SHIFT MEDIC' or 'VACANT VACANT') for this slot
      +   " ) as be_challenge"
      + " , sum(be_selected and (first_release_as_aic_date > DATE_SUB(CURDATE(),INTERVAL " + ConfigurationManager.AppSettings["greenhorn_period_in_months"] + " MONTH))) = sum(be_selected) as be_greenhorns"
      + " from schedule_assignment"
      +   " join member on (member.id=schedule_assignment.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)";
      }

    public TClass_db_schedule_assignments() : base()
      {
      db_shifts = new TClass_db_shifts();
      db_trail = new TClass_db_trail();
      }

    public bool BeAdventitiousChangeDetected
      (
      string user_id,
      k.subtype<int> relative_month,
      bool be_virgin_watchbill
      )
      {
      var be_adventitious_change_detected = false;
      var liberal_conditions = (be_virgin_watchbill ? k.EMPTY : " or post_id = this_member.agency_id or agency_satellite_station.agency_id = this_member.agency_id");
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand
          (
          "select count(*)"
          + " from schedule_assignment"
          +   " join member reviser_member on (reviser_member.id=schedule_assignment.reviser_member_id)"
          +   " join user_member_map reviser_user_member_map on (reviser_user_member_map.member_id=reviser_member.id)"
          +   " join user reviser_user on (reviser_user.id=reviser_user_member_map.user_id)"
          +   " join member assignment_member on (assignment_member.id=schedule_assignment.member_id)"
          +   " left join agency_satellite_station on (agency_satellite_station.satellite_station_id=schedule_assignment.post_id)"
          +   " join user this_user on (this_user.id = '" + user_id + "')"
          +   " join user_member_map this_user_member_map on (this_user_member_map.user_id=this_user.id)"
          +   " join member this_member on (this_member.id=this_user_member_map.member_id)"
          + " where be_selected"
          +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
          +   " and (assignment_member.agency_id = this_member.agency_id" + liberal_conditions + " )"
          +   " and (reviser_member_id is null or reviser_user.id <> '" + user_id + "')"
          +   " and schedule_assignment.last_revised > this_user.last_login",
          connection,
          transaction
          );
        be_adventitious_change_detected = "1" == my_sql_command_1.ExecuteScalar().ToString();
        using var my_sql_command_2 = new MySqlCommand("update user set last_login = NOW() where id = '" + user_id + "'",connection,transaction);
        my_sql_command_2.ExecuteNonQuery(); // Deliberately not db_trail.Saved.
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      return be_adventitious_change_detected;
      }

    public bool BeMemberAvailableEitherCanonicalShiftThisNominalDay
      (
      string member_id,
      DateTime nominal_day
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand("select count(*) from schedule_assignment where member_id = '" + member_id + "' and nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'",connection);
      var be_member_available_either_canonical_shift_this_nominal_day = "0" != my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_member_available_either_canonical_shift_this_nominal_day;
      }

    public bool BeMemberOnMedicalLeaveFor(string id)
      {
      var be_member_on_medical_leave_for = false;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select 1"
        + " from schedule_assignment"
        +   " join leave_of_absence on (leave_of_absence.member_id=schedule_assignment.member_id)"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where"
        +     " (schedule_assignment.id = '" + id + "')"
        +   " and"
        +     " (description = 'Medical')"
        +   " and"
        +     " (nominal_day between start_date and end_date)"
        + " limit 1",
        connection
        ); 
      be_member_on_medical_leave_for = null != my_sql_command.ExecuteScalar();
      Close();
      return be_member_on_medical_leave_for;
      }

    public bool BeMemberOnMedicalLeaveFor
      (
      string member_id,
      DateTime nominal_day
      )
      {
      var be_member_on_medical_leave_for = false;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select 1"
        + " from leave_of_absence"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where"
        +     " (member_id = '" + member_id + "')"
        +   " and"
        +     " (description = 'Medical')"
        +   " and"
        +     " ('" + nominal_day.ToString("yyyy-MM-dd") + "' between start_date and end_date)"
        + " limit 1",
        connection
        ); 
      be_member_on_medical_leave_for = null != my_sql_command.ExecuteScalar();
      Close();
      return be_member_on_medical_leave_for;
      }

    public bool BeMemberSelectedDuringPeriod
      (
      string member_id,
      DateTime period_start,
      DateTime period_end
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select count(*)"
        + " from schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + " where member_id = '" + member_id + "'"
        +   " and be_selected"
        +   " and ADDTIME(nominal_day,start) between '" + period_start.ToString("yyyy-MM-dd HH:mm") + "' and '" + period_end.ToString("yyyy-MM-dd HH:mm") + "'",
        connection
        );
      var be_member_selected_during_period = "0" != my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_member_selected_during_period;
      }

    public bool BeNotificationPendingForAllInScope
      (
      string agency_filter,
      k.subtype<int> relative_month
      )
      {
      var be_notification_pending_for_all_in_scope = true;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select sum(not be_notification_pending)"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        + " where agency_id = '" + agency_filter + "'"
        +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))",
        connection
        );
      be_notification_pending_for_all_in_scope = "0" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_notification_pending_for_all_in_scope;
      }

    public bool BePendingNotifications
      (
      k.subtype<int> relative_month,
      string publisher_member_id,
      string publisher_member_agency_id,
      bool be_virgin_watchbill,
      bool be_selected_only
      )
      {
      var be_pending_notifications = false;
      var liberal_conditions = (be_virgin_watchbill ? k.EMPTY : " or post_id = '" + publisher_member_agency_id + "' or agency_satellite_station.agency_id = '" + publisher_member_agency_id + "' or reviser_member_id = '" + publisher_member_id + "'");
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select count(member_id) > 0"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " left join agency_satellite_station on (agency_satellite_station.satellite_station_id=schedule_assignment.post_id)"
        + " where be_notification_pending"
        +     (be_selected_only ? " and be_selected" : k.EMPTY)
        +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +   " and (member.agency_id = '" + publisher_member_agency_id + "'" + liberal_conditions + " )",
        connection
        );
      be_pending_notifications = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_pending_notifications;
      }

    public bool BeProposalGeneratedForNextMonth()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select count(*)"
        + " from schedule_assignment"
        + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL 1 MONTH))"
        +   " and be_selected",
        connection
        );
      var be_proposal_generated_for_next_month = "0" != my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_proposal_generated_for_next_month;
      }

    public bool BeSpecialEventActive()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT count(*) > 0"
        + " FROM schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + " where nominal_day = CURDATE()"
        +   " and CURTIME() between SUBTIME(ADDTIME(start,muster_to_logon_timespan),'01:00:00') and ADDTIME(start,muster_to_logoff_timespan)"
        +   " and post_id between 700 and 799" // Special Event (SE) posts
        +   " and be_selected",
        connection
        );
      var be_special_event_active = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_special_event_active;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(nominal_day,'-'),'|',IFNULL(shift_id,'-'),'|',IFNULL(post_id,'-'),'|',IFNULL(post_cardinality,'-'),'|',IFNULL(position_id,'-'),'|',IFNULL(member_id,'-'),'|',IFNULL(be_selected,'-'),'|',IFNULL(comment,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from schedule_assignment"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindAmbulanceStaffingTimeLineChartBaseDataList
      (
      #pragma warning disable IDE0060 // Remove unused parameter
      #pragma warning disable CA1801 // Remove unused parameter
      string sort_order,
      bool be_sort_order_ascending,
      DataGrid target,
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter = k.EMPTY
      #pragma warning restore CA1801 // Remove unused parameter
      #pragma warning restore IDE0060 // Remove unused parameter
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select nominal_day"
        + " , d0000,d0030,d0100,d0130,d0200,d0230,d0300,d0330,d0400,d0430,d0500,d0530,d0600,d0630,d0700,d0730,d0800,d0830,d0900,d0930,d1000,d1030,d1100,d1130"
        + " , n0000,n0030,n0100,n0130,n0200,n0230,n0300,n0330,n0400,n0430,n0500,n0530,n0600,n0630,n0700,n0730,n0800,n0830,n0900,n0930,n1000,n1030,n1100,n1130"
        + " from"
        +   " ("
        +   " select nominal_day"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('000000' AS TIME) AND CAST('000000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0000"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('003000' AS TIME) AND CAST('003000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0030"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('010000' AS TIME) AND CAST('010000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0100"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('013000' AS TIME) AND CAST('013000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0130"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('020000' AS TIME) AND CAST('020000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0200"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('023000' AS TIME) AND CAST('023000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0230"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('030000' AS TIME) AND CAST('030000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0300"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('033000' AS TIME) AND CAST('033000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0330"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('040000' AS TIME) AND CAST('040000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0400"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('043000' AS TIME) AND CAST('043000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0430"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('050000' AS TIME) AND CAST('050000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0500"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('053000' AS TIME) AND CAST('053000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0530"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('060000' AS TIME) AND CAST('060000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0600"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('063000' AS TIME) AND CAST('063000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0630"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('070000' AS TIME) AND CAST('070000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0700"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('073000' AS TIME) AND CAST('073000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0730"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('080000' AS TIME) AND CAST('080000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0800"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('083000' AS TIME) AND CAST('083000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0830"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('090000' AS TIME) AND CAST('090000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0900"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('093000' AS TIME) AND CAST('093000' AS TIME) < muster_to_logoff_timespan)/2,1) as d0930"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('100000' AS TIME) AND CAST('100000' AS TIME) < muster_to_logoff_timespan)/2,1) as d1000"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('103000' AS TIME) AND CAST('103000' AS TIME) < muster_to_logoff_timespan)/2,1) as d1030"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('110000' AS TIME) AND CAST('110000' AS TIME) < muster_to_logoff_timespan)/2,1) as d1100"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('113000' AS TIME) AND CAST('113000' AS TIME) < muster_to_logoff_timespan)/2,1) as d1130"
        +   " from schedule_assignment"
        +     " join shift on (shift.id=schedule_assignment.shift_id)"
        +     " join member on (member.id=schedule_assignment.member_id)"
        +     " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " where medical_release_code_description_map.pecking_order >= 20"
        +     " and be_selected"
        +     " and post_id < 200"
        +     " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +       (nominal_day_filter.Length == 0 ? k.EMPTY : " and DAY(nominal_day) = '" + nominal_day_filter + "'")
        +     " and shift.name = 'DAY'"
        +   " group by nominal_day"
        +   " )"
        +   " as granular_coverage_levels_day"
        + " join"
        +   " ("
        +   " select nominal_day"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('000000' AS TIME) AND CAST('000000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0000"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('003000' AS TIME) AND CAST('003000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0030"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('010000' AS TIME) AND CAST('010000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0100"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('013000' AS TIME) AND CAST('013000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0130"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('020000' AS TIME) AND CAST('020000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0200"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('023000' AS TIME) AND CAST('023000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0230"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('030000' AS TIME) AND CAST('030000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0300"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('033000' AS TIME) AND CAST('033000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0330"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('040000' AS TIME) AND CAST('040000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0400"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('043000' AS TIME) AND CAST('043000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0430"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('050000' AS TIME) AND CAST('050000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0500"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('053000' AS TIME) AND CAST('053000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0530"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('060000' AS TIME) AND CAST('060000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0600"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('063000' AS TIME) AND CAST('063000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0630"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('070000' AS TIME) AND CAST('070000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0700"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('073000' AS TIME) AND CAST('073000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0730"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('080000' AS TIME) AND CAST('080000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0800"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('083000' AS TIME) AND CAST('083000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0830"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('090000' AS TIME) AND CAST('090000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0900"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('093000' AS TIME) AND CAST('093000' AS TIME) < muster_to_logoff_timespan)/2,1) as n0930"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('100000' AS TIME) AND CAST('100000' AS TIME) < muster_to_logoff_timespan)/2,1) as n1000"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('103000' AS TIME) AND CAST('103000' AS TIME) < muster_to_logoff_timespan)/2,1) as n1030"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('110000' AS TIME) AND CAST('110000' AS TIME) < muster_to_logoff_timespan)/2,1) as n1100"
        +   " , FORMAT(SUM(muster_to_logon_timespan <= CAST('113000' AS TIME) AND CAST('113000' AS TIME) < muster_to_logoff_timespan)/2,1) as n1130"
        +   " from schedule_assignment"
        +     " join shift on (shift.id=schedule_assignment.shift_id)"
        +     " join member on (member.id=schedule_assignment.member_id)"
        +     " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " where medical_release_code_description_map.pecking_order >= 20"
        +     " and be_selected"
        +     " and post_id < 200"
        +     " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +       (nominal_day_filter.Length == 0 ? k.EMPTY : " and DAY(nominal_day) = '" + nominal_day_filter + "'")
        +     " and shift.name = 'NIGHT'"
        +   " group by nominal_day"
        +   " )"
        +   " as granular_coverage_levels_night"
        + " using (nominal_day)",
        connection
        );
      target.DataSource = my_sql_command.ExecuteReader();
      target.DataBind();
      (target.DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindBalancingOpportunities
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
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select member.id as member_id"
        + " , CONCAT(last_name,', ',first_name) as member"
        + " , CONCAT(agency.short_designator,CHAR(ASCII('a') + heavy.post_cardinality - 1 using ascii)) as current_assignment"
        + " , heavy.comment as comment"
        + " , email_address as email_target"
        + " , concat(phone_num,'@',sms_gateway.hostname) as sms_target"
        + " from schedule_assignment heavy"
        +   " join shift heavy_shift on (heavy_shift.id=heavy.shift_id)"
        +   " join member on (member.id=heavy.member_id)"
        +   " join agency on (agency.id=heavy.post_id)"
        +   " join schedule_assignment light on (light.member_id=heavy.member_id)"
        +   " join shift light_shift on (light_shift.id=light.shift_id)"
        +   " left join sms_gateway on (sms_gateway.id=member.phone_service_id)"
        + " where member.agency_id between 1 and 199"
        +   " and heavy.nominal_day = '" + heavy_nominal_day + "'"
        +   " and heavy_shift.name = '" + heavy_shift_name + "'"
        +   " and heavy.be_selected"
        +   " and NOT light.be_selected"
        +   " and light.nominal_day = '" + light_nominal_day + "'"
        +   " and light_shift.name = '" + light_shift_name + "'"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindBaseDataList
      (
      string agency_filter,
      string release_filter,
      string depth_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      object target,
      ref k.int_nonnegative num_members,
      ref k.decimal_nonnegative num_crew_shifts,
      bool do_limit_to_agency_members
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and"
        + " ("
        +   " (agency_id = '" + agency_filter + "')"
        + " or"
        +   " (post_id = '" + agency_filter + "')"
        + " or"
        +   " (post_id in (select satellite_station_id from agency_satellite_station where agency_id = '" + agency_filter + "'))"
        + " or"
        +   " (comment like concat('%>',(select short_designator from agency where id = '" + agency_filter + "')))"
        + " )";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      var depth_condition_clause = k.EMPTY;
      if (depth_filter == "1")
        {
        depth_condition_clause = " and be_selected";
        }
      else if (depth_filter == "0")
        {
        depth_condition_clause = " and not be_selected";
        }
      var nominal_day_condition_clause = k.EMPTY;
      if (nominal_day_filter.Length > 0)
        {
        nominal_day_condition_clause = " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'";
        }
      var commensuration_condition_clause = (do_limit_to_agency_members ? " and member.agency_id = '" + agency_filter + "'" : k.EMPTY);
      var common_initial_field_list = k.EMPTY
      + " , num_units.from_agency as num_units_from_agency"
      + " , num_units.citywide as num_units_citywide"
      + " , schedule_assignment.id as assignment_id"
      + " , post_id"
      + " , IF(be_selected," + POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE + ",'') as post_cardinality"
      + " , member.agency_id as member_agency_id"
      + " , short_designator as agency_short_designator"
      + " , member_id"
      + " , IF((LEFT(cad_num,1) BETWEEN 'A' and 'Z') and (medical_release_code = '1'),'o',watchbill_rendition) as medical_release_description" // o = Observer
      + " , concat(last_name,', ',first_name) as name"
      + " , IF(medical_release_code_description_map.pecking_order >= 20,IF(be_driver_qualified,'','Ð'),'') as be_driver_qualified"
      + " , be_selected"
      + " , IFNULL(comment,'') as comment"
      + " , be_challenge"
      + " , be_greenhorns"
      + " , IFNULL(phone_num,'') as phone_num"
      + " , IFNULL(cad_num,'') as cad_num"
      + " , be_flight_medic"
      + " , be_marine_medic"
      + " , IF(muster_to_logon_timespan <= CAST('000000' AS TIME) AND CAST('000000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0000"
      + " , IF(muster_to_logon_timespan <= CAST('003000' AS TIME) AND CAST('003000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0030"
      + " , IF(muster_to_logon_timespan <= CAST('010000' AS TIME) AND CAST('010000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0100"
      + " , IF(muster_to_logon_timespan <= CAST('013000' AS TIME) AND CAST('013000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0130"
      + " , IF(muster_to_logon_timespan <= CAST('020000' AS TIME) AND CAST('020000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0200"
      + " , IF(muster_to_logon_timespan <= CAST('023000' AS TIME) AND CAST('023000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0230"
      + " , IF(muster_to_logon_timespan <= CAST('030000' AS TIME) AND CAST('030000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0300"
      + " , IF(muster_to_logon_timespan <= CAST('033000' AS TIME) AND CAST('033000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0330"
      + " , IF(muster_to_logon_timespan <= CAST('040000' AS TIME) AND CAST('040000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0400"
      + " , IF(muster_to_logon_timespan <= CAST('043000' AS TIME) AND CAST('043000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0430"
      + " , IF(muster_to_logon_timespan <= CAST('050000' AS TIME) AND CAST('050000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0500"
      + " , IF(muster_to_logon_timespan <= CAST('053000' AS TIME) AND CAST('053000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0530"
      + " , IF(muster_to_logon_timespan <= CAST('060000' AS TIME) AND CAST('060000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0600"
      + " , IF(muster_to_logon_timespan <= CAST('063000' AS TIME) AND CAST('063000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0630"
      + " , IF(muster_to_logon_timespan <= CAST('070000' AS TIME) AND CAST('070000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0700"
      + " , IF(muster_to_logon_timespan <= CAST('073000' AS TIME) AND CAST('073000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0730"
      + " , IF(muster_to_logon_timespan <= CAST('080000' AS TIME) AND CAST('080000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0800"
      + " , IF(muster_to_logon_timespan <= CAST('083000' AS TIME) AND CAST('083000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0830"
      + " , IF(muster_to_logon_timespan <= CAST('090000' AS TIME) AND CAST('090000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0900"
      + " , IF(muster_to_logon_timespan <= CAST('093000' AS TIME) AND CAST('093000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s0930"
      + " , IF(muster_to_logon_timespan <= CAST('100000' AS TIME) AND CAST('100000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s1000"
      + " , IF(muster_to_logon_timespan <= CAST('103000' AS TIME) AND CAST('103000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s1030"
      + " , IF(muster_to_logon_timespan <= CAST('110000' AS TIME) AND CAST('110000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s1100"
      + " , IF(muster_to_logon_timespan <= CAST('113000' AS TIME) AND CAST('113000' AS TIME) < muster_to_logoff_timespan,'#',' ') as s1130"
      ;
      var common_from_where_clause = k.EMPTY
      + " from schedule_assignment"
      +   " join agency on (agency.id=schedule_assignment.post_id)"
      +   " join member on (member.id=schedule_assignment.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
      +   " join shift on (shift.id=schedule_assignment.shift_id)"
      +   " left join num_units using (nominal_day,shift_id)"
      +   " left join challenge_analysis using (nominal_day,shift_id,post_id,post_cardinality)"
      + " where schedule_assignment.trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
      +     nominal_day_condition_clause
      +     agency_condition_clause
      +     commensuration_condition_clause;
      var common_initial_from_where_clause = common_from_where_clause + release_condition_clause + depth_condition_clause;
      var common_order_by_clause = k.EMPTY
      + " order by nominal_day"
      + " , post_id"
      + " , be_selected desc"
      + " , post_cardinality"
      + " , medical_release_code_description_map.pecking_order desc"
      + " , equivalent_los_start_date"
      + " , first_release_as_aic_date";
      var common_subsequent_field_list = k.EMPTY
      + " , num_units_from_agency"
      + " , num_units_citywide"
      + " , assignment_id"
      + " , post_id"
      + " , post_cardinality"
      + " , member_agency_id"
      + " , agency_short_designator"
      + " , member_id"
      + " , medical_release_description"
      + " , be_flight_medic"
      + " , be_marine_medic"
      + " , name"
      + " , be_driver_qualified"
      + " , be_selected"
      + " , comment"
      + " , be_challenge"
      + " , be_greenhorns"
      + " , phone_num"
      + " , cad_num"
      + " , s0000"
      + " , s0030"
      + " , s0100"
      + " , s0130"
      + " , s0200"
      + " , s0230"
      + " , s0300"
      + " , s0330"
      + " , s0400"
      + " , s0430"
      + " , s0500"
      + " , s0530"
      + " , s0600"
      + " , s0630"
      + " , s0700"
      + " , s0730"
      + " , s0800"
      + " , s0830"
      + " , s0900"
      + " , s0930"
      + " , s1000"
      + " , s1030"
      + " , s1100"
      + " , s1130"
      ;
      var common_final_fields = k.EMPTY
      // nominal_day
      // display_seq_num
      + " , d.num_units_from_agency as d_num_units_from_agency"
      + " , d.num_units_citywide as d_num_units_citywide"
      + " , d.assignment_id as d_assignment_id"
      + " , d.post_id as d_post_id"
      + " , d.post_cardinality as d_post_cardinality"
      + " , d.member_agency_id as d_member_agency_id"
      + " , d.agency_short_designator as d_agency_short_designator"
      + " , d.member_id as d_member_id"
      + " , d.medical_release_description as d_medical_release_description"
      + " , d.be_flight_medic as d_be_flight_medic"
      + " , d.be_marine_medic as d_be_marine_medic"
      + " , d.name as d_name"
      + " , d.be_driver_qualified as d_be_driver_qualified"
      + " , d.be_selected as d_be_selected"
      + " , d.comment as d_comment"
      + " , d.be_challenge as d_be_challenge"
      + " , d.be_greenhorns as d_be_greenhorns"
      + " , d.phone_num as d_phone_num"
      + " , d.cad_num as d_cad_num"
      + " , d.s0000 as d0000"
      + " , d.s0030 as d0030"
      + " , d.s0100 as d0100"
      + " , d.s0130 as d0130"
      + " , d.s0200 as d0200"
      + " , d.s0230 as d0230"
      + " , d.s0300 as d0300"
      + " , d.s0330 as d0330"
      + " , d.s0400 as d0400"
      + " , d.s0430 as d0430"
      + " , d.s0500 as d0500"
      + " , d.s0530 as d0530"
      + " , d.s0600 as d0600"
      + " , d.s0630 as d0630"
      + " , d.s0700 as d0700"
      + " , d.s0730 as d0730"
      + " , d.s0800 as d0800"
      + " , d.s0830 as d0830"
      + " , d.s0900 as d0900"
      + " , d.s0930 as d0930"
      + " , d.s1000 as d1000"
      + " , d.s1030 as d1030"
      + " , d.s1100 as d1100"
      + " , d.s1130 as d1130"
      + " , n.num_units_from_agency as n_num_units_from_agency"
      + " , n.num_units_citywide as n_num_units_citywide"
      + " , n.assignment_id as n_assignment_id"
      + " , n.post_id as n_post_id"
      + " , n.post_cardinality as n_post_cardinality"
      + " , n.member_agency_id as n_member_agency_id"
      + " , n.agency_short_designator as n_agency_short_designator"
      + " , n.member_id as n_member_id"
      + " , n.medical_release_description as n_medical_release_description"
      + " , n.be_flight_medic as n_be_flight_medic"
      + " , n.be_marine_medic as n_be_marine_medic"
      + " , n.name as n_name"
      + " , n.be_driver_qualified as n_be_driver_qualified"
      + " , n.be_selected as n_be_selected"
      + " , n.comment as n_comment"
      + " , n.be_challenge as n_be_challenge"
      + " , n.be_greenhorns as n_be_greenhorns"
      + " , n.phone_num as n_phone_num"
      + " , n.cad_num as n_cad_num"
      + " , n.s0000 as n0000"
      + " , n.s0030 as n0030"
      + " , n.s0100 as n0100"
      + " , n.s0130 as n0130"
      + " , n.s0200 as n0200"
      + " , n.s0230 as n0230"
      + " , n.s0300 as n0300"
      + " , n.s0330 as n0330"
      + " , n.s0400 as n0400"
      + " , n.s0430 as n0430"
      + " , n.s0500 as n0500"
      + " , n.s0530 as n0530"
      + " , n.s0600 as n0600"
      + " , n.s0630 as n0630"
      + " , n.s0700 as n0700"
      + " , n.s0730 as n0730"
      + " , n.s0800 as n0800"
      + " , n.s0830 as n0830"
      + " , n.s0900 as n0900"
      + " , n.s0930 as n0930"
      + " , n.s1000 as n1000"
      + " , n.s1030 as n1030"
      + " , n.s1100 as n1100"
      + " , n.s1130 as n1130"
      ;
      //
      Open();
      using var transaction = connection.BeginTransaction();
      //
      // Since we are only using selects and temporary tables, do not save this to the db_trail.
      //
      var be_done = false;
      while (!be_done)
        {
        try
          {
          using var my_sql_command_1 = new MySqlCommand
            (
            "create temporary table num_units"
            + " select nominal_day"
            + " , shift_id"
            + " , sum(member.agency_id = '" + agency_filter + "')/2 as from_agency"
            + " , count(*)/2 as citywide"
            + " from schedule_assignment"
            +   " join member on (member.id=schedule_assignment.member_id)"
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            + " where medical_release_code_description_map.pecking_order >= 20"
            +   " and be_selected"
            +   " and post_id < 200" // Only count ground ambulance assignments.
            +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
            +   " and (comment is null or comment not rlike '[[:digit:]]-[[:digit:]]')"
            + " group by nominal_day,shift_id"
            + ";"
            //
            // Generate the challenge analysis table
            //
            + CommonChallengeAnalysisDropCreateSelectFromClause()
            + CommonChallengeAnalysisWhereClause(relative_month)
            + " group by nominal_day,shift_id,post_id,post_cardinality"
            + ";"
            //
            // Generate the list of DAY schedule assignments for this month in the desired order.
            //
            + " drop temporary table if exists this_month_day_schedule_assignment"
            + ";"
            + " create temporary table this_month_day_schedule_assignment"
            + " select schedule_assignment.nominal_day as nominal_day"
            + common_initial_field_list
            + common_initial_from_where_clause
            +   " and shift.name = 'DAY'"
            + common_order_by_clause
            + ";"
            //
            // Generate the list of NIGHT schedule assignments for this month in the desired order.
            //
            + " drop temporary table if exists this_month_night_schedule_assignment"
            + ";"
            + " create temporary table this_month_night_schedule_assignment"
            + " select schedule_assignment.nominal_day as nominal_day"
            + common_initial_field_list
            + common_initial_from_where_clause
            +   " and shift.name = 'NIGHT'"
            + common_order_by_clause
            + ";"
            //
            // Set up special subqueries that use user variables to calculate and assign display sequence numbers to each day and night assignment, respectively, such that the display sequence numbers reset to 1 each time the nominal_day changes.  The display
            // sequence numbers are thus used as the common attribute that allows an otherwise unassociated pair of day and night assignments to be displayed side by side for each particular nominal_day.
            //
            + " drop temporary table if exists this_month_day_schedule_assignment_with_dsn"
            + ";"
            + " create temporary table this_month_day_schedule_assignment_with_dsn"
            + " select IF(nominal_day <> @d_nominal_day,@d_display_seq_num := 1,@d_display_seq_num := @d_display_seq_num + 1) as display_seq_num"
            + " , @d_nominal_day := nominal_day as nominal_day"
            + common_subsequent_field_list
            + " from (select @d_nominal_day := '0000-00-00', @d_display_seq_num := 0) dummy, this_month_day_schedule_assignment"
            + ";"
            + " drop temporary table if exists this_month_night_schedule_assignment_with_dsn"
            + ";"
            + " create temporary table this_month_night_schedule_assignment_with_dsn"
            + " select IF(nominal_day <> @n_nominal_day,@n_display_seq_num := 1,@n_display_seq_num := @n_display_seq_num + 1) as display_seq_num"
            + " , @n_nominal_day := nominal_day as nominal_day"
            + common_subsequent_field_list
            + " from (select @n_nominal_day := '0000-00-00', @n_display_seq_num := 0) dummy, this_month_night_schedule_assignment"
            + ";"
            + " drop temporary table if exists this_month_schedule_assignment"
            + ";"
            //
            // The following CREATE, ALTER, and INSERT statements accomplish a FULL OUTER JOIN hinged on nominal_day and display_seq_num.  (MySQL 5.5 does not directly support FULL OUTER JOINs.)
            //
            + " CREATE temporary table this_month_schedule_assignment"
            + " select DATE_FORMAT(d.nominal_day,'%Y-%m-%d') as nominal_day , d.display_seq_num" + common_final_fields
            + " from this_month_day_schedule_assignment_with_dsn as d"
            +   " left join this_month_night_schedule_assignment_with_dsn as n"
            +     " using (nominal_day,display_seq_num)"
            + ";"
            + " ALTER table this_month_schedule_assignment add primary key (nominal_day,display_seq_num)"
            + " , modify d_num_units_from_agency FLOAT NULL"
            + " , modify d_num_units_citywide FLOAT NULL"
            + " , modify d_assignment_id BIGINT UNSIGNED NULL"
            + " , modify d_post_id BIGINT UNSIGNED NULL"
            + " , modify d_post_cardinality CHAR NULL"
            + " , modify d_member_agency_id INT UNSIGNED NULL"
            + " , modify d_agency_short_designator VARCHAR(3) NULL"
            + " , modify d_member_id INT UNSIGNED NULL"
            + " , modify d_medical_release_description VARCHAR(31) NULL"
            + " , modify d_be_flight_medic TINYINT NULL"
            + " , modify d_be_marine_medic TINYINT NULL"
            + " , modify d_name VARCHAR(64) NULL"
            + " , modify d_be_selected TINYINT NULL"
            + " , modify d_be_driver_qualified CHAR NULL"
            + " , modify d_comment VARCHAR(511) NULL"
            + " , modify d_be_challenge TINYINT NULL"
            + " , modify d_be_greenhorns TINYINT NULL"
            + " , modify d_phone_num VARCHAR(10) NULL"
            + " , modify d_cad_num VARCHAR(6) NULL"
            + " , modify d0000 CHAR NULL"
            + " , modify d0030 CHAR NULL"
            + " , modify d0100 CHAR NULL"
            + " , modify d0130 CHAR NULL"
            + " , modify d0200 CHAR NULL"
            + " , modify d0230 CHAR NULL"
            + " , modify d0300 CHAR NULL"
            + " , modify d0330 CHAR NULL"
            + " , modify d0400 CHAR NULL"
            + " , modify d0430 CHAR NULL"
            + " , modify d0500 CHAR NULL"
            + " , modify d0530 CHAR NULL"
            + " , modify d0600 CHAR NULL"
            + " , modify d0630 CHAR NULL"
            + " , modify d0700 CHAR NULL"
            + " , modify d0730 CHAR NULL"
            + " , modify d0800 CHAR NULL"
            + " , modify d0830 CHAR NULL"
            + " , modify d0900 CHAR NULL"
            + " , modify d0930 CHAR NULL"
            + " , modify d1000 CHAR NULL"
            + " , modify d1030 CHAR NULL"
            + " , modify d1100 CHAR NULL"
            + " , modify d1130 CHAR NULL"
            + ";"
            + " INSERT ignore this_month_schedule_assignment"
            + " select DATE_FORMAT(n.nominal_day,'%Y-%m-%d') as nominal_day , n.display_seq_num" + common_final_fields
            + " from this_month_day_schedule_assignment_with_dsn as d"
            +   " right join this_month_night_schedule_assignment_with_dsn as n"
            +     " using (nominal_day,display_seq_num)",
            connection,
            transaction
            );
          my_sql_command_1.ExecuteNonQuery();
          using var my_sql_command_2 = new MySqlCommand("select * from this_month_schedule_assignment",connection,transaction);
          (target as BaseDataList).DataSource = my_sql_command_2.ExecuteReader();
          (target as BaseDataList).DataBind();
          ((target as BaseDataList).DataSource as MySqlDataReader).Close();
          //
          using var my_sql_command_3 = new MySqlCommand
            (
            "select count(distinct member_id) as num_members"
            + " , sum(be_selected and medical_release_code_description_map.pecking_order >= 20 and post_id < 200)/2 as num_crew_shifts"
            + common_from_where_clause,
            connection,
            transaction
            );
          using var dr = my_sql_command_3.ExecuteReader();
          dr.Read();
          (num_members = new k.int_nonnegative()).val = int.Parse(dr["num_members"].ToString());
          num_crew_shifts = new k.decimal_nonnegative();
          object num_crew_shifts_obj;
          if ((num_crew_shifts_obj = dr["num_crew_shifts"]) != DBNull.Value)
            {
            (num_crew_shifts = new k.decimal_nonnegative()).val = decimal.Parse(num_crew_shifts_obj.ToString());
            }
          dr.Close();
          //
          using var my_sql_command_4 = new MySqlCommand
            (
            "drop temporary table num_units"
            + " , challenge_analysis"
            + " , this_month_day_schedule_assignment"
            + " , this_month_night_schedule_assignment"
            + " , this_month_day_schedule_assignment_with_dsn"
            + " , this_month_night_schedule_assignment_with_dsn"
            + " , this_month_schedule_assignment",
            connection,
            transaction
            );
          my_sql_command_4.ExecuteNonQuery();
          //
          transaction.Commit();
          be_done = true;
          }
        catch (Exception e)
          {
          transaction.Rollback();
          if (!e.ToString().Contains("Deadlock found when trying to get lock; try restarting transaction"))
            {
            throw;
            }
          }
        }
      Close();
      //
      }

    public void BindBaseDataListByShiftForMaag
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string shift_name,
      string nominal_day_filter,
      object target
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        //
        // Generate the challenge analysis table
        //
        + CommonChallengeAnalysisDropCreateSelectFromClause()
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + CommonChallengeAnalysisWhereClause(relative_month)
        +   " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'"
        +   " and shift.name = '" + shift_name + "'"
        + " group by post_id,post_cardinality"
        + ";"
        //
        // Generate the list of assignments for this shift in the desired order.
        //
        + CommonBindBaseDataListByShiftSelectClause(first_name_clause:"left(first_name,1),lower(right(left(first_name,2),1))")
        + CommonBindBaseDataListByShiftFromWhereOrderByClause
            (
            relative_month:relative_month,
            nominal_day_filter:nominal_day_filter,
            shift_name:shift_name,
            agency_filter:agency_filter,
            depth_filter:"1"
            )
        + ";"
        + " drop temporary table challenge_analysis"
        + ";"
        + " COMMIT",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindBaseDataListByShiftForQuickMessage
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
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        //
        // Generate the challenge analysis table
        //
        + CommonChallengeAnalysisDropCreateSelectFromClause()
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + CommonChallengeAnalysisWhereClause(relative_month)
        +   " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'"
        +   " and shift.name = '" + shift_name + "'"
        + " group by post_id,post_cardinality"
        + ";"
        //
        // Generate the list of assignments for this shift in the desired order.
        //
        + CommonBindBaseDataListByShiftSelectClause(first_name_clause:"first_name")
        + " , be_selected"
        + " , email_address as email_target"
        + " , IFNULL(concat(phone_num,'@',sms_gateway.hostname),'') as sms_target"
        + CommonBindBaseDataListByShiftFromWhereOrderByClause
            (
            relative_month:relative_month,
            nominal_day_filter:nominal_day_filter,
            shift_name:shift_name,
            agency_filter:agency_filter,
            depth_filter:depth_filter,
            release_condition_clause:release_condition_clause
            )
        + ";"
        + " drop temporary table challenge_analysis"
        + ";"
        + " COMMIT",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(nominal_day,'-'),'|',IFNULL(shift_id,'-'),'|',IFNULL(post_id,'-'),'|',IFNULL(post_cardinality,'-'),'|',IFNULL(position_id,'-'),'|',IFNULL(member_id,'-'),'|',IFNULL(be_selected,'-'),'|',IFNULL(comment,'-')) USING utf8) as spec"
        + " FROM schedule_assignment"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    public void BindInsufficientDriversAlertBaseDataList
      (
      string agency_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      var post_filter = (agency_filter.Length > 0 ? " and post_id = '" + agency_filter + "' or agency_satellite_station.agency_id = '" + agency_filter + "'" : k.EMPTY);
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select nominal_day"
        + " , shift.name as shift_name"
        + " , short_designator as post_designator"
        + " , (sum(IF((medical_release_code_description_map.pecking_order > 20) or ((medical_release_code_description_map.pecking_order >= 20) and (not be_driver_qualified)),1,0)) > sum(IF(be_driver_qualified,1,0))) as be_insufficient_drivers"
        + " from schedule_assignment"
        +   " join shift on (shift.id=shift_id)"
        +   " join agency on (agency.id=schedule_assignment.post_id)"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " left join agency_satellite_station on (agency_satellite_station.satellite_station_id=schedule_assignment.post_id)"
        + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +   " and be_selected"
        +   post_filter
        + " group by nominal_day,shift_id,post_id"
        +   " having be_insufficient_drivers",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindMemberScheduleDetailBaseDataList
      (
      string member_id,
      k.subtype<int> relative_month,
      string agency_id,
      object target
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        //
        // The MySQL query order of operations is critical here.  It is typically(?) as follows:
        // 1. FROM clause
        // 2. WHERE clause
        // 3. GROUP BY clause
        // 4. HAVING clause (not involved here)
        // 5. SELECT clause
        // 6. ORDER BY clause
        //
        // But, I have seen cases where steps 5 and 6 above have been swapped.  It's not clear to me if they swapped because of changing data conditions, or because I upgraded to a newer version of MySQL.  If the order-
        // dependent calculations seem to go haywire, it's probably because the order of operations has changed.
        //
        // Also, this query is closely related to the second part of SpreadSelections().
        //
        "select schedule_assignment_id"
        + " , nominal_day"
        + " , shift_name"
        + " , post_id"
        + " , post_designator"
        + " , post_cardinality"
        + " , comment"
        + " , be_selected"
        + " , be_notification_pending"
        + " , on_duty"
        + " , off_duty"
        + " , time_off_before"
        + " , time_off_after"
        + " , shift_population_from_agency"
        + " , shift_population_citywide"
        + " , others_available"
        + " , last_reviser"
        + " , door_code"
        + " from"
        +   " ("
        +   " select schedule_assignment_id"
        +   " , nominal_day"
        +   " , shift_name"
        +   " , post_id"
        +   " , post_designator"
        +   " , post_cardinality"
        +   " , comment"
        +   " , be_selected"
        +   " , be_notification_pending"
        +   " , IF(be_selected,@on_duty_before := on_duty,NULL) as on_duty"
        +   " , IF(be_selected,TIMESTAMPDIFF(HOUR,@off_duty_before,@on_duty_before),TIMESTAMPDIFF(HOUR,@off_duty_before,on_duty)) as time_off_before"
        +   " , IF(be_selected,@off_duty_before := off_duty,NULL) as off_duty"
        +   " , time_off_after"
        +   " , shift_population_from_agency"
        +   " , shift_population_citywide"
        +   " , others_available"
        +   " , last_reviser"
        +   " , door_code"
        +   " from (select @on_duty_before := ADDDATE(LAST_DAY(ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " - 1 MONTH)),INTERVAL '1 6' DAY_HOUR), @off_duty_before := ADDDATE(LAST_DAY(ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " - 1 MONTH)),INTERVAL '1 6' DAY_HOUR)) as dummy,"
        +     " ("
        +     " select * from"  // This wrapper statement, which does nothing but reverse the order of the rows, became necessary after the implicit order of operations changed and screwed up the time-off-after calculations.
        +       " ("
        +       " select schedule_assignment_id"
        +       " , nominal_day"
        +       " , shift_name"
        +       " , post_id"
        +       " , post_designator"
        +       " , post_cardinality"
        +       " , comment"
        +       " , be_selected"
        +       " , be_notification_pending"
        +       " , IF(be_selected,@off_duty_after := off_duty,off_duty) as off_duty"
        +       " , IF(be_selected,-TIMESTAMPDIFF(HOUR,@on_duty_after,@off_duty_after),-TIMESTAMPDIFF(HOUR,@on_duty_after,off_duty)) as time_off_after"
        +       " , IF(be_selected,@on_duty_after := on_duty,on_duty) as on_duty"
        +       " , from_agency as shift_population_from_agency"
        +       " , citywide as shift_population_citywide"
        +       " , others_available"
        +       " , last_reviser"
        +       " , door_code"
        +       " , shift_start"
        +       " from (select @on_duty_after := ADDDATE(LAST_DAY(ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH)),INTERVAL '1 6' DAY_HOUR), @off_duty_after := ADDDATE(LAST_DAY(ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH)),INTERVAL '1 6' DAY_HOUR)) as dummy,"
        +         " ("
        +         " select member_id"
        +         " , schedule_assignment.id as schedule_assignment_id"
        +         " , DATE_FORMAT(nominal_day,'%Y-%m-%d') as nominal_day"
        +         " , shift_id"
        +         " , shift.name as shift_name"
        +         " , shift.start as shift_start"
        +         " , IF(be_selected,post_id,'') as post_id"
        +         " , IF(be_selected,short_designator,'') as post_designator"
        +         " , IF(be_selected," + POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE + ",'') as post_cardinality"
        +         " , comment"
        +         " , DATE_FORMAT(ADDTIME(nominal_day,start),'%Y-%m-%d %H:%i') as on_duty"
        +         " , DATE_FORMAT(IF(start<end,ADDTIME(nominal_day,end),ADDTIME(ADDTIME(nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i') as off_duty"
        +         " , be_selected"
        +         " , be_notification_pending"
        +         " , (select concat('by ',first_name,' ',last_name) from member where id = reviser_member_id) as last_reviser"
        +         " , IF(be_selected,IFNULL(door_code,''),'') as door_code"
        +         " FROM schedule_assignment"
        +           " join shift on (shift.id=schedule_assignment.shift_id)"
        +           " join member on (member.id=schedule_assignment.member_id)"
        +           " join agency on (agency.id=schedule_assignment.post_id)"
        +         " where member_id = '" + member_id + "'"
        +           " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +         " order by nominal_day desc,start desc"
        +         " ) as msd_member_schedule_assignments_sorted_chronologically_backwards"
        +         " left join"
        +           " ("
        +           " select nominal_day"
        +           " , shift_id"
        +           " , sum(member.agency_id = '" + agency_id + "')/2 as from_agency"
        +           " , count(*)/2 as citywide"
        +           " , group_concat(distinct IF(member.agency_id = '" + agency_id + "' and member.id <> '" + member_id + "',concat(first_name,' ',last_name),NULL) order by last_name, first_name separator ', ') as others_available"
        +           " from schedule_assignment"
        +             " join member on (member.id=schedule_assignment.member_id)"
        +             " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +           " where medical_release_code_description_map.pecking_order >= 20"
        +             " and be_selected"
        +             " and post_id < 200" // Only count ground ambulance assignments.
        +             " and (comment is null or comment not rlike '[[:digit:]]-[[:digit:]]')"
        +           " group by nominal_day,shift_id"
        +           " ) msd_shift_populations_on_member_schedule_assignments"
        +             " using (nominal_day,shift_id)"
        +       " ) as msd_calculated_time_off_after_chronologically_backwards"
        +     " order by nominal_day,shift_start"
        +     " ) as msd_calculated_time_off_after"
        +   " ) as msd_calculated_time_off_before",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindMemberScheduleDetailBaseDataListForIcalendar
      (
      string member_id,
      object target
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select sa1.id as schedule_assignment_id"
        + " , name as shift_name"
        + " , DATE_FORMAT(CONVERT_TZ(ADDDATE(nominal_day,INTERVAL HOUR(ADDTIME(start,muster_to_logon_timespan)) HOUR),@@session.time_zone,'+00:00'),'%Y%m%dT%H%i00Z') as logon_time"
        + " , DATE_FORMAT(CONVERT_TZ(ADDDATE(nominal_day,INTERVAL HOUR(ADDTIME(start,muster_to_logoff_timespan)) HOUR),@@session.time_zone,'+00:00'),'%Y%m%dT%H%i00Z') as logoff_time"
        + " , short_designator as post_short_designator"
        + " , CHAR(ASCII('a') + post_cardinality - 1 using ascii) as post_cardinality"
        + " , medium_designator as post_medium_designator"
        + " , long_designator as post_long_designator"
        + " , IFNULL(address,'') as post_address"
        + " , IFNULL(door_code,'') as door_code"
        + " , IFNULL(comment,'') as comment"
        + " , ("
        +   " select group_concat("
        +     " concat("
        +       " IFNULL(concat(keyclick_enumerator,' '),''),"
        +       " description,"
        +       " ' ',"
        +       " first_name,"
        +       " ' ',"
        +       " last_name,"
        +       " IFNULL(concat(' {',sa2.comment,'}'),''),"
        +       " ', ',SPACE(3),"
        +       " IFNULL(IF(email_address = '','',email_address),''),"
        +       " IF(email_address <> '' and phone_num <> '',concat(', ',SPACE(3)),''),"
        +       " IFNULL(IF(phone_num = '','',concat('tel:',SUBSTRING(phone_num,1,3),'-',SUBSTRING(phone_num,4,3),'-',SUBSTRING(phone_num,7))),'')"
        +       " )"
        +     " order by pecking_order desc,equivalent_los_start_date separator ', '"
        +   " )"
        +   " from schedule_assignment sa2"
        +     " join member on (member.id=sa2.member_id)"
        +     " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +     " join agency on (agency.id=member.agency_id)"
        +   " where sa2.nominal_day = sa1.nominal_day"
        +     " and sa2.shift_id = sa1.shift_id"
        +     " and sa2.post_id = sa1.post_id"
        +     " and sa2.post_cardinality = sa1.post_cardinality"
        +     " and be_selected"
        +     " and sa2.member_id <> sa1.member_id"
        +   " )"
        +   " as partner_list"
        + " , IFNULL(CONCAT(first_name,' ',last_name),'') as reviser"
        + " , IFNULL(last_revised,'') as last_revised"
        + " from schedule_assignment sa1"
        +   " join shift on (shift.id=sa1.shift_id)"
        +   " join agency on (agency.id=sa1.post_id)"
        +   " join member reviser on (reviser.id=sa1.reviser_member_id)"
        + " where member_id = '" + member_id + "'"
        +   " and be_selected"
        + " order by logon_time",
        connection
        );
      (target as DataGrid).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindPotentialHelpersBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string schedule_assignment_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        " select concat(object_member.last_name,', ',object_member.first_name) as name"
        + " , agency.short_designator as agency"
        + " , object_medical_release_level.description as medical_release_level"
        + " , IF(object_member.be_driver_qualified,'Yes','No') as be_driver"
        + " , object_member.email_address as email_address"
        + " , object_member.phone_num as phone_num"
        + " , object_member.agency_id = subject_member.agency_id as be_same_agency"
        + " , object_member.email_address as email_target"
        + " , '' as sms_target"
        + " , GROUP_CONCAT(CONCAT(swaportunity_agency.short_designator,CAST(CHAR(ASCII('a') + swaportunity_assignment.post_cardinality - 1) as CHAR),' ',DATE_FORMAT(swaportunity_assignment.nominal_day,'%m/%d'),' ',swaportunity_shift.name) order by swaportunity_assignment.nominal_day,swaportunity_shift.start) as swaportunities"
        + " from schedule_assignment subject_assignment"
        +   " join schedule_assignment object_assignment"
        +   " join member subject_member on (subject_member.id=subject_assignment.member_id)"
        +   " join member object_member on (object_member.id=object_assignment.member_id)"
        +   " join medical_release_code_description_map subject_medical_release_level on (subject_medical_release_level.code=subject_member.medical_release_code)"
        +   " join medical_release_code_description_map object_medical_release_level on (object_medical_release_level.code=object_member.medical_release_code)"
        +   " join agency on (agency.id=object_member.agency_id)"
        +     " left join schedule_assignment swaportunity_assignment on"
        +       " ("
        +         " swaportunity_assignment.member_id = object_member.id"
        +       " and"
        +         " swaportunity_assignment.be_selected"
        +       " and"
        +         " swaportunity_assignment.nominal_day > CURDATE()"
        +       " and"
        +         " ("
        +           " swaportunity_assignment.post_id between 1 and 99"
        +         " or"
        +           " IF(subject_medical_release_level.pecking_order >= 50,swaportunity_assignment.post_id between 301 and 399,FALSE)"
        +         " )"
        +       " and"
        +           " 0"
        +         " ="
        +           " ("
        +           " select count(*)"
        +           " from schedule_assignment"
        +           " where member_id = subject_member.id"
        +             " and nominal_day = swaportunity_assignment.nominal_day"
        +             " and shift_id = swaportunity_assignment.shift_id"
        +             " and be_selected"
        +           " )"
        +       "	)"
        +     " left join agency swaportunity_agency on (swaportunity_agency.id=swaportunity_assignment.post_id)"
        +     " left join shift swaportunity_shift on (swaportunity_shift.id=swaportunity_assignment.shift_id)"
        + " where subject_assignment.id = '" + schedule_assignment_id + "'"
        +   " and object_assignment.nominal_day=subject_assignment.nominal_day"
        +   " and object_assignment.shift_id=subject_assignment.shift_id"
        +   " and not object_assignment.be_selected"
        +   " and not object_member.be_placeholder"
        +   " and IF(subject_medical_release_level.pecking_order >= 20,object_medical_release_level.pecking_order >= 20,object_medical_release_level.pecking_order between 5 and 19)"
        +   " and IF(subject_assignment.post_id between 301 and 399,object_medical_release_level.pecking_order >= 50,TRUE)" // if subject is sched'd for zone, object must be ALS
        + " group by object_member.id"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
      ((target) as DataGrid).DataBind();
      ((target as DataGrid).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindRankedAvailabilitySubmissionCompliance(object target)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select NULL as `rank`"
        + " , concat(medium_designator,' - ',long_designator) as agency"
        + " , value"
        + " from indicator_avail_submission_compliance"
        +   " join agency on (agency.id=indicator_avail_submission_compliance.agency_id)"
        + " where concat(year,'-',LPAD(month,2,'0')) = (select max(concat(year,'-',LPAD(month,2,'0'))) from indicator_avail_submission_compliance)"
        +   " and be_agency_id_applicable = TRUE"
        + " order by value desc",
        connection
        );
      ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
      ((target) as DataGrid).DataBind();
      ((target as DataGrid).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindSubmissionCompliancyBaseDataList
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
      var filter = " where"
      + " ("
      +   " ("
      +     " enrollment_level.description in ('Recruit','Associate','EDP','Regular','Life','Senior','Tenured BLS','Tenured ALS','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
      +   " and"
      +     " if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',1,num_shifts)) > 0"
      +   " )"
      + " or"
      +   " (enrollment_level.description in ('Field staff','College','Atypical','ResDoc','SpecOps','ALS Intern'" + (show_transferring_members ? ",'Transferring'" : k.EMPTY) + "))"
      + " )";
      //
      if (agency_filter.Length > 0)
        {
        filter += " and agency_id = '" + agency_filter + "'";
        }
      //
      if (release_filter == "released")
        {
        filter += " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        filter += " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        filter += " and medical_release_code_description_map.description = 'Student'";
        }
      else if (release_filter == "bls_intern")
        {
        filter += " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      //
      if (compliancy_filter == "0") // holdouts
        {
        filter += " and (enrollment_level.description not in ('Field staff','College','Atypical','ResDoc','SpecOps','ALS Intern'" + (show_transferring_members ? ",'Transferring'" : k.EMPTY) + ")) and (condensed_schedule_assignment.member_id is null)";
        }
      else if (compliancy_filter == "1") // submitters
        {
        filter += " and condensed_schedule_assignment.member_id is not null";
        }
      else if (compliancy_filter == "A") // atypicals
        {
        filter += " and (enrollment_level.description in ('Field staff','College','Atypical','ResDoc','ALS Intern'" + (show_transferring_members ? ",'Transferring'" : k.EMPTY) + ")) and (condensed_schedule_assignment.member_id is null)";
        }
      else if (compliancy_filter == "G") // Guest Providers
        {
        filter = " where enrollment_level.description = 'Guest Provider'";
        }
      else if (compliancy_filter == "S") // field staff
        {
        filter += " and (enrollment_level.description in ('Field staff'))";
        }
      else if (compliancy_filter == "Z") // Observers
        {
        filter = " where enrollment_level.description = 'Observer'";
        }
      //
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select distinct concat(member.last_name,', ',member.first_name) as name"
        + " , member.id as member_id"
        + " , agency.short_designator as agency"
        + " , section_num"
        + " , IF(medical_release_code_description_map.pecking_order >= 20,'YES','no') as be_released"
        + " , medical_release_code_description_map.watchbill_rendition as level"
        + " , ("
        +     " (condensed_schedule_assignment.member_id is not null)"
        +   " or"
        +     " IF(enrollment_level.description not in ('Field staff','College','Atypical','ALS Intern','Guest Provider'" + (show_transferring_members ? ",'Transferring'" : k.EMPTY) + "),FALSE,NULL)"
        +   " ) as be_compliant"
        + " , be_notification_pending"
        + " , member.email_address"
        + " , member.phone_num"
        + " from member"
        +   " join agency on (agency.id=member.agency_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join enrollment_history on"
        +     " ("
        +       " enrollment_history.member_id=member.id"
        +     " and"
        +       " ("
        +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +       " and"
        +         " ("
        +           " (enrollment_history.end_date is null)"
        +         " or"
        +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)))"
        +         " )"
        +       " )"
        +     " )"
        +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
        +   " left join leave_of_absence on"
        +     " ("
        +       " leave_of_absence.member_id=member.id"
        +     " and"
        +       " ("
        +         " (leave_of_absence.start_date is null)"
        +       " or"
        +         " ("
        +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +         " and"
        +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)))"
        +         " )"
        +       " )"
        +     " )"
        +   " left join"
        +     " ("
        +     " select distinct member_id"
        +     " , IF(max(be_notification_pending),'**','') as be_notification_pending"
        +     " from schedule_assignment"
        +     " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +     " group by member_id"
        +     " ) as condensed_schedule_assignment"
        +     " on (condensed_schedule_assignment.member_id=member.id)"
        + filter
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public void BindTimeOffAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and agency_id = '" + agency_filter + "'";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        //
        // Since we are only using selects and temporary tables, do not save this to the db_trail.
        //
        using var my_sql_command_1 = new MySqlCommand
          (
          ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_COMMON_SELECT_FROM_WHERE_CLAUSE
          + " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
          + agency_condition_clause
          + release_condition_clause
          + ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_ORDER_BY_CLAUSE,
          connection,
          transaction
          );
        my_sql_command_1.ExecuteNonQuery();
        using var my_sql_command_2 = new MySqlCommand
          (
          "create temporary table times_off"
          + " select @on_duty := on_duty as on_duty"
          + " , IF(member_id = @member_id,TIMESTAMPDIFF(HOUR,@off_duty,@on_duty),NULL) as time_off"
          + " , IF(member_id = @member_id,@saved_schedule_assignment_id,NULL) as first_schedule_assignment_id"
          + " , @off_duty := off_duty as off_duty"
          + " , @member_id := member_id as member_id"
          + " , be_member_released"
          + " , @saved_schedule_assignment_id := schedule_assignment_id as second_schedule_assignment_id"
          + " from (select @on_duty := '', @off_duty := '', @member_id := '', @saved_schedule_assignment_id := '') as dummy,assignment_start_and_end_datetimes_sorted_by_member_id",
          connection,
          transaction
          );
        my_sql_command_2.ExecuteNonQuery();
        using var my_sql_command_3 = new MySqlCommand
          (
          "select concat(member.first_name,' ',member.last_name) as name"
          + " , times_off.member_id as member_id"
          + " , be_member_released"
          + " , member.agency_id"
          + " , DATE_FORMAT(first_schedule_assignment.nominal_day,'%Y-%m-%d') as first_nominal_day"
          + " , first_shift.name as first_shift_name"
          + " , first_schedule_assignment_id"
          + " , first_schedule_assignment.comment as first_comment"
          + " , time_off"
          + " , DATE_FORMAT(second_schedule_assignment.nominal_day,'%Y-%m-%d') as second_nominal_day"
          + " , second_shift.name as second_shift_name"
          + " , second_schedule_assignment_id"
          + " , second_schedule_assignment.comment as second_comment"
          + " , note"
          + " , medical_release_code_description_map.watchbill_rendition as level"
          + " from times_off"
          +   " join member on (member.id=times_off.member_id)"
          +   " join schedule_assignment as first_schedule_assignment on (first_schedule_assignment.id=times_off.first_schedule_assignment_id)"
          +   " join schedule_assignment as second_schedule_assignment on (second_schedule_assignment.id=times_off.second_schedule_assignment_id)"
          +   " join shift as first_shift on (first_shift.id=first_schedule_assignment.shift_id)"
          +   " join shift as second_shift on (second_shift.id=second_schedule_assignment.shift_id)"
          +   " join avail_sheet on (avail_sheet.odnmid=member.id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where ADDTIME(SUBTIME(first_schedule_assignment.muster_to_logoff_timespan,first_schedule_assignment.muster_to_logon_timespan),SUBTIME(second_schedule_assignment.muster_to_logoff_timespan,second_schedule_assignment.muster_to_logon_timespan)) > '18:00:00'"
          +   " and time_off between 0 and 36"
          +   " and month = '" + DateTime.Now.AddMonths(relative_month.val).ToString("MMM") + "'"
          + " order by time_off,second_schedule_assignment.nominal_day,second_shift.start",
          connection,
          transaction
          );
        (target as BaseDataList).DataSource = my_sql_command_3.ExecuteReader();
        (target as BaseDataList).DataBind();
        ((target as BaseDataList).DataSource as MySqlDataReader).Close();
        using var my_sql_command_4 = new MySqlCommand("drop temporary table assignment_start_and_end_datetimes_sorted_by_member_id,times_off",connection,transaction);
        my_sql_command_4.ExecuteNonQuery();
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      //
      }

    public void BindTimeOnAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and agency_id = '" + agency_filter + "'";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        //
        // Since we are only using selects and temporary tables, do not save this to the db_trail.
        //
        using var my_sql_command_1 = new MySqlCommand
          (
          ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_COMMON_SELECT_FROM_WHERE_CLAUSE
          + " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
          + agency_condition_clause
          + release_condition_clause
          + ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_ORDER_BY_CLAUSE,
          connection,
          transaction
          );
        my_sql_command_1.ExecuteNonQuery();
        //
        using var my_sql_command_2 = new MySqlCommand
          (
          "create temporary table times_on"
          + " select schedule_assignment_id"
          + " , @time_on := IF((member_id = @member_id) and (on_duty = @off_duty),@time_on + TIMESTAMPDIFF(HOUR,on_duty,off_duty),TIMESTAMPDIFF(HOUR,on_duty,off_duty)) as time_on"
          + " , @off_duty := off_duty as off_duty"
          + " , @member_id := member_id as member_id"
          + " from (select @time_on := '', @off_duty := '', @member_id := '') as dummy,assignment_start_and_end_datetimes_sorted_by_member_id"
          + " where post_id <> '450'", // CDO
          connection,
          transaction
          );
        my_sql_command_2.ExecuteNonQuery();
        //
        using var my_sql_command_3 = new MySqlCommand
          (
          "select concat(first_name,' ',last_name) as name"
          + " , times_on.member_id as member_id"
          + " , member.agency_id"
          + " , DATE_FORMAT(nominal_day,'%Y-%m-%d') as nominal_day"
          + " , shift.name as shift_name"
          + " , comment"
          + " , time_on"
          + " , medical_release_code_description_map.watchbill_rendition as level"
          + " from times_on"
          +   " join member on (member.id=times_on.member_id)"
          +   " join schedule_assignment on (schedule_assignment.id=times_on.schedule_assignment_id)"
          +   " join shift on (shift.id=schedule_assignment.shift_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where time_on > 24"
          + " order by schedule_assignment.nominal_day,shift.start",
          connection,
          transaction
          );
        (target as BaseDataList).DataSource = my_sql_command_3.ExecuteReader();
        (target as BaseDataList).DataBind();
        ((target as BaseDataList).DataSource as MySqlDataReader).Close();
        //
        using var my_sql_command_4 = new MySqlCommand("drop temporary table assignment_start_and_end_datetimes_sorted_by_member_id,times_on",connection,transaction);
        my_sql_command_4.ExecuteNonQuery();
        //
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      //
      }

    public void BindTravelGapAlertBaseDataList
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
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and (agency_id = '" + agency_filter + "'" + (post_footprint.Length > 0 ? " or a_from.post_id in (" + post_footprint + ") or a_to.post_id in (" + post_footprint + ")" : k.EMPTY ) + ")";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        var initial_time_window_condition_clause = k.EMPTY;
        var subsequent_time_window_condition_clause = k.EMPTY;
        if (be_lineup)
          {
          subsequent_time_window_condition_clause = " and a_to.on_duty = ADDDATE(CURDATE(),INTERVAL "
          + (db_shifts.BeInDayShift(DateTime.Now.TimeOfDay.Add(new TimeSpan(hours:1,minutes:0,seconds:0))) ? (be_for_muster ? "6" : "18") : (be_for_muster ? "18" : "30")) + " HOUR)";
          }
        else
          {
          initial_time_window_condition_clause = " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))";
          }
        //
        // Since we are only using selects and temporary tables, do not save this to the db_trail.
        //
        using var my_sql_command_1 = new MySqlCommand
          (
          ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_COMMON_SELECT_FROM_WHERE_CLAUSE
          + initial_time_window_condition_clause
          + release_condition_clause
          + ASSIGNMENT_START_AND_END_DATETIMES_SORTED_BY_MEMBER_ID_ORDER_BY_CLAUSE,
          connection,
          transaction
          );
        my_sql_command_1.ExecuteNonQuery();
        //
        // MySQL does not allow joining a temporary table to itself, so make a copy.
        //
        using var my_sql_command_2 = new MySqlCommand
          (
          "create temporary table a_to"
          + " select * from assignment_start_and_end_datetimes_sorted_by_member_id a_from",
          connection,
          transaction
          );
        my_sql_command_2.ExecuteNonQuery();
        //
        // Now perform the SELECT that joins "a_from" to a_to.
        //
        using var my_sql_command_3 = new MySqlCommand
          (
          "select DATE_FORMAT(a_to.on_duty,'%Y-%m-%d') as gap_day"
          + " , DATE_FORMAT(a_to.on_duty,'%H:%i') as gap_time"
          + " , concat(first_name,' ',last_name) as name"
          + " , member.id as member_id"
          + " , member.agency_id"
          + " , post_from.short_designator as post_from"
          + " , a_from.comment as comment_from"
          + " , post_to.short_designator as post_to"
          + " , a_to.comment as comment_to"
          + " , medical_release_code_description_map.watchbill_rendition as level"
          + " from assignment_start_and_end_datetimes_sorted_by_member_id a_from"
          +   " join agency post_from on (post_from.id=a_from.post_id)"
          +   " left join a_to on (a_to.member_id=a_from.member_id and a_to.on_duty=a_from.off_duty and a_to.post_id <> a_from.post_id)"
          +   " left join agency post_to on (post_to.id=a_to.post_id)"
          +   " join member on (member.id=a_from.member_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where a_to.post_id is not null"
          +     agency_condition_clause
          +     subsequent_time_window_condition_clause
          + " order by a_from.off_duty,a_from.post_id",
          connection,
          transaction
          );
        (target as BaseDataList).DataSource = my_sql_command_3.ExecuteReader();
        (target as BaseDataList).DataBind();
        ((target as BaseDataList).DataSource as MySqlDataReader).Close();
        //
        using var my_sql_command_4 = new MySqlCommand("drop temporary table assignment_start_and_end_datetimes_sorted_by_member_id,a_to",connection,transaction);
        my_sql_command_4.ExecuteNonQuery();
        //
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      }

    public void BindUnexpectedSubmissionsAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and agency.id = '" + agency_filter + "'";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "not_released")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      else if (release_filter == "student")
        {
        release_condition_clause = " and medical_release_code_description_map.description in ('Student','Oriented Student')";
        }
      else if (release_filter == "bls_intern")
        {
        release_condition_clause = " and medical_release_code_description_map.description = 'BLS Intern'";
        }
      Open();
      //
      // Since we are only using selects and temporary tables, do not save this to the db_trail.
      //
      using var my_sql_command = new MySqlCommand
        (
        k.EMPTY
        //
        // Select members who submitted despite their status indicating they didn't have to or shouldn't have.
        //
        + " ("
        + " select distinct concat(last_name,', ',first_name) as name"
        + " , last_name"
        + " , first_name"
        + " , member.id as member_id"
        + " , agency.id as target_agency_id" // Because of the way the join is coded below, this is the id of the agency to which the member belongs.
        + " , medical_release_code_description_map.watchbill_rendition as level"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join agency on (agency.id=member.agency_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join enrollment_history on" 
        +     " (" 
        +       " enrollment_history.member_id=member.id" 
        +     " and" 
        +       " (" 
        +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))" 
        +       " and" 
        +         " (" 
        +           " (enrollment_history.end_date is null)" 
        +         " or" 
        +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)))" 
        +         " )" 
        +       " )" 
        +     " )" 
        +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
        +   " left join leave_of_absence on" 
        +     " (" 
        +       " leave_of_absence.member_id=member.id" 
        +     " and " 
        +       " (" 
        +         " (leave_of_absence.start_date is null)" 
        +       " or" 
        +         " (" 
        +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))" 
        +         " and" 
        +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)))" 
        +         " )" 
        +       " )" 
        +     " )" 
        + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))" + agency_condition_clause + release_condition_clause
        +   " and 0 ="
        +     " IFNULL"  // num duties supposed to run
        +       " ("
        +         " if"
        +           " ("
        +             " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH)))"  // on leave
        +           " ,"
        +             " num_obliged_shifts"  // then num duties specified in terms of leave
        +           " ,"
        +             " IFNULL"  // else if applicable...
        +               " ("
        +                 " IF"
        +                   " ("
        +                     " medical_release_code_description_map.description = 'Student'"
        +                   " ,"
        +                     " 1"  // expect 1 even though not strictly required
        +                   " ,"
        +                     " num_shifts"  // num standard obliged duties
        +                   " )"
        +               " ,"
        +                 " 0"  // else (like for Atypical members) num avails submitted
        +               " )"
        +           " )"
        +       " ,"
        +         " 0"
        +       " )"
        +   " and enrollment_level.description not in ('Field staff','Observer','Guest Provider')"
        + " )"
        + " UNION"
        //
        // Select members who belong to one agency but submitted to another, regardless of the member's status.
        //
        + " ("
        + " select distinct concat(member.last_name,', ',member.first_name) as name"
        + " , member.last_name"
        + " , member.first_name"
        + " , member.id as member_id"
        + " , agency.id as target_agency_id" // Because of the way the join is coded below, this is the id of the agency to which the member submitted avails.
        + " , medical_release_code_description_map.watchbill_rendition as level"
        + " from avail_sheet"
        +   " join member on (member.id=avail_sheet.odnmid)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join agency on (agency.oscar_classic_enumerator=avail_sheet.coord_agency)"
        + " where agency.id <> member.agency_id and month = '" + DateTime.Now.AddMonths(relative_month.val).ToString("MMM") + "'" + agency_condition_clause + release_condition_clause
        + " )"
        + " order by last_name,first_name",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      //
      }

    public string CommentOf(object summary)
      {
      return (summary as schedule_assignment_summary).comment;
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from schedule_assignment where id = \"" + id + "\""), connection);
        my_sql_command.ExecuteNonQuery();
        }
      catch(Exception e)
        {
        if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
          {
          result = false;
          }
        else
          {
          throw;
          }
        }
      Close();
      return result;
      }

    public string ForceAvail
      (
      string member_id,
      DateTime nominal_day,
      string shift_name,
      string post_id,
      string reviser_member_id
      )
      {
      var id = k.EMPTY;
      Open();
      var be_done = false;
      while (!be_done)
        {
        try
          {
          using var my_sql_command = new MySqlCommand
            (
            db_trail.Saved
              (
              "insert ignore schedule_assignment set nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'"
              + " , shift_id = (select id from shift where name = '" + shift_name + "')"
              + " , post_id = '" + post_id + "'"
              + " , member_id = '" + member_id + "'"
              + " , be_selected = FALSE"
              + " , be_new = FALSE"
              + " , reviser_member_id = '" + reviser_member_id + "'"
              ),
            connection
            );
            id = (my_sql_command.ExecuteNonQuery() > 0 ? my_sql_command.LastInsertedId.ToString() : k.EMPTY);
          be_done = true;
          }
        catch (Exception e)
          {
          if (!e.ToString().Contains("Deadlock found when trying to get lock; try restarting transaction"))
            {
            throw;
            }
          }
        }
      Close();
      return id;
      }

    public void ForceSelection
      (
      string id,
      bool be_selected,
      string reviser_member_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "update schedule_assignment"
          + " set be_selected = " + be_selected
          + " , be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW()"
          + " , reviser_member_id = '" + reviser_member_id + "'"
          + " where id = '" + id + "'"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
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
      var result = false;
      //
      nominal_day = DateTime.MinValue;
      shift_id = k.EMPTY;
      post_id = k.EMPTY;
      post_cardinality = k.EMPTY;
      position_id = k.EMPTY;
      member_id = k.EMPTY;
      be_selected = false;
      comment = k.EMPTY;
      partner_list = k.EMPTY;
      //
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select *"
        + " , ("
        +   " select group_concat("
        +     " concat("
        +       " IFNULL(concat(keyclick_enumerator,' '),''),"
        +       " description,"
        +       " ' ',"
        +       " first_name,"
        +       " ' ',"
        +       " last_name,"
        +       " IFNULL(concat(' {',sa2.comment,'}'),''),"
        +       " ', ',SPACE(3),"
        +       " IFNULL(IF(email_address = '','',email_address),''),"
        +       " IF(email_address <> '' and phone_num <> '',concat(', ',SPACE(3)),''),"
        +       " IFNULL(IF(phone_num = '','',concat('tel:',SUBSTRING(phone_num,1,3),'-',SUBSTRING(phone_num,4,3),'-',SUBSTRING(phone_num,7))),'')"
        +       " )"
        +     " order by pecking_order desc,equivalent_los_start_date separator ', '"
        +     " )"
        +   " from schedule_assignment sa2"
        +     " join member on (member.id=sa2.member_id)"
        +     " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +     " join agency on (agency.id=member.agency_id)"
        +   " where sa2.nominal_day = sa1.nominal_day"
        +     " and sa2.shift_id = sa1.shift_id"
        +     " and sa2.post_id = sa1.post_id"
        +     " and sa2.post_cardinality = sa1.post_cardinality"
        +     " and be_selected"
        +     " and sa2.member_id <> sa1.member_id"
        +   " )"
        +   " as partner_list"
        + " from schedule_assignment sa1"
        + " where CAST(id AS CHAR) = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        nominal_day = DateTime.Parse(dr["nominal_day"].ToString());
        shift_id = dr["shift_id"].ToString();
        post_id = dr["post_id"].ToString();
        post_cardinality = dr["post_cardinality"].ToString();
        position_id = dr["position_id"].ToString();
        member_id = dr["member_id"].ToString();
        be_selected = (dr["be_selected"].ToString() == "1");
        comment = dr["comment"].ToString();
        partner_list = dr["partner_list"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void GetAgencyFootprintInfo
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      out string posts,
      out string max_post_cardinality
      )
      {
      var agency_filter_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_filter_clause = " and ((post_id = '" + agency_filter + "') or (post_id in (select satellite_station_id from agency_satellite_station where agency_id = '" + agency_filter + "')))";
        }
      var nominal_day_condition_clause = k.EMPTY;
      if (nominal_day_filter.Length > 0)
        {
        nominal_day_condition_clause = " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'";
        }
      Open();
      MySqlDataReader dr = null;
      var num_tries = new k.int_nonnegative();
      using var my_sql_command = new MySqlCommand
        (
        "select GROUP_CONCAT(distinct post_id order by post_id) as posts"
        + " , max(" + POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE + ") as max_post_cardinality"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        + " where be_selected"
        +     agency_filter_clause
        +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +     nominal_day_condition_clause
        + " group by NULL",
        connection
        );
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        posts = dr["posts"].ToString();
        max_post_cardinality = dr["max_post_cardinality"].ToString();
        }
      else
        {
        posts = agency_filter;
        max_post_cardinality = "a";
        }
      dr.Close();
      Close();
      }

    public void GetInfoAboutMemberInMonth
      (
      string member_id,
      k.subtype<int> relative_month,
      ref k.subtype<int> num,
      out DateTime start_of_earliest_unselected,
      out DateTime end_of_latest_unselected
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select count(*) as num"
        + " , IFNULL(min(IF(be_selected,'9999-12-31 23:59:59',DATE_FORMAT(ADDTIME(nominal_day,start),'%Y-%m-%d %H:%i:%s'))),'9999-12-31 23:59:59') as start_of_earliest_unselected"
        + " , IFNULL(max(IF(be_selected,'1000-01-01 00:00:00',DATE_FORMAT(IF(start<end,ADDTIME(nominal_day,end),ADDTIME(ADDTIME(nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i:%s'))),'1000-01-01 00:00:00') as end_of_latest_unselected"
        + " from schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + " where member_id = '" + member_id + "'"
        +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      num.val = int.Parse(dr["num"].ToString());
      start_of_earliest_unselected = DateTime.Parse(dr["start_of_earliest_unselected"].ToString());
      end_of_latest_unselected = DateTime.Parse(dr["end_of_latest_unselected"].ToString());
      Close();
      }

    public void GetMostLikelyForNewEval
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
      most_likely_nominal_day = k.EMPTY;
      most_likely_shift_id = k.EMPTY;
      most_likely_post_id = k.EMPTY;
      most_likely_post_cardinality = k.EMPTY;
      most_likely_time_in = k.EMPTY;
      most_likely_time_out = k.EMPTY;
      most_likely_aic_member_id = k.EMPTY;
      //
      Open();
      using var my_sql_command_1 = new MySqlCommand
        (
        "select DATE_FORMAT(nominal_day,'%Y-%m-%d') as most_likely_nominal_day"
        + " , shift_id as most_likely_shift_id"
        + " , post_id as most_likely_post_id"
        + " , CHAR(ASCII('a') + post_cardinality - 1 using ascii) as most_likely_post_cardinality"
        + " , start as most_likely_start"
        + " , end as most_likely_end"
        + " from schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + " where member_id = '" + user_member_id + "'"
        +   " and be_selected"
        +   " and (@shift_start := DATE_FORMAT(ADDTIME(nominal_day,start),'%Y-%m-%d %H:%i')) < '" + DateTime.Now.ToUniversalTime().AddMinutes(-client_timezone_offset).ToString("yyyy-MM-dd HH:mm") + "'"
        + " order by @shift_start desc"
        + " limit 1",
        connection
        );
      var dr = my_sql_command_1.ExecuteReader();
      if (dr.Read())
        {
        most_likely_nominal_day = dr["most_likely_nominal_day"].ToString();
        most_likely_shift_id = dr["most_likely_shift_id"].ToString();
        most_likely_post_id = dr["most_likely_post_id"].ToString();
        most_likely_post_cardinality = dr["most_likely_post_cardinality"].ToString();
        most_likely_time_in = dr["most_likely_start"].ToString();
        most_likely_time_out = dr["most_likely_end"].ToString();
        dr.Close();
        //
        using var my_sql_command_2 = new MySqlCommand
          (
          "select member_id as most_likely_aic_member_id"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where nominal_day = '" + most_likely_nominal_day + "'"
          +   " and shift_id = '" + most_likely_shift_id + "'"
          +   " and post_id = '" + most_likely_post_id + "'"
          +   " and post_cardinality = ASCII('" + most_likely_post_cardinality + "') - ASCII('a') + 1"
          +   " and be_selected"
          + " order by medical_release_code_description_map.pecking_order desc, member.equivalent_los_start_date"
          + " limit 1",
          connection
          );
        dr = my_sql_command_2.ExecuteReader();
        if (dr.Read())
          {
          most_likely_aic_member_id = dr["most_likely_aic_member_id"].ToString();
          }
        dr.Close();
        }
      Close();
      }

    public bool GetNominalDayShiftNameOfId
      (
      string id,
      out DateTime nominal_day,
      out string shift_name
      )
      {
      nominal_day = DateTime.MinValue;
      shift_name = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select nominal_day,shift.name as shift_name from schedule_assignment join shift on (shift.id=schedule_assignment.shift_id) where CAST(schedule_assignment.id AS CHAR) = '" + id + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        nominal_day = DateTime.Parse(dr["nominal_day"].ToString());
        shift_name = dr["shift_name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string IdOf(object summary)
      {
      return (summary as schedule_assignment_summary).id;
      }

    public void LogAvailabilitySubmissionComplianceData()
      {
      var metric_phrase = k.EMPTY
      + " ("
      +   " 100"
      + " *"
      +   " ("
      +     " sum((enrollment_level.description in ('Field staff','College','Atypical','Transferring')) or (condensed_schedule_assignment.member_id is not null))"
      +   " /"
      +     " count(member.id)"
      +   " )"
      + " )";
      var from_where_phrase = k.EMPTY
      + " from member"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
      +   " join enrollment_history on"
      +     " ("
      +       " enrollment_history.member_id=member.id"
      +     " and"
      +       " ("
      +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))"
      +       " and"
      +         " ("
      +           " (enrollment_history.end_date is null)"
      +         " or"
      +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))"
      +         " )"
      +       " )"
      +     " )"
      +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
      +   " left join leave_of_absence on"
      +     " ("
      +       " leave_of_absence.member_id=member.id"
      +     " and"
      +       " ("
      +         " (leave_of_absence.start_date is null)"
      +       " or"
      +         " ("
      +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))"
      +         " and"
      +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))"
      +         " )"
      +       " )"
      +     " )"
      +   " left join"
      +     " ("
      +     " select distinct member_id"
      +     " from schedule_assignment"
      +     " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL 1 MONTH))"
      +     " ) as condensed_schedule_assignment"
      +     " on (condensed_schedule_assignment.member_id=member.id)"
      +   " join agency on (agency.id=member.agency_id)"
      + " where"
      +   " ("
      +     " ("
      +       " enrollment_level.description in ('Recruit','Associate','EDP','Regular','Life','Senior','Tenured BLS','Tenured ALS','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
      +     " and"
      +       " if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',1,num_shifts)) > 0"
      +     " )"
      +   " or"
      +     " (enrollment_level.description in ('Field staff','College','Atypical','Transferring'))"
      +   " )";
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "START TRANSACTION"
          + ";"
          //
          // Log squad-by-squad indicators.
          //
          + " replace indicator_avail_submission_compliance (year,month,be_agency_id_applicable,agency_id,value)"
          + " select YEAR(CURDATE())"
          + " , MONTH(CURDATE())"
          + " , TRUE"
          + " , agency.id"
          + " , " + metric_phrase
          +   from_where_phrase
          + " group by agency.id"
          + ";"
          //
          // Log citywide indicator.
          //
          + " replace indicator_avail_submission_compliance (year,month,be_agency_id_applicable,agency_id,value)"
          + " select YEAR(CURDATE())"
          + " , MONTH(CURDATE())"
          + " , FALSE"
          + " , 0"
          + " , " + metric_phrase
          +   from_where_phrase
          + ";"
          + " COMMIT"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public void MarkMemberToBeReleased
      (
      string member_id,
      k.subtype<int> relative_month
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "update schedule_assignment"
          + " set comment = IF(comment is null,'TBR',concat('TBR ',comment))"
          + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
          +   " and member_id = '" + member_id + "'"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public void MarkNotificationsMade
      (
      Queue member_id_q,
      k.subtype<int> relative_month
      )
      {
      if (member_id_q.Count > 0)
        {
        var member_id_list = k.EMPTY;
        while (member_id_q.Count > 0)
          {
          member_id_list += member_id_q.Dequeue() + k.COMMA;
          }
        Open();
        using var my_sql_command = new MySqlCommand
          (
          db_trail.Saved
            (
            "update schedule_assignment"
            + " set be_notification_pending = FALSE"
            + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
            +   " and member_id in (" + member_id_list.Trim(new char[] {Convert.ToChar(k.COMMA)}) + ")"
            ),
          connection
          );
        my_sql_command.ExecuteNonQuery();
        Close();
        }
      }

    public void RigForProposalGeneration()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "update schedule_assignment join member on (member.id=schedule_assignment.member_id)"
        + " set be_selected = IF(post_id = agency_id,TRUE,FALSE)"
        + " , be_new = IF(post_id = agency_id,TRUE,FALSE)"
        + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL 1 MONTH))",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public string PostCardinalityOf(object summary)
      {
      return (summary as schedule_assignment_summary).post_cardinality;
      }

    public string PostDesignatorOf(object summary)
      {
      return (summary as schedule_assignment_summary).post_designator;
      }

    public string PostIdOf(object summary)
      {
      return (summary as schedule_assignment_summary).post_id;
      }

    public void Purge()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " delete from schedule_assignment where nominal_day < DATE_FORMAT(SUBDATE(CURDATE(),INTERVAL 37 MONTH),'%Y-%m-01')"
              // It appears that 3 years may be the maximum time allowed for an employee to claim back pay under FLSA.
        + ";"
        + " delete from schedule_assignment where nominal_day < DATE_FORMAT(SUBDATE(CURDATE(),INTERVAL 13 MONTH),'%Y-%m-01') and (select agency_id from member where id = member_id) <> 0"
              // We only need to analyze the last year of a volunteer's activity for peronal property tax relief purposes.
        + ";"
        + "COMMIT",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public Queue SelectedAndNotifiableWithinFutureHoursIdQueue
      (
      uint num_hours_til_window_open,
      uint num_hours_til_window_close
      )
      {
      var selected_and_notifiable_within_future_hours_id_q = new Queue();
      //
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select schedule_assignment.id as schedule_assignment_id"
        + " from schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join agency on (agency.id=member.agency_id)"
        + " where be_selected"
        +   " and ADDDATE(nominal_day,INTERVAL HOUR(start) HOUR) >= ADDDATE(NOW(),INTERVAL " + num_hours_til_window_open + " HOUR)"
        +   " and ADDDATE(nominal_day,INTERVAL HOUR(start) HOUR) <= ADDDATE(NOW(),INTERVAL " + num_hours_til_window_close + " HOUR)"
        +   " and post_id <> 0"
        +   " and post_id not in (" + ConfigurationManager.AppSettings["upcoming_duty_notification_post_id_exclusion_target"] + ")"
        +   " and be_ok_to_send_duty_reminders"
        +   " and email_address is not null",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        selected_and_notifiable_within_future_hours_id_q.Enqueue(dr["schedule_assignment_id"].ToString());
        }
      Close();
      //
      return selected_and_notifiable_within_future_hours_id_q;
      }

    public string MemberAgencyIdOf(object summary)
      {
      return (summary as schedule_assignment_summary).member_agency_id;
      }

    public string MemberIdOf(object summary)
      {
      return (summary as schedule_assignment_summary).member_id;
      }

    public string MemberMedicalReleaseLevelOf(object summary)
      {
      return (summary as schedule_assignment_summary).member_medical_release_level;
      }

    public DateTime NominalDayOf(object summary)
      {
      return (summary as schedule_assignment_summary).nominal_day;
      }

    public k.decimal_nonnegative NumCrewShifts
      (
      string agency_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name
      )
      {
      //
      // The following query is related to the queries in the first part of SpreadSelections().
      //
      var agency_condition_clause = k.EMPTY;
      if (agency_filter.Length > 0)
        {
        agency_condition_clause = " and ((agency_id = '" + agency_filter + "') or (post_id = '" + agency_filter + "') or (post_id in (select satellite_station_id from agency_satellite_station where agency_id = '" + agency_filter + "')))";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select sum(be_selected and medical_release_code_description_map.pecking_order >= 20 and post_id < 200 and (comment is null or comment not rlike '[[:digit:]]-[[:digit:]]'))/2 as num_crew_shifts"
        + " from schedule_assignment"
        +   " join agency on (agency.id=schedule_assignment.post_id)"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        + " where schedule_assignment.trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +   " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'"
        +   " and shift.name = '" + shift_name + "'"
        +     agency_condition_clause,
        connection
        );
      var num_crew_shifts_obj = my_sql_command.ExecuteScalar();
      var num_crew_shifts = new k.decimal_nonnegative();
      if (num_crew_shifts_obj != DBNull.Value)
        {
        (num_crew_shifts = new k.decimal_nonnegative()).val = decimal.Parse(num_crew_shifts_obj.ToString());
        }
      Close();
      return num_crew_shifts;
      //
      }

    public string OverallAvailabilitySubmissionCompliance()
      {
      object overall_availability_submission_compliance_obj;
      var result = k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select FORMAT(value,0)"
        + " from indicator_avail_submission_compliance"
        + " where concat(year,'-',LPAD(month,2,'0')) = (select max(concat(year,'-',LPAD(month,2,'0'))) from indicator_avail_submission_compliance)"
        +   " and not be_agency_id_applicable",
        connection
        );
      overall_availability_submission_compliance_obj = my_sql_command.ExecuteScalar();
      if (overall_availability_submission_compliance_obj != null)
        {
        result = overall_availability_submission_compliance_obj.ToString();
        }
      Close();
      return result;
      }

    public void PendingNotificationTargets
      (
      k.subtype<int> relative_month,
      string publisher_member_id,
      string publisher_member_agency_id,
      bool be_virgin_watchbill,
      ref Queue member_id_q,
      ref Queue other_agency_ids_q
      )
      {
      var liberal_conditions = (be_virgin_watchbill ? k.EMPTY : " or post_id = '" + publisher_member_agency_id + "' or agency_satellite_station.agency_id = '" + publisher_member_agency_id + "' or reviser_member_id = '" + publisher_member_id + "'");
      member_id_q.Clear();
      other_agency_ids_q.Clear();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select member_id"
        + " , group_concat(distinct NULLIF(IFNULL(agency_satellite_station.agency_id,post_id),'" + publisher_member_agency_id + "') separator ',') as other_agencies"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " left join agency_satellite_station on (agency_satellite_station.satellite_station_id=schedule_assignment.post_id)"
        + " where be_notification_pending"
        +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +   " and (member.agency_id = '" + publisher_member_agency_id + "'" + liberal_conditions + " )"
        + " group by member_id",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        member_id_q.Enqueue(dr["member_id"].ToString());
        other_agency_ids_q.Enqueue(dr["other_agencies"].ToString());
        }
      dr.Close();
      Close();
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
      string childless_field_assignments_clause = k.EMPTY
      + "nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'"
      + " , shift_id = NULLIF('" + shift_id + "','')"
      + " , post_id = NULLIF('" + post_id + "','')"
      + " , post_cardinality = NULLIF('" + post_cardinality + "','')"
      + " , position_id = NULLIF('" + position_id + "','')"
      + " , member_id = NULLIF('" + member_id + "','')"
      + " , be_selected = " + be_selected
      + " , comment = NULLIF('" + comment + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert schedule_assignment"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          connection
          );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public bool SetComment
      (
      string id,
      string comment,
      string reviser_member_id
      )
      {
      var hh_range = Regex.Match(comment,HH_RANGE_PATTERN).Value;
      var hhmm_range = Regex.Match(comment,HHMM_RANGE_PATTERN).Value;
      var muster_to_logon_timespan = TimeSpan.Zero;
      var range_part_array = new string[2];
      //
      var be_hhmm_range_present = (hhmm_range.Length > 0);
      var be_hh_range_present = (hh_range.Length > 0);
      //
      range_part_array = (be_hhmm_range_present ? hhmm_range : hh_range).Split(new char[] {Convert.ToChar(k.HYPHEN)});
      //
      var summary = Summary(id);
      //
      var shift_start_time = ShiftStartOf(summary);
      //
      var logon_time_spec = (be_hhmm_range_present ? range_part_array[0].Replace("2400","0000") : (be_hh_range_present ? range_part_array[0].Replace("24","00") + "00" : shift_start_time.ToString("hhmm")));
      var logoff_time_spec = (be_hhmm_range_present ? range_part_array[1].Replace("2400","0000") : (be_hh_range_present ? range_part_array[1].Replace("24","00") + "00" : ShiftEndOf(summary).ToString("hhmm")));
      //
      var muster_to_logon_timespan_raw = new TimeSpan(hours:int.Parse(logon_time_spec.Substring(0,2)),minutes:int.Parse(logon_time_spec.Substring(2,2)),seconds:0) - shift_start_time;
      var muster_to_logoff_timespan_raw = new TimeSpan(hours:int.Parse(logoff_time_spec.Substring(0,2)),minutes:int.Parse(logoff_time_spec.Substring(2,2)),seconds:0) - shift_start_time;
      //
      if (ShiftNameOf(summary) == "NIGHT")
        {
        if (muster_to_logon_timespan_raw >= new TimeSpan(hours:-18,minutes:0,seconds:0) && muster_to_logon_timespan_raw <= new TimeSpan(hours:-12,minutes:0,seconds:0))
          {
          muster_to_logon_timespan = muster_to_logon_timespan_raw.Add(new TimeSpan(hours:24,minutes:0,seconds:0));
          }
        else
          {
          muster_to_logon_timespan = muster_to_logon_timespan_raw;
          }
        }
      else
        {
        muster_to_logon_timespan = (muster_to_logon_timespan_raw >= new TimeSpan(hours:-6,minutes:0,seconds:0) ? muster_to_logon_timespan_raw : muster_to_logon_timespan_raw.Add(new TimeSpan(hours:12,minutes:0,seconds:0)));
        }
      //
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "update schedule_assignment"
          + " set comment = '" + comment + "'"
          + " , be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW()"
          + " , reviser_member_id = '" + reviser_member_id + "'"
          + " , muster_to_logon_timespan = '" +  muster_to_logon_timespan + "'"
          + " , muster_to_logoff_timespan = '" + (muster_to_logoff_timespan_raw >= TimeSpan.Zero ? muster_to_logoff_timespan_raw : muster_to_logoff_timespan_raw.Add(new TimeSpan(hours:24,minutes:0,seconds:0))) + "'"
          + " where id = '" + id + "'"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      //
      return
        !Regex.IsMatch(comment,"[0-9]:[0-9]")
      &&
        (
          !Regex.IsMatch(comment,"[0-9]-[0-9]")
        ||
          (be_hhmm_range_present && !Regex.IsMatch(comment,"[0-9]{5}-") && !Regex.IsMatch(comment,"-[0-9]{5}"))
        ||
          (be_hh_range_present && !Regex.IsMatch(comment,"[0-9]{3}-") && !Regex.IsMatch(comment,"-[0-9]{3}"))
        );
      }

    public void SetPost
      (
      string id,
      string post_id,
      string reviser_member_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved("update schedule_assignment set post_id = '" + post_id + "', be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW(), reviser_member_id = '" + reviser_member_id + "' where id = '" + id + "'"),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public void SetPostCardinality
      (
      string id,
      string post_cardinality,
      string reviser_member_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved("update schedule_assignment set post_cardinality = ASCII('" + post_cardinality + "') - ASCII('a') + 1, be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW(), reviser_member_id = '" + reviser_member_id + "' where id = '" + id + "'"),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public TimeSpan ShiftEndOf(object summary)
      {
      return (summary as schedule_assignment_summary).shift_end;
      }

    public string ShiftNameOf(object summary)
      {
      return (summary as schedule_assignment_summary).shift_name;
      }

    public TimeSpan ShiftStartOf(object summary)
      {
      return (summary as schedule_assignment_summary).shift_start;
      }

    public string SpreadSelections
      (
      bool be_member_released,
      string id_a,
      string id_b,
      string intolerable_gap,
      string reviser_member_id
      )
      {
      var spread_selections = k.EMPTY;
      //
      // The following two queries are related to NumCrewShifts()
      //
      var citywide_population_select_from_where_prefix = k.EMPTY
      + " ("
      + " select sum(s.be_selected and medical_release_code_description_map.pecking_order >= 20 and s.post_id < 200 and (s.comment is null or s.comment not rlike '[[:digit:]]-[[:digit:]]'))/2"
      + " from schedule_assignment t"
      +   " join schedule_assignment s on (s.nominal_day=t.nominal_day and s.shift_id=t.shift_id)"
      +   " join member on (member.id=s.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
      + " where t.id = '";
      var local_population_select_from_where_prefix = k.EMPTY
      + " ("
      + " select sum(s.be_selected and medical_release_code_description_map.pecking_order >= 20 and s.post_id < 200 and (s.comment is null or s.comment not rlike '[[:digit:]]-[[:digit:]]'))/2"
      + " from schedule_assignment t"
      +   " join schedule_assignment s on (s.nominal_day=t.nominal_day and s.shift_id=t.shift_id)"
      +   " join member m on (m.id=s.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=m.medical_release_code)"
      +   " join agency on (agency.id=s.post_id)"
      +   " join member n on (n.id=t.member_id)"
      + " where ((m.agency_id = n.agency_id) or (s.post_id = n.agency_id) or (s.post_id in (select satellite_station_id from agency_satellite_station where agency_id = n.agency_id)))"
      +   " and t.id = '";
      var common_suffix = "'"
      + " )";
      //
      Open();
      var transaction = connection.BeginTransaction();
      //
      using var my_sql_command_1 = new MySqlCommand
        (
        "select"
        + " IF("
        +         citywide_population_select_from_where_prefix + id_a + common_suffix
        +     (be_member_released ? " >" : " <")
        +         citywide_population_select_from_where_prefix + id_b + common_suffix
        +   " ,"
        +     " '" + id_a + "'"
        +   " ,"
        +     " IF("
        +             local_population_select_from_where_prefix + id_a + common_suffix
        +         (be_member_released ? " >" : " <")
        +             local_population_select_from_where_prefix + id_b + common_suffix
        +       " ,"
        +         " '" + id_a + "'"
        +       " ,"
        +         " '" + id_b + "'"
        +       " )"
        +   " )",
        connection,
        transaction
        );
      var primary_selected_assignment_to_swap = my_sql_command_1.ExecuteScalar().ToString();
      var unselected_assignment_to_swap_obj = UnselectedAssignmentToSwapObj(primary_selected_assignment_to_swap,intolerable_gap,be_member_released,transaction);
      if (unselected_assignment_to_swap_obj == null)
        {
        unselected_assignment_to_swap_obj = UnselectedAssignmentToSwapObj((primary_selected_assignment_to_swap == id_a ? id_b : id_a),intolerable_gap,be_member_released,transaction);
        }
      if (unselected_assignment_to_swap_obj != null)
        {
        using var my_sql_command_2 = new MySqlCommand
          (
          db_trail.Saved
            (
            "update schedule_assignment set be_selected = not be_selected"
            + " , be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW()"
            + " , reviser_member_id = '" + reviser_member_id + "'"
            + " where id in ('" + primary_selected_assignment_to_swap + "','" + unselected_assignment_to_swap_obj.ToString() + "')"
            ),
          connection,
          transaction
          );
        my_sql_command_2.ExecuteNonQuery();
        spread_selections = primary_selected_assignment_to_swap;
        }
      transaction.Commit();
      Close();
      return spread_selections;
      }

    public object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT DATE_FORMAT(nominal_day,'%Y-%m-%d') as nominal_day"
        + " , shift_id"
        + " , shift.name as shift_name"
        + " , shift.start as shift_start"
        + " , shift.end as shift_end"
        + " , post_id"
        + " , agency.short_designator as post_designator"
        + " , " + POST_CARDINALITY_NUM_TO_CHAR_CONVERSION_CLAUSE + " as post_cardinality"
        + " , member_id"
        + " , comment"
        + " , last_name"
        + " , first_name"
        + " , cad_num"
        + " , medical_release_code_description_map.watchbill_rendition as medical_release_level"
        + " , member.agency_id as member_agency_id"
        + " , member.phone_num as member_phone_num"
        + " , be_selected"
        + " FROM schedule_assignment"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        +   " join agency on (agency.id=schedule_assignment.post_id)"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        + " where schedule_assignment.id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new schedule_assignment_summary()
        {
        id = id,
        nominal_day = DateTime.Parse(dr["nominal_day"].ToString()),
        shift_id = dr["shift_id"].ToString(),
        shift_name = dr["shift_name"].ToString(),
        shift_start = TimeSpan.Parse(dr["shift_start"].ToString()),
        shift_end = TimeSpan.Parse(dr["shift_end"].ToString()),
        post_id = dr["post_id"].ToString(),
        post_designator = dr["post_designator"].ToString(),
        post_cardinality = dr["post_cardinality"].ToString(),
        member_id = dr["member_id"].ToString(),
        member_last_name = dr["last_name"].ToString(),
        member_first_name = dr["first_name"].ToString(),
        member_cad_num = dr["cad_num"].ToString(),
        member_medical_release_level = dr["medical_release_level"].ToString(),
        member_agency_id = dr["member_agency_id"].ToString(),
        member_phone_num = k.FormatAsNanpPhoneNum(dr["member_phone_num"].ToString()),
        comment = dr["comment"].ToString(),
        be_selected = (dr["be_selected"].ToString() == "1")
        };
      Close();
      return the_summary;
      }

    public void SwapSelectedForMemberNextEarlierUnselected
      (
      string id,
      string reviser_member_id
      )
      {
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand
          (
          "select target.id as id"
          + " FROM"
          +   " ("
          +   " select member_id"
          +   " , DATE_FORMAT(nominal_day,'%Y-%m-%d') as nominal_day"
          +   " , DATE_FORMAT(IF(start<end,ADDTIME(nominal_day,end),ADDTIME(ADDTIME(nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i') as off_duty"
          +   " FROM schedule_assignment"
          +     " join shift on (shift.id=schedule_assignment.shift_id)"
          +   " where schedule_assignment.id = '" + id + "'"
          +   " ) as source"
          +   " join schedule_assignment as target"
          +   " join shift on (shift.id=target.shift_id)"
          + " where target.member_id = source.member_id"
          +   " and target.trigger_managed_year_month = EXTRACT(YEAR_MONTH from source.nominal_day)"
          +   " and DATE_FORMAT(IF(start<end,ADDTIME(target.nominal_day,end),ADDTIME(ADDTIME(target.nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i') < source.off_duty"
          +   " and not target.be_selected"
          + " order by target.nominal_day desc,start desc"
          + " limit 1",
          connection,
          transaction
          );
        var target_id = my_sql_command_1.ExecuteScalar().ToString();
        //
        using var my_sql_command_2 = new MySqlCommand(db_trail.Saved("update schedule_assignment set be_selected = not be_selected, be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW(), reviser_member_id = '" + reviser_member_id + "' where id in ('" + id + "','" + target_id + "')"),connection,transaction)
          ;
        my_sql_command_2.ExecuteNonQuery();
        //
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      }

    public void SwapSelectedForMemberNextLaterUnselected
      (
      string id,
      string reviser_member_id
      )
      {
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand
          (
          "select target.id as id"
          + " FROM"
          +   " ("
          +   " select member_id"
          +   " , DATE_FORMAT(nominal_day,'%Y-%m-%d') as nominal_day"
          +   " , DATE_FORMAT(ADDTIME(nominal_day,start),'%Y-%m-%d %H:%i') as on_duty"
          +   " FROM schedule_assignment"
          +     " join shift on (shift.id=schedule_assignment.shift_id)"
          +   " where schedule_assignment.id = '" + id + "'"
          +   " ) as source"
          +   " join schedule_assignment as target"
          +   " join shift on (shift.id=target.shift_id)"
          + " where target.member_id = source.member_id"
          +   " and target.trigger_managed_year_month = EXTRACT(YEAR_MONTH from source.nominal_day)"
          +   " and DATE_FORMAT(ADDTIME(target.nominal_day,start),'%Y-%m-%d %H:%i') > source.on_duty"
          +   " and not target.be_selected"
          + " order by target.nominal_day,start"
          + " limit 1",
          connection,
          transaction
          );
        var target_id = my_sql_command_1.ExecuteScalar().ToString();
        //
        using var my_sql_command_2 = new MySqlCommand(db_trail.Saved("update schedule_assignment set be_selected = not be_selected, be_notification_pending = ADDTIME(nominal_day,(select start from shift where id = shift_id)) > NOW(), reviser_member_id = '" + reviser_member_id + "' where id in ('" + id + "','" + target_id + "')"),connection,transaction)
          ;
        my_sql_command_2.ExecuteNonQuery();
        //
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      }

      private object UnselectedAssignmentToSwapObj
        (
        string selected_assignment_to_swap,
        string intolerable_gap,
        bool be_member_released,
        MySqlTransaction transaction
        )
        {
        //
        // Spread released members to shifts where they're most needed.  Spread non-released members to shifts where they're most likely to find a host crew.
        //
        var order_by_populations_direction = (be_member_released ? "asc" : "desc");
        //
        using var my_sql_command = new MySqlCommand
          (
          //
          // The MySQL query order of operations is critical here.  It is as follows:
          // 1. FROM clause
          // 2. WHERE clause
          // 3. GROUP BY clause
          // 4. HAVING clause (not involved here)
          // 5. SELECT clause
          // 6. ORDER BY clause
          //
          // Also, this query is closely related to the query in BindMemberScheduleDetailBaseDataList().
          //
          "select schedule_assignment_id"
          + " from"
          + " ("
          + " select schedule_assignment_id"
          + " , nominal_day"
          + " , shift_name"
          + " , post_designator"
          + " , post_cardinality"
          + " , comment"
          + " , be_selected"
          + " , be_notification_pending"
          + " , on_duty"
          + " , off_duty"
          + " , time_off_before"
          + " , time_off_after"
          + " , shift_population_from_agency"
          + " , shift_population_citywide"
          + " , last_reviser"
          + " , door_code"
          + " from"
          + " ("
          + " select schedule_assignment_id"
          + " , nominal_day"
          + " , shift_name"
          + " , post_designator"
          + " , post_cardinality"
          + " , comment"
          + " , be_selected"
          + " , be_notification_pending"
          + " , IF(be_selected,@on_duty_before := on_duty,NULL) as on_duty"
          + " , IF(be_selected,TIMESTAMPDIFF(HOUR,@off_duty_before,@on_duty_before),TIMESTAMPDIFF(HOUR,@off_duty_before,on_duty)) as time_off_before"
          + " , IF(be_selected,@off_duty_before := off_duty,NULL) as off_duty"
          + " , time_off_after"
          + " , shift_population_from_agency"
          + " , shift_population_citywide"
          + " , last_reviser"
          + " , door_code"
          + " from (select @on_duty_before := ADDDATE(LAST_DAY(ADDDATE(nominal_day,INTERVAL -1 MONTH)),INTERVAL '1 6' DAY_HOUR), @off_duty_before := ADDDATE(LAST_DAY(ADDDATE(nominal_day,INTERVAL -1 MONTH)),INTERVAL '1 6' DAY_HOUR) from schedule_assignment where id = '" + selected_assignment_to_swap + "') as dummy,"
          + " ("
          + " select schedule_assignment_id"
          + " , nominal_day"
          + " , shift_name"
          + " , post_designator"
          + " , post_cardinality"
          + " , comment"
          + " , be_selected"
          + " , be_notification_pending"
          + " , IF(be_selected,@off_duty_after := off_duty,off_duty) as off_duty"
          + " , IF(be_selected,-TIMESTAMPDIFF(HOUR,@on_duty_after,@off_duty_after),-TIMESTAMPDIFF(HOUR,@on_duty_after,off_duty)) as time_off_after"
          + " , IF(be_selected,@on_duty_after := on_duty,on_duty) as on_duty"
          + " , from_agency as shift_population_from_agency"
          + " , citywide as shift_population_citywide"
          + " , last_reviser"
          + " , door_code"
          + " from (select @on_duty_after := ADDDATE(LAST_DAY(nominal_day),INTERVAL '1 6' DAY_HOUR), @off_duty_after := ADDDATE(LAST_DAY(nominal_day),INTERVAL '1 6' DAY_HOUR) from schedule_assignment where id = '" + selected_assignment_to_swap + "') as dummy,"
          + " ("
          + " select s.member_id"
          + " , s.id as schedule_assignment_id"
          + " , DATE_FORMAT(s.nominal_day,'%Y-%m-%d') as nominal_day"
          + " , s.shift_id"
          + " , shift.name as shift_name"
          + " , shift.start as shift_start"
          + " , IF(s.be_selected,short_designator,'') as post_designator"
          + " , IF(s.be_selected,CAST(CHAR(ASCII('a') + s.post_cardinality - 1) as CHAR),'') as post_cardinality"
          + " , s.comment"
          + " , DATE_FORMAT(ADDTIME(s.nominal_day,start),'%Y-%m-%d %H:%i') as on_duty"
          + " , DATE_FORMAT(IF(start<end,ADDTIME(s.nominal_day,end),ADDTIME(ADDTIME(s.nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i') as off_duty"
          + " , s.be_selected"
          + " , s.be_notification_pending"
          + " , (select concat('by ',first_name,' ',last_name) from member where id = s.reviser_member_id) as last_reviser"
          + " , IF(s.be_selected,IFNULL(door_code,''),'') as door_code"
          + " FROM schedule_assignment t"
          + " join schedule_assignment s on (s.member_id=t.member_id and s.trigger_managed_year_month = t.trigger_managed_year_month)"
          + " join shift on (shift.id=s.shift_id)"
          + " join member on (member.id=s.member_id)"
          + " join agency on (agency.id=s.post_id)"
          + " where t.id = '" + selected_assignment_to_swap + "'"
          + " order by nominal_day desc,start desc"
          + " ) as msd_member_schedule_assignments_sorted_chronologically_backwards"
          + " left join"
          + " ("
          + " select s.nominal_day"
          + " , s.shift_id"
          + " , sum(m.agency_id = n.agency_id)/2 as from_agency"
          + " , count(*)/2 as citywide"
          + " from schedule_assignment s"
          + " join member m on (m.id=s.member_id)"
          + " join schedule_assignment t on (t.id='" + selected_assignment_to_swap + "')"
          + " join member n on (n.id=t.member_id)"
          + " join medical_release_code_description_map on (medical_release_code_description_map.code=m.medical_release_code)"
          + " where medical_release_code_description_map.pecking_order >= 20"
          + " and s.be_selected"
          + " and s.post_id < 200" // Only count ground ambulance assignments.
          + " group by s.nominal_day,s.shift_id"
          + " ) msd_shift_populations_on_member_schedule_assignments"
          + " using (nominal_day,shift_id)"
          + " order by nominal_day,shift_start"
          + " ) as msd_calculated_time_off_after"
          + " ) as msd_calculated_time_off_before"
          + " ) as member_schedule_detail"
          + " where not be_selected"
          + " and time_off_before > '" + intolerable_gap + "'"
          + " and time_off_after > '" + intolerable_gap + "'"
          + " order by shift_population_citywide " + order_by_populations_direction + ",shift_population_from_agency " + order_by_populations_direction + ",nominal_day,on_duty"
          + " limit 1",
          connection,
          transaction
          );
        return my_sql_command.ExecuteScalar();
        }

    private delegate string Update_Dispositioned(string sql);
    public void Update
      (
      string relative_month,
      bool be_official,
      bool be_ok_to_work_on_next_month_assignments,
      StreamWriter log
      )
      {
      log.WriteLine
        (
        DateTime.Now.ToString("s")
        + " db_schedule_assignments.Update: relative_month = " + relative_month
        + ", be_official = " + be_official.ToString()
        + ", be_ok_to_work_on_next_month_assignments = " + be_ok_to_work_on_next_month_assignments.ToString()
        );
      //
      const string BE_WHOLE_COMMENT_HH_RANGE = "avail_comment.comment rlike '^" + HH_RANGE_PATTERN + "$'";
      const string BE_WHOLE_COMMENT_HHMM_RANGE = "avail_comment.comment rlike '^" + HHMM_RANGE_PATTERN + "$'";
      //
      const string LOGON_TIME = "CAST(IF(" + BE_WHOLE_COMMENT_HHMM_RANGE + ",CONCAT(REPLACE(LEFT(avail_comment.comment,4),'2400','0000'),'00'),IF(" + BE_WHOLE_COMMENT_HH_RANGE + ",CONCAT(REPLACE(LEFT(avail_comment.comment,2),'24','00'),'0000'),shift.start)) AS TIME)";
      //
      const string MUSTER_TO_LOGON_TIMESPAN_RAW = "TIMEDIFF(" + LOGON_TIME + ",shift.start)";
      const string MUSTER_TO_LOGOFF_TIMESPAN_RAW = "TIMEDIFF(CAST(IF(" + BE_WHOLE_COMMENT_HHMM_RANGE + ",CONCAT(REPLACE(RIGHT(avail_comment.comment,4),'2400','0000'),'00'),IF(" + BE_WHOLE_COMMENT_HH_RANGE + ",CONCAT(REPLACE(RIGHT(avail_comment.comment,2),'24','00'),'0000'),shift.end)) AS TIME),shift.start)";
      //
      const string MUSTER_TO_LOGON_TIMESPAN_COOKED_DAY = " IF(CAST(" + MUSTER_TO_LOGON_TIMESPAN_RAW + " AS TIME) >= CAST('-06:00:00' AS TIME)," + MUSTER_TO_LOGON_TIMESPAN_RAW + ",DATE_ADD(" + MUSTER_TO_LOGON_TIMESPAN_RAW + ",INTERVAL 12 HOUR))";
      const string MUSTER_TO_LOGON_TIMESPAN_COOKED_NIGHT = " IF(CAST(" + MUSTER_TO_LOGON_TIMESPAN_RAW + " AS TIME) BETWEEN CAST('-18:00:00' AS TIME) AND CAST('-12:00:00' AS TIME),DATE_ADD(" + MUSTER_TO_LOGON_TIMESPAN_RAW + ",INTERVAL 24 HOUR)," + MUSTER_TO_LOGON_TIMESPAN_RAW + ")";
      const string MUSTER_TO_LOGOFF_TIMESPAN_COOKED = " IF(CAST(" + MUSTER_TO_LOGOFF_TIMESPAN_RAW +  " AS TIME) >= CAST(0 AS TIME)," + MUSTER_TO_LOGOFF_TIMESPAN_RAW +  ",DATE_ADD(" + MUSTER_TO_LOGOFF_TIMESPAN_RAW +  ",INTERVAL 24 HOUR))";
      //
      Update_Dispositioned Dispositioned = delegate (string sql)
        {
        return (be_official ? db_trail.Saved(sql) : sql);
        };
      //
      var convenient_datetime = DateTime.Now.AddMonths(int.Parse(relative_month));
      var month_abbreviation = convenient_datetime.ToString("MMM");
      var month_yyyy_mm = convenient_datetime.ToString("yyyy-MM");
      var trimables = new StringBuilder();
      Open();
      var be_done = false;
      while (!be_done)
        {
        var transaction = connection.BeginTransaction();
        try
          {
          //
          // Load new availabilities from avail_sheet.
          //
          var sql = new StringBuilder();
          for (var i = new k.subtype<int>(0,31); i.val < i.LAST; i.val++)
            {
            sql.Append
              (
              k.EMPTY
              + " insert schedule_assignment (nominal_day,shift_id,post_id,member_id,be_selected,be_new,comment,muster_to_logon_timespan,muster_to_logoff_timespan)"
              + " select str_to_date(concat('" + month_yyyy_mm + "-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
              + " , shift.id as shift_id"
              + " , @post_id := agency.id as post_id"
              + " , odnmid as member_id"
              + " , @be_selected := " + (be_ok_to_work_on_next_month_assignments ? "(@post_id = member.agency_id)" : "false") + " as be_selected"
              + " , @be_selected as be_new"
              + " , @result_comment := IF(@post_id = member.agency_id,comment,IFNULL(concat(comment,'>',agency.short_designator),concat('>',agency.short_designator))) as comment"
              + " , " + MUSTER_TO_LOGON_TIMESPAN_COOKED_DAY + " as muster_to_logon_timespan"
              + " , " + MUSTER_TO_LOGOFF_TIMESPAN_COOKED + "  as muster_to_logoff_timespan"
              + " from (select @post_id := '', @be_selected := TRUE, @result_comment := '') as init, avail_sheet"
              +   " join shift on (shift.name='DAY')"
              +   " join agency on (agency.oscar_classic_enumerator=avail_sheet.coord_agency)"
              +   " join member on (member.id=avail_sheet.odnmid)"
              +   " left join avail_comment on"
              +     " ("
              +       " avail_comment.month=avail_sheet.month"
              +     " and"
              +       " avail_comment.last_name=avail_sheet.last_name"
              +     " and"
              +       " avail_comment.first_name=avail_sheet.first_name"
              +     " and"
              +       " avail_comment.timestamp=avail_sheet.timestamp"
              +     " and"
              +       " avail_comment.coord_agency=avail_sheet.coord_agency"
              +     " and"
              +       " avail_comment.shift_designator='d'"
              +     " and"
              +       " avail_comment.nominal_day_of_month='" + (i.val + 1).ToString() + "'"
              +     " )"
              + " where avail_sheet.month = '" + month_abbreviation + "'"
              +   " and d" + (i.val + 1).ToString() + " = 'AVAILABLE'"
              + " on duplicate key update schedule_assignment.comment = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null,@result_comment,schedule_assignment.comment)"
              +   " , schedule_assignment.muster_to_logon_timespan = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null," + MUSTER_TO_LOGON_TIMESPAN_COOKED_DAY + ",schedule_assignment.muster_to_logon_timespan)"
              +   " , schedule_assignment.muster_to_logoff_timespan = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null," + MUSTER_TO_LOGOFF_TIMESPAN_COOKED + ",schedule_assignment.muster_to_logoff_timespan)"
              + ";"
              + " insert schedule_assignment (nominal_day,shift_id,post_id,member_id,be_selected,be_new,comment,muster_to_logon_timespan,muster_to_logoff_timespan)"
              + " select str_to_date(concat('" + month_yyyy_mm + "-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
              + " , shift.id as shift_id"
              + " , @post_id := agency.id as post_id"
              + " , odnmid as member_id"
              + " , @be_selected := " + (be_ok_to_work_on_next_month_assignments ? "(@post_id = member.agency_id)" : "false") + " as be_selected"
              + " , @be_selected as be_new"
              + " , @result_comment := IF(@post_id = member.agency_id,comment,IFNULL(concat(comment,'>',agency.short_designator),concat('>',agency.short_designator))) as comment"
              + " , " + MUSTER_TO_LOGON_TIMESPAN_COOKED_NIGHT + " as muster_to_logon_timespan"
              + " , " + MUSTER_TO_LOGOFF_TIMESPAN_COOKED + " as muster_to_logoff_timespan"
              + " from (select @post_id := '', @be_selected := TRUE, @result_comment := '') as init, avail_sheet"
              +   " join shift on (shift.name='NIGHT')"
              +   " join agency on (agency.oscar_classic_enumerator=avail_sheet.coord_agency)"
              +   " join member on (member.id=avail_sheet.odnmid)"
              +   " left join avail_comment on"
              +     " ("
              +       " avail_comment.month=avail_sheet.month"
              +     " and"
              +       " avail_comment.last_name=avail_sheet.last_name"
              +     " and"
              +       " avail_comment.first_name=avail_sheet.first_name"
              +     " and"
              +       " avail_comment.timestamp=avail_sheet.timestamp"
              +     " and"
              +       " avail_comment.coord_agency=avail_sheet.coord_agency"
              +     " and"
              +       " avail_comment.shift_designator='n'"
              +     " and"
              +       " avail_comment.nominal_day_of_month='" + (i.val + 1).ToString() + "'"
              +     " )"
              + " where avail_sheet.month = '" + month_abbreviation + "'"
              +   " and n" + (i.val + 1).ToString() + " = 'AVAILABLE'"
              + " on duplicate key update schedule_assignment.comment = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null,@result_comment,schedule_assignment.comment)"
              +   " , schedule_assignment.muster_to_logon_timespan = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null," + MUSTER_TO_LOGON_TIMESPAN_COOKED_NIGHT + ",schedule_assignment.muster_to_logon_timespan)"
              +   " , schedule_assignment.muster_to_logoff_timespan = IF(not schedule_assignment.be_selected and schedule_assignment.comment is null," + MUSTER_TO_LOGOFF_TIMESPAN_COOKED + ",schedule_assignment.muster_to_logoff_timespan)"
              + ";"
              );
            }
          log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will load new availabilities from avail_sheet.");
          using var my_sql_command_1 = new MySqlCommand(Dispositioned(sql.ToString()),connection,transaction);
          my_sql_command_1.ExecuteNonQuery();
          //
          if (be_ok_to_work_on_next_month_assignments)
            {
            //
            // Determine initial shift popularities.  Do not save operations on temporary table to the db_trail.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will determine initial shift popularities.");
            using var my_sql_command_2 = new MySqlCommand
              (
              " create temporary table shift_popularity"
              + " select nominal_day"
              + " , shift_id"
              + " , sum(medical_release_code_description_map.pecking_order >= 20) as num_released_members_available"
              + " , sum(medical_release_code_description_map.pecking_order >= 30) as num_als_members_available"
              + " , sum(be_driver_qualified) as num_driver_members_available"
              + " from schedule_assignment"
              +   " join member on (member.id=schedule_assignment.member_id)"
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              +   " join agency on (agency.id=schedule_assignment.post_id)"
              + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
              +   " and be_ems_post"
              + " group by nominal_day,shift_id"
              + ";"
              + " alter table shift_popularity add primary key (nominal_day,shift_id)" // Believe this causes an *IMPLICIT COMMIT*.
              + " , add key (num_released_members_available desc)",
              connection,
              transaction
              );
            my_sql_command_2.ExecuteNonQuery();
            //----
            //
            // RELEASED MEMBERS
            //
            //----
            //--
            //
            // Factor in member flexibilities and shift popularities.
            //
            //--
            //
            // Determine released member flexibilities.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will determine released member flexibilities.");
            using var my_sql_command_3 = new MySqlCommand
              (
              "select member.id as member_id"
              + " , ("
              +     " count(*)"  // num avails submitted
              +     " -"
              +     " IFNULL"  // num duties supposed to run
              +       " ("
              +         " if"
              +           " ("
              +             " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))"  // on leave
              +           " ,"
              +             " num_obliged_shifts"  // then num duties specified in terms of leave
              +           " ,"
              +             " IFNULL"  // else
              +               " ("
              +                 " num_shifts"  // if applicable, num standard obliged duties
              +               " ,"
              +                 " 0"  // else (like for Atypical members) zero
              +               " )"
              +           " )"
              +         " +"  // plus
              +           " (select IFNULL(min(num_extras),0) from avail_sheet where avail_sheet.odnmid = member.id and EXTRACT(YEAR_MONTH from avail_sheet.expiration) = schedule_assignment.trigger_managed_year_month)"  // num extras member indicated they wanted to run, if any
              +       " ,"
              +         " 0"
              +       " )"
              +   " )"
              +   " as num_excess_avails"
              + " from schedule_assignment"
              +   " join member on (member.id=schedule_assignment.member_id)"
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              +   " join enrollment_history on" 
              +     " (" 
              +       " enrollment_history.member_id=member.id" 
              +     " and" 
              +       " (" 
              +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +       " and" 
              +         " (" 
              +           " (enrollment_history.end_date is null)" 
              +         " or" 
              +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
              +   " left join leave_of_absence on" 
              +     " (" 
              +       " leave_of_absence.member_id=member.id" 
              +     " and " 
              +       " (" 
              +         " (leave_of_absence.start_date is null)" 
              +       " or" 
              +         " (" 
              +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +         " and" 
              +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
              +   " and medical_release_code_description_map.pecking_order >= 20"
              + " group by member.id"
              +   " having num_excess_avails > 0"
              + " order by num_excess_avails desc",
              connection,
              transaction
              );
            var dr = my_sql_command_3.ExecuteReader();
            var member_id_q = new Queue();
            var quantity_of_interest_q = new Queue();
            while (dr.Read())
              {
              member_id_q.Enqueue(dr["member_id"].ToString());
              quantity_of_interest_q.Enqueue(dr["num_excess_avails"].ToString());
              }
            dr.Close();
            //
            // Trim assignments in excess of obligations from most flexible released members that fall on most popular shifts.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will build a trimables list for " + member_id_q.Count + " released members.");
            trimables.Clear();
            while (member_id_q.Count > 0)
              {
              using var my_sql_command_4 = new MySqlCommand
                (
                " select schedule_assignment.id as id"
                + " from schedule_assignment"
                +   " join shift_popularity on (shift_popularity.nominal_day=schedule_assignment.nominal_day and shift_popularity.shift_id=schedule_assignment.shift_id)"
                +   " join shift on (shift.id=schedule_assignment.shift_id)"
                + " where member_id = '" + member_id_q.Dequeue() + "'"
                + " order by num_released_members_available desc, schedule_assignment.nominal_day desc, shift.start desc"
                + " limit " + quantity_of_interest_q.Dequeue(),
                connection,
                transaction
                );
              dr = my_sql_command_4.ExecuteReader();
              while (dr.Read())
                {
                trimables.Append(k.COMMA);
                trimables.Append(dr["id"].ToString());
                }
              dr.Close();
              }
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will" + (trimables.Length > 0 ? k.SPACE : " NOT ") + "trim selections for released members.");
            if (trimables.Length > 0)
              {
              using var my_sql_command_5 = new MySqlCommand(Dispositioned("update schedule_assignment set be_selected = FALSE, reviser_member_id = null where be_new and (id in (" + trimables.Remove(0,1).ToString() + "))"),connection,transaction);
              my_sql_command_5.ExecuteNonQuery();
              }
            //--
            //
            // Factor in need.
            //
            //--
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will factor in need.");
            var swappables = k.EMPTY;
            var done = false;
            while (!done)
              {
              //
              // Determine shift wealth (how many released members are assigned to each shift).
              //
              using var my_sql_command_6 = new MySqlCommand
                (
                "create temporary table shift_population"
                + " select nominal_day"
                + " , shift_id"
                + " , count(*) as num_released_members_assigned"
                + " from schedule_assignment"
                +   " join member on (member.id=schedule_assignment.member_id)"
                +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
                + " where medical_release_code_description_map.pecking_order >= 20"
                +   " and be_selected"
                +   " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
                + " group by nominal_day,shift_id"
                + ";"
                + " create temporary table member_assignment_vs_shift_population"
                + " SELECT member_id"
                + " , schedule_assignment.id as schedule_assignment_id"
                + " , be_selected"
                + " , num_released_members_assigned"
                + " FROM shift_population"
                +   " join schedule_assignment on (schedule_assignment.nominal_day=shift_population.nominal_day and schedule_assignment.shift_id=shift_population.shift_id)"
                +   " join member on (member.id=schedule_assignment.member_id)"
                +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
                + " where be_new"
                +   " and pecking_order >= 20"
                + ";"
                + " create temporary table least_needed"
                + " select member_id,schedule_assignment_id,num_released_members_assigned"
                + " from"
                +   " ("
                +   " SELECT IF(member_id <> @hi_saved_member_id,@hi_rank := 1,@hi_rank := @hi_rank + 1) as `rank`"
                +   " , @hi_saved_member_id := member_id as member_id"
                +   " , schedule_assignment_id"
                +   " , num_released_members_assigned"
                +   " FROM (select @hi_saved_member_id := '', @hi_rank := 0) as dummy, member_assignment_vs_shift_population"
                +   " where be_selected"
                +   " order by member_id,num_released_members_assigned desc"
                +   " ) as high_duty_populations"
                + " where `rank` = 1"
                + ";"
                + " create temporary table most_needed"
                + " select member_id,schedule_assignment_id,num_released_members_assigned"
                + " from"
                +   " ("
                +   " SELECT IF(member_id <> @lo_saved_member_id,@lo_rank := 1,@lo_rank := @lo_rank + 1) as `rank`"
                +   " , @lo_saved_member_id := member_id as member_id"
                +   " , schedule_assignment_id"
                +   " , num_released_members_assigned"
                +   " FROM (select @lo_saved_member_id := '', @lo_rank := 0) as dummy, member_assignment_vs_shift_population"
                +   " where not be_selected"
                +   " order by member_id,num_released_members_assigned asc"
                +   " ) as low_duty_populations"
                + " where `rank` = 1",
                connection,
                transaction
                );
              my_sql_command_6.ExecuteNonQuery();
              //
              using var my_sql_command_7 = new MySqlCommand
                (
                "select least_needed.schedule_assignment_id as least_needed_assignment_id"
                + " , most_needed.schedule_assignment_id as most_needed_assignment_id"
                + " from least_needed join most_needed using (member_id)"
                + " where least_needed.num_released_members_assigned - most_needed.num_released_members_assigned > 1"
                + " limit 1",
                connection,
                transaction
                );
              dr = my_sql_command_7.ExecuteReader();
              if (dr.Read())
                {
                swappables = dr["least_needed_assignment_id"].ToString() + k.COMMA + dr["most_needed_assignment_id"].ToString();
                }
              else
                {
                done = true;
                }
              dr.Close();
              if (!done)
                {
                using var my_sql_command_8 = new MySqlCommand(Dispositioned("update schedule_assignment set be_selected = not be_selected, reviser_member_id = null where be_new and (id in (" + swappables + "))"),connection,transaction);
                my_sql_command_8.ExecuteNonQuery();
                }
              using var my_sql_command_9 = new MySqlCommand("drop temporary table shift_population,member_assignment_vs_shift_population,least_needed,most_needed",connection,transaction);
              my_sql_command_9.ExecuteNonQuery();
              }
            //----
            //
            // NON-RELEASED MEMBERS
            //
            //----
            //
            // Determine flexibilities versus minimum intended assignments for thirds.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will determine flexibilities versus minimum intended assignments for thirds.");
            using var my_sql_command_10 = new MySqlCommand
              (
              "select member.id as member_id"
              + " , ("
              +     " count(*)"
              +     " -"
              +     " IFNULL(if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',1,num_shifts)),0)"
              +   " )"
              +   " as num_excess_avails"
              + " from schedule_assignment"
              +   " join member on (member.id=schedule_assignment.member_id)"
              + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              +   " join avail_sheet on (avail_sheet.odnmid=member.id and EXTRACT(YEAR_MONTH from avail_sheet.expiration)=schedule_assignment.trigger_managed_year_month)"
              +   " join enrollment_history on" 
              +     " (" 
              +       " enrollment_history.member_id=member.id" 
              +     " and" 
              +       " (" 
              +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +       " and" 
              +         " (" 
              +           " (enrollment_history.end_date is null)" 
              +         " or" 
              +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
              +   " left join leave_of_absence on" 
              +     " (" 
              +       " leave_of_absence.member_id=member.id" 
              +     " and " 
              +       " (" 
              +         " (leave_of_absence.start_date is null)" 
              +       " or" 
              +         " (" 
              +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +         " and" 
              +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
              +   " and medical_release_code_description_map.pecking_order < 20"
              + " group by member.id"
              +   " having num_excess_avails > 0"
              + " order by num_excess_avails desc",
              connection,
              transaction
              );
            dr = my_sql_command_10.ExecuteReader();
            member_id_q.Clear();
            quantity_of_interest_q.Clear();
            while (dr.Read())
              {
              member_id_q.Enqueue(dr["member_id"].ToString());
              quantity_of_interest_q.Enqueue(dr["num_excess_avails"].ToString());
              }
            dr.Close();
            //
            // Trim assignments in excess of obligations from most flexible third members that fall on most popular shifts.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will build a trimables list for " + member_id_q.Count + " thirds.");
            trimables.Clear();
            while (member_id_q.Count > 0)
              {
              using var my_sql_command_11 = new MySqlCommand
                (
                " select schedule_assignment.id as id"
                + " from schedule_assignment"
                +   " join shift_popularity on (shift_popularity.nominal_day=schedule_assignment.nominal_day and shift_popularity.shift_id=schedule_assignment.shift_id)"
                +   " join shift on (shift.id=schedule_assignment.shift_id)"
                + " where member_id = '" + member_id_q.Dequeue() + "'"
                + " order by num_released_members_available desc, schedule_assignment.nominal_day desc, shift.start desc"
                + " limit " + quantity_of_interest_q.Dequeue(),
                connection,
                transaction
                );
              dr = my_sql_command_11.ExecuteReader();
              while (dr.Read())
                {
                trimables.Append(k.COMMA);
                trimables.Append(dr["id"].ToString());
                }
              dr.Close();
              }
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will" + (trimables.Length > 0 ? k.SPACE : " NOT ") + "trim selections for thirds.");
            if (trimables.Length > 0)
              {
              using var my_sql_command_12 = new MySqlCommand(Dispositioned("update schedule_assignment set be_selected = FALSE, reviser_member_id = null where be_new and (id in (" + trimables.Remove(0,10).ToString() + "))"),connection,transaction);
              my_sql_command_12.ExecuteNonQuery();
              }
            //
            // Determine which BLS Interns want how many extra assignments.  Students are not allowed to run extras.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will determine which Test Candidates, BLS Interns, and Facilitated Physicians want how many extra assignments.");
            using var my_sql_command_13 = new MySqlCommand
              (
              "select member.id as member_id"
              + " , num_extras"
              + " from schedule_assignment"
              +   " join member on (member.id=schedule_assignment.member_id)"
              + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              +   " join avail_sheet on (avail_sheet.odnmid=member.id and EXTRACT(YEAR_MONTH from avail_sheet.expiration)=schedule_assignment.trigger_managed_year_month)"
              +   " join enrollment_history on" 
              +     " (" 
              +       " enrollment_history.member_id=member.id" 
              +     " and" 
              +       " (" 
              +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +       " and" 
              +         " (" 
              +           " (enrollment_history.end_date is null)" 
              +         " or" 
              +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
              +   " left join leave_of_absence on" 
              +     " (" 
              +       " leave_of_absence.member_id=member.id" 
              +     " and " 
              +       " (" 
              +         " (leave_of_absence.start_date is null)" 
              +       " or" 
              +         " (" 
              +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +         " and" 
              +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
              +         " )" 
              +       " )" 
              +     " )" 
              + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
              +   " and medical_release_code_description_map.description in ('Test Candidate','BLS Intern','Facilitated Physician')"
              + " group by member.id"
              +   " having num_extras > 0"
              + " order by num_extras",
              connection,
              transaction
              );
            dr = my_sql_command_13.ExecuteReader();
            member_id_q.Clear();
            quantity_of_interest_q.Clear();
            while (dr.Read())
              {
              member_id_q.Enqueue(dr["member_id"].ToString());
              quantity_of_interest_q.Enqueue(dr["num_extras"].ToString());
              }
            dr.Close();
            //
            // Give extra assignments to interested thirds where possible
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will give extra assignments to interested thirds where possible.");
            var member_id = k.EMPTY;
            var num_extras = 0;
            while (member_id_q.Count > 0)
              {
              member_id = member_id_q.Dequeue().ToString();
              num_extras = int.Parse(quantity_of_interest_q.Dequeue().ToString());
              using var my_sql_command_14 = new MySqlCommand
                (
                "select id"
                + " from schedule_assignment as x"
                +   " join"
                +     " ("
                +     " SELECT nominal_day"
                +      " , shift_id"
                +      " , (sum(medical_release_code_description_map.pecking_order >= 20)/2 - sum(medical_release_code_description_map.pecking_order < 20))"
                +        " as num_openings"
                +     " FROM schedule_assignment"
                +       " join member on (member.id=schedule_assignment.member_id)"
                +       " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
                +     " where be_selected"
                +       " and trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month + " MONTH))"
                +     " group by nominal_day,shift_id"
                +       " having (sum(medical_release_code_description_map.pecking_order >= 20)/2 - sum(medical_release_code_description_map.pecking_order < 20)) > 0"
                +     " )"
                +     " as y on (y.nominal_day=x.nominal_day and y.shift_id=x.shift_id)"
                + " where x.member_id = '" + member_id + "'"
                +   " and not x.be_selected"
                + " order by y.num_openings desc"
                + " limit 1",
                connection,
                transaction
                );
              var selectable_id_obj = my_sql_command_14.ExecuteScalar();
              if (selectable_id_obj != null)
                {
                using var my_sql_command_15 = new MySqlCommand(Dispositioned("update schedule_assignment set be_selected = TRUE, reviser_member_id = null where be_new and id = '" + selectable_id_obj.ToString() + "'"),connection,transaction);
                my_sql_command_15.ExecuteNonQuery();
                if (num_extras > 1)
                  {
                  member_id_q.Enqueue(member_id);
                  quantity_of_interest_q.Enqueue(num_extras - 1);
                  }
                }
              }
            //
            // Mark all current assignments hands off for this routine, and clean up.
            //
            log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will mark all current assignments hands off for this routine, and clean up.");
            using var my_sql_command_16 = new MySqlCommand
              (
              Dispositioned("update schedule_assignment set be_new = FALSE")
              + ";"
              + " drop temporary table shift_popularity",
              connection,
              transaction
              );
            my_sql_command_16.ExecuteNonQuery();
            }
          log.WriteLine(DateTime.Now.ToString("s") + " db_schedule_assignments.Update: Transaction will COMMIT.");
          transaction.Commit();
          be_done = true;
          }
        catch (Exception e)
          {
          log.WriteLine(DateTime.Now.ToString("s") + " ***db_schedule_assignments.Update: Transaction will ROLLBACK DUE TO EXCEPTION.");
          transaction.Rollback();
          if (e.ToString().Contains("Deadlock found when trying to get lock; try restarting transaction"))
            {
            using var my_sql_command_17 = new MySqlCommand("drop temporary table if exists shift_popularity",connection);
            my_sql_command_17.ExecuteNonQuery();
            }
          else
            {
            throw;
            }
          }
        }
      Close();
      }

    } // end TClass_db_schedule_assignments

  }
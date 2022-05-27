// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_biz_members;
using Class_biz_user;
using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_schedule_assignment_logs
  {
  public class TClass_db_schedule_assignment_logs: TClass_db
    {
    private class schedule_assignment_log_summary
      {
      public string id;
      }

    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_user  biz_user = null;
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_schedule_assignment_logs() : base()
      {
      biz_members = new TClass_biz_members();
      biz_user = new TClass_biz_user();
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(assignment_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(action,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from schedule_assignment_log"
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

    internal void BindBaseDataList
      (
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name,
      object target,
      string days_old
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT DATE_FORMAT(timestamp,'%Y-%m-%d %H:%i:%s') as at"
        + " , concat(actor.first_name,' ',actor.last_name) as scheduler"
        + " , action"
        + " , concat('(',IF(provider.cad_num between 'A' and 'Z' and provider.medical_release_code = '1','o',medical_release_code_description_map.watchbill_rendition),') ',provider.first_name,' ',provider.last_name) as provider"
        + " , " + (shift_name.Length > 0 ? "''" : "shift.name") + " as shift"
        + " FROM schedule_assignment_log"
        +   " join schedule_assignment on (schedule_assignment.id=schedule_assignment_log.assignment_id)"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        +   " join member actor on (actor.id=schedule_assignment_log.actor_member_id)"
        +   " join member provider on (provider.id=schedule_assignment.member_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=provider.medical_release_code)"
        + " where schedule_assignment.trigger_managed_year_month = EXTRACT(YEAR_MONTH from ADDDATE(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        +   " and DAY(schedule_assignment.nominal_day) = '" + nominal_day_filter + "'"
        +   (shift_name.Length > 0 ? " and shift.name = '" + shift_name + "'" : k.EMPTY)
        +   " and timestamp > DATE_SUB(CURDATE(),INTERVAL " + days_old + " DAY)"
        + " order by timestamp",
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void LogMetric
      (
      string agency_id,
      k.int_nonnegative num_released_core_ops_tapouts
      )
      {
      var be_agency_id_applicable = (agency_id.Length > 0);
      Open();
      using var my_sql_command_1 = new MySqlCommand
        (
        " select value"
        + " from indicator_crew_shifts_forecast"
        + " where year = YEAR(CURDATE())"
        +   " and month = MONTH(CURDATE())"
        +   " and" + (be_agency_id_applicable ? k.EMPTY : " not") + " be_agency_id_applicable"
        +   " and agency_id = '" + agency_id + "'",
        connection
        );
      var forecast_slots = 2*Decimal.Parse(my_sql_command_1.ExecuteScalar().ToString());
      //
      using var my_sql_command_2 = new MySqlCommand
        (
        db_trail.Saved
          (
          "replace indicator_scheduled_duty_compliance"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = " + be_agency_id_applicable.ToString()
          + " , agency_id = '" + (be_agency_id_applicable ? agency_id : "0") + "'"
          + " , value = IFNULL(100.0*(" + forecast_slots.ToString() + " - " + num_released_core_ops_tapouts.val.ToString() + ")/" + forecast_slots.ToString() + ",0)"
          ),
        connection
        );
      my_sql_command_2.ExecuteNonQuery();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(assignment_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(action,'-')) USING utf8) as spec"
        + " FROM schedule_assignment_log"
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

    internal void BindEndOfMonthTapoutReportBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter
      )
      {
      BindEndOfPeriodTapoutReportBaseDataList
        (
        sort_order:sort_order,
        be_sort_order_ascending:be_sort_order_ascending,
        target:target,
        agency_filter:agency_filter,
        period_condition:"(trigger_managed_year_month = EXTRACT(YEAR_MONTH from CURDATE()))"
        );
      }

    private void BindEndOfPeriodTapoutReportBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string period_condition
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT sal_last.id as id"
        + " , short_designator as agency"
        + " , provider.id as provider_id"
        + " , concat(provider.first_name,' ',provider.last_name,' (',provider.cad_num,')') as provider"
        + " , DATE_FORMAT(ADDTIME(ADDTIME(schedule_assignment.nominal_day,shift.start),muster_to_logon_timespan),'%Y-%m-%d %H:%i') as expected_start"
        + " , comment"
        + " , IF(TIMEDIFF(ADDTIME(ADDTIME(schedule_assignment.nominal_day,shift.start),muster_to_logon_timespan),sal_last.timestamp) > 0,"
        +       " TIME_FORMAT(TIMEDIFF(ADDTIME(ADDTIME(schedule_assignment.nominal_day,shift.start),muster_to_logon_timespan),sal_last.timestamp),'%k') + 1,"
        +       " 'NONE'"
		    +       " ) as hours_warning"
        + " , actor.id as actor_id"
        + " , concat(actor.first_name,' ',actor.last_name) as actor"
        + " , DATE_FORMAT(sal_last.timestamp,'%Y-%m-%d %H:%i') as actor_timestamp"
        + " FROM schedule_assignment_log sal_last"
        +   " left join schedule_assignment_log sal_any on (sal_any.action like 'forced %' and sal_last.action like 'forced %' and sal_any.assignment_id=sal_last.assignment_id and sal_any.id<sal_last.id)"
        +   " join schedule_assignment on (schedule_assignment.id=sal_last.assignment_id)"
        +   " join member provider on (provider.id=schedule_assignment.member_id)"
        +   " join agency on (agency.id=provider.agency_id)"
        +   " join shift on (shift.id=schedule_assignment.shift_id)"
        +   " join member actor on (actor.id=sal_last.actor_member_id)"
        + " where " + period_condition
        +   " and sal_any.id is null"
        +   " and sal_last.action = 'forced OFF'"
        +   " and DATEDIFF(ADDTIME(schedule_assignment.nominal_day,shift.start),sal_last.timestamp) <= 3"
        +   " and comment not like '%CVD%'"
        +   " and comment not like '%cvr%'"
        +   " and comment not like '%swap%'"
        +   " and comment not like '%switch%'"
        +   " and comment not like '%covered%'"
        +   (agency_filter.Length > 0 ? " and provider.agency_id = '" + agency_filter + "'" : k.EMPTY)
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void BindEndOfWeekTapoutReportBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter
      )
      {
      BindEndOfPeriodTapoutReportBaseDataList
        (
        sort_order:sort_order,
        be_sort_order_ascending:be_sort_order_ascending,
        target:target,
        agency_filter:agency_filter,
        period_condition:"nominal_day between SUBDATE(CURDATE(),INTERVAL 6 DAY) and CURDATE()"
        );
      }

    internal void BindRankedScheduledDutyCompliance(object target)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select NULL as `rank`"
        + " , concat(medium_designator,' - ',long_designator) as agency"
        + " , value"
        + " from indicator_scheduled_duty_compliance"
        +   " join agency on (agency.id=indicator_scheduled_duty_compliance.agency_id)"
        + " where year = YEAR(SUBDATE(CURDATE(),INTERVAL 1 MONTH))"
        +   " and month = MONTH(SUBDATE(CURDATE(),INTERVAL 1 MONTH))"
        +   " and agency_id <> 0"
        +   " and be_agency_id_applicable = TRUE"
        + " order by value desc",
        connection
        );
      ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from schedule_assignment_log where id = '" + id + "'"), connection);
        my_sql_command.ExecuteNonQuery();
        }
      catch(System.Exception e)
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

    internal void Enter
      (
      string assignment_id,
      string action
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert schedule_assignment_log"
          + " set assignment_id = NULLIF('" + assignment_id + "','')"
          + " , actor_member_id = NULLIF('" + biz_members.IdOfUserId(biz_user.IdNum()) + "','')"
          + " , action = NULLIF('" + action + "','')"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public bool Get
      (
      string id,
      out string assignment_id,
      out string timestamp,
      out string actor_member_id,
      out string action
      )
      {
      assignment_id = k.EMPTY;
      timestamp = k.EMPTY;
      actor_member_id = k.EMPTY;
      action = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from schedule_assignment_log where CAST(id AS CHAR) = '" + id + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        assignment_id = dr["assignment_id"].ToString();
        timestamp = dr["timestamp"].ToString();
        actor_member_id = dr["actor_member_id"].ToString();
        action = dr["action"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string OverallScheduledDutyCompliance()
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select FORMAT(value,0) from indicator_scheduled_duty_compliance where year = YEAR(SUBDATE(CURDATE(),INTERVAL 1 MONTH)) and month = MONTH(SUBDATE(CURDATE(),INTERVAL 1 MONTH)) and not be_agency_id_applicable",
        connection
        );
      var overall_scheduled_duty_compliance_obj = my_sql_command.ExecuteScalar();
      Close();
      return (overall_scheduled_duty_compliance_obj == null ? k.EMPTY : overall_scheduled_duty_compliance_obj.ToString());
      }

    public void Set
      (
      string id,
      string assignment_id,
      string timestamp,
      string actor_member_id,
      string action
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "assignment_id = NULLIF('" + assignment_id.ToString() + "','')"
      + " , timestamp = NULLIF('" + timestamp + "','')"
      + " , actor_member_id = NULLIF('" + actor_member_id + "','')"
      + " , action = NULLIF('" + action + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"schedule_assignment_log",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM schedule_assignment_log"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new schedule_assignment_log_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_schedule_assignment_logs

  }

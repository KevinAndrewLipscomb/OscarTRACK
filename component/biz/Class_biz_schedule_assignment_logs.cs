// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_schedule_assignment_logs;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_schedule_assignment_logs
  {
  public class TClass_biz_schedule_assignment_logs
    {
    private TClass_db_schedule_assignment_logs db_schedule_assignment_logs = null;

    public TClass_biz_schedule_assignment_logs() : base()
      {
      db_schedule_assignment_logs = new TClass_db_schedule_assignment_logs();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_schedule_assignment_logs.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name,
      object target,
      string days_old
      )
      {
      db_schedule_assignment_logs.BindBaseDataList(relative_month,nominal_day_filter,shift_name,target,days_old);
      }

    public void BindDirectToListControl(object target)
      {
      db_schedule_assignment_logs.BindDirectToListControl(target);
      }

    internal void BindEndOfMonthTapoutReportBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter
      )
      {
      db_schedule_assignment_logs.BindEndOfMonthTapoutReportBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter);
      }

    internal void BindEndOfWeekTapoutReportBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter
      )
      {
      db_schedule_assignment_logs.BindEndOfWeekTapoutReportBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter);
      }

    internal void BindRankedScheduledDutyCompliance(object target)
      {
      db_schedule_assignment_logs.BindRankedScheduledDutyCompliance(target);
      }

    public bool Delete(string id)
      {
      return db_schedule_assignment_logs.Delete(id);
      }

    internal void Enter
      (
      string assignment_id,
      string action
      )
      {
      db_schedule_assignment_logs.Enter(assignment_id,action);
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
      return db_schedule_assignment_logs.Get
        (
        id,
        out assignment_id,
        out timestamp,
        out actor_member_id,
        out action
        );
      }

    internal void LogMetric
      (
      string agency_id,
      k.int_nonnegative num_released_core_ops_tapouts
      )
      {
      db_schedule_assignment_logs.LogMetric(agency_id,num_released_core_ops_tapouts);
      }

    internal string OverallScheduledDutyCompliance()
      {
      return db_schedule_assignment_logs.OverallScheduledDutyCompliance();
      }

    internal void PublishEndOfMonthTapOutReport(string working_directory)
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
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R01\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R02\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R04\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R05\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R06\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R09\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R13\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R14\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R16\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=R17\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx?agency=EMS\""
          ,
            "--output-document=/dev/null --no-check-certificate"
            + k.SPACE
            + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_end_of_month_tapouts.aspx\""
          },
        working_directory,
        out stdout,
        out stderr
        );
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
      db_schedule_assignment_logs.Set
        (
        id,
        assignment_id,
        timestamp,
        actor_member_id,
        action
        );
      }

    internal object Summary(string id)
      {
      return db_schedule_assignment_logs.Summary(id);
      }

    } // end TClass_biz_schedule_assignment_logs

  }

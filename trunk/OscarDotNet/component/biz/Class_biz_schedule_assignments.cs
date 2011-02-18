// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_schedule_assignments;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_biz_schedule_assignments
  {
  public class TClass_biz_schedule_assignments
    {

    public const int MAX_PER_MONTH = 62;

    private TClass_db_schedule_assignments db_schedule_assignments = null;

    public TClass_biz_schedule_assignments() : base()
      {
      db_schedule_assignments = new TClass_db_schedule_assignments();
      }

    internal bool BeOkToWorkOnNextMonth()
      {
      return (DateTime.Now.Day > uint.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"]));
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_schedule_assignments.Bind(partial_spec, target);
      }

    internal void BindBaseDataList
      (
      string agency_filter,
      string release_filter,
      string depth_filter,
      k.subtype<int> relative_month,
      object target,
      ref k.int_nonnegative num_members,
      ref k.decimal_nonnegative num_crew_shifts
      )
      {
      db_schedule_assignments.BindBaseDataList(agency_filter,release_filter,depth_filter,relative_month,target,ref num_members,ref num_crew_shifts);
      }

    public void BindDirectToListControl(object target)
      {
      db_schedule_assignments.BindDirectToListControl(target);
      }

    internal void BindPostCardinalityListControl
      (
      DropDownList target,
      string designator
      )
      {
      for (var i = new k.subtype<int>(0,int.Parse(ConfigurationManager.AppSettings["max_num_units_per_post"])); i.val < i.LAST; i.val++)
        {
        target.Items.Add(new ListItem(Convert.ToString(Convert.ToChar(Convert.ToInt16('a') + i.val)),Convert.ToString(Convert.ToChar(Convert.ToInt16('a') + i.val))));
        }
      target.SelectedValue = designator;
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

    internal void BindSubmissionCompliancyBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      string compliancy_filter
      )
      {
      db_schedule_assignments.BindSubmissionCompliancyBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,release_filter,relative_month,compliancy_filter);
      }

    internal void BindTimeOffAlertInvestigationBaseDataList
      (
      string member_id,
      k.subtype<int> relative_month,
      string agency_id,
      object target
      )
      {
      db_schedule_assignments.BindTimeOffAlertInvestigationBaseDataList(member_id,relative_month,agency_id,target);
      }

    public bool Delete(string id)
      {
      return db_schedule_assignments.Delete(id);
      }

    internal void ForceAvail
      (
      string member_id,
      DateTime nominal_day,
      string shift_name,
      string agency_id
      )
      {
      db_schedule_assignments.ForceAvail(member_id,nominal_day,shift_name,agency_id);
      }

    internal void ForceSelection
      (
      string id,
      bool be_selected
      )
      {
      db_schedule_assignments.ForceSelection(id,be_selected);
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
      out string comment
      )
      {
      return db_schedule_assignments.Get
        (
        id,
        out nominal_day,
        out shift_id,
        out post_id,
        out post_cardinality,
        out position_id,
        out member_id,
        out be_selected,
        out comment
        );
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

    internal void SetComment
      (
      string id,
      string comment
      )
      {
      db_schedule_assignments.SetComment(id,comment);
      }

    internal void SetPost
      (
      string id,
      string post_id
      )
      {
      db_schedule_assignments.SetPost(id,post_id);
      }

    internal void SetPostCardinality
      (
      string id,
      string post_cardinality
      )
      {
      db_schedule_assignments.SetPostCardinality(id,post_cardinality);
      }

    internal void SwapSelectedForMemberNextEarlierUnselected(string id)
      {
      db_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(id);
      }

    internal void SwapSelectedForMemberNextLaterUnselected(string id)
      {
      db_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(id);
      }

    internal void Update(string relative_month)
      {
      db_schedule_assignments.Update(relative_month,(relative_month == "0") || BeOkToWorkOnNextMonth());
      }

    } // end TClass_biz_schedule_assignments

  }

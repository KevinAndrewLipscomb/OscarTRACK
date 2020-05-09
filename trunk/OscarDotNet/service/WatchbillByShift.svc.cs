using Class_biz_schedule_assignments;
using Class_biz_shifts;
using Class_db_schedule_assignments;
using kix;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "FleetStatus" in code, svc and config file together.
  // NOTE: In order to launch WCF Test Client for testing this service, please select FleetStatus.svc or FleetStatus.svc.cs at the Solution Explorer and start debugging.
  public class WatchbillByShift : IWatchbillByShift
    {
    public List<schedule_assignment_summary> Assignments
      (
      string agency_filter,
      string relative_month_val,
      string shift_name,
      string nominal_day_filter,
      string depth_filter
      )
      {
      agency_filter = k.Safe(agency_filter ?? k.EMPTY,k.safe_hint_type.NUM);
      relative_month_val = k.Safe(relative_month_val ?? "0",k.safe_hint_type.NUM);
      shift_name = k.Safe(shift_name ?? (new TClass_biz_shifts().BeInDayShift(DateTime.Now.TimeOfDay) ? "DAY" : "NIGHT"),k.safe_hint_type.HYPHENATED_ALPHANUM_WORDS);
      nominal_day_filter = k.Safe(nominal_day_filter ?? (relative_month_val == "0" ? DateTime.Today.Day.ToString() : "1"),k.safe_hint_type.NUM);
      depth_filter = k.Safe(depth_filter ?? "1",k.safe_hint_type.NUM);
      //
      var the_items = new List<schedule_assignment_summary>();
      var biz_schedule_assignments = new TClass_biz_schedule_assignments();
      using var target = new DataGrid();
      biz_schedule_assignments.BindBaseDataListByShiftForQuickMessage
        (
        agency_filter:agency_filter,
        relative_month:new k.subtype<int>(0,1){val = int.Parse(relative_month_val)},
        shift_name:shift_name,
        nominal_day_filter:nominal_day_filter,
        depth_filter:depth_filter,
        target:target
        );
      foreach (DataGridItem item in target.Items)
        {
        the_items.Add(biz_schedule_assignments.Summary(item.Cells[0].Text) as schedule_assignment_summary); // Cells[0] is the index of schedule_assignment_id in the raw SQL statement in TClass_db_schedule_assignments.BindBaseDataList.
        }
      return the_items;
      }
    }
  }

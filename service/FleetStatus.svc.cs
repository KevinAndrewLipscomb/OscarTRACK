using Class_biz_vehicles;
using Class_db_vehicles;
using kix;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "FleetStatus" in code, svc and config file together.
  // NOTE: In order to launch WCF Test Client for testing this service, please select FleetStatus.svc or FleetStatus.svc.cs at the Solution Explorer and start debugging.
  public class FleetStatus : IFleetStatus
    {
    public List<vehicle_summary> Items
      (
      string sort_order,
      bool be_sort_order_ascending,
      string agency_filter,
      string vehicle_kind_filter,
      bool be_four_or_all_wheel_drive_filter,
      string quarters_filter,
      bool can_receive_legacy_cot_fastener_filter = false
      )
      {
      sort_order = k.Safe(sort_order ?? k.EMPTY,k.safe_hint_type.KI_SORT_EXPRESSION);
      agency_filter = k.Safe(agency_filter ?? k.EMPTY,k.safe_hint_type.NUM);
      vehicle_kind_filter = k.Safe(vehicle_kind_filter ?? k.EMPTY,k.safe_hint_type.NUM);
      quarters_filter = k.Safe(quarters_filter ?? k.EMPTY,k.safe_hint_type.NUM);
      //
      var the_items = new List<vehicle_summary>();
      var biz_vehicles = new TClass_biz_vehicles();
      using var target = new DataGrid();
      biz_vehicles.BindBaseDataList
        (
        sort_order:(sort_order.Length > 0 ? sort_order : "vehicle_name"),
        be_sort_order_ascending:be_sort_order_ascending,
        target:target,
        agency_filter:agency_filter,
        vehicle_kind_filter:vehicle_kind_filter,
        be_four_or_all_wheel_drive_filter:be_four_or_all_wheel_drive_filter,
        quarters_filter:quarters_filter,
        can_receive_legacy_cot_fastener_filter:can_receive_legacy_cot_fastener_filter
        );
      foreach (DataGridItem item in target.Items)
        {
        the_items.Add(biz_vehicles.Summary(item.Cells[0].Text) as vehicle_summary); // Cells[0] is the index of vehicle_id in the raw SQL statement in TClass_db_vehicles.BindBaseDataList.
        }
      return the_items;
      }
    }
  }

// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_members;
using Class_db_vehicle_quarters_history;
using kix;
using System;
using System.Collections;

namespace Class_biz_vehicle_quarters_history
  {
  public class TClass_biz_vehicle_quarters_history
    {
    private TClass_biz_members biz_members = null;
    private TClass_db_vehicle_quarters_history db_vehicle_quarters_history = null;

    public TClass_biz_vehicle_quarters_history() : base()
      {
      biz_members = new TClass_biz_members();
      db_vehicle_quarters_history = new TClass_db_vehicle_quarters_history();
      }

    public bool BeLater
      (
      string vehicle_id,
      DateTime proposed_datetime
      )
      {
      return db_vehicle_quarters_history.BeLater(vehicle_id,proposed_datetime);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicle_quarters_history.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicle_quarters_history.BindDirectToListControl(target);
      }

    public void BindVehicleRecords
      (
      string vehicle_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_vehicle_quarters_history.BindVehicleRecords(vehicle_id,sort_order,be_sort_order_ascending,target);
      }

    public bool Delete(string id)
      {
      return db_vehicle_quarters_history.Delete(id);
      }

    public bool Get
      (
      string id,
      out string vehicle_id,
      out string quarters_id,
      out DateTime start_datetime,
      out DateTime end_datetime,
      out string note
      )
      {
      return db_vehicle_quarters_history.Get
        (
        id,
        out vehicle_id,
        out quarters_id,
        out start_datetime,
        out end_datetime,
        out note
        );
      }

    public string IdOfCurrent(string vehicle_id)
      {
      return db_vehicle_quarters_history.IdOfCurrent(vehicle_id);
      }

    public void Set
      (
      string id,
      string vehicle_id,
      string quarters_id,
      DateTime start_datetime,
      DateTime end_datetime,
      string note
      )
      {
      db_vehicle_quarters_history.Set
        (
        id,
        vehicle_id,
        quarters_id,
        start_datetime,
        end_datetime,
        biz_members.UserAttributionIndicator() + note
        );
      }

    } // end TClass_biz_vehicle_quarters_history

  }

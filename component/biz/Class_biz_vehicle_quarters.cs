// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_vehicle_quarters;
using kix;
using System;
using System.Collections;

namespace Class_biz_vehicle_quarters
  {
  public class TClass_biz_vehicle_quarters
    {
    private TClass_db_vehicle_quarters db_vehicle_quarters = null;

    public TClass_biz_vehicle_quarters() : base()
      {
      db_vehicle_quarters = new TClass_db_vehicle_quarters();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicle_quarters.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicle_quarters.BindDirectToListControl(target);
      }

    public void BindDirectToListControlMedium(object target)
      {
      db_vehicle_quarters.BindDirectToListControlMedium(target);
      }

    public void BindDirectToListControlMedium
      (
      object target,
      string selected_id,
      bool be_available_option_all
      )
      {
      db_vehicle_quarters.BindDirectToListControlMedium(target,selected_id,be_available_option_all);
      }

    public void BindDirectToListControlMediumDashLong(object target)
      {
      db_vehicle_quarters.BindDirectToListControlMediumDashLong(target);
      }

    public bool Delete(string id)
      {
      return db_vehicle_quarters.Delete(id);
      }

    public bool Get
      (
      string id,
      out string medium_designator,
      out string long_designator,
      out string pecking_order,
      out bool be_active
      )
      {
      return db_vehicle_quarters.Get
        (
        id,
        out medium_designator,
        out long_designator,
        out pecking_order,
        out be_active
        );
      }

    public string MediumDashLongDesignatorOfId(string id)
      {
      return db_vehicle_quarters.MediumDashLongDesignatorOfId(id);
      }

    public void Set
      (
      string id,
      string medium_designator,
      string long_designator,
      string pecking_order,
      bool be_active
      )
      {
      db_vehicle_quarters.Set
        (
        id,
        medium_designator,
        long_designator,
        pecking_order,
        be_active
        );
      }

    } // end TClass_biz_vehicle_quarters

  }

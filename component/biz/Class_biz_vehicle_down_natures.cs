// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_vehicle_down_natures;
using kix;
using System;
using System.Collections;

namespace Class_biz_vehicle_down_natures
  {
  public class TClass_biz_vehicle_down_natures
    {
    private TClass_db_vehicle_down_natures db_vehicle_down_natures = null;

    public TClass_biz_vehicle_down_natures() : base()
      {
      db_vehicle_down_natures = new TClass_db_vehicle_down_natures();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicle_down_natures.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicle_down_natures.BindDirectToListControl(target);
      }

    public void BindDirectToListControlForMarkDown(object target)
      {
      db_vehicle_down_natures.BindDirectToListControlForMarkDown(target);
      }

    public bool Delete(string id)
      {
      return db_vehicle_down_natures.Delete(id);
      }

    public string ElaborationOf(string id)
      {
      return db_vehicle_down_natures.ElaborationOf(id);
      }

    public bool Get
      (
      string id,
      out string name,
      out string pecking_order,
      out bool be_failure,
      out string elaboration
      )
      {
      return db_vehicle_down_natures.Get
        (
        id,
        out name,
        out pecking_order,
        out be_failure,
        out elaboration
        );
      }

    public void Set
      (
      string id,
      string name,
      string pecking_order,
      bool be_failure,
      string elaboration
      )
      {
      db_vehicle_down_natures.Set
        (
        id,
        name,
        pecking_order,
        be_failure,
        elaboration
        );
      }

    } // end TClass_biz_vehicle_down_natures

  }

// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_vehicle_kinds;
using kix;
using System;
using System.Collections;

namespace Class_biz_vehicle_kinds
  {
  public class TClass_biz_vehicle_kinds
    {
    private TClass_db_vehicle_kinds db_vehicle_kinds = null;

    public TClass_biz_vehicle_kinds() : base()
      {
      db_vehicle_kinds = new TClass_db_vehicle_kinds();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicle_kinds.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicle_kinds.BindDirectToListControl(target);
      }
    public void BindListControl
      (
      object target,
      string selected_id,
      bool be_available_option_all
      )
      {
      db_vehicle_kinds.BindListControl(target,selected_id,be_available_option_all);
      }

    public bool Delete(string id)
      {
      return db_vehicle_kinds.Delete(id);
      }

    internal string DescriptionOf(string id)
      {
      return db_vehicle_kinds.DescriptionOf(id);
      }

    public bool Get
      (
      string id,
      out string description
      )
      {
      return db_vehicle_kinds.Get
        (
        id,
        out description
        );
      }

    public void Set
      (
      string id,
      string description
      )
      {
      db_vehicle_kinds.Set
        (
        id,
        description
        );
      }

    } // end TClass_biz_vehicle_kinds

  }

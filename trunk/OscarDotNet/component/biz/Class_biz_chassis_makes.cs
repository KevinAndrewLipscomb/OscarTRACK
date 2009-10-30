// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_chassis_makes;
using kix;
using System;
using System.Collections;

namespace Class_biz_chassis_makes
  {
  public class TClass_biz_chassis_makes
    {
    private TClass_db_chassis_makes db_chassis_makes = null;

    public TClass_biz_chassis_makes() : base()
      {
      db_chassis_makes = new TClass_db_chassis_makes();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_chassis_makes.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_chassis_makes.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_chassis_makes.Delete(id);
      }

    public bool Get
      (
      string id,
      out string name
      )
      {
      return db_chassis_makes.Get
        (
        id,
        out name
        );
      }

    public void Set
      (
      string id,
      string name
      )
      {
      db_chassis_makes.Set
        (
        id,
        name
        );
      }

    } // end TClass_biz_chassis_makes

  }

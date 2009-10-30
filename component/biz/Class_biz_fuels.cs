// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_fuels;
using kix;
using System;
using System.Collections;

namespace Class_biz_fuels
  {
  public class TClass_biz_fuels
    {
    private TClass_db_fuels db_fuels = null;

    public TClass_biz_fuels() : base()
      {
      db_fuels = new TClass_db_fuels();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_fuels.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_fuels.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_fuels.Delete(id);
      }

    public bool Get
      (
      string id,
      out string description
      )
      {
      return db_fuels.Get
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
      db_fuels.Set
        (
        id,
        description
        );
      }

    } // end TClass_biz_fuels

  }

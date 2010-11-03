// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_streets;
using kix;
using System;
using System.Collections;

namespace Class_biz_streets
  {
  public class TClass_biz_streets
    {
    private TClass_db_streets db_streets = null;

    public TClass_biz_streets() : base()
      {
      db_streets = new TClass_db_streets();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_streets.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,false);
      }
    public void BindDirectToListControl(object target, bool be_idiomatic_format)
      {
      db_streets.BindDirectToListControl(target,be_idiomatic_format);
      }

    public bool Delete(string id)
      {
      return db_streets.Delete(id);
      }

    public bool Get
      (
      string id,
      out string city_id,
      out string name
      )
      {
      return db_streets.Get
        (
        id,
        out city_id,
        out name
        );
      }

    public void Set
      (
      string id,
      string city_id,
      string name
      )
      {
      db_streets.Set
        (
        id,
        city_id,
        name
        );
      }

    } // end TClass_biz_streets

  }

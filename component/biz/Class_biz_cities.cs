// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_cities;
using kix;
using System;
using System.Collections;

namespace Class_biz_cities
  {
  public class TClass_biz_cities
    {
    private TClass_db_cities db_cities = null;

    public TClass_biz_cities() : base()
      {
      db_cities = new TClass_db_cities();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_cities.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,false);
      }
    public void BindDirectToListControl(object target, bool be_idiomatic_format)
      {
      db_cities.BindDirectToListControl(target,be_idiomatic_format);
      }

    public bool Delete(string id)
      {
      return db_cities.Delete(id);
      }

    public bool Get
      (
      string id,
      out string make_id,
      out string name
      )
      {
      return db_cities.Get
        (
        id,
        out make_id,
        out name
        );
      }

    public void Set
      (
      string id,
      string make_id,
      string name
      )
      {
      db_cities.Set
        (
        id,
        make_id,
        name
        );
      }

    } // end TClass_biz_cities

  }

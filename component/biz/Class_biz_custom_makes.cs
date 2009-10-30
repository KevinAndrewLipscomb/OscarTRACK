// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_custom_makes;
using kix;
using System;
using System.Collections;

namespace Class_biz_custom_makes
  {
  public class TClass_biz_custom_makes
    {
    private TClass_db_custom_makes db_custom_makes = null;

    public TClass_biz_custom_makes() : base()
      {
      db_custom_makes = new TClass_db_custom_makes();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_custom_makes.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_custom_makes.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_custom_makes.Delete(id);
      }

    public bool Get
      (
      string id,
      out string name
      )
      {
      return db_custom_makes.Get
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
      db_custom_makes.Set
        (
        id,
        name
        );
      }

    } // end TClass_biz_custom_makes

  }

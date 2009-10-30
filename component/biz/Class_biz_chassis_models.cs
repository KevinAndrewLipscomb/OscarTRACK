// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_chassis_models;
using kix;
using System;
using System.Collections;

namespace Class_biz_chassis_models
  {
  public class TClass_biz_chassis_models
    {
    private TClass_db_chassis_models db_chassis_models = null;

    public TClass_biz_chassis_models() : base()
      {
      db_chassis_models = new TClass_db_chassis_models();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_chassis_models.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,false);
      }
    public void BindDirectToListControl(object target, bool be_idiomatic_format)
      {
      db_chassis_models.BindDirectToListControl(target,be_idiomatic_format);
      }

    public bool Delete(string id)
      {
      return db_chassis_models.Delete(id);
      }

    public bool Get
      (
      string id,
      out string make_id,
      out string name
      )
      {
      return db_chassis_models.Get
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
      db_chassis_models.Set
        (
        id,
        make_id,
        name
        );
      }

    } // end TClass_biz_chassis_models

  }

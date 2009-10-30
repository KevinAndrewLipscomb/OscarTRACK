// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_custom_models;
using kix;
using System;
using System.Collections;

namespace Class_biz_custom_models
  {
  public class TClass_biz_custom_models
    {
    private TClass_db_custom_models db_custom_models = null;

    public TClass_biz_custom_models() : base()
      {
      db_custom_models = new TClass_db_custom_models();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_custom_models.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,false);
      }
    public void BindDirectToListControl(object target, bool be_idiomatic_format)
      {
      db_custom_models.BindDirectToListControl(target,be_idiomatic_format);
      }

    public bool Delete(string id)
      {
      return db_custom_models.Delete(id);
      }

    public bool Get
      (
      string id,
      out string make_id,
      out string name
      )
      {
      return db_custom_models.Get
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
      db_custom_models.Set
        (
        id,
        make_id,
        name
        );
      }

    } // end TClass_biz_custom_models

  }

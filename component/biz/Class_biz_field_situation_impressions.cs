// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situation_impressions;
using kix;
using System;
using System.Collections;

namespace Class_biz_field_situation_impressions
  {
  public class TClass_biz_field_situation_impressions
    {
    private TClass_db_field_situation_impressions db_field_situation_impressions = null;

    public TClass_biz_field_situation_impressions() : base()
      {
      db_field_situation_impressions = new TClass_db_field_situation_impressions();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_field_situation_impressions.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_field_situation_impressions.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_field_situation_impressions.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_field_situation_impressions.Delete(id);
      }

    public bool Get
      (
      string id,
      out string description,
      out string pecking_order
      )
      {
      return db_field_situation_impressions.Get
        (
        id,
        out description,
        out pecking_order
        );
      }

    public void Set
      (
      string id,
      string description,
      string pecking_order
      )
      {
      db_field_situation_impressions.Set
        (
        id,
        description,
        pecking_order
        );
      }

    internal object Summary(string id)
      {
      return db_field_situation_impressions.Summary(id);
      }

    } // end TClass_biz_field_situation_impressions

  }

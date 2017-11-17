// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_rank_groups;
using kix;
using System;
using System.Collections;

namespace Class_biz_rank_groups
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_rank_groups
    {
    private TClass_db_rank_groups db_rank_groups = null;

    public TClass_biz_rank_groups() : base()
      {
      db_rank_groups = new TClass_db_rank_groups();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_rank_groups.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_rank_groups.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_rank_groups.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_rank_groups.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name,
      out string pecking_order
      )
      {
      return db_rank_groups.Get
        (
        id,
        out agency_id,
        out name,
        out pecking_order
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string name,
      string pecking_order
      )
      {
      db_rank_groups.Set
        (
        id,
        agency_id,
        name,
        pecking_order
        );
      }

    internal object Summary(string id)
      {
      return db_rank_groups.Summary(id);
      }

    } // end TClass_biz_rank_groups

  }

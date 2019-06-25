// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_tapouts;
using kix;
using System;
using System.Collections;

namespace Class_biz_tapouts
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_tapouts
    {
    private TClass_db_tapouts db_tapouts = null;

    public TClass_biz_tapouts() : base()
      {
      db_tapouts = new TClass_db_tapouts();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_tapouts.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string member_id
      )
      {
      db_tapouts.BindBaseDataList(sort_order,be_sort_order_ascending,target,member_id);
      }

    public void BindDirectToListControl(object target)
      {
      db_tapouts.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_tapouts.Delete(id);
      }

    public bool Get
      (
      string id,
      out string member_id,
      out DateTime expected_start,
      out string comment,
      out string hours_warning,
      out string actor_member_id,
      out DateTime actor_timestamp
      )
      {
      return db_tapouts.Get
        (
        id,
        out member_id,
        out expected_start,
        out comment,
        out hours_warning,
        out actor_member_id,
        out actor_timestamp
        );
      }

    public void Set
      (
      string id,
      string member_id,
      DateTime expected_start,
      string comment,
      string hours_warning,
      string actor_member_id,
      DateTime actor_timestamp
      )
      {
      db_tapouts.Set
        (
        id,
        member_id,
        expected_start,
        comment,
        hours_warning,
        actor_member_id,
        actor_timestamp
        );
      }

    internal object Summary(string id)
      {
      return db_tapouts.Summary(id);
      }

    } // end TClass_biz_tapouts

  }

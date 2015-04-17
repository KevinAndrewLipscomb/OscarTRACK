// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_ephemeral_dispatches;
using kix;
using System;
using System.Collections;

namespace Class_biz_ephemeral_dispatches
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_ephemeral_dispatches
    {
    private TClass_db_ephemeral_dispatches db_ephemeral_dispatches = null;

    public TClass_biz_ephemeral_dispatches() : base()
      {
      db_ephemeral_dispatches = new TClass_db_ephemeral_dispatches();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_ephemeral_dispatches.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_ephemeral_dispatches.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_ephemeral_dispatches.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_ephemeral_dispatches.Delete(id);
      }

    public bool Get
      (
      string id,
      out string designator,
      out string description
      )
      {
      return db_ephemeral_dispatches.Get
        (
        id,
        out designator,
        out description
        );
      }

    public void Set
      (
      string id,
      string designator,
      string description
      )
      {
      db_ephemeral_dispatches.Set
        (
        id,
        designator,
        description
        );
      }

    internal object Summary(string id)
      {
      return db_ephemeral_dispatches.Summary(id);
      }

    } // end TClass_biz_ephemeral_dispatches

  }

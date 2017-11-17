// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_priorities;
using kix;
using System;
using System.Collections;

namespace Class_biz_uniform_priorities
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_priorities
    {
    private TClass_db_uniform_priorities db_uniform_priorities = null;

    public TClass_biz_uniform_priorities() : base()
      {
      db_uniform_priorities = new TClass_db_uniform_priorities();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_uniform_priorities.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_priorities.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_uniform_priorities.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_uniform_priorities.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string value,
      out string description
      )
      {
      return db_uniform_priorities.Get
        (
        id,
        out agency_id,
        out value,
        out description
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string value,
      string description
      )
      {
      db_uniform_priorities.Set
        (
        id,
        agency_id,
        value,
        description
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_priorities.Summary(id);
      }

    } // end TClass_biz_uniform_priorities

  }

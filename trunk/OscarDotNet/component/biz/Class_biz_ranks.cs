// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_ranks;

namespace Class_biz_ranks
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_ranks
    {
    private readonly TClass_db_ranks db_ranks = null;

    public TClass_biz_ranks() : base()
      {
      db_ranks = new TClass_db_ranks();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_ranks.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_ranks.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_ranks.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_ranks.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name,
      out string pecking_order
      )
      {
      return db_ranks.Get
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
      db_ranks.Set
        (
        id,
        agency_id,
        name,
        pecking_order
        );
      }

    internal object Summary(string id)
      {
      return db_ranks.Summary(id);
      }

    } // end TClass_biz_ranks

  }

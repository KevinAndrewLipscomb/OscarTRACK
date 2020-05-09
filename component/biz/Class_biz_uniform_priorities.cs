// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_priorities;
using kix;

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
    private readonly TClass_db_uniform_priorities db_uniform_priorities = null;

    public TClass_biz_uniform_priorities() : base()
      {
      db_uniform_priorities = new TClass_db_uniform_priorities();
      }

    internal string AgencyIdOf(object summary)
      {
      return db_uniform_priorities.AgencyIdOf(summary);
      }
      
    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_priorities.Bind(partial_spec, target, agency_id_filter);
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

    public void BindDirectToListControl
      (
      object target,
      string agency_id_filter
      )
      {
      db_uniform_priorities.BindDirectToListControl(target,agency_id_filter);
      }

    public bool Delete(string id)
      {
      return db_uniform_priorities.Delete(id);
      }

    internal string DescriptionOf(object summary)
      {
      return db_uniform_priorities.DescriptionOf(summary);
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

    internal k.int_positive ValueOf(object summary)
      {
      return db_uniform_priorities.ValueOf(summary);
      }
      
    } // end TClass_biz_uniform_priorities

  }

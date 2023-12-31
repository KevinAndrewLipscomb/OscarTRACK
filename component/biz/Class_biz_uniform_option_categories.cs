// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_option_categories;

namespace Class_biz_uniform_option_categories
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_option_categories
    {
    private readonly TClass_db_uniform_option_categories db_uniform_option_categories = null;

    public TClass_biz_uniform_option_categories() : base()
      {
      db_uniform_option_categories = new TClass_db_uniform_option_categories();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_option_categories.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_option_categories.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      db_uniform_option_categories.BindDirectToListControl(target,agency_id);
      }

    public bool Delete(string id)
      {
      return db_uniform_option_categories.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name
      )
      {
      return db_uniform_option_categories.Get
        (
        id,
        out agency_id,
        out name
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string name
      )
      {
      db_uniform_option_categories.Set
        (
        id,
        agency_id,
        name
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_option_categories.Summary(id);
      }

    } // end TClass_biz_uniform_option_categories

  }

// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_piece_vendors;

namespace Class_biz_uniform_piece_vendors
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_piece_vendors
    {
    private readonly TClass_db_uniform_piece_vendors db_uniform_piece_vendors = null;

    public TClass_biz_uniform_piece_vendors() : base()
      {
      db_uniform_piece_vendors = new TClass_db_uniform_piece_vendors();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_piece_vendors.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_piece_vendors.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      db_uniform_piece_vendors.BindDirectToListControl(target,agency_id);
      }

    public bool Delete(string id)
      {
      return db_uniform_piece_vendors.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name
      )
      {
      return db_uniform_piece_vendors.Get
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
      db_uniform_piece_vendors.Set
        (
        id,
        agency_id,
        name
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_piece_vendors.Summary(id);
      }

    } // end TClass_biz_uniform_piece_vendors

  }

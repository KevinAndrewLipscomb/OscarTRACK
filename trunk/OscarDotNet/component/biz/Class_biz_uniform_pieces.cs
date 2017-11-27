// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_pieces;

namespace Class_biz_uniform_pieces
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_pieces
    {
    private TClass_db_uniform_pieces db_uniform_pieces = null;

    public TClass_biz_uniform_pieces() : base()
      {
      db_uniform_pieces = new TClass_db_uniform_pieces();
      }

    internal string AgencyIdOf(object summary)
      {
      return db_uniform_pieces.AgencyIdOf(summary);
      }
      
    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_pieces.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_pieces.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      db_uniform_pieces.BindDirectToListControl(target,agency_id);
      }

    public bool Delete(string id)
      {
      return db_uniform_pieces.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string priority_id,
      out string layer,
      out string class_id,
      out string name,
      out string authorized_quantity
      )
      {
      return db_uniform_pieces.Get
        (
        id,
        out agency_id,
        out priority_id,
        out layer,
        out class_id,
        out name,
        out authorized_quantity
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string priority_id,
      string layer,
      string class_id,
      string name,
      string authorized_quantity
      )
      {
      db_uniform_pieces.Set
        (
        id,
        agency_id,
        priority_id,
        layer,
        class_id,
        name,
        authorized_quantity
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_pieces.Summary(id);
      }

    } // end TClass_biz_uniform_pieces

  }

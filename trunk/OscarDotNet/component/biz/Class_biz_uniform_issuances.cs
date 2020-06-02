// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_issuances;
using kix;
using System;
using System.Collections;

namespace Class_biz_uniform_issuances
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_issuances
    {
    private readonly TClass_db_uniform_issuances db_uniform_issuances = null;

    public TClass_biz_uniform_issuances() : base()
      {
      db_uniform_issuances = new TClass_db_uniform_issuances();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_uniform_issuances.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_issuances.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_uniform_issuances.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_uniform_issuances.Delete(id);
      }

    public bool Get
      (
      string id,
      out string member_id,
      out DateTime date,
      out string catalog_id
      )
      {
      return db_uniform_issuances.Get
        (
        id,
        out member_id,
        out date,
        out catalog_id
        );
      }

    public void Set
      (
      string id,
      string member_id,
      DateTime date,
      string catalog_id
      )
      {
      db_uniform_issuances.Set
        (
        id,
        member_id,
        date,
        catalog_id
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_issuances.Summary(id);
      }

    } // end TClass_biz_uniform_issuances

  }

// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_piece_models;
using kix;
using System;
using System.Collections;

namespace Class_biz_uniform_piece_models
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_piece_models
    {
    private TClass_db_uniform_piece_models db_uniform_piece_models = null;

    public TClass_biz_uniform_piece_models() : base()
      {
      db_uniform_piece_models = new TClass_db_uniform_piece_models();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_piece_models.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_piece_models.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      db_uniform_piece_models.BindDirectToListControl(target,agency_id);
      }

    public bool Delete(string id)
      {
      return db_uniform_piece_models.Delete(id);
      }

    public bool Get
      (
      string id,
      out string make_id,
      out string name
      )
      {
      return db_uniform_piece_models.Get
        (
        id,
        out make_id,
        out name
        );
      }

    public void Set
      (
      string id,
      string make_id,
      string name
      )
      {
      db_uniform_piece_models.Set
        (
        id,
        make_id,
        name
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_piece_models.Summary(id);
      }

    } // end TClass_biz_uniform_piece_models

  }

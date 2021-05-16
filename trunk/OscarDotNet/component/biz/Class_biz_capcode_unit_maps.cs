// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_capcode_unit_maps;
using kix;
using System;
using System.Collections;

namespace Class_biz_capcode_unit_maps
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_capcode_unit_maps
    {
    private readonly TClass_db_capcode_unit_maps db_capcode_unit_maps = null;

    public TClass_biz_capcode_unit_maps() : base()
      {
      db_capcode_unit_maps = new TClass_db_capcode_unit_maps();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_capcode_unit_maps.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_capcode_unit_maps.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_capcode_unit_maps.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_capcode_unit_maps.Delete(id);
      }

    public bool Get
      (
      string id,
      out string capcode,
      out string unit
      )
      {
      return db_capcode_unit_maps.Get
        (
        id,
        out capcode,
        out unit
        );
      }

    public void Set
      (
      string id,
      string capcode,
      string unit
      )
      {
      db_capcode_unit_maps.Set
        (
        id,
        capcode,
        unit
        );
      }

    internal object Summary(string id)
      {
      return db_capcode_unit_maps.Summary(id);
      }

    } // end TClass_biz_capcode_unit_maps

  }

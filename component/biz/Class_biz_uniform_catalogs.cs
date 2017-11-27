// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_catalogs;
using kix;
using System;
using System.Collections;

namespace Class_biz_uniform_catalogs
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_catalogs
    {
    private TClass_db_uniform_catalogs db_uniform_catalogs = null;

    public TClass_biz_uniform_catalogs() : base()
      {
      db_uniform_catalogs = new TClass_db_uniform_catalogs();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_catalogs.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_catalogs.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_uniform_catalogs.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_uniform_catalogs.Delete(id);
      }

    public bool Get
      (
      string id,
      out string piece_id,
      out bool be_branded,
      out bool be_size_dependent,
      out bool be_specific_rank_dependent,
      out bool be_extra_individualized,
      out string rank_group_id,
      out string medical_release_code,
      out string option_category_id,
      out k.int_sign_range male_null_false_true_condition,
      out string vendor_id,
      out string model_id,
      out string base_color_id,
      out string trim_color_id,
      out string metal_color_id,
      out string instruction_to_vendor,
      out string elaboration,
      out string unit_cost
      )
      {
      return db_uniform_catalogs.Get
        (
        id,
        out piece_id,
        out be_branded,
        out be_size_dependent,
        out be_specific_rank_dependent,
        out be_extra_individualized,
        out rank_group_id,
        out medical_release_code,
        out option_category_id,
        out male_null_false_true_condition,
        out vendor_id,
        out model_id,
        out base_color_id,
        out trim_color_id,
        out metal_color_id,
        out instruction_to_vendor,
        out elaboration,
        out unit_cost
        );
      }

    public void Set
      (
      string id,
      string piece_id,
      bool be_branded,
      bool be_size_dependent,
      bool be_specific_rank_dependent,
      bool be_extra_individualized,
      string rank_group_id,
      string medical_release_code,
      string option_category_id,
      k.int_sign_range male_null_false_true_condition,
      string vendor_id,
      string model_id,
      string base_color_id,
      string trim_color_id,
      string metal_color_id,
      string instruction_to_vendor,
      string elaboration,
      string unit_cost
      )
      {
      db_uniform_catalogs.Set
        (
        id,
        piece_id,
        be_branded,
        be_size_dependent,
        be_specific_rank_dependent,
        be_extra_individualized,
        rank_group_id,
        medical_release_code,
        option_category_id,
        male_null_false_true_condition,
        vendor_id,
        model_id,
        base_color_id,
        trim_color_id,
        metal_color_id,
        instruction_to_vendor,
        elaboration,
        unit_cost
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_catalogs.Summary(id);
      }

    } // end TClass_biz_uniform_catalogs

  }

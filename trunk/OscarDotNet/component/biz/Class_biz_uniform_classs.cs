// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_classs;
using kix;
using System;
using System.Collections;

namespace Class_biz_uniform_classs
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_classs
    {
    private TClass_db_uniform_classs db_uniform_classs = null;

    public TClass_biz_uniform_classs() : base()
      {
      db_uniform_classs = new TClass_db_uniform_classs();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_uniform_classs.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_classs.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_uniform_classs.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_uniform_classs.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string short_designator,
      out string long_designator
      )
      {
      return db_uniform_classs.Get
        (
        id,
        out agency_id,
        out short_designator,
        out long_designator
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string short_designator,
      string long_designator
      )
      {
      db_uniform_classs.Set
        (
        id,
        agency_id,
        short_designator,
        long_designator
        );
      }

    internal object Summary(string id)
      {
      return db_uniform_classs.Summary(id);
      }

    } // end TClass_biz_uniform_classs

  }

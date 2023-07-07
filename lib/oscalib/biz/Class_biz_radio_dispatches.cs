// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_radio_dispatches;
using kix;
using System;
using System.Collections;

namespace Class_biz_radio_dispatches
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_radio_dispatches
    {
    private readonly TClass_db_radio_dispatches db_radio_dispatches = null;

    public TClass_biz_radio_dispatches() : base()
      {
      db_radio_dispatches = new TClass_db_radio_dispatches();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_radio_dispatches.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_radio_dispatches.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_radio_dispatches.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_radio_dispatches.Delete(id);
      }

    public bool Get
      (
      string id,
      out string capcode,
      out DateTime transmission_datetime,
      out string address,
      out string nature
      )
      {
      return db_radio_dispatches.Get
        (
        id,
        out capcode,
        out transmission_datetime,
        out address,
        out nature
        );
      }

    public void Set
      (
      string id,
      string capcode,
      DateTime transmission_datetime,
      string address,
      string nature
      )
      {
      db_radio_dispatches.Set
        (
        id,
        capcode,
        transmission_datetime,
        address,
        nature
        );
      }

    internal object Summary(string id)
      {
      return db_radio_dispatches.Summary(id);
      }

    } // end TClass_biz_radio_dispatches

  }

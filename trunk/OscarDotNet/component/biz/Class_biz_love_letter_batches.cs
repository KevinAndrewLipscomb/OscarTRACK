// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_love_letter_batches;
using kix;
using System;
using System.Collections;

namespace Class_biz_love_letter_batches
  {
  public class TClass_biz_love_letter_batches
    {
    private TClass_db_love_letter_batches db_love_letter_batches = null;

    public TClass_biz_love_letter_batches() : base()
      {
      db_love_letter_batches = new TClass_db_love_letter_batches();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_love_letter_batches.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_love_letter_batches.BindDirectToListControl(target);
      }

    internal void BindRecentToBaseDataList
      (
      string agency,
      k.int_positive limit,
      object target
      )
      {
      db_love_letter_batches.BindRecentToBaseDataList(agency,limit,target);
      }

    public bool Delete(string id)
      {
      return db_love_letter_batches.Delete(id);
      }

    public bool Get
      (
      string id,
      out string designator,
      out string immune_scene_visits_factor
      )
      {
      return db_love_letter_batches.Get
        (
        id,
        out designator,
        out immune_scene_visits_factor
        );
      }

    public void Set
      (
      string id,
      string designator,
      string immune_scene_visits_factor
      )
      {
      db_love_letter_batches.Set
        (
        id,
        designator,
        immune_scene_visits_factor
        );
      }

    } // end TClass_biz_love_letter_batchs

  }

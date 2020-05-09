// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_special_event_shifts;
using kix;
using System;
using System.Collections;

namespace Class_biz_special_event_shifts
  {
  public class TClass_biz_special_event_shifts
    {
    private readonly TClass_db_special_event_shifts db_special_event_shifts = null;

    public TClass_biz_special_event_shifts() : base()
      {
      db_special_event_shifts = new TClass_db_special_event_shifts();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_special_event_shifts.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_special_event_shifts.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_special_event_shifts.Delete(id);
      }

    public bool Get
      (
      string id,
      out string special_event_id,
      out DateTime nominal_day,
      out string name
      )
      {
      return db_special_event_shifts.Get
        (
        id,
        out special_event_id,
        out nominal_day,
        out name
        );
      }

    public void Set
      (
      string id,
      string special_event_id,
      DateTime nominal_day,
      string name
      )
      {
      db_special_event_shifts.Set
        (
        id,
        special_event_id,
        nominal_day,
        name
        );
      }

    } // end TClass_biz_special_event_shifts

  }

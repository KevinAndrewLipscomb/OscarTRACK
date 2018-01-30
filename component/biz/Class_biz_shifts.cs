// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_shifts;
using kix;
using System;
using System.Collections;

namespace Class_biz_shifts
  {
  public class TClass_biz_shifts
    {
    private TClass_db_shifts db_shifts = null;

    public TClass_biz_shifts() : base()
      {
      db_shifts = new TClass_db_shifts();
      }

    internal bool BeInDayShift(TimeSpan time_of_day)
      {
      return db_shifts.BeInDayShift(time_of_day);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_shifts.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_shifts.BindDirectToListControl(target);
      }

    internal void BindDirectToListControlByPeckingOrder(object target)
      {
      db_shifts.BindDirectToListControlByPeckingOrder(target);
      }

    public bool Delete(string id)
      {
      return db_shifts.Delete(id);
      }

    internal string EndHHofName(string name)
      {
      return db_shifts.EndHHofName(name);
      }

    public bool Get
      (
      string id,
      out DateTime start,
      out DateTime end,
      out string name,
      out string pecking_order
      )
      {
      return db_shifts.Get
        (
        id,
        out start,
        out end,
        out name,
        out pecking_order
        );
      }

    internal string IdOfName(string name)
      {
      return db_shifts.IdOfName(name);
      }

    internal string NameOf(string id)
      {
      return db_shifts.NameOf(id);
      }

    public void Set
      (
      string id,
      DateTime start,
      DateTime end,
      string name,
      string pecking_order
      )
      {
      db_shifts.Set
        (
        id,
        start,
        end,
        name,
        pecking_order
        );
      }

    internal string StartHHofName(string name)
      {
      return db_shifts.StartHHofName(name);
      }

    } // end TClass_biz_shifts

  }

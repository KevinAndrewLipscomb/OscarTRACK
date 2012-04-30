using Class_db_special_events;
using kix;

namespace Class_biz_special_events
  {

  public class TClass_biz_special_events
    {

    private TClass_db_special_events db_special_events = null;

    public TClass_biz_special_events() : base()
      {
      db_special_events = new TClass_db_special_events();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_special_events.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_special_events.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- special_event --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_special_events.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_special_events.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_special_events.Set(code, description);
      }

    } // end TClass_biz_special_events

  }
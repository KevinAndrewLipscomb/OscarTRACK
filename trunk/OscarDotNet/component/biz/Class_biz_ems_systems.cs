using Class_db_ems_systems;
using kix;

namespace Class_biz_ems_systems
  {

  public class TClass_biz_ems_systems
    {

    private TClass_db_ems_systems db_ems_systems = null;

    public TClass_biz_ems_systems() : base()
      {
      db_ems_systems = new TClass_db_ems_systems();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_ems_systems.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_ems_systems.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- ems_system --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_ems_systems.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_ems_systems.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_ems_systems.Set(code, description);
      }

    } // end TClass_biz_ems_systems

  }
using Class_db_driver_skills;
using kix;

namespace Class_biz_driver_skills
  {

  public class TClass_biz_driver_skills
    {

    private TClass_db_driver_skills db_driver_skills = null;

    public TClass_biz_driver_skills() : base()
      {
      db_driver_skills = new TClass_db_driver_skills();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_driver_skills.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_driver_skills.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- driver_skill --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_driver_skills.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_driver_skills.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_driver_skills.Set(code, description);
      }

    } // end TClass_biz_driver_skills

  }
using Class_db_patient_encounter_levels;
using kix;

namespace Class_biz_patient_encounter_levels
  {

  public class TClass_biz_patient_encounter_levels
    {

    private TClass_db_patient_encounter_levels db_patient_encounter_levels = null;

    public TClass_biz_patient_encounter_levels() : base()
      {
      db_patient_encounter_levels = new TClass_db_patient_encounter_levels();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_patient_encounter_levels.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_patient_encounter_levels.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- patient_encounter_level --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_patient_encounter_levels.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_patient_encounter_levels.Get(code, out description);
      }

    public void Set(string code, string description)
      {
      db_patient_encounter_levels.Set(code, description);
      }

    } // end TClass_biz_patient_encounter_levels

  }
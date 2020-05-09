using Class_db_patient_age_units;
using kix;

namespace Class_biz_patient_age_units
  {

  public class TClass_biz_patient_age_units
    {

    private readonly TClass_db_patient_age_units db_patient_age_units = null;

    public TClass_biz_patient_age_units() : base()
      {
      db_patient_age_units = new TClass_db_patient_age_units();
      }

    public bool Bind(string partial_code, object target)
      {
      return db_patient_age_units.Bind(partial_code, target);
      }

    public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
      {
      db_patient_age_units.BindDirectToListControl(target, unselected_literal, selected_value);
      }

    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- patient_age_unit --");
      }

    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }

    public bool Delete(string code)
      {
      return db_patient_age_units.Delete(code);
      }

    public bool Get(string code, out string description)
      {
      return db_patient_age_units.Get(code, out description);
      }

    internal string IdOfDescription(string description)
      {
      return db_patient_age_units.IdOfDescription(description);
      }

    public void Set(string code, string description)
      {
      db_patient_age_units.Set(code, description);
      }

    } // end TClass_biz_patient_age_units

  }
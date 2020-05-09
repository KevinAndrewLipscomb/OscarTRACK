// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_patient_encounters;

namespace Class_biz_patient_encounters
  {
  public class TClass_biz_patient_encounters
    {
    private readonly TClass_db_patient_encounters db_patient_encounters = null;

    public TClass_biz_patient_encounters() : base()
      {
      db_patient_encounters = new TClass_db_patient_encounters();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_patient_encounters.Bind(partial_spec, target);
      }

    internal void BindBaseDataList
      (
      object target,
      string eval_id_filter
      )
      {
      db_patient_encounters.BindBaseDataList
        (
        target:target,
        eval_id_filter:eval_id_filter
        );
      }

    public void BindDirectToListControl(object target)
      {
      db_patient_encounters.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_patient_encounters.Delete(id);
      }

    internal string IdOfUnique(string guid)
      {
      return db_patient_encounters.IdOfUnique(guid);
      }

    public bool Get
      (
      string id,
      out string eval_id,
      out string chief_complaint,
      out string patient_age,
      out string patient_age_unit_id,
      out string patient_encounter_level_id,
      out string guid
      )
      {
      return db_patient_encounters.Get
        (
        id,
        out eval_id,
        out chief_complaint,
        out patient_age,
        out patient_age_unit_id,
        out patient_encounter_level_id,
        out guid
        );
      }

    public void Set
      (
      string id,
      string eval_id,
      string chief_complaint,
      string patient_age,
      string patient_age_unit_id,
      string patient_encounter_level_id,
      string guid
      )
      {
      db_patient_encounters.Set
        (
        id,
        eval_id,
        chief_complaint,
        patient_age,
        patient_age_unit_id,
        patient_encounter_level_id,
        guid
        );
      }

    } // end TClass_biz_patient_encounters

  }

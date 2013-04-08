// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_care_skill_ratings;
using kix;
using System;
using System.Collections;

namespace Class_biz_care_skill_ratings
  {
  public class TClass_biz_care_skill_ratings
    {
    private TClass_db_care_skill_ratings db_care_skill_ratings = null;

    public TClass_biz_care_skill_ratings() : base()
      {
      db_care_skill_ratings = new TClass_db_care_skill_ratings();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_care_skill_ratings.Bind(partial_spec, target);
      }

    internal void BindBaseDataList
      (
      object target,
      string patient_encounter_id
      )
      {
      db_care_skill_ratings.BindBaseDataList(target,patient_encounter_id);
      }

    public void BindDirectToListControl(object target)
      {
      db_care_skill_ratings.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_care_skill_ratings.Delete(id);
      }

    public bool Get
      (
      string id,
      out string care_skill_id,
      out string skill_rating_id,
      out string patient_encounter_id
      )
      {
      return db_care_skill_ratings.Get
        (
        id,
        out care_skill_id,
        out skill_rating_id,
        out patient_encounter_id
        );
      }

    public void Set
      (
      string id,
      string care_skill_id,
      string skill_rating_id,
      string patient_encounter_id
      )
      {
      db_care_skill_ratings.Set
        (
        id,
        care_skill_id,
        skill_rating_id,
        patient_encounter_id
        );
      }

    } // end TClass_biz_care_skill_ratings

  }

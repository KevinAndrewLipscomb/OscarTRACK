using Class_db_residents;
using kix;
using System;

namespace Class_biz_residents
  {
    public class TClass_biz_residents
      {

      private TClass_db_residents db_residents = null;
      
      public TClass_biz_residents() : base()
        {
        db_residents = new TClass_db_residents();
        }

      public bool BeExtantId(string id)
        {
        bool result;
        result = db_residents.BeExtantId(id);
        return result;
        }

      internal string FilteredFromSceneVisits
        (
        string scene_visits,
        string love_letter_batch_designator
        )
        {
        return db_residents.FilteredFromSceneVisits(scene_visits,love_letter_batch_designator);
        }

      internal k.int_nonnegative NumForAgency(string agency_id)
        {
        return db_residents.NumForAgency(agency_id);
        }

      internal void ScrubToApplicationStandards()
        {
        db_residents.ScrubToApplicationStandards();
        }

      }

  }

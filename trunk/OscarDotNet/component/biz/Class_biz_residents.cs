using Class_db_residents;
using kix;
using System;
using System.Text.RegularExpressions;

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

      internal void BindDirectToBaseDataList
        (
        string agency,
        string email_address,
        string name,
        string house_num,
        string street_id,
        object target
        )
        {
        db_residents.BindDirectToBaseDataList(agency,email_address,name,house_num,street_id,target);
        }

      internal string FilteredFromSceneVisits
        (
        string scene_visits,
        string love_letter_batch_designator,
        string agency
        )
        {
        var filtered_from_scene_visits = db_residents.FilteredFromSceneVisits(scene_visits,love_letter_batch_designator,agency);
        //
        // When revising this section, also consider making corresponding revisions to Class_biz_field_situations.MapRenditionOf().
        //
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )AR$|(?<prefix> )AR(?<suffix> )",
          replacement:"${prefix}ARCH${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )AV$|(?<prefix> )AV(?<suffix> )",
          replacement:"${prefix}AVE${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )BL$|(?<prefix> )BL(?<suffix> )",
          replacement:"${prefix}BLVD${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )CI$|(?<prefix> )CI(?<suffix> )",
          replacement:"${prefix}CIR${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )CW$|(?<prefix> )CW(?<suffix> )",
          replacement:"${prefix}CAUSEWAY${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )LD$|(?<prefix> )LD(?<suffix> )",
          replacement:"${prefix}LNDG${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )PW$|(?<prefix> )PW(?<suffix> )",
          replacement:"${prefix}PKWY${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )SC$|(?<prefix> )SC(?<suffix> )",
          replacement:"${prefix}SHOPPING CENTER${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )TE$|(?<prefix> )TE(?<suffix> )",
          replacement:"${prefix}TERR${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )TL$|(?<prefix> )TL(?<suffix> )",
          replacement:"${prefix}TRL${suffix}"
          );
        filtered_from_scene_visits = Regex.Replace
          (
          input:filtered_from_scene_visits,
          pattern:"(?<prefix> )WF$|(?<prefix> )WF(?<suffix> )",
          replacement:"${prefix}WHARF${suffix}"
          );
        //
        return filtered_from_scene_visits;
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

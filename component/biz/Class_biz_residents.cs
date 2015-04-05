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
        //
        // First revise the incoming scene_visits list to match USPS standard address abbreviations, to match the way the residents table is maintained.
        //
        //**
        //
        // When revising this section, also consider making corresponding revisions to Class_biz_field_situations.MapRenditionOf() and keyclick user-defined function `NORMALIZED_STREET_SUFFIX_RENDITION`.
        //
        //**
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )AR$|(?<prefix> )AR(?<suffix> )",
          replacement:"${prefix}ARCH${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )AV$|(?<prefix> )AV(?<suffix> )",
          replacement:"${prefix}AVE${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )BL$|(?<prefix> )BL(?<suffix> )",
          replacement:"${prefix}BLVD${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CI$|(?<prefix> )CI(?<suffix> )",
          replacement:"${prefix}CIR${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CW$|(?<prefix> )CW(?<suffix> )",
          replacement:"${prefix}CAUSEWAY${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )LD$|(?<prefix> )LD(?<suffix> )",
          replacement:"${prefix}LNDG${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )PW$|(?<prefix> )PW(?<suffix> )",
          replacement:"${prefix}PKWY${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )SC$|(?<prefix> )SC(?<suffix> )",
          replacement:"${prefix}SHOPPING CENTER${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TE$|(?<prefix> )TE(?<suffix> )",
          replacement:"${prefix}TERR${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TL$|(?<prefix> )TL(?<suffix> )",
          replacement:"${prefix}TRL${suffix}"
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )WF$|(?<prefix> )WF(?<suffix> )",
          replacement:"${prefix}WHARF${suffix}"
          );
        //
        return db_residents.FilteredFromSceneVisits(scene_visits,love_letter_batch_designator,agency);
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

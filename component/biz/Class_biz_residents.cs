using Class_db_residents;
using kix;
using System.Text.RegularExpressions;

namespace Class_biz_residents
  {
  public class TClass_biz_residents
      {

      private readonly TClass_db_residents db_residents = null;
      
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
          replacement:"${prefix}ARCH${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )AV$|(?<prefix> )AV(?<suffix> )",
          replacement:"${prefix}AVE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )BD$|(?<prefix> )BD(?<suffix> )",
          replacement:"${prefix}BND${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )BL$|(?<prefix> )BL(?<suffix> )",
          replacement:"${prefix}BLVD${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CE$|(?<prefix> )CE(?<suffix> )",
          replacement:"${prefix}CRST${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CH$|(?<prefix> )CH(?<suffix> )",
          replacement:"${prefix}CHASE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CI$|(?<prefix> )CI(?<suffix> )",
          replacement:"${prefix}CIR${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CG$|(?<prefix> )CG(?<suffix> )",
          replacement:"${prefix}XING${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CL$|(?<prefix> )CL(?<suffix> )",
          replacement:"${prefix}CLUSTER${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CO$|(?<prefix> )CO(?<suffix> )",
          replacement:"${prefix}CMNS${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CS$|(?<prefix> )CS(?<suffix> )",
          replacement:"${prefix}CLOSE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )CW$|(?<prefix> )CW(?<suffix> )",
          replacement:"${prefix}CAUSEWAY${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )GA$|(?<prefix> )GA(?<suffix> )",
          replacement:"${prefix}GATE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )GR$|(?<prefix> )GR(?<suffix> )",
          replacement:"${prefix}GRN${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )HE$|(?<prefix> )HE(?<suffix> )",
          replacement:"${prefix}HEATH${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )KP$|(?<prefix> )KP(?<suffix> )",
          replacement:"${prefix}KEEP${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )LD$|(?<prefix> )LD(?<suffix> )",
          replacement:"${prefix}LNDG${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )LO$|(?<prefix> )LO(?<suffix> )",
          replacement:"${prefix}LOOP${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )LS$|(?<prefix> )LS(?<suffix> )",
          replacement:"${prefix}LAST${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )MS$|(?<prefix> )MS(?<suffix> )",
          replacement:"${prefix}MUSE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )MW$|(?<prefix> )MW(?<suffix> )",
          replacement:"${prefix}MEWS${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )PA$|(?<prefix> )PA(?<suffix> )",
          replacement:"${prefix}PATH${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )PK$|(?<prefix> )PK(?<suffix> )",
          replacement:"${prefix}PARK${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )PW$|(?<prefix> )PW(?<suffix> )",
          replacement:"${prefix}PKWY${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )QU$|(?<prefix> )QU(?<suffix> )",
          replacement:"${prefix}QUAY${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )RE$|(?<prefix> )RE(?<suffix> )",
          replacement:"${prefix}REACH${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )RI$|(?<prefix> )RI(?<suffix> )",
          replacement:"${prefix}RDG${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )RN$|(?<prefix> )RN(?<suffix> )",
          replacement:"${prefix}RUN${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )SC$|(?<prefix> )SC(?<suffix> )",
          replacement:"${prefix}SHOPPING CENTER${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TE$|(?<prefix> )TE(?<suffix> )",
          replacement:"${prefix}TERR${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TL$|(?<prefix> )TL(?<suffix> )",
          replacement:"${prefix}TRL${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TP$|(?<prefix> )TP(?<suffix> )",
          replacement:"${prefix}TPKE${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )TU$|(?<prefix> )TU(?<suffix> )",
          replacement:"${prefix}TURN${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )WA$|(?<prefix> )WA(?<suffix> )",
          replacement:"${prefix}WALK${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )WD$|(?<prefix> )WD(?<suffix> )",
          replacement:"${prefix}WYND${suffix}",
          options:RegexOptions.Multiline
          );
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:"(?<prefix> )WF$|(?<prefix> )WF(?<suffix> )",
          replacement:"${prefix}WHARF${suffix}",
          options:RegexOptions.Multiline
          );
        //
        scene_visits = Regex.Replace
          (
          input:scene_visits,
          pattern:" HALF ST$",
          replacement:" 1/2 ST",
          options:RegexOptions.Multiline
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

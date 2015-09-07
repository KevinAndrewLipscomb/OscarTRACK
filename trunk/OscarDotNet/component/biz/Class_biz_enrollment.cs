using Class_biz_agencies;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_notifications;
using Class_db_enrollment;
using Class_db_members;
using kix;
using System;
using System.Collections;

namespace Class_biz_enrollment
  {

  public enum filter_type
    {
    ALL,
    CURRENT,
    APPLICANT,
    OPERATIONAL,
    CORE_OPS,
    STANDARD,
    SENIOR,
    TENURED_BLS,
    TENURED_ALS,
    LIFE,
    REGULAR,
    LIBERAL,
    REDUCED,
    ASSOCIATE,
    STAFF,
    ALS_INTERN,
    COLLEGE,
    ATYPICAL,
    NEW_TRAINEE,
    SPECOPS,
    RECRUIT,
    ADMIN,
    TRANSFERRING,
    SUSPENDED,
    PAST,
    WITHDREW_APPLICATION,
    UNKNOWN,
    RESIGNED,
    RETIRED,
    DISABLED,
    DISMISSED,
    DECEASED,
    }

  public class TClass_biz_enrollment
    {

        private TClass_biz_agencies biz_agencies = null;
        private TClass_biz_medical_release_levels biz_medical_release_levels = null;
        private TClass_biz_notifications biz_notifications = null;
        private TClass_db_enrollment db_enrollment = null;
        private TClass_db_members db_members = null;

        public TClass_biz_enrollment() : base()
        {
            biz_agencies = new TClass_biz_agencies();
            biz_medical_release_levels = new TClass_biz_medical_release_levels();
            biz_notifications = new TClass_biz_notifications();
            db_enrollment = new TClass_db_enrollment();
            db_members = new TClass_db_members();
        }

        public bool BeLeaf(filter_type filter)
        {
            bool result;
            result = false;
            if (!(new ArrayList(new filter_type[] {filter_type.ALL, filter_type.CURRENT, filter_type.OPERATIONAL, filter_type.CORE_OPS, filter_type.STANDARD, filter_type.LIBERAL, filter_type.PAST}).Contains(filter)))
            {
                result = true;
            }
            return result;
        }

        public bool BePastDescription(string description)
        {
            bool result;
            result = (description == "Withdrew application") || (description == "Resigned") || (description == "Retired") || (description == "Disabled") || (description == "Unknown") || (description == "Dismissed") || (description == "Deceased");
            return result;
        }

        public void BindMemberHistory(string member_id, object target)
        {
            db_enrollment.BindMemberHistory(member_id, target);
        }

        public void BindTransitionRadioButtonList(string member_id, string tier_id, object target)
        {
            db_enrollment.BindTransitionRadioButtonList(member_id, tier_id, target);
        }

        public void BindUncontrolledListControl(object target)
        {
            db_enrollment.BindUncontrolledListControl(target);
        }

        public string ElaborationOf(string description)
        {
            string result;
            result = db_enrollment.ElaborationOf(description);
            return result;
        }

        public string CodeOf(string description)
        {
            string result;
            result = db_enrollment.CodeOf(description);
            return result;
        }

        public void CurrentDescriptionAndEffectiveDateForMember
          (
          string member_id,
          out string description,
          out DateTime effective_date
          )
          {
          db_enrollment.CurrentDescriptionAndEffectiveDateForMember(member_id, out description, out effective_date);
          }

        public string DescriptionOf(string level_code)
        {
            string result;
            result = db_enrollment.DescriptionOf(level_code);
            return result;
        }

        public void MakeFailureToThriveDemotions()
        {
            TClass_biz_members biz_members;
            uint i;
            string member_id;
            Queue member_id_q;
            biz_members = new TClass_biz_members();
            member_id_q = db_enrollment.FailureToThriveDemotionsSince(db_enrollment.MakeFailureToThriveDemotions());
            uint member_id_q_count = (uint)(member_id_q.Count);
            for (i = 1; i <= member_id_q_count; i ++ )
            {
                member_id = member_id_q.Dequeue().ToString();
                biz_notifications.IssueForFailureToThriveDemotion(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id));
            }
        }

        public void MakeSeniorityPromotions()
        {
            TClass_biz_members biz_members;
            uint i;
            string member_id;
            Queue member_id_q;
            biz_members = new TClass_biz_members();
            member_id_q = db_enrollment.SeniorityPromotionsSince(db_enrollment.MakeSeniorityPromotions());
            uint member_id_q_count = (uint)(member_id_q.Count);
            for (i = 1; i <= member_id_q_count; i ++ )
            {
                member_id = member_id_q.Dequeue().ToString();
                biz_notifications.IssueForSeniorityPromotion(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id), biz_members.EnrollmentOfMemberId(member_id));
            }
        }

    internal void MakeSeniorityPromotionEarlysWarnings()
      {
      var biz_members = new TClass_biz_members();
      //
      var member_id_q = db_enrollment.NearlyPromotableMembers();
      var member_id_q_count = new k.int_nonnegative(member_id_q.Count);
      var member_id = k.EMPTY;
      //
      for (var i = new k.subtype<int>(0,member_id_q_count.val); i.val < member_id_q_count.val; i.val++ )
        {
        member_id = member_id_q.Dequeue().ToString();
        biz_notifications.IssueForSeniorityPromotionEarlyWarning
          (
          member_id:member_id,
          first_name:biz_members.FirstNameOfMemberId(member_id),
          last_name:biz_members.LastNameOfMemberId(member_id),
          cad_num:biz_members.CadNumOfMemberId(member_id),
          current_level:biz_members.EnrollmentOfMemberId(member_id),
          subject_email_address:biz_members.EmailAddressOf(member_id),
          subject_phone_number:k.FormatAsNanpPhoneNum(digits:biz_members.PhoneNumOf(member_id))
          );
        }
      }

    public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object summary, string target_agency_id)
      {
      var set_level = false;
      var first_name = db_members.FirstNameOfMemberId(member_id);
      var last_name = db_members.LastNameOfMemberId(member_id);
      var cad_num = db_members.CadNumOfMemberId(member_id);
      var old_agency_short_designator = db_members.AgencyOf(summary);
      if (db_enrollment.SetLevel(new_level_code, effective_date, note, member_id, summary, target_agency_id))
        {
        set_level = true;
        if (BePastDescription(db_members.EnrollmentOf(summary)))
          {
          db_members.SetOscalertThresholds
            (
            oscalert_threshold_general:k.EMPTY,
            oscalert_threshold_als:k.EMPTY,
            do_clear_subscriptions:true,
            summary:summary
            );
          }
        if (target_agency_id != k.EMPTY)
          {
          var old_agency_medium_designator = biz_agencies.MediumDesignatorOf(biz_agencies.IdOfShortDesignator(old_agency_short_designator));
          var new_agency_medium_designator = biz_agencies.MediumDesignatorOf(target_agency_id);
          if (new_agency_medium_designator != old_agency_medium_designator)
            {
            biz_notifications.IssueForAgencyChange(member_id,first_name,last_name,cad_num,old_agency_medium_designator,new_agency_medium_designator);
            }
          }
        var new_level_description = db_enrollment.DescriptionOf(new_level_code);
        if (new_level_description == "Deceased")
          {
          biz_notifications.IssueForDeath(member_id, first_name, last_name, cad_num, effective_date.ToString("yyyy-MM-dd"), note);
          }
        else
          {
          biz_notifications.IssueForNewEnrollmentLevel(member_id, first_name, last_name, cad_num, new_level_description, effective_date.ToString("yyyy-MM-dd"), note);
          }
        //
        if ((new ArrayList() {"Transferring","Unknown","Resigned","Retired"}).Contains(new_level_description))
          {
          biz_notifications.IssueForElectiveDeparture(member_id, first_name, last_name, cad_num, new_level_description, effective_date.ToString("yyyy-MM-dd"), note);
          }
        }
      return set_level;
      }
    public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object summary)
      {
      return SetLevel(new_level_code,effective_date,note,member_id,summary,k.EMPTY);
      }

    } // end TClass_biz_enrollment

  }

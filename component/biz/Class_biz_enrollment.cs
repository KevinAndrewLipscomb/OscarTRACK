using System;

using System.Collections;
using Class_db_enrollment;
using Class_biz_notifications;
using Class_biz_members;
namespace Class_biz_enrollment
{
    public class TClass_biz_enrollment
    {
        private TClass_db_enrollment db_enrollment = null;
        private TClass_biz_notifications biz_notifications = null;
        //Constructor  Create()
        public TClass_biz_enrollment() : base()
        {
            // TODO: Add any constructor code here
            db_enrollment = new TClass_db_enrollment();
            biz_notifications = new TClass_biz_notifications();
        }
        public bool BeLeaf(filter_type filter)
        {
            bool result;
            result = false;
            if (!(new ArrayList(new filter_type[] {filter_type.ALL, filter_type.CURRENT, filter_type.OPERATIONAL, filter_type.STANDARD_OPS, filter_type.PAST}).Contains(filter)))
            {
                result = true;
            }
            return result;
        }

        public bool BePastDescription(string description)
        {
            bool result;
            result = (description == "Withdrew application") || (description == "Resigned") || (description == "Retired") || (description == "Disabled") || (description == "Unknown") || (description == "Dismissed") || (description == "Died");
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
            for (i = 1; i <= member_id_q.Count; i ++ )
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
            for (i = 1; i <= member_id_q.Count; i ++ )
            {
                member_id = member_id_q.Dequeue().ToString();
                biz_notifications.IssueForSeniorityPromotion(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id), biz_members.EnrollmentOfMemberId(member_id));
            }
        }

        public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object e_item)
        {
            bool result;
            TClass_biz_members biz_members;
            result = false;
            biz_members = new TClass_biz_members();
            if (db_enrollment.SetLevel(new_level_code, effective_date, note, member_id, e_item))
            {
                result = true;
                biz_notifications.IssueForNewEnrollmentLevel(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id), db_enrollment.DescriptionOf(new_level_code), effective_date.ToString("yyyy-MM-dd"), note);
            }

            return result;
        }

    } // end TClass_biz_enrollment

    public enum filter_type
    {
        ALL,
        CURRENT,
        APPLICANT,
        OPERATIONAL,
        STANDARD_OPS,
        TENURED,
        LIFE,
        REGULAR,
        REDUCED,
        ASSOCIATE,
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
    } // end filter_type

}

using System;
using Class_biz_enrollment;
using Class_biz_leaves;
using Class_db_members;
namespace Class_biz_scheduled_tasks
{
    public class TClass_biz_scheduled_tasks
    {
        private TClass_biz_enrollment biz_enrollment = null;
        private TClass_biz_leaves biz_leaves = null;
        private TClass_db_members db_members = null;
        //Constructor  Create()
        public TClass_biz_scheduled_tasks() : base()
        {
            // TODO: Add any constructor code here
            biz_enrollment = new TClass_biz_enrollment();
            biz_leaves = new TClass_biz_leaves();
            db_members = new TClass_db_members();
        }
        public void DoDailyChores()
        {
            biz_enrollment.MakeSeniorityPromotions();
            biz_leaves.MakeLeaveEndingSoonNotifications();
            biz_leaves.MakeLeaveExpirationNotifications();
            biz_enrollment.MakeFailureToThriveDemotions();
        }

        public void DoMemberStatusStatements()
        {
            db_members.MakeMemberStatusStatements();
        }

    } // end TClass_biz_scheduled_tasks

}

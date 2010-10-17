using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_residents;
using Class_db_members;
using System;

namespace Class_biz_scheduled_tasks
{
    public class TClass_biz_scheduled_tasks
    {
        private TClass_biz_enrollment biz_enrollment = null;
        private TClass_biz_leaves biz_leaves = null;
        private TClass_biz_residents biz_residents = null;
        private TClass_db_members db_members = null;

        public TClass_biz_scheduled_tasks() : base()
        {
            biz_enrollment = new TClass_biz_enrollment();
            biz_leaves = new TClass_biz_leaves();
            biz_residents = new TClass_biz_residents();
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

        internal void DoWeeklyChores()
          {
          biz_residents.ScrubToApplicationStandards();
          }

    } // end TClass_biz_scheduled_tasks

}

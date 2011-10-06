using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_residents;
using Class_biz_schedule_assignments;
using Class_db_members;
using OscarDotNet.component.os;

namespace Class_biz_scheduled_tasks
{
    public class TClass_biz_scheduled_tasks
    {
        private TClass_biz_enrollment biz_enrollment = null;
        private TClass_biz_leaves biz_leaves = null;
        private TClass_biz_members biz_members = null;
        private TClass_biz_residents biz_residents = null;
        private TClass_biz_schedule_assignments biz_schedule_assignments = null;
        private TClass_db_members db_members = null;
        private Class_fs fs = null;

        public TClass_biz_scheduled_tasks() : base()
        {
            biz_enrollment = new TClass_biz_enrollment();
            biz_leaves = new TClass_biz_leaves();
            biz_members = new TClass_biz_members();
            biz_residents = new TClass_biz_residents();
            biz_schedule_assignments = new TClass_biz_schedule_assignments();
            db_members = new TClass_db_members();
            fs = new Class_fs();
        }
        public void DoDailyChores(string current_working_directory_spec)
        {
            biz_enrollment.MakeSeniorityPromotions();
            biz_leaves.MakeLeaveEndingSoonNotifications();
            biz_leaves.MakeLeaveExpirationNotifications();
            biz_enrollment.MakeFailureToThriveDemotions();
            biz_members.MakeAvailabilitySubmissionDeadlineRelatedNotifications();
            biz_schedule_assignments.MakeUpcomingDutyNotifications();
            fs.DeleteCondemnedFolders(current_working_directory_spec + "/../protected/attachment");
        }

        internal void DoEndOfMonthChores(string working_directory)
          {
          biz_schedule_assignments.PublishArchivalEndOfMonthWatchbill(working_directory);
          }

        public void DoMemberStatusStatements()
        {
            biz_members.MakeMemberStatusStatements();
        }

        internal void DoWeeklyChores()
          {
          biz_residents.ScrubToApplicationStandards();
          }

    } // end TClass_biz_scheduled_tasks

}

using Class_biz_availabilities;
using Class_biz_cities;
using Class_biz_enrollment;
using Class_biz_evals;
using Class_biz_gripes;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_residents;
using Class_biz_schedule_assignment_logs;
using Class_biz_schedule_assignments;
using Class_biz_states;
using Class_biz_streets;
using OscarDotNet.component.os;

namespace Class_biz_scheduled_tasks
  {

  public class TClass_biz_scheduled_tasks
    {

    private readonly TClass_biz_availabilities biz_availabilities = null;

    private readonly TClass_biz_cities biz_cities = null;
    private readonly TClass_biz_enrollment biz_enrollment = null;
    private readonly TClass_biz_evals biz_evals = null;
    private readonly TClass_biz_gripes biz_gripes = null;
    private readonly TClass_biz_leaves biz_leaves = null;
    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_residents biz_residents = null;
    private readonly TClass_biz_schedule_assignments biz_schedule_assignments = null;
    private readonly TClass_biz_schedule_assignment_logs biz_schedule_assignment_logs = null;
    private readonly TClass_biz_states biz_states = null;
    private readonly TClass_biz_streets biz_streets = null;
    private readonly Class_fs fs = null;

    public TClass_biz_scheduled_tasks() : base()
      {
      biz_availabilities = new TClass_biz_availabilities();
      biz_cities = new TClass_biz_cities();
      biz_enrollment = new TClass_biz_enrollment();
      biz_evals = new TClass_biz_evals();
      biz_gripes = new TClass_biz_gripes();
      biz_leaves = new TClass_biz_leaves();
      biz_members = new TClass_biz_members();
      biz_residents = new TClass_biz_residents();
      biz_schedule_assignments = new TClass_biz_schedule_assignments();
      biz_schedule_assignment_logs = new TClass_biz_schedule_assignment_logs();
      biz_states = new TClass_biz_states();
      biz_streets = new TClass_biz_streets();
      fs = new Class_fs();
      }

    internal void DoAvailSubmissionDeadlineChores()
      {
      biz_schedule_assignments.LogAvailabilitySubmissionComplianceData();
      }

    public void DoDailyChores(string current_working_directory_spec)
      {
      biz_enrollment.MakeSeniorityPromotionEarlyWarnings();
      biz_enrollment.MakeSeniorityPromotions();
      biz_enrollment.IssueDeparturesEffectiveTodayReport(current_working_directory_spec);
      biz_leaves.MakeLeaveEndingSoonNotifications();
      biz_leaves.MakeLeaveExpirationNotifications();
      biz_enrollment.MakeFailureToThriveDemotions();
      biz_members.MakeAvailabilitySubmissionDeadlineRelatedNotifications();
      biz_schedule_assignments.MakeUpcomingDutyNotifications();
      biz_evals.ManageStalled(current_working_directory_spec);
      biz_gripes.ManageStalled();
      fs.DeleteCondemnedFolders(current_working_directory_spec + "/../protected/attachment");
      fs.DeleteCondemnedFolders(current_working_directory_spec + "/../pub/attachment");
      }

    internal void DoEndOfMonthChores(string working_directory)
      {
      biz_schedule_assignments.PublishEndOfMonthAuditReport(working_directory);
      biz_schedule_assignment_logs.PublishEndOfMonthTapOutReport(working_directory);
      biz_schedule_assignments.PublishArchivalEndOfMonthWatchbill(working_directory);
      biz_schedule_assignments.LogCommensurationData();
      }

    internal void DoFirstOfMonthChores()
      {
      biz_leaves.KeepMedicalsExtendedIntoNextMonth();
      }

    public void DoMemberStatusStatements()
      {
      biz_members.MakeMemberStatusStatements();
      }

    internal void DoMonthlyChores()
      {
      biz_availabilities.Purge();
      biz_schedule_assignments.Purge();
      }

    internal void DoWeeklyChores()
      {
      biz_residents.ScrubToApplicationStandards();
      biz_streets.Prune();
      biz_cities.Prune();
      biz_states.Prune();
      }

    } // end TClass_biz_scheduled_tasks

  }
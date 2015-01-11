// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_schedule_assignment_logs;
using kix;

namespace Class_biz_schedule_assignment_logs
  {
  public class TClass_biz_schedule_assignment_logs
    {
    private TClass_db_schedule_assignment_logs db_schedule_assignment_logs = null;

    public TClass_biz_schedule_assignment_logs() : base()
      {
      db_schedule_assignment_logs = new TClass_db_schedule_assignment_logs();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_schedule_assignment_logs.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name,
      object target,
      string days_old
      )
      {
      db_schedule_assignment_logs.BindBaseDataList(relative_month,nominal_day_filter,shift_name,target,days_old);
      }

    public void BindDirectToListControl(object target)
      {
      db_schedule_assignment_logs.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_schedule_assignment_logs.Delete(id);
      }

    internal void Enter
      (
      string assignment_id,
      string action
      )
      {
      db_schedule_assignment_logs.Enter(assignment_id,action);
      }

    public bool Get
      (
      string id,
      out string assignment_id,
      out string timestamp,
      out string actor_member_id,
      out string action
      )
      {
      return db_schedule_assignment_logs.Get
        (
        id,
        out assignment_id,
        out timestamp,
        out actor_member_id,
        out action
        );
      }

    public void Set
      (
      string id,
      string assignment_id,
      string timestamp,
      string actor_member_id,
      string action
      )
      {
      db_schedule_assignment_logs.Set
        (
        id,
        assignment_id,
        timestamp,
        actor_member_id,
        action
        );
      }

    internal object Summary(string id)
      {
      return db_schedule_assignment_logs.Summary(id);
      }

    } // end TClass_biz_schedule_assignment_logs

  }

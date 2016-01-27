// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_role_member_map_logs;
using kix;

namespace Class_biz_role_member_map_logs
  {
  public class TClass_biz_role_member_map_logs
    {
    private TClass_db_role_member_map_logs db_role_member_map_logs = null;

    public TClass_biz_role_member_map_logs() : base()
      {
      db_role_member_map_logs = new TClass_db_role_member_map_logs();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_role_member_map_logs.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string subject_member_id
      )
      {
      db_role_member_map_logs.BindBaseDataList(sort_order,be_sort_order_ascending,target,subject_member_id);
      }

    public void BindDirectToListControl(object target)
      {
      db_role_member_map_logs.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_role_member_map_logs.Delete(id);
      }

    internal void Enter
      (
      string subject_member_id,
      bool be_granted,
      string role_id
      )
      {
      db_role_member_map_logs.Enter(subject_member_id,be_granted,role_id);
      }

    public bool Get
      (
      string id,
      out string subject_member_id,
      out string timestamp,
      out string actor_member_id,
      out bool be_granted,
      out string role_id
      )
      {
      return db_role_member_map_logs.Get
        (
        id,
        out subject_member_id,
        out timestamp,
        out actor_member_id,
        out be_granted,
        out role_id
        );
      }

    public void Set
      (
      string id,
      string subject_member_id,
      string timestamp,
      string actor_member_id,
      bool be_granted,
      string role_id
      )
      {
      db_role_member_map_logs.Set
        (
        id,
        subject_member_id,
        timestamp,
        actor_member_id,
        be_granted,
        role_id
        );
      }

    internal object Summary(string id)
      {
      return db_role_member_map_logs.Summary(id);
      }

    } // end TClass_biz_role_member_map_logs

  }

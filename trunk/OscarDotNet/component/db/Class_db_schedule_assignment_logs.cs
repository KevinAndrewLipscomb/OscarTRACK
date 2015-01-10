// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_biz_members;
using Class_biz_user;
using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_schedule_assignment_logs
  {
  public class TClass_db_schedule_assignment_logs: TClass_db
    {
    private class schedule_assignment_log_summary
      {
      public string id;
      }

    private TClass_biz_members biz_members = null;
    private TClass_biz_user  biz_user = null;
    private TClass_db_trail db_trail = null;

    public TClass_db_schedule_assignment_logs() : base()
      {
      biz_members = new TClass_biz_members();
      biz_user = new TClass_biz_user();
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(assignment_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(action,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from schedule_assignment_log"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string assignment_id
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select schedule_assignment_log.id as id"
        + " , DATE_FORMAT(timestamp,'%Y-%m-%d %H:%i:%s') as timestamp"
        + " , CONCAT(last_name,', ',first_name,' (',LPAD(certification_number,6,'0'),')') as actor"
        + " , action"
        + " from schedule_assignment_log"
        +   " join member on (member.id=schedule_assignment_log.actor_member_id)"
        + " where assignment_id = '" + assignment_id + "'"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(assignment_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(action,'-')) USING utf8) as spec"
        + " FROM schedule_assignment_log"
        + " order by spec",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from schedule_assignment_log where id = '" + id + "'"), connection).ExecuteNonQuery();
        }
      catch(System.Exception e)
        {
        if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
          {
          result = false;
          }
        else
          {
          throw e;
          }
        }
      Close();
      return result;
      }

    internal void Enter
      (
      string assignment_id,
      string action
      )
      {
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert schedule_assignment_log"
          + " set assignment_id = NULLIF('" + assignment_id + "','')"
          + " , actor_member_id = NULLIF('" + biz_members.IdOfUserId(biz_user.IdNum()) + "','')"
          + " , action = NULLIF('" + action + "','')"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
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
      assignment_id = k.EMPTY;
      timestamp = k.EMPTY;
      actor_member_id = k.EMPTY;
      action = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from schedule_assignment_log where CAST(id AS CHAR) = '" + id + "'", connection).ExecuteReader();
      if (dr.Read())
        {
        assignment_id = dr["assignment_id"].ToString();
        timestamp = dr["timestamp"].ToString();
        actor_member_id = dr["actor_member_id"].ToString();
        action = dr["action"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
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
      var childless_field_assignments_clause = k.EMPTY
      + "assignment_id = NULLIF('" + assignment_id.ToString() + "','')"
      + " , timestamp = NULLIF('" + timestamp + "','')"
      + " , actor_member_id = NULLIF('" + actor_member_id + "','')"
      + " , action = NULLIF('" + action + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"schedule_assignment_log",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal object Summary(string id)
      {
      Open();
      var dr =
        (
        new MySqlCommand
          (
          "SELECT *"
          + " FROM schedule_assignment_log"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new schedule_assignment_log_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_schedule_assignment_logs

  }

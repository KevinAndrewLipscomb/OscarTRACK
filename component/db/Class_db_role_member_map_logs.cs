// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_biz_members;
using Class_biz_user;
using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_role_member_map_logs
  {
  public class TClass_db_role_member_map_logs: TClass_db
    {
    private class role_member_map_log_summary
      {
      public string id;
      }

    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_user  biz_user = null;
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_role_member_map_logs() : base()
      {
      biz_members = new TClass_biz_members();
      biz_user = new TClass_biz_user();
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(subject_member_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(role.name,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from role_member_map_log"
        +   " join role on (role.id=role_member_map_log.role_id)"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
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
      string subject_member_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT be_granted"
        + " , role.name as role"
        + " , concat(actor.first_name,' ',actor.last_name) as actor"
        + " , DATE_FORMAT(timestamp,'%Y-%m-%d %H:%i:%s') as at"
        + " FROM role_member_map_log"
        +   " left join member actor on (actor.id=role_member_map_log.actor_member_id)"
        +   " join role on (role.id=role_member_map_log.role_id)"
        + " where subject_member_id = '" + subject_member_id + "'"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(subject_member_id,'-'),'|',IFNULL(timestamp,'-'),'|',IFNULL(actor_member_id,'-'),'|',IFNULL(role.name,'-')) USING utf8) as spec"
        + " FROM role_member_map_log"
        +   " join role on (role.id=role_member_map_log.role_id)"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from role_member_map_log where id = '" + id + "'"), connection);
        my_sql_command.ExecuteNonQuery();
        }
      catch(System.Exception e)
        {
        if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
          {
          result = false;
          }
        else
          {
          throw;
          }
        }
      Close();
      return result;
      }

    internal void Enter
      (
      string subject_member_id,
      bool be_granted,
      string role_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert role_member_map_log"
          + " set subject_member_id = NULLIF('" + subject_member_id + "','')"
          + " , actor_member_id = NULLIF('" + biz_members.IdOfUserId(biz_user.IdNum()) + "','')"
          + " , be_granted = " + be_granted.ToString()
          + " , role_id = '" + role_id + "'"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
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
      subject_member_id = k.EMPTY;
      timestamp = k.EMPTY;
      actor_member_id = k.EMPTY;
      be_granted = false;
      role_id = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from role_member_map_log where CAST(id AS CHAR) = '" + id + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        subject_member_id = dr["subject_member_id"].ToString();
        timestamp = dr["timestamp"].ToString();
        actor_member_id = dr["actor_member_id"].ToString();
        be_granted = (dr["be_granted"].ToString() == "1");
        role_id = dr["role_id"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
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
      var childless_field_assignments_clause = k.EMPTY
      + "subject_member_id = NULLIF('" + subject_member_id.ToString() + "','')"
      + " , timestamp = NULLIF('" + timestamp + "','')"
      + " , actor_member_id = NULLIF('" + actor_member_id + "','')"
      + " , be_granted = " + be_granted.ToString()
      + " , role_id = '" + role_id + "'"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"role_member_map_log",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM role_member_map_log"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new role_member_map_log_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_role_member_map_logs

  }

// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_tapouts
  {
  public class TClass_db_tapouts: TClass_db
    {
    private class tapout_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_tapouts() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(expected_start,'-'),'|',IFNULL(comment,'-'),'|',IFNULL(timestamp,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from tapout"
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
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select tapout.id as id"
        + " from tapout",
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
        + " , CONVERT(concat(IFNULL(expected_start,'-'),'|',IFNULL(comment,'-'),'|',IFNULL(timestamp,'-')) USING utf8) as spec"
        + " FROM tapout"
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
        new MySqlCommand(db_trail.Saved("delete from tapout where id = \"" + id + "\""), connection).ExecuteNonQuery();
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

    public bool Get
      (
      string id,
      out string member_id,
      out DateTime expected_start,
      out string comment,
      out string hours_warning,
      out string actor_member_id,
      out DateTime actor_timestamp
      )
      {
      member_id = k.EMPTY;
      expected_start = DateTime.MinValue;
      comment = k.EMPTY;
      hours_warning = k.EMPTY;
      actor_member_id = k.EMPTY;
      actor_timestamp = DateTime.MinValue;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from tapout where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        member_id = dr["member_id"].ToString();
        expected_start = DateTime.Parse(dr["expected_start"].ToString());
        comment = dr["comment"].ToString();
        hours_warning = dr["hours_warning"].ToString();
        actor_member_id = dr["actor_member_id"].ToString();
        actor_timestamp = DateTime.Parse(dr["actor_timestamp"].ToString());
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string member_id,
      DateTime expected_start,
      string comment,
      string hours_warning,
      string actor_member_id,
      DateTime actor_timestamp
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "member_id = NULLIF('" + member_id + "','')"
      + " , expected_start = NULLIF('" + expected_start.ToString("yyyy-MM-dd HH:mm") + "','')"
      + " , comment = NULLIF('" + comment + "','')"
      + " , hours_warning = NULLIF('" + hours_warning + "','')"
      + " , actor_member_id = NULLIF('" + actor_member_id + "','')"
      + " , actor_timestamp = NULLIF('" + actor_timestamp.ToString("yyyy-MM-dd HH:mm") + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"tapout",
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
          + " FROM tapout"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new tapout_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_tapouts

  }

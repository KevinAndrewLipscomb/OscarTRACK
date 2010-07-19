// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_mini_fix_requests
  {
  public class TClass_db_mini_fix_requests: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_mini_fix_requests() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind
      (
      string vehicle_id,
      string partial_spec,
      object target
      )
      {
      var concat_clause = "concat(IFNULL(description,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from mini_fix_request"
        + " where vehicle_id = '" + vehicle_id + "'"
        +   " and " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl
      (
      string vehicle_id,
      object target
      )
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(description,'-')) USING utf8) as spec"
        + " FROM mini_fix_request"
        + " where vehicle_id = '" + vehicle_id + "'"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      }

    internal void BindLog
      (
      string vehicle_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      if (be_sort_order_ascending)
        {
        sort_order = sort_order.Replace("%", " asc");
        }
      else
        {
        sort_order = sort_order.Replace("%", " desc");
        }
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select mini_fix_request.id as id"
        + " , description"
        + " from mini_fix_request"
        +   " join vehicle on (vehicle.id=mini_fix_request.vehicle_id)"
        + " where vehicle_id = '" + vehicle_id + "'"
        + " order by " + sort_order,
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from mini_fix_request where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      this.Close();
      return result;
      }

    public bool Get
      (
      string id,
      out string vehicle_name,
      out string description
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      vehicle_name = k.EMPTY;
      description = k.EMPTY;
      result = false;
      //
      Open();
      dr = new MySqlCommand
        (
        "select name"
        + " , description"
        + " from mini_fix_request"
        +   " join vehicle on (vehicle.id=mini_fix_request.vehicle_id)"
        + " where CAST(mini_fix_request.id AS CHAR) = '" + id + "'",
        connection
        )
        .ExecuteReader();
      if (dr.Read())
        {
        vehicle_name = dr["name"].ToString();
        description = dr["description"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Replace
      (
      string id,
      string replacement_note
      )
      {
      Open();
      new MySqlCommand(db_trail.Saved("update mini_fix_request set description = '" + replacement_note + "' where id = '" + id + "'"),connection).ExecuteNonQuery();
      Close();
      }

    public void Set
      (
      string id,
      string vehicle_name,
      string description
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "vehicle_id = NULLIF((select id from vehicle where name = '" + vehicle_name + "'),'')"
      + " , description = NULLIF('" + description + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert mini_fix_request"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          this.connection
        )
        .ExecuteNonQuery();
      this.Close();
      }

    } // end TClass_db_mini_fix_requests

  }

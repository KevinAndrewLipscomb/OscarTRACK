// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_gripes
  {
  public class TClass_db_gripes: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_gripes() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool BeVehicleLogEmpty(string vehicle_id)
      {
      Open();
      var be_vehicle_log_empty = ("0" == new MySqlCommand("select count(*) from gripe where vehicle_id = '" + vehicle_id + "'",connection).ExecuteScalar().ToString());
      Close();
      return be_vehicle_log_empty;
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
        + " from gripe"
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
        + " FROM gripe"
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
        "select gripe.id as id"
        + " , description"
        + " from gripe"
        +   " join vehicle on (vehicle.id=gripe.vehicle_id)"
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
        new MySqlCommand(db_trail.Saved("delete from gripe where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
        + " from gripe"
        +   " join vehicle on (vehicle.id=gripe.vehicle_id)"
        + " where CAST(gripe.id AS CHAR) = '" + id + "'",
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

    internal void VehicleLog
      (
      string vehicle_id,
      ref Queue id_q,
      ref Queue description_q
      )
      {
      id_q = new Queue();
      description_q = new Queue();
      Open();
      var dr = new MySqlCommand
        (
        "select id,description from gripe where vehicle_id = '" + vehicle_id + "' order by id",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        id_q.Enqueue(dr["id"].ToString());
        description_q.Enqueue(dr["description"].ToString());
        }
      dr.Close();
      Close();
      }

    public void Replace
      (
      string id,
      string replacement_note
      )
      {
      Open();
      new MySqlCommand(db_trail.Saved("update gripe set description = '" + replacement_note + "' where id = '" + id + "'"),connection).ExecuteNonQuery();
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
          "insert gripe"
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

    } // end TClass_db_gripes

  }

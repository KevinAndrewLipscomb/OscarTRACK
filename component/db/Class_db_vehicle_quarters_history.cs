// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_vehicle_quarters_history
  {
  public class TClass_db_vehicle_quarters_history: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_vehicle_quarters_history() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool BeLater
      (
      string vehicle_id,
      DateTime proposed_datetime
      )
      {
      var be_later = true;
      Open();
      var max_start_datetime = new MySqlCommand
        (
        "select DATE_FORMAT(max(start_datetime),'%Y-%m-%d %H:%i') as max_start_datetime from vehicle_quarters_history where vehicle_id = '" + vehicle_id + "'",
        connection
        )
        .ExecuteScalar();
      if (max_start_datetime != DBNull.Value)
        {
        be_later = (DateTime.Parse(max_start_datetime.ToString()) < proposed_datetime);
        }
      Close();
      return be_later;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(start_datetime,'-'),'|',IFNULL(end_datetime,'-'),'|',IFNULL(note,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from vehicle_quarters_history"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
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

    public void BindDirectToListControl(object target)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(start_datetime,'-'),'|',IFNULL(end_datetime,'-'),'|',IFNULL(note,'-')) USING utf8) as spec"
        + " FROM vehicle_quarters_history"
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

    public void BindVehicleRecords
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
      ((target) as DataGrid).DataSource = new MySqlCommand
        (
        "select vehicle_quarters_history.id as id"
        + " , vehicle_quarters.medium_designator as designator"
        + " , date_format(start_datetime,'%Y-%m-%d %H:%i') as start_datetime"
        + " , date_format(end_datetime,'%Y-%m-%d %H:%i') as end_datetime"
        + " , note"
        + " , TIMEDIFF(IFNULL(end_datetime,NOW()),start_datetime) as duration"
        + " from vehicle_quarters_history"
        +   " join vehicle on (vehicle.id=vehicle_quarters_history.vehicle_id)"
        +   " join vehicle_quarters on (vehicle_quarters.id=vehicle_quarters_history.quarters_id)"
        + " where vehicle_id = " + vehicle_id
        + " order by " + sort_order,
        connection
        )
        .ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    public void Change
      (
      string vehicle_id,
      string quarters_id,
      DateTime effective_datetime,
      string mileage,
      string note
      )
      {
      var sql = "START TRANSACTION"
      + "; "
      + "update vehicle_quarters_history"
      + " set end_datetime = '" + effective_datetime.ToString("yyyy-MM-dd HH:mm") + "'"
      + " where vehicle_id = '" + vehicle_id + "'"
      +   " and end_datetime is null"
      + "; "
      + "insert vehicle_quarters_history"
      + " set vehicle_id = '" + vehicle_id + "'"
      + " , quarters_id = '" + quarters_id + "'"
      + " , start_datetime = '" + effective_datetime.ToString("yyyy-MM-dd HH:mm") + "'"
      + " , note = NULLIF('" + note + "','')"
      + "; ";
      if (mileage != k.EMPTY)
        {
        sql += "update vehicle set recent_mileage = '" + mileage + "' where id = '" + vehicle_id + "'; ";
        }
      sql += "COMMIT";
      Open();
      new MySqlCommand(db_trail.Saved(sql),connection).ExecuteNonQuery();
      Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from vehicle_quarters_history where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      out string vehicle_id,
      out string quarters_id,
      out DateTime start_datetime,
      out DateTime end_datetime,
      out string note
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      vehicle_id = k.EMPTY;
      quarters_id = k.EMPTY;
      start_datetime = DateTime.MinValue;
      end_datetime = DateTime.MinValue;
      note = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from vehicle_quarters_history where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        vehicle_id = dr["vehicle_id"].ToString();
        quarters_id = dr["quarters_id"].ToString();
        start_datetime = DateTime.Parse(dr["start_datetime"].ToString());
        end_datetime = DateTime.Parse(dr["end_datetime"].ToString());
        note = dr["note"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public string IdOfCurrent(string vehicle_id)
      {
      var id_of_current = k.EMPTY;
      Open();
      var obj = new MySqlCommand("select quarters_id from vehicle_quarters_history where vehicle_id = '" + vehicle_id + "' and end_datetime is null",connection).ExecuteScalar();
      Close();
      if (obj != null)
        {
        id_of_current = obj.ToString();
        }
      return id_of_current;
      }

    public void Set
      (
      string id,
      string vehicle_id,
      string quarters_id,
      DateTime start_datetime,
      DateTime end_datetime,
      string note
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "vehicle_id = NULLIF('" + vehicle_id + "','')"
      + " , quarters_id = NULLIF('" + quarters_id + "','')"
      + " , start_datetime = NULLIF('" + start_datetime.ToString() + "','')"
      + " , end_datetime = NULLIF('" + end_datetime.ToString() + "','')"
      + " , note = NULLIF('" + note + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle_quarters_history"
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

    } // end TClass_db_vehicle_quarters_history

  }

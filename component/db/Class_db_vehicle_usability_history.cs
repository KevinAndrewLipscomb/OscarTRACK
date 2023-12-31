// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_vehicle_usability_history
  {
  public class TClass_db_vehicle_usability_history: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_vehicle_usability_history() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool BeLater
      (
      string id,
      DateTime proposed_datetime
      )
      {
      var be_later = true;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select DATE_FORMAT(max(time_went_down),'%Y-%m-%d %H:%i') as max_time_went_down from vehicle_usability_history where vehicle_id = '" + id + "'",
        connection
        );
      var max_time_went_down = my_sql_command.ExecuteScalar();
      if (max_time_went_down != DBNull.Value)
        {
        be_later = (DateTime.Parse(max_time_went_down.ToString()) < proposed_datetime);
        }
      Close();
      return be_later;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(time_went_down,'-'),'|',IFNULL(mileage,'-'),'|',IFNULL(time_came_up,'-'),'|',IFNULL(down_comment,'-'),'|',IFNULL(up_comment,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from vehicle_usability_history"
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
      using var my_sql_command = new MySqlCommand
        (
        "select vehicle_usability_history.id as id"
        + " , nature_id"
        + " , vehicle_down_nature.name as nature_name"
        + " , date_format(time_went_down,'%Y-%m-%d %H:%i') as time_went_down"
        + " , mileage"
        + " , down_comment"
        + " , date_format(time_came_up,'%Y-%m-%d %H:%i') as time_came_up"
        + " , up_comment"
        + " , @duration_minutes := TIMESTAMPDIFF(MINUTE,time_went_down,IFNULL(time_came_up,NOW()))"
        + " , @duration_days := @duration_minutes DIV 1440"
        + " , @duration_minutes := @duration_minutes MOD 1440"
        + " , @duration_hours := @duration_minutes DIV 60"
        + " , @duration_minutes := @duration_minutes MOD 60"
        + " , concat(LPAD(@duration_days,7,'0'),'.',LPAD(@duration_hours,2,'0'),':',LPAD(@duration_minutes,2,'0')) as duration"
        + " from vehicle_usability_history"
        +   " join vehicle on (vehicle.id=vehicle_usability_history.vehicle_id)"
        +   " join vehicle_down_nature on (vehicle_down_nature.id=vehicle_usability_history.nature_id)"
        + " where vehicle_id = " + vehicle_id
        + " order by " + sort_order,
        connection
        );
      ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(time_went_down,'-'),'|',IFNULL(mileage,'-'),'|',IFNULL(time_came_up,'-'),'|',IFNULL(down_comment,'-'),'|',IFNULL(up_comment,'-')) USING utf8) as spec"
        + " FROM vehicle_usability_history"
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
      bool result;
      result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from vehicle_usability_history where id = \"" + id + "\""), connection);
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

    public bool Get
      (
      string id,
      out string vehicle_id,
      out DateTime time_went_down,
      out string nature_id,
      out string mileage,
      out DateTime time_came_up,
      out string down_comment,
      out string up_comment
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      vehicle_id = k.EMPTY;
      time_went_down = DateTime.MinValue;
      nature_id = k.EMPTY;
      mileage = k.EMPTY;
      time_came_up = DateTime.MinValue;
      down_comment = k.EMPTY;
      up_comment = k.EMPTY;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from vehicle_usability_history where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        vehicle_id = dr["vehicle_id"].ToString();
        time_went_down = DateTime.Parse(dr["time_went_down"].ToString());
        nature_id = dr["nature_id"].ToString();
        mileage = dr["mileage"].ToString();
        time_came_up = DateTime.Parse(dr["time_came_up"].ToString());
        down_comment = dr["down_comment"].ToString();
        up_comment = dr["up_comment"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string LatestDownComment(string vehicle_id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select IFNULL(down_comment,'') from vehicle_usability_history where vehicle_id = '" + vehicle_id + "' and time_came_up is null",connection);
      var latest_down_comment = (my_sql_command.ExecuteScalar() ?? k.EMPTY).ToString();
      Close();
      return latest_down_comment;
      }

    public void ReplaceDownNote
      (
      string vehicle_id,
      string replacement_note
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved("update vehicle_usability_history set down_comment = '" + replacement_note + "' where vehicle_id = '" + vehicle_id + "' and time_came_up is null"),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public void Set
      (
      string id,
      string vehicle_id,
      DateTime time_went_down,
      string nature_id,
      string mileage,
      DateTime time_came_up,
      string down_comment,
      string up_comment
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "vehicle_id = NULLIF('" + vehicle_id + "','')"
      + " , time_went_down = NULLIF('" + time_went_down.ToString("yyyy-MM-dd HH:mm") + "','')"
      + " , nature_id = NULLIF('" + nature_id + "','')"
      + " , mileage = NULLIF('" + mileage + "','')"
      + " , time_came_up = NULLIF('" + time_came_up.ToString("yyyy-MM-dd HH:mm") + "','')"
      + " , down_comment = NULLIF('" + down_comment + "','')"
      + " , up_comment = NULLIF('" + up_comment + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle_usability_history"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          connection
          );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_vehicle_usability_history

  }

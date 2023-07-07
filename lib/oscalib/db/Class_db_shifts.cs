// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_shifts
  {
  public class TClass_db_shifts: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_shifts() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool BeInDayShift(TimeSpan time_of_day)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select IF(@t between start and end,1,0) from (select @t := '" + time_of_day.ToString("hh':'mm") + "') as init,shift where name = 'DAY'",
        connection
        );
      var be_now_day_shift = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_now_day_shift;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(start,'-'),'|',IFNULL(end,'-'),'|',IFNULL(name,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from shift"
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

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(start,'-'),'|',IFNULL(end,'-'),'|',IFNULL(name,'-')) USING utf8) as spec"
        + " FROM shift"
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

    public void BindDirectToListControlByPeckingOrder(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      ((target) as ListControl).Items.Add(new ListItem("-- Shift --",k.EMPTY));
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , concat(name,' (',TIME_FORMAT(start,'%H%i'),'-',TIME_FORMAT(end,'%H%i'),')') as spec"
        + " FROM shift"
        + " order by pecking_order",
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from shift where id = \"" + id + "\""), connection);
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

    public string EndHHofName(string name)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select TIME_FORMAT(end,'%H') from shift where name = '" + name + "'",connection);
      var end_hh_of_name = my_sql_command.ExecuteScalar().ToString();
      Close();
      return end_hh_of_name;
      }

    public bool Get
      (
      string id,
      out DateTime start,
      out DateTime end,
      out string name,
      out string pecking_order
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      start = DateTime.MinValue;
      end = DateTime.MinValue;
      name = k.EMPTY;
      pecking_order = k.EMPTY;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from shift where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        start = DateTime.Parse(dr["start"].ToString());
        end = DateTime.Parse(dr["end"].ToString());
        name = dr["name"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string IdOfName(string name)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select id from shift where name = '" + name + "'",connection);
      var id_obj = my_sql_command.ExecuteScalar();
      Close();
      return (id_obj == null ? k.EMPTY : id_obj.ToString());
      }

    public string NameOf(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select name from shift where id = '" + id + "'",connection);
      var name_of = my_sql_command.ExecuteScalar().ToString();
      Close();
      return name_of;
      }

    public void Set
      (
      string id,
      DateTime start,
      DateTime end,
      string name,
      string pecking_order
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "start = NULLIF('" + start.ToString() + "','')"
      + " , end = NULLIF('" + end.ToString() + "','')"
      + " , name = NULLIF('" + name + "','')"
      + " , pecking_order = NULLIF('" + pecking_order + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert shift"
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

    public string StartHHofName(string name)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select TIME_FORMAT(start,'%H') from shift where name = '" + name + "'",connection);
      var start_hh_of_name = my_sql_command.ExecuteScalar().ToString();
      Close();
      return start_hh_of_name;
      }

    } // end TClass_db_shifts

  }

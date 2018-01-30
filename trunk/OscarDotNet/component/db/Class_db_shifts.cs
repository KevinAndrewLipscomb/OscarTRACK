// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_shifts
  {
  public class TClass_db_shifts: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_shifts() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool BeInDayShift(TimeSpan time_of_day)
      {
      Open();
      var be_now_day_shift = "1" == new MySqlCommand
        (
        "select IF(@t between start and end,1,0) from (select @t := '" + time_of_day.ToString("hh':'mm") + "') as init,shift where name = 'DAY'",
        connection
        )
        .ExecuteScalar().ToString();
      Close();
      return be_now_day_shift;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(start,'-'),'|',IFNULL(end,'-'),'|',IFNULL(name,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from shift"
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
        + " , CONVERT(concat(IFNULL(start,'-'),'|',IFNULL(end,'-'),'|',IFNULL(name,'-')) USING utf8) as spec"
        + " FROM shift"
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

    internal void BindDirectToListControlByPeckingOrder(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      ((target) as ListControl).Items.Add(new ListItem("-- Shift --",k.EMPTY));
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , concat(name,' (',TIME_FORMAT(start,'%H%i'),'-',TIME_FORMAT(end,'%H%i'),')') as spec"
        + " FROM shift"
        + " order by pecking_order",
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
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from shift where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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

    internal string EndHHofName(string name)
      {
      Open();
      var end_hh_of_name = new MySqlCommand("select TIME_FORMAT(end,'%H') from shift where name = '" + name + "'",connection).ExecuteScalar().ToString();
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
      this.Open();
      dr = new MySqlCommand("select * from shift where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        start = DateTime.Parse(dr["start"].ToString());
        end = DateTime.Parse(dr["end"].ToString());
        name = dr["name"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    internal string IdOfName(string name)
      {
      Open();
      var id_obj = new MySqlCommand("select id from shift where name = '" + name + "'",connection).ExecuteScalar();
      Close();
      return (id_obj == null ? k.EMPTY : id_obj.ToString());
      }

    internal string NameOf(string id)
      {
      Open();
      var name_of = new MySqlCommand("select name from shift where id = '" + id + "'",connection).ExecuteScalar().ToString();
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
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert shift"
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

    internal string StartHHofName(string name)
      {
      Open();
      var start_hh_of_name = new MySqlCommand("select TIME_FORMAT(start,'%H') from shift where name = '" + name + "'",connection).ExecuteScalar().ToString();
      Close();
      return start_hh_of_name;
      }

    } // end TClass_db_shifts

  }

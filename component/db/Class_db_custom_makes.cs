// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_custom_makes
  {
  public class TClass_db_custom_makes: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_custom_makes() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      bool result;
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(concat(IFNULL(name,'-')) USING utf8) as spec"
        + " from custom_make"
        + " where concat(IFNULL(name,'-')) like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        );
      dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      result = ((target) as ListControl).Items.Count > 0;
      return result;
      }

    public void BindDirectToListControl(object target)
      {
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(name,'-')) USING utf8) as spec"
        + " FROM custom_make"
        + " order by spec",
        connection
        );
      dr = my_sql_command.ExecuteReader();
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from custom_make where id = \"" + id + "\""), connection);
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
      out string name
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      name = k.EMPTY;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from custom_make where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string name
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " name = NULLIF('" + name + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert custom_make"
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

    } // end TClass_db_custom_makes

  }

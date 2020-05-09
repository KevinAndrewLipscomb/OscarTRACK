// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_fuels
  {
  public class TClass_db_fuels: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_fuels() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      bool result;
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(concat(IFNULL(description,'-')) USING utf8) as spec"
        + " from fuel"
        + " where concat(IFNULL(description,'-')) like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        this.connection
        );
      dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      result = ((target) as ListControl).Items.Count > 0;
      return result;
      }

    public void BindDirectToListControl(object target)
      {
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(description,'-')) USING utf8) as spec"
        + " FROM fuel"
        + " order by spec",
        this.connection
        );
      dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from fuel where id = \"" + id + "\""), this.connection);
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
          throw e;
          }
        }
      this.Close();
      return result;
      }

    internal string DescriptionOf(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("SELECT CONVERT(concat(IFNULL(description,'-')) USING utf8) FROM fuel where id = '" + id + "'",connection);
      var description_of_obj = my_sql_command.ExecuteScalar();
      Close();
      return (description_of_obj == null ? k.EMPTY : description_of_obj.ToString());
      }

    public bool Get
      (
      string id,
      out string description
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      description = k.EMPTY;
      result = false;
      //
      this.Open();
      using var my_sql_command = new MySqlCommand("select * from fuel where CAST(id AS CHAR) = \"" + id + "\"", this.connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        description = dr["description"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void Set
      (
      string id,
      string description
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " description = NULLIF('" + description + "','')"
      + k.EMPTY;
      this.Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert fuel"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          this.connection
          );
      my_sql_command.ExecuteNonQuery();
      this.Close();
      }

    } // end TClass_db_fuels

  }

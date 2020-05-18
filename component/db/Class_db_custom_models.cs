// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_custom_models
  {
  public class TClass_db_custom_models: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_custom_models() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_phrase = "IFNULL(custom_model.name,'-'),'|',IFNULL(custom_make.name,'-')";
      bool result;
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select custom_model.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " from custom_model"
        +   " join custom_make on (custom_make.id=custom_model.make_id)"
        + " where concat(" + concat_phrase + ") like '%" + partial_spec.ToUpper() + "%'"
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
      BindDirectToListControl(target,false);
      }
    public void BindDirectToListControl(object target, bool be_idiomatic_format)
      {
      var concat_phrase = k.EMPTY;
      if (be_idiomatic_format)
        {
        concat_phrase = "IFNULL(custom_make.name,'-'),' ',IFNULL(custom_model.name,'-')";
        }
      else
        {
        concat_phrase = "IFNULL(custom_model.name,'-')";
        }
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT custom_model.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " FROM custom_model"
        +   " join custom_make on (custom_make.id=custom_model.make_id)"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from custom_model where id = \"" + id + "\""), connection);
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

    internal string DescriptionOf(string id)
      {
      return DescriptionOf(id,false);
      }
    internal string DescriptionOf(string id, bool be_idiomatic_format)
      {
      var concat_phrase = k.EMPTY;
      if (be_idiomatic_format)
        {
        concat_phrase = "IFNULL(custom_make.name,'-'),' ',IFNULL(custom_model.name,'-')";
        }
      else
        {
        concat_phrase = "IFNULL(custom_model.name,'-')";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT CONVERT(concat(" + concat_phrase + ") USING utf8)"
        + " FROM custom_model"
        +   " join custom_make on (custom_make.id=custom_model.make_id)"
        + " where custom_model.id = '" + id + "'",
        connection
        );
      var description_of_obj = my_sql_command.ExecuteScalar();
      Close();
      return (description_of_obj == null ? k.EMPTY : description_of_obj.ToString());
      }

    public bool Get
      (
      string id,
      out string make_id,
      out string name
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      make_id = k.EMPTY;
      name = k.EMPTY;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from custom_model where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        make_id = dr["make_id"].ToString();
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
      string make_id,
      string name
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " make_id = NULLIF('" + make_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert custom_model"
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

    } // end TClass_db_custom_models

  }

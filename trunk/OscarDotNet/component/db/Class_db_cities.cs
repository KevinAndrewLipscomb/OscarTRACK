// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_cities
  {
  public class TClass_db_cities: TClass_dbkeyclick
    {
    private readonly TClass_dbkeyclick_trail dbkeyclick_trail = null;

    public TClass_db_cities() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_phrase = "IFNULL(city.name,'-'),'|',IFNULL(state.abbreviation,'-')";
      bool result;
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select city.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " from city"
        +   " join state on (state.id=city.state_id)"
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
        concat_phrase = "IFNULL(state.abbreviation,'-'),' ',IFNULL(city.name,'-')";
        }
      else
        {
        concat_phrase = "IFNULL(city.name,'-'),'|',IFNULL(state.abbreviation,'-')";
        }
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT city.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " FROM city"
        +   " join state on (state.id=city.state_id)"
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
        using var my_sql_command = new MySqlCommand(dbkeyclick_trail.Saved("delete from city where id = \"" + id + "\""), connection);
        my_sql_command.ExecuteNonQuery();
        }
      catch(Exception e)
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
      out string state_id,
      out string name
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      state_id = k.EMPTY;
      name = k.EMPTY;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from city where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        state_id = dr["state_id"].ToString();
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal void Prune()
      {
      Open();
      using var my_sql_command = new MySqlCommand("delete from city where id not in (select distinct city_id from street)",connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public void Set
      (
      string id,
      string state_id,
      string name
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " state_id = NULLIF('" + state_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        dbkeyclick_trail.Saved
          (
          "insert city"
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

    } // end TClass_db_cities

  }

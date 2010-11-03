// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_streets
  {
  public class TClass_db_streets: TClass_dbkeyclick
    {
    private TClass_dbkeyclick_trail dbkeyclick_trail = null;

    public TClass_db_streets() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_phrase = "IFNULL(street.name,'-'),'|',IFNULL(city.name,'-'),'|',IFNULL(state.abbreviation,'-')";
      bool result;
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      dr = new MySqlCommand
        (
        "select street.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " from street"
        +   " join city on (city.id=street.city_id)"
        +   " join state on (state.id=city.state_id)"
        + " where concat(" + concat_phrase + ") like '%" + partial_spec.ToUpper() + "%'"
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
        concat_phrase = "IFNULL(city.name,'-'),' ',IFNULL(street.name,'-')";
        }
      else
        {
        concat_phrase = "IFNULL(street.name,'-')";
        }
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      dr = new MySqlCommand
        (
        "SELECT street.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " FROM street"
        +   " join city on (city.id=street.city_id)"
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

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(dbkeyclick_trail.Saved("delete from street where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      out string city_id,
      out string name
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      city_id = k.EMPTY;
      name = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from street where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        city_id = dr["city_id"].ToString();
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void Set
      (
      string id,
      string city_id,
      string name
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " city_id = NULLIF('" + city_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        dbkeyclick_trail.Saved
          (
          "insert street"
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

    } // end TClass_db_streets

  }

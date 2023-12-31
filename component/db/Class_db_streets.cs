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
    private readonly TClass_dbkeyclick_trail dbkeyclick_trail = null;

    public TClass_db_streets() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_phrase = "IFNULL(street.name,'-'),'|',IFNULL(city.name,'-'),'|',IFNULL(state.abbreviation,'-')";
      bool result;
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select street.id"
        + " , CONVERT(concat(" + concat_phrase + ") USING utf8) as spec"
        + " from street"
        +   " join city on (city.id=street.city_id)"
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

    public void BindDirectToListControl
      (
      object target,
      string agency_keyclick_enumerator,
      string unselected_literal,
      string selected_value
      )
      {
      ((target) as ListControl).Items.Clear();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT DISTINCT street.id as id"
        + " , CONVERT(concat(street.name,', ',city.name,', ',state.abbreviation) USING utf8) as spec"
        + " FROM street"
        +   " join city on (city.id=street.city_id)"
        +   " join state on (state.id=city.state_id)"
        +   " join resident_base on (resident_base.street_id=street.id)"
        + " where resident_base.agency = '" + agency_keyclick_enumerator + "'"
        + " order by spec",
        connection
        );
      (target as ListControl).DataSource = my_sql_command.ExecuteReader();
      (target as ListControl).DataValueField = "id";
      (target as ListControl).DataTextField = "spec";
      (target as ListControl).DataBind();
      ((target as ListControl).DataSource as MySqlDataReader).Close();
      Close();
      if (unselected_literal.Length > 0)
        {
        ((target) as ListControl).Items.Insert(0,new ListItem(unselected_literal, k.EMPTY));
        }
      if (selected_value.Length > 0)
        {
        ((target) as ListControl).SelectedValue = selected_value;
        }
      }

    public void BindDirectToListControl(object target, string agency_keyclick_enumerator, string unselected_literal)
      {
      BindDirectToListControl(target, agency_keyclick_enumerator, unselected_literal, k.EMPTY);
      }
    public void BindDirectToListControl(object target, string agency_keyclick_enumerator)
      {
      BindDirectToListControl(target, agency_keyclick_enumerator, "-- street --");
      }


    public bool Delete(string id)
      {
      bool result;
      result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(dbkeyclick_trail.Saved("delete from street where id = \"" + id + "\""), connection);
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
      Open();
      using var my_sql_command = new MySqlCommand("select * from street where CAST(id AS CHAR) = \"" + id + "\"", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        city_id = dr["city_id"].ToString();
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string IdOf
      (
      string street_name,
      string city_name
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand("select street.id from street join city on (city.id=street.city_id) where street.name = '" + street_name + "' and city.name = '" + city_name + "'",connection);
      var id_of_obj = my_sql_command.ExecuteScalar();
      Close();
      return (id_of_obj == null ? k.EMPTY : id_of_obj.ToString());
      }

    internal string NameOfId(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand($"select name from street where id = '{id}'",connection);
      var obj = my_sql_command.ExecuteScalar();
      Close();
      return (obj?.ToString() ?? k.EMPTY);
      }

    internal string NormalizedSuffixRendition(string name)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select NORMALIZED_STREET_SUFFIX_RENDITION('" + name.Substring(0,Math.Min(name.Length,127)) + "')",connection);
      var normalized_suffix_rendition = my_sql_command.ExecuteScalar().ToString();
      Close();
      return normalized_suffix_rendition;
      }

    internal void Prune()
      {
      Open();
      using var my_sql_command = new MySqlCommand("delete from street where id not in (select distinct street_id from resident_base) and city_id <> (select id from city where name = 'VIRGINIA BEACH')",connection);
      my_sql_command.ExecuteNonQuery();
      Close();
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
      Open();
      using var my_sql_command = new MySqlCommand
        (
        dbkeyclick_trail.Saved
          (
          "insert street"
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

    } // end TClass_db_streets

  }

// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_radio_dispatches
  {
  public class TClass_db_radio_dispatches: TClass_db
    {
    private class radio_dispatch_summary
      {
      public string id;
      }


    public TClass_db_radio_dispatches() : base()
      {
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(capcode,'-'),'|',IFNULL(transmission_datetime,'-'),'|',IFNULL(address,'-'),'|',IFNULL(nature,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from radio_dispatch"
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

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select radio_dispatch.id as id"
        + " from radio_dispatch"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? "asc" : "desc")),
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(capcode,'-'),'|',IFNULL(transmission_datetime,'-'),'|',IFNULL(address,'-'),'|',IFNULL(nature,'-')) USING utf8) as spec"
        + " FROM radio_dispatch"
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
      var result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand("delete from radio_dispatch where id = '" + id + "'", connection);
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
      out string capcode,
      out DateTime transmission_datetime,
      out string address,
      out string nature
      )
      {
      capcode = k.EMPTY;
      transmission_datetime = DateTime.MinValue;
      address = k.EMPTY;
      nature = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from radio_dispatch where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        capcode = dr["capcode"].ToString();
        transmission_datetime = DateTime.Parse(dr["transmission_datetime"].ToString());
        address = dr["address"].ToString();
        nature = dr["nature"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string NatureOf(string address)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        ("select IFNULL(description,radio_dispatch.nature)"
        + " from radio_dispatch"
        +   " join incident_nature on (incident_nature.designator=radio_dispatch.nature)"
        + " where address = '" + address + "'"
        + " order by transmission_datetime desc"
        + " limit 1",
        connection
        );
      var description_obj = my_sql_command.ExecuteScalar();
      Close();
      return (description_obj == null ? k.EMPTY : description_obj.ToString());
      }

    public void Set
      (
      string id,
      string capcode,
      DateTime transmission_datetime,
      string address,
      string nature
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "capcode = NULLIF('" + capcode + "','')"
      + " , transmission_datetime = NULLIF('" + transmission_datetime.ToString("yyyy-MM-dd HH:mm:ss") + "','')"
      + " , address = NULLIF('" + address + "','')"
      + " , nature = NULLIF('" + nature + "','')"
      + k.EMPTY;
      //
      var target_table_name = "radio_dispatch";
      var key_field_name = "id";
      var key_field_value = id;
      var additional_match_condition = k.EMPTY;
      //
      // The following code is adapted from Class_db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate, but does not journal its activity.
      //
      const string DELIMITER = "~";
      var procedure_name = "MTIODKU_" + ConfigurationManager.AppSettings["application_name"] + "_" + DateTime.Now.Ticks.ToString("D19");
      var code = "/* DELIMITER '" + DELIMITER + "' */"
      + " drop procedure if exists " + procedure_name
      + DELIMITER
      + " create procedure " + procedure_name + "() modifies sql data"
      +   " BEGIN"
      +   " start transaction;"
      +   " if (select 1 from " + target_table_name + " where " + key_field_name + " = '" + key_field_value + "'" + (additional_match_condition.Length > 0 ? additional_match_condition : k.EMPTY) + " limit 1 LOCK IN SHARE MODE) is null"
      +   " then"
      +     " insert " + target_table_name + " set " + key_field_name + " = NULLIF('" + key_field_value + "',''), " + childless_field_assignments_clause + ";"
      +   " else"
      +     " update " + target_table_name + " set " + childless_field_assignments_clause + " where " + key_field_name + " = '" + key_field_value + "'" + (additional_match_condition.Length > 0 ? additional_match_condition : k.EMPTY) + ";"
      +   " end if;"
      +   " commit;"
      +   " END"
      + DELIMITER
      + " call " + procedure_name + "()"
      + DELIMITER
      + " drop procedure if exists " + procedure_name;
      var my_sql_script = new MySqlScript();
      my_sql_script.Connection = connection;
      my_sql_script.Delimiter = DELIMITER;
      my_sql_script.Query = code;
      Open();
      ExecuteOneOffProcedureScriptWithTolerance(procedure_name,my_sql_script);
      //
      using var my_sql_command = new MySqlCommand
        (
        "update field_situation"
        + " set nature = IFNULL((select description from incident_nature where designator = '" + nature + "'),'" + nature + "')"
        + " where address = 'address'",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    internal object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM radio_dispatch"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new radio_dispatch_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    internal void Trim()
      {
      Open();
      using var my_sql_command = new MySqlCommand("delete from radio_dispatch where transmission_datetime < (select min(time_initialized) from field_situation)",connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_radio_dispatches

  }

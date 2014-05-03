// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_cad_records
  {
  public class TClass_db_cad_records: TClass_db
    {
    private class cad_record_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_cad_records() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(incident_date,'-'),'|',IFNULL(incident_num,'-'),'|',IFNULL(incident_address,'-'),'|',IFNULL(call_sign,'-'),'|',IFNULL(time_initialized,'-'),'|',IFNULL(time_of_alarm,'-'),'|',IFNULL(time_enroute,'-'),'|',IFNULL(time_on_scene,'-'),'|',IFNULL(time_transporting,'-'),'|',IFNULL(time_at_hospital,'-'),'|',IFNULL(time_available,'-'),'|',IFNULL(time_downloaded,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from cad_record"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        )
        .ExecuteReader();
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
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select cad_record.id as id"
        + " from cad_record",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(incident_date,'-'),'|',IFNULL(incident_num,'-'),'|',IFNULL(incident_address,'-'),'|',IFNULL(call_sign,'-'),'|',IFNULL(time_initialized,'-'),'|',IFNULL(time_of_alarm,'-'),'|',IFNULL(time_enroute,'-'),'|',IFNULL(time_on_scene,'-'),'|',IFNULL(time_transporting,'-'),'|',IFNULL(time_at_hospital,'-'),'|',IFNULL(time_available,'-'),'|',IFNULL(time_downloaded,'-')) USING utf8) as spec"
        + " FROM cad_record"
        + " order by spec",
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
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from cad_record where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      Close();
      return result;
      }

    public bool Get
      (
      string id,
      out DateTime incident_date,
      out string incident_num,
      out string incident_address,
      out string call_sign,
      out DateTime time_initialized,
      out DateTime time_of_alarm,
      out DateTime time_enroute,
      out DateTime time_on_scene,
      out DateTime time_transporting,
      out DateTime time_at_hospital,
      out DateTime time_available,
      out DateTime time_downloaded
      )
      {
      incident_date = DateTime.MinValue;
      incident_num = k.EMPTY;
      incident_address = k.EMPTY;
      call_sign = k.EMPTY;
      time_initialized = DateTime.MinValue;
      time_of_alarm = DateTime.MinValue;
      time_enroute = DateTime.MinValue;
      time_on_scene = DateTime.MinValue;
      time_transporting = DateTime.MinValue;
      time_at_hospital = DateTime.MinValue;
      time_available = DateTime.MinValue;
      time_downloaded = DateTime.MinValue;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from cad_record where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        incident_date = DateTime.Parse(dr["incident_date"].ToString());
        incident_num = dr["incident_num"].ToString();
        incident_address = dr["incident_address"].ToString();
        call_sign = dr["call_sign"].ToString();
        time_initialized = DateTime.Parse(dr["time_initialized"].ToString());
        time_of_alarm = DateTime.Parse(dr["time_of_alarm"].ToString());
        time_enroute = DateTime.Parse(dr["time_enroute"].ToString());
        time_on_scene = DateTime.Parse(dr["time_on_scene"].ToString());
        time_transporting = DateTime.Parse(dr["time_transporting"].ToString());
        time_at_hospital = DateTime.Parse(dr["time_at_hospital"].ToString());
        time_available = DateTime.Parse(dr["time_available"].ToString());
        time_downloaded = DateTime.Parse(dr["time_downloaded"].ToString());
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string incident_date,
      string incident_num,
      string incident_address,
      string call_sign,
      string time_initialized,
      string time_of_alarm,
      string time_enroute,
      string time_on_scene,
      string time_transporting,
      string time_at_hospital,
      string time_available,
      string time_downloaded
      )
      {
      //try
      //  {

      //
      // Perform the Set in the usual fashion.
      //
      var childless_field_assignments_clause = k.EMPTY
      + "incident_date = STR_TO_DATE(NULLIF('" + incident_date + "',''),'%m/%d/%y')"
      + " , incident_num = NULLIF('" + incident_num + "','')"
      + " , incident_address = NULLIF('" + incident_address + "','')"
      + " , call_sign = NULLIF('" + call_sign + "','')"
      + " , time_initialized = STR_TO_DATE(NULLIF('" + time_initialized + "',''),'%H:%i')"
      + " , time_of_alarm = STR_TO_DATE(NULLIF('" + time_of_alarm + "',''),'%H:%i')"
      + " , time_enroute = STR_TO_DATE(NULLIF('" + time_enroute + "',''),'%H:%i')"
      + " , time_on_scene = STR_TO_DATE(NULLIF('" + time_on_scene + "',''),'%H:%i')"
      + " , time_transporting = STR_TO_DATE(NULLIF('" + time_transporting + "',''),'%H:%i')"
      + " , time_at_hospital = STR_TO_DATE(NULLIF('" + time_at_hospital + "',''),'%H:%i')"
      + " , time_available = STR_TO_DATE(NULLIF('" + time_available + "',''),'%H:%i')"
      + " , time_downloaded = STR_TO_DATE(NULLIF('" + time_downloaded + "',''),'%m/%d/%y %H:%i')"
      + k.EMPTY;
      //
      var target_table_name = "cad_record";
      var key_field_name = "id";
      var key_field_value = id;
      var additional_match_condition = " or (incident_num = '" + incident_num + "' and call_sign = '" + call_sign + "')";
      //
      // The following code is adapted from Class_db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate, but does not journal its activity.
      //
      const string DELIMITER = "~";
      var procedure_name = "MTIODKU_" + DateTime.Now.Ticks.ToString("D19");
      var code = "/* DELIMITER '" + DELIMITER + "' */"
      + " drop procedure if exists " + procedure_name
      + DELIMITER
      + " create procedure " + procedure_name + "() modifies sql data"
      +   " BEGIN"
      +   " start transaction;"
      +   " if (select 1 from " + target_table_name + " where " + key_field_name + " = '" + key_field_value + "'" + (additional_match_condition.Length > 0 ? additional_match_condition : k.EMPTY) + " LOCK IN SHARE MODE) is null"
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
      + " drop procedure " + procedure_name + "";
      var my_sql_script = new MySqlScript();
      my_sql_script.Connection = connection;
      my_sql_script.Delimiter = DELIMITER;
      my_sql_script.Query = code;
      Open();
      my_sql_script.Execute();
      ////
      //// Determine if a Nature is known for this record.
      ////
      //var be_nature_unknown_after_set = DBNull.Value == new MySqlCommand
      //  ("select nature from cad_record where id = '" + id + "' or (incident_num = '" + incident_num + "' and call_sign = '" + call_sign + "')",connection).ExecuteScalar();
      ////
      Close();
      ////
      //return be_nature_unknown_after_set;

      //  }
      //catch (Exception the_exception)
      //  {
      //  }
      }

    internal object Summary(string id)
      {
      Open();
      var dr =
        (
        new MySqlCommand
          (
          "SELECT *"
          + " FROM cad_record"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new cad_record_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    internal void Trim()
      {
      //try
      //  {

      Open();
      new MySqlCommand
        (
        k.EMPTY
        + " delete from cad_record where incident_date < DATE_ADD(CURDATE(),INTERVAL -7 DAY)"
        ,
        connection
        )
        .ExecuteNonQuery();
      Close();

      //  }
      //catch (Exception the_exception)
      //  {
      //  }
      }

    } // end TClass_db_cad_records

  }

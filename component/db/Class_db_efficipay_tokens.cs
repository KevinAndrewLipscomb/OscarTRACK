// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_dbhomedb;
using Class_dbhomedb_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_efficipay_tokens
  {
  public class TClass_db_efficipay_tokens: TClass_dbhomedb
    {
    private readonly TClass_dbhomedb_trail dbhomedb_trail = null;

    public TClass_db_efficipay_tokens() : base()
      {
      dbhomedb_trail = new TClass_dbhomedb_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(time_created,'-'),'|',IFNULL(time_retired,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from efficipay_token"
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
        + " , CONVERT(concat(IFNULL(time_created,'-'),'|',IFNULL(time_retired,'-')) USING utf8) as spec"
        + " FROM efficipay_token"
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

    internal void BindTimePeriodsToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , concat('Between ',time_created,' and ',IFNULL(time_retired,'NOW')) as time_period"
        + " FROM efficipay_token"
        + " order by time_created desc",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["time_period"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    internal string Current()
      {
      Open();
      using var my_sql_command = new MySqlCommand("select value from efficipay_token where id = (select max(id) from efficipay_token) and time_retired is null",connection);
      var c = my_sql_command.ExecuteScalar().ToString();
      Close();
      return c;
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(dbhomedb_trail.Saved("delete from efficipay_token where id = \"" + id + "\""), connection);
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
      out string value,
      out DateTime time_created,
      out DateTime time_retired
      )
      {
      value = k.EMPTY;
      time_created = DateTime.MinValue;
      time_retired = DateTime.MinValue;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from efficipay_token where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        value = dr["value"].ToString();
        time_created = DateTime.Parse(dr["time_created"].ToString());
        time_retired = (dr["time_retired"] == DBNull.Value ? DateTime.MaxValue : DateTime.Parse(dr["time_retired"].ToString()));
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string GetById(string token_id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select value from efficipay_token where id = '" + token_id + "'",connection);
      var value = my_sql_command.ExecuteScalar().ToString();
      Close();
      return value;
      }

    public void Set
      (
      string id,
      string value
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "value = NULLIF('" + value + "','')"
      + " , time_created = NOW()"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        dbhomedb_trail.Saved
          (
          "START TRANSACTION"
          + ";"
          + " update efficipay_token set time_retired = NOW() where time_retired is null"
          + ";"
          + " insert efficipay_token"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          + ";"
          + " COMMIT"
          ),
          connection
          );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_efficipay_tokens

  }

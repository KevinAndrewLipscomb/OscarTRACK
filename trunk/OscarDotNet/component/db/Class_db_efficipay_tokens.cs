// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_efficipay_tokens
  {
  public class TClass_db_efficipay_tokens: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_efficipay_tokens() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(time_created,'-'),'|',IFNULL(time_retired,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from efficipay_token"
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

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(time_created,'-'),'|',IFNULL(time_retired,'-')) USING utf8) as spec"
        + " FROM efficipay_token"
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

    internal string Current()
      {
      Open();
      var c = new MySqlCommand("select value from efficipay_token where id = (select max(id) from efficipay_token) and time_retired is null",connection).ExecuteScalar().ToString();
      Close();
      return c;
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from efficipay_token where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      var dr = new MySqlCommand("select * from efficipay_token where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
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
      new MySqlCommand
        (
        db_trail.Saved
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
        )
        .ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_efficipay_tokens

  }

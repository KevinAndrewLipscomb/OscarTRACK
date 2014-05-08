// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_sms_gateways
  {
  public class TClass_db_sms_gateways: TClass_db
    {
    private class sms_gateway_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_sms_gateways() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(carrier_name,'-'),'|',IFNULL(hostname,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from sms_gateway"
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
        "select sms_gateway.id as id"
        + " from sms_gateway",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl
      (
      object target,
      string unselected_literal,
      string selected_value
      )
      {
      ((target) as ListControl).Items.Clear();
      if (unselected_literal != k.EMPTY)
        {
        ((target) as ListControl).Items.Add(new ListItem(unselected_literal,k.EMPTY));
        }
      Open();
      var dr = new MySqlCommand
        (
        "select id"
        + " , carrier_name as spec"
        + " from sms_gateway"
        + " where carrier_name <> '(none specified)'"
        + " order by carrier_name",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      if (selected_value != k.EMPTY)
        {
        ((target) as ListControl).SelectedValue = selected_value;
        }
      }
    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,unselected_literal:"-- sms_gateway --");
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from sms_gateway where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string carrier_name,
      out string hostname
      )
      {
      carrier_name = k.EMPTY;
      hostname = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from sms_gateway where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        carrier_name = dr["carrier_name"].ToString();
        hostname = dr["hostname"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string carrier_name,
      string hostname
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "carrier_name = NULLIF('" + carrier_name + "','')"
      + " , hostname = NULLIF('" + hostname + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"sms_gateway",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal object Summary(string id)
      {
      Open();
      var dr =
        (
        new MySqlCommand
          (
          "SELECT *"
          + " FROM sms_gateway"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new sms_gateway_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_sms_gateways

  }

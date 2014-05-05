// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_field_situation_impressions
  {
  public class TClass_db_field_situation_impressions: TClass_db
    {
    private class field_situation_impression_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_field_situation_impressions() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(description,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from field_situation_impression"
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
        "select field_situation_impression.id as id"
        + " from field_situation_impression",
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
        + " , CONVERT(concat(IFNULL(description,'-')) USING utf8) as spec"
        + " FROM field_situation_impression"
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
        new MySqlCommand(db_trail.Saved("delete from field_situation_impression where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string description,
      out string pecking_order
      )
      {
      description = k.EMPTY;
      pecking_order = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from field_situation_impression where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        description = dr["description"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }
    internal void GetIdDescriptionElaborationOfPeckingOrder
      (
      k.int_nonnegative pecking_order,
      out string id,
      out string description,
      out string elaboration
      )
      {
      Open();
      var dr = new MySqlCommand("select id,description,elaboration from field_situation_impression where pecking_order = '" + pecking_order.val + "'",connection).ExecuteReader();
      dr.Read();
      id = dr["id"].ToString();
      description = dr["description"].ToString();
      elaboration = dr["elaboration"].ToString();
      dr.Close();
      Close();
      }


    internal int PeckingOrderValOfDescription(string description)
      {
      Open();
      var pecking_order_val_of_description = int.Parse(new MySqlCommand("select pecking_order from field_situation_impression where description = '" + description + "'",connection).ExecuteScalar().ToString());
      Close();
      return pecking_order_val_of_description;
      }

    public void Set
      (
      string id,
      string description,
      string pecking_order
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "description = NULLIF('" + description + "','')"
      + " , pecking_order = NULLIF('" + pecking_order + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"field_situation_impression",
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
          + " FROM field_situation_impression"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new field_situation_impression_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_field_situation_impressions

  }

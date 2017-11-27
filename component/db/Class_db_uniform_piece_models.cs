// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_uniform_piece_models
  {
  public class TClass_db_uniform_piece_models: TClass_db
    {
    private class uniform_piece_model_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_uniform_piece_models() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      var concat_clause = "concat(IFNULL(uniform_piece_make.name,'-'),'|',IFNULL(uniform_piece_model.name,'-'))";
      var agency_id_filter_clause = k.EMPTY;
      if (agency_id_filter.Length > 0)
        {
        agency_id_filter_clause = " and agency_id = '" + agency_id_filter + "'";
        }
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select uniform_piece_model.id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from uniform_piece_model"
        +   " join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        +     agency_id_filter_clause
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
        "select uniform_piece_model.id as id"
        + " from uniform_piece_model",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT uniform_piece_model.id"
        + " , CONVERT(concat(IFNULL(uniform_piece_make.name,'-'),'|',IFNULL(uniform_piece_model.name,'-')) USING utf8) as spec"
        + " FROM uniform_piece_model"
        +   " join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)"
        + " where agency_id = '" + agency_id + "'"
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
        new MySqlCommand(db_trail.Saved("delete from uniform_piece_model where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string make_id,
      out string name
      )
      {
      make_id = k.EMPTY;
      name = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from uniform_piece_model where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
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
      var childless_field_assignments_clause = k.EMPTY
      + "make_id = NULLIF('" + make_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"uniform_piece_model",
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
          + " FROM uniform_piece_model"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new uniform_piece_model_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_uniform_piece_models

  }

// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_uniform_catalogs
  {
  public class TClass_db_uniform_catalogs: TClass_db
    {
    private class uniform_catalog_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_uniform_catalogs() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(piece_id,'-'),'|',IFNULL(rank_group_id,'-'),'|',IFNULL(medical_release_code,'-'),'|',IFNULL(option_category_id,'-'),'|',IFNULL(be_male,'-'),'|',IFNULL(vendor_id,'-'),'|',IFNULL(model_id,'-'),'|',IFNULL(base_color_id,'-'),'|',IFNULL(trim_color_id,'-'),'|',IFNULL(metal_color_id,'-'),'|',IFNULL(instruction_to_vendor,'-'),'|',IFNULL(elaboration,'-'),'|',IFNULL(unit_cost,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from uniform_catalog"
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
        "select uniform_catalog.id as id"
        + " from uniform_catalog",
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
        + " , CONVERT(concat(IFNULL(piece_id,'-'),'|',IFNULL(rank_group_id,'-'),'|',IFNULL(medical_release_code,'-'),'|',IFNULL(option_category_id,'-'),'|',IFNULL(be_male,'-'),'|',IFNULL(vendor_id,'-'),'|',IFNULL(model_id,'-'),'|',IFNULL(base_color_id,'-'),'|',IFNULL(trim_color_id,'-'),'|',IFNULL(metal_color_id,'-'),'|',IFNULL(instruction_to_vendor,'-'),'|',IFNULL(elaboration,'-'),'|',IFNULL(unit_cost,'-')) USING utf8) as spec"
        + " FROM uniform_catalog"
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
        new MySqlCommand(db_trail.Saved("delete from uniform_catalog where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string piece_id,
      out bool be_branded,
      out bool be_size_dependent,
      out bool be_specific_rank_dependent,
      out bool be_extra_individualized,
      out string rank_group_id,
      out string medical_release_code,
      out string option_category_id,
      out bool be_male,
      out string vendor_id,
      out string model_id,
      out string base_color_id,
      out string trim_color_id,
      out string metal_color_id,
      out string instruction_to_vendor,
      out string elaboration,
      out string unit_cost
      )
      {
      piece_id = k.EMPTY;
      be_branded = false;
      be_size_dependent = false;
      be_specific_rank_dependent = false;
      be_extra_individualized = false;
      rank_group_id = k.EMPTY;
      medical_release_code = k.EMPTY;
      option_category_id = k.EMPTY;
      be_male = false;
      vendor_id = k.EMPTY;
      model_id = k.EMPTY;
      base_color_id = k.EMPTY;
      trim_color_id = k.EMPTY;
      metal_color_id = k.EMPTY;
      instruction_to_vendor = k.EMPTY;
      elaboration = k.EMPTY;
      unit_cost = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from uniform_catalog where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        piece_id = dr["piece_id"].ToString();
        be_branded = (dr["be_branded"].ToString() == "1");
        be_size_dependent = (dr["be_size_dependent"].ToString() == "1");
        be_specific_rank_dependent = (dr["be_specific_rank_dependent"].ToString() == "1");
        be_extra_individualized = (dr["be_extra_individualized"].ToString() == "1");
        rank_group_id = dr["rank_group_id"].ToString();
        medical_release_code = dr["medical_release_code"].ToString();
        option_category_id = dr["option_category_id"].ToString();
        be_male = (dr["be_male"].ToString() == "1");
        vendor_id = dr["vendor_id"].ToString();
        model_id = dr["model_id"].ToString();
        base_color_id = dr["base_color_id"].ToString();
        trim_color_id = dr["trim_color_id"].ToString();
        metal_color_id = dr["metal_color_id"].ToString();
        instruction_to_vendor = dr["instruction_to_vendor"].ToString();
        elaboration = dr["elaboration"].ToString();
        unit_cost = dr["unit_cost"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string piece_id,
      bool be_branded,
      bool be_size_dependent,
      bool be_specific_rank_dependent,
      bool be_extra_individualized,
      string rank_group_id,
      string medical_release_code,
      string option_category_id,
      bool be_male,
      string vendor_id,
      string model_id,
      string base_color_id,
      string trim_color_id,
      string metal_color_id,
      string instruction_to_vendor,
      string elaboration,
      string unit_cost
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "piece_id = NULLIF('" + piece_id + "','')"
      + " , be_branded = NULLIF('" + be_branded.ToString() + "','')"
      + " , be_size_dependent = NULLIF('" + be_size_dependent.ToString() + "','')"
      + " , be_specific_rank_dependent = NULLIF('" + be_specific_rank_dependent.ToString() + "','')"
      + " , be_extra_individualized = NULLIF('" + be_extra_individualized.ToString() + "','')"
      + " , rank_group_id = NULLIF('" + rank_group_id + "','')"
      + " , medical_release_code = NULLIF('" + medical_release_code + "','')"
      + " , option_category_id = NULLIF('" + option_category_id + "','')"
      + " , be_male = NULLIF('" + be_male.ToString() + "','')"
      + " , vendor_id = NULLIF('" + vendor_id + "','')"
      + " , model_id = NULLIF('" + model_id + "','')"
      + " , base_color_id = NULLIF('" + base_color_id + "','')"
      + " , trim_color_id = NULLIF('" + trim_color_id + "','')"
      + " , metal_color_id = NULLIF('" + metal_color_id + "','')"
      + " , instruction_to_vendor = NULLIF('" + instruction_to_vendor + "','')"
      + " , elaboration = NULLIF('" + elaboration + "','')"
      + " , unit_cost = NULLIF('" + unit_cost + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"uniform_catalog",
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
          + " FROM uniform_catalog"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new uniform_catalog_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_uniform_catalogs

  }

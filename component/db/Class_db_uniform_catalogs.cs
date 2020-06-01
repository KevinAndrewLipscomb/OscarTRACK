// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_uniform_catalogs
  {
  public class TClass_db_uniform_catalogs: TClass_db
    {
    private class uniform_catalog_summary
      {
      public string id;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_uniform_catalogs() : base()
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
      var concat_clause = "concat(uniform_priority.value,'-',layer,'-',uniform_class.short_designator,'-',IFNULL(REPLACE(uniform_piece.name,' ','-'),'-'),'|',IFNULL(rank_group.name,'-'),'|',IFNULL(medical_release_code_description_map.description,'-'),'|',IFNULL(uniform_option_category.name,'-'),'|',IF(be_male is null,'-',IF(be_male,'M','F')),'|',IFNULL(uniform_piece_vendor.name,'-'),'|',IFNULL(uniform_piece_make.name,'-'),'|',IFNULL(uniform_piece_model.name,'-'),'|',IFNULL(base_color.name,'-'),'|',IFNULL(trim_color.name,'-'),'|',IFNULL(metal_color.name,'-'),'|',IFNULL(instruction_to_vendor,'-'),'|',IFNULL(elaboration,'-'),'|',IFNULL(unit_cost,'-'))";
      var agency_id_filter_clause = k.EMPTY;
      if (agency_id_filter.Length > 0)
        {
        agency_id_filter_clause = " and uniform_piece.agency_id = '" + agency_id_filter + "'";
        }
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select uniform_catalog.id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from uniform_catalog"
        +   " join uniform_piece on (uniform_piece.id=uniform_catalog.piece_id)"
        +   " join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)"
        +   " join uniform_class on (uniform_class.id=uniform_piece.class_id)"
        +   " left join rank_group on (rank_group.id=uniform_catalog.rank_group_id)"
        +   " left join medical_release_code_description_map on (medical_release_code_description_map.code=uniform_catalog.medical_release_code)"
        +   " left join uniform_option_category on (uniform_option_category.id=uniform_catalog.option_category_id)"
        +   " join uniform_piece_vendor on (uniform_piece_vendor.id=uniform_catalog.vendor_id)"
        +   " join uniform_piece_model on (uniform_piece_model.id=uniform_catalog.model_id)"
        +   " join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)"
        +   " left join uniform_piece_color base_color on (base_color.id=uniform_catalog.base_color_id)"
        +   " left join uniform_piece_color trim_color on (trim_color.id=uniform_catalog.trim_color_id)"
        +   " left join uniform_piece_color metal_color on (metal_color.id=uniform_catalog.metal_color_id)"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        +     agency_id_filter_clause
        + " order by uniform_priority.value, layer, uniform_class.short_designator desc, uniform_piece.name",
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
      object target,
      string agency_filter
      )
      {      
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select uniform_catalog.id as id"
        + " , uniform_priority.value as priority"
        + " , uniform_piece.layer as layer"
        + " , uniform_class.short_designator as class"
        + " , uniform_piece.name as name"
        + " , IF(be_branded,'Y','N') as be_branded"
        + " , IF(be_size_dependent,'Y','N') as be_size_dependent"
        + " , IF(be_specific_rank_dependent,'Y','N') as be_specific_rank_dependent"
        + " , IF(be_extra_individualized,'Y','N') as be_extra_individualized"
        + " , rank_group.name as rank_group"
        + " , medical_release_code_description_map.description as cert_level"
        + " , uniform_option_category.name as option_category"
        + " , IF(be_male is null,'',IF(be_male,'M','F')) as gender"
        + " , uniform_piece_vendor.name as vendor"
        + " , uniform_piece_make.name as make"
        + " , uniform_piece_model.name as model"
        + " , base_color.name as base_color"
        + " , trim_color.name as trim_color"
        + " , metal_color.name as metal_color"
        + " , elaboration"
        + " , unit_cost as cost"
        + " from uniform_catalog"
        +   " left join uniform_piece on (uniform_piece.id=uniform_catalog.piece_id)"
        +   " left join agency on (agency.id=uniform_piece.agency_id)"
        +   " left join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)"
        +   " left join uniform_class on (uniform_class.id=uniform_piece.class_id)"
        +   " left join rank_group on (rank_group.id=uniform_catalog.rank_group_id)"
        +   " left join medical_release_code_description_map on (medical_release_code_description_map.code=uniform_catalog.medical_release_code)"
        +   " left join uniform_option_category on (uniform_option_category.id=uniform_catalog.option_category_id)"
        +   " left join uniform_piece_vendor on (uniform_piece_vendor.id=uniform_catalog.vendor_id)"
        +   " left join uniform_piece_model on (uniform_piece_model.id=uniform_catalog.model_id)"
        +   " left join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)"
        +   " left join uniform_piece_color base_color on (base_color.id=uniform_catalog.base_color_id)"
        +   " left join uniform_piece_color trim_color on (trim_color.id=uniform_catalog.trim_color_id)"
        +   " left join uniform_piece_color metal_color on (metal_color.id=uniform_catalog.metal_color_id)"
        + " where uniform_piece.agency_id = '" + agency_filter + "'"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
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
        + " , CONVERT(concat(IFNULL(piece_id,'-'),'|',IFNULL(rank_group_id,'-'),'|',IFNULL(medical_release_code,'-'),'|',IFNULL(option_category_id,'-'),'|',IFNULL(be_male,'-'),'|',IFNULL(vendor_id,'-'),'|',IFNULL(model_id,'-'),'|',IFNULL(base_color_id,'-'),'|',IFNULL(trim_color_id,'-'),'|',IFNULL(metal_color_id,'-'),'|',IFNULL(instruction_to_vendor,'-'),'|',IFNULL(elaboration,'-'),'|',IFNULL(unit_cost,'-')) USING utf8) as spec"
        + " FROM uniform_catalog"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from uniform_catalog where id = \"" + id + "\""), connection);
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
      out string piece_id,
      out bool be_branded,
      out bool be_size_dependent,
      out bool be_specific_rank_dependent,
      out bool be_extra_individualized,
      out string rank_group_id,
      out string medical_release_code,
      out string option_category_id,
      out k.int_sign_range male_null_false_true_condition,
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
      male_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
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
      using var my_sql_command = new MySqlCommand("select * from uniform_catalog where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
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
        male_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_male"].ToString());
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
      k.int_sign_range male_null_false_true_condition,
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
      + " , be_branded = " + be_branded.ToString()
      + " , be_size_dependent = " + be_size_dependent.ToString()
      + " , be_specific_rank_dependent = " + be_specific_rank_dependent.ToString()
      + " , be_extra_individualized = " + be_extra_individualized.ToString()
      + " , rank_group_id = NULLIF('" + rank_group_id + "','')"
      + " , medical_release_code = NULLIF('" + medical_release_code + "','')"
      + " , option_category_id = NULLIF('" + option_category_id + "','')"
      + " , be_male = " + k.NoneFalseTrueOf(male_null_false_true_condition,"NULL")
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
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM uniform_catalog"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
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

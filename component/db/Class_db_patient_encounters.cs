// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_patient_encounters
  {
  public class TClass_db_patient_encounters: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_patient_encounters() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(id)";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from patient_encounter"
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
      object target,
      string eval_id_filter
      )
      {
      var filter = " where 1=1 ";
      if (eval_id_filter.Length > 0)
        {
        filter += " and eval_id = '" + eval_id_filter + "'" + k.SPACE;
        }
      Open();
      (target as BaseDataList).DataSource = 
        (
        new MySqlCommand
          (
          "select patient_encounter.id as id"
          + " , chief_complaint"
          + " , CONCAT(patient_age,' ',patient_age_unit.description) as patient_age_spec"
          + " , patient_encounter_level.description as patient_encounter_level"
          + " , IFNULL(GROUP_CONCAT('<tt>',skill_rating.designator,'</tt> :',care_skill.description order by skill_rating.pecking_order desc, tier, care_skill.description SEPARATOR '<br>'),'-- NONE --') as skill_performance"
          + " from patient_encounter"
          +   " join patient_age_unit on (patient_age_unit.id=patient_encounter.patient_age_unit_id)"
          +   " join patient_encounter_level on (patient_encounter_level.id=patient_encounter.patient_encounter_level_id)"
          +   " left join care_skill_rating on (care_skill_rating.patient_encounter_id=patient_encounter.id)"
          +   " left join care_skill on (care_skill.id=care_skill_rating.care_skill_id)"
          +   " left join skill_rating on (skill_rating.id=care_skill_rating.skill_rating_id)"
          + filter
          + " group by patient_encounter.id",
          connection
          )
        .ExecuteReader()
        );
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(id) USING utf8) as spec"
        + " FROM patient_encounter"
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
        new MySqlCommand(db_trail.Saved("delete from patient_encounter where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string eval_id,
      out string chief_complaint,
      out string patient_age,
      out string patient_age_unit_id,
      out string patient_encounter_level_id,
      out string guid
      )
      {
      eval_id = k.EMPTY;
      chief_complaint = k.EMPTY;
      patient_age = k.EMPTY;
      patient_age_unit_id = k.EMPTY;
      patient_encounter_level_id = k.EMPTY;
      guid = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from patient_encounter where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        eval_id = dr["eval_id"].ToString();
        chief_complaint = dr["chief_complaint"].ToString();
        patient_age = dr["patient_age"].ToString();
        patient_age_unit_id = dr["patient_age_unit_id"].ToString();
        patient_encounter_level_id = dr["patient_encounter_level_id"].ToString();
        guid = dr["guid"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string IdOfUnique(string guid)
      {
      Open();
      var id_of_unique = new MySqlCommand("select id from patient_encounter where guid = '" + guid + "'",connection).ExecuteScalar().ToString();
      Close();
      return id_of_unique;
      }

    public void Set
      (
      string id,
      string eval_id,
      string chief_complaint,
      string patient_age,
      string patient_age_unit_id,
      string patient_encounter_level_id,
      string guid
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "eval_id = NULLIF('" + eval_id + "','')"
      + " , chief_complaint = NULLIF('" + chief_complaint + "','')"
      + " , patient_age = NULLIF('" + patient_age + "','')"
      + " , patient_age_unit_id = NULLIF('" + patient_age_unit_id + "','')"
      + " , patient_encounter_level_id = NULLIF('" + patient_encounter_level_id + "','')"
      + " , guid = NULLIF('" + guid + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"patient_encounter",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause,
        additional_match_condition:" or guid = '" + guid + "'"
        );
      }

    } // end TClass_db_patient_encounters

  }

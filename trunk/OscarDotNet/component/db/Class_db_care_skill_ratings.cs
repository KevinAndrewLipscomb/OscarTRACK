// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_care_skill_ratings
  {
  public class TClass_db_care_skill_ratings: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_care_skill_ratings() : base()
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
        + " from care_skill_rating"
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
      string patient_encounter_id
      )
      {
      Open();
      (target as BaseDataList).DataSource = 
        (
        new MySqlCommand
          (
          "select care_skill.id as care_skill_id"
          + " , care_skill.description as care_skill_description"
          + " , IF(designator = '?','?','') as performed_needs_rating"
          + " , IFNULL(care_skill_rating.id,'-') as care_skill_rating_id"
          + " , IFNULL(care_skill_rating.skill_rating_id,'-') as care_skill_rating_skill_rating_id"
          + " from care_skill"
          +   " left join care_skill_rating on (care_skill_rating.care_skill_id=care_skill.id and patient_encounter_id = '" + patient_encounter_id + "')"
          +   " left join skill_rating on (skill_rating.id=care_skill_rating.skill_rating_id)"
          + " order by tier,care_skill_description",
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
        + " FROM care_skill_rating"
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
        new MySqlCommand(db_trail.Saved("delete from care_skill_rating where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string care_skill_id,
      out string skill_rating_id,
      out string patient_encounter_id
      )
      {
      care_skill_id = k.EMPTY;
      skill_rating_id = k.EMPTY;
      patient_encounter_id = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from care_skill_rating where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        care_skill_id = dr["care_skill_id"].ToString();
        skill_rating_id = dr["skill_rating_id"].ToString();
        patient_encounter_id = dr["patient_encounter_id"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string care_skill_id,
      string skill_rating_id,
      string patient_encounter_id
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "care_skill_id = NULLIF('" + care_skill_id + "','')"
      + " , skill_rating_id = NULLIF('" + skill_rating_id + "','')"
      + " , patient_encounter_id = NULLIF('" + patient_encounter_id + "','')"
      + k.EMPTY;
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert care_skill_rating"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          connection
        )
        .ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_care_skill_ratings

  }

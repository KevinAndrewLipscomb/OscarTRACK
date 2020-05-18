// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_driver_skill_ratings
  {
  public class TClass_db_driver_skill_ratings: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_driver_skill_ratings() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(id)";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from driver_skill_rating"
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

    internal void BindBaseDataList
      (
      object target,
      string eval_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select driver_skill.id as driver_skill_id"
        + " , driver_skill.description as driver_skill_description"
        + " , IF(designator = '?','?','') as performed_needs_rating"
        + " , IFNULL(driver_skill_rating.id,'-') as driver_skill_rating_id"
        + " , IFNULL(driver_skill_rating.skill_rating_id,'-') as driver_skill_rating_skill_rating_id"
        + " from driver_skill"
        +   " left join driver_skill_rating on (driver_skill_rating.driver_skill_id=driver_skill.id and eval_id = '" + eval_id + "')"
        +   " left join skill_rating on (skill_rating.id=driver_skill_rating.skill_rating_id)"
        + " order by driver_skill_description",
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(id) USING utf8) as spec"
        + " FROM driver_skill_rating"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from driver_skill_rating where id = \"" + id + "\""), connection);
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
      out string driver_skill_id,
      out string skill_rating_id,
      out string eval_id
      )
      {
      driver_skill_id = k.EMPTY;
      skill_rating_id = k.EMPTY;
      eval_id = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from driver_skill_rating where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        driver_skill_id = dr["driver_skill_id"].ToString();
        skill_rating_id = dr["skill_rating_id"].ToString();
        eval_id = dr["eval_id"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string driver_skill_id,
      string skill_rating_id,
      string eval_id
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "driver_skill_id = NULLIF('" + driver_skill_id + "','')"
      + " , skill_rating_id = NULLIF('" + skill_rating_id + "','')"
      + " , eval_id = NULLIF('" + eval_id + "','')"
      + k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert driver_skill_rating"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          connection
          );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_driver_skill_ratings

  }

using Class_db;
using Class_db_trail;
using MySql.Data.MySqlClient;
using kix;
using System;
using System.Web.UI.WebControls;

namespace Class_db_skill_ratings
  {

  internal enum skill_rating_enumeration
    {
    DESCRIPTION_1 = 1,
    DESCRIPTION_2 = 2
    }

  public class TClass_db_skill_ratings: TClass_db
    {

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_skill_ratings() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind
      (
      string partial_spec,
      object target
      )
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT lpad(id,4,'0') as id"
        + " , designator"
        + " , description"
        + " FROM skill_rating"
        + " WHERE concat(lpad(id,4,'0'),'|',designator,'|',description) like '%" + partial_spec + "%'"
        + " order by description",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["id"].ToString() + k.SPACE_HYPHENS_SPACE + dr["description"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl
      (
      object target,
      string unselected_literal,
      string selected_value
      )
      {
      ((target) as ListControl).Items.Clear();
      if (unselected_literal.Length > 0)
        {
        ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
        }
      Open();
      using var my_sql_command = new MySqlCommand("SELECT id,description FROM skill_rating where description <> '(none specified)' order by id", connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      if (selected_value.Length > 0)
        {
        ((target) as ListControl).SelectedValue = selected_value;
        }
      }
    public void BindDirectToListControl(object target,string unselected_literal)
      {
      BindDirectToListControl(target, unselected_literal, k.EMPTY);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target, "-- skill_rating --");
      }

    internal void BindListItemCollectionForEvaluatee(object target)
      {
      Open();
      (target as ListItemCollection).Clear();
      (target as ListItemCollection).Add(new ListItem("(not applicable)","-"));
      using var my_sql_command = new MySqlCommand("select id,description from skill_rating where for_evaluatee_both_evaluator_condition in (-1,0) order by pecking_order",connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        (target as ListItemCollection).Add(new ListItem(dr["description"].ToString(),dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    internal void BindListItemCollectionForEvaluator(object target)
      {
      Open();
      (target as ListItemCollection).Clear();
      (target as ListItemCollection).Add(new ListItem("(not applicable)","-"));
      using var my_sql_command = new MySqlCommand("select id,description from skill_rating where for_evaluatee_both_evaluator_condition in (0,1) order by pecking_order",connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        (target as ListItemCollection).Add(new ListItem(dr["description"].ToString(),dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    internal void BindListItemCollectionUnlimited(object target)
      {
      Open();
      (target as ListItemCollection).Clear();
      (target as ListItemCollection).Add(new ListItem("(not applicable)","-"));
      using var my_sql_command = new MySqlCommand("select id,description from skill_rating order by id",connection);
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        (target as ListItemCollection).Add(new ListItem(dr["description"].ToString(),dr["id"].ToString()));
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from skill_rating where id = '" + id + "'"), connection);
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
      out string designator,
      out string description
      )
      {
      designator = k.EMPTY;
      description = k.EMPTY;
      var result = false;
      Open();
      using var my_sql_command = new MySqlCommand("select designator,description from skill_rating where id = '" + id + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        designator = dr["designator"].ToString();
        description = dr["description"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string designator,
      string description
      )
      {
      var childless_field_assignments_clause = "designator = '" + designator + "', description = '" + description + "'";
      Open();
      using var my_sql_command = new MySqlCommand
        (
        db_trail.Saved
          (
          "insert skill_rating"
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

    } // end TClass_db_skill_ratings

  }

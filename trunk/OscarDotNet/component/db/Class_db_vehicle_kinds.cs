// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_vehicle_kinds
  {
  public class TClass_db_vehicle_kinds: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_vehicle_kinds() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool BeTargetPmMileageMeaningful(string id)
      {
      Open();
      var be_target_pm_mileage_meaningful = ("1" == new MySqlCommand("select be_target_pm_mileage_meaningful from vehicle_kind where id = '" + id + "'",connection).ExecuteScalar().ToString());
      Close();
      return be_target_pm_mileage_meaningful;
      }

    public bool Bind(string partial_spec, object target)
      {
      bool result;
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(concat(IFNULL(description,'-')) USING utf8) as spec"
        + " from vehicle_kind"
        + " where concat(IFNULL(description,'-')) like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      result = ((target) as ListControl).Items.Count > 0;
      return result;
      }

    public void BindDirectToListControl(string unselected_literal,object target,string selected_id)
      {
      this.Open();
      (target as ListControl).Items.Clear();
      if (unselected_literal != k.EMPTY)
        {
        (target as ListControl).Items.Add(new ListItem(unselected_literal, ""));
        }
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(description USING utf8) as spec"
        + " FROM vehicle_kind"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        (target as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      if (selected_id != k.EMPTY)
        {
        (target as ListControl).SelectedValue = selected_id;
        }
      this.Close();
      }
    public void BindDirectToListControl(object target,string selected_id)
      {
      BindDirectToListControl(k.EMPTY,target,selected_id);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(k.EMPTY,target,k.EMPTY);
      }

    public void BindListControl(object target,string selected_id,bool be_available_option_all,string unselected_literal)
      {
      if (be_available_option_all)
        {
        BindDirectToListControl(unselected_literal, target, selected_id);
        }
      else
        {
        BindDirectToListControl(k.EMPTY, target, selected_id);
        }
      }
    public void BindListControl(object target,string selected_id,bool be_available_option_all)
      {
      BindListControl(target, selected_id, be_available_option_all, "All");
      }
    public void BindListControl(object target,string selected_id)
      {
      BindListControl(target, selected_id, true);
      }
    public void BindListControl(object target)
      {
      BindListControl(target, "");
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from vehicle_kind where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      this.Close();
      return result;
      }

    public bool Get
      (
      string id,
      out string description
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      description = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from vehicle_kind where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        description = dr["description"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void Set
      (
      string id,
      string description
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " description = NULLIF('" + description + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle_kind"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          this.connection
        )
        .ExecuteNonQuery();
      this.Close();
      }

    } // end TClass_db_vehicle_kinds

  }

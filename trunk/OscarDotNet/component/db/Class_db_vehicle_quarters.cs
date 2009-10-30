// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_vehicle_quarters
  {
  public class TClass_db_vehicle_quarters: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_vehicle_quarters() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(medium_designator,'-'),'|',IFNULL(long_designator,'-'),'|',IFNULL(be_active,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from vehicle_quarters"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
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
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl(string unselected_literal,string designator_clause,object target,string selected_id)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      if (unselected_literal != k.EMPTY)
        {
        (target as ListControl).Items.Add(new ListItem(unselected_literal, ""));
        }
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(" + designator_clause + " USING utf8) as spec"
        + " FROM vehicle_quarters"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      if (selected_id != k.EMPTY)
        {
        (target as ListControl).SelectedValue = selected_id;
        }
      this.Close();
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(k.EMPTY,"concat(IFNULL(medium_designator,'-'),'|',IFNULL(long_designator,'-'),'|',IFNULL(be_active,'-'))",target,k.EMPTY);
      }

    public void BindDirectToListControlMedium(object target,string selected_id,bool be_available_option_all,string unselected_literal)
      {
      if (be_available_option_all)
        {
        BindDirectToListControl(unselected_literal,"medium_designator",target,selected_id);
        }
      else
        {
        BindDirectToListControl(k.EMPTY,"medium_designator",target,selected_id);
        }
      }
    public void BindDirectToListControlMedium(object target,string selected_id,bool be_available_option_all)
      {
      BindDirectToListControlMedium(target,selected_id,be_available_option_all,"All");
      }
    public void BindDirectToListControlMedium(object target,string selected_id)
      {
      BindDirectToListControlMedium(target,selected_id,true);
      }
    public void BindDirectToListControlMedium(object target)
      {
      BindDirectToListControl(k.EMPTY,"medium_designator",target,k.EMPTY);
      }

    public void BindDirectToListControlMediumDashLong(object target)
      {
      BindDirectToListControl(k.EMPTY,"concat(medium_designator,' - ',long_designator)",target,k.EMPTY);
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from vehicle_quarters where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      out string medium_designator,
      out string long_designator,
      out string pecking_order,
      out bool be_active
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      medium_designator = k.EMPTY;
      long_designator = k.EMPTY;
      pecking_order = k.EMPTY;
      be_active = false;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from vehicle_quarters where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        medium_designator = dr["medium_designator"].ToString();
        long_designator = dr["long_designator"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        be_active = (dr["be_active"].ToString() == "1");
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public string MediumDashLongDesignatorOfId(string id)
      {
      Open();
      var medium_dash_long_designator_of_id = new MySqlCommand("select concat(medium_designator,' - ',long_designator) from vehicle_quarters where id = '" + id + "'",connection).ExecuteScalar().ToString();
      Close();
      return medium_dash_long_designator_of_id;
      }

    public void Set
      (
      string id,
      string medium_designator,
      string long_designator,
      string pecking_order,
      bool be_active
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "medium_designator = NULLIF('" + medium_designator + "','')"
      + " , long_designator = NULLIF('" + long_designator + "','')"
      + " , pecking_order = NULLIF('" + pecking_order + "','')"
      + " , be_active = NULLIF('" + be_active.ToString() + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle_quarters"
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

    } // end TClass_db_vehicle_quarters

  }

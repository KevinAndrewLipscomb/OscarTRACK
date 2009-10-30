// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_vehicle_down_natures
  {
  public class TClass_db_vehicle_down_natures: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_vehicle_down_natures() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(name,'-'),'|',IFNULL(elaboration,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from vehicle_down_nature"
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

    public void BindDirectToListControl(object target)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(name,'-'),'|',IFNULL(elaboration,'-')) USING utf8) as spec"
        + " FROM vehicle_down_nature"
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
      }

    public void BindDirectToListControlForMarkDown(object target)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(elaboration USING utf8) as spec"
        + " FROM vehicle_down_nature"
        + " order by pecking_order",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from vehicle_down_nature where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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

    public string ElaborationOf(string id)
      {
      Open();
      var elaboration_of = new MySqlCommand("select elaboration from vehicle_down_nature where id = '" + id + "'",connection).ExecuteScalar().ToString();
      Close();
      return elaboration_of;
      }

    public bool Get
      (
      string id,
      out string name,
      out string pecking_order,
      out bool be_failure,
      out string elaboration
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      name = k.EMPTY;
      pecking_order = k.EMPTY;
      be_failure = false;
      elaboration = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from vehicle_down_nature where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        name = dr["name"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        be_failure = (dr["be_failure"].ToString() == "1");
        elaboration = dr["elaboration"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void Set
      (
      string id,
      string name,
      string pecking_order,
      bool be_failure,
      string elaboration
      )
      {
      string childless_field_assignments_clause = k.EMPTY
          + " set name = NULLIF('" + name + "','')"
          + " , pecking_order = NULLIF('" + pecking_order + "','')"
          + " , be_failure = NULLIF('" + be_failure.ToString() + "','')"
          + " , elaboration = NULLIF('" + elaboration + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle_down_nature"
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

    } // end TClass_db_vehicle_down_natures

  }

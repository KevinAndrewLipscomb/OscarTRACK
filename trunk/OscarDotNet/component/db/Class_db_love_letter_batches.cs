// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_love_letter_batches
  {
  public class TClass_db_love_letter_batches: TClass_dbkeyclick
    {
    private TClass_dbkeyclick_trail db_trail = null;

    public TClass_db_love_letter_batches() : base()
      {
      db_trail = new TClass_dbkeyclick_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(designator,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from love_letter_batch"
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

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(designator,'-')) USING utf8) as spec"
        + " FROM love_letter_batch"
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

    internal void BindRecentToBaseDataList
      (
      k.int_positive limit,
      object target
      )
      {
 	    Open();
      (target as BaseDataList).DataSource = new MySqlCommand
        (
        "select *"
        + " from"
        +   " ("
        +   " select id"
        +   " , designator"
        +   " , CONCAT(FORMAT(immune_scene_visits_factor*100,1),'%') as immune_scene_visits_factor"
        +   " from love_letter_batch"
        +   " order by designator desc"
        +   " limit " + limit.val.ToString()
        +   " ) as recentmost_first"
        + " order by designator",
        connection
        )
        .ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from love_letter_batch where id = \"" + id + "\""), connection).ExecuteNonQuery();
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
      out string designator,
      out string immune_scene_visits_factor
      )
      {
      designator = k.EMPTY;
      immune_scene_visits_factor = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from love_letter_batch where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        designator = dr["designator"].ToString();
        immune_scene_visits_factor = dr["immune_scene_visits_factor"].ToString();
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
      string immune_scene_visits_factor
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "designator = NULLIF('" + designator + "','')"
      + " , immune_scene_visits_factor = NULLIF('" + immune_scene_visits_factor + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"love_letter_batch",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    } // end TClass_db_love_letter_batchs

  }

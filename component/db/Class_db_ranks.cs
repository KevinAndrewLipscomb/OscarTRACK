// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_ranks
  {
  public class TClass_db_ranks: TClass_db
    {
    private class rank_summary
      {
      public string id;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_ranks() : base()
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
      var concat_clause = "concat(IFNULL(name,'-'))";
      var agency_id_filter_clause = k.EMPTY;
      if (agency_id_filter.Length > 0)
        {
        agency_id_filter_clause = " and agency_id = '" + agency_id_filter + "'";
        }
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from `rank`"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        +     agency_id_filter_clause
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
      #pragma warning disable IDE0060 // Remove unused parameter
      string sort_order,
      bool be_sort_order_ascending,
      object target
      #pragma warning restore IDE0060 // Remove unused parameter
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select `rank`.id as id"
        + " from `rank`",
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
        + " , CONVERT(concat(IFNULL(agency_id,'-'),'|',IFNULL(name,'-')) USING utf8) as spec"
        + " FROM `rank`"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from `rank` where id = \"" + id + "\""), connection);
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
          throw e;
          }
        }
      Close();
      return result;
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name,
      out string pecking_order
      )
      {
      agency_id = k.EMPTY;
      name = k.EMPTY;
      pecking_order = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from `rank` where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        name = dr["name"].ToString();
        pecking_order = dr["pecking_order"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string agency_id,
      string name,
      string pecking_order
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "agency_id = NULLIF('" + agency_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + " , pecking_order = NULLIF('" + pecking_order + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"`rank`",
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
        + " FROM `rank`"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new rank_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_ranks

  }

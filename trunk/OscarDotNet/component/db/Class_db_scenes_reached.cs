// Derived from KiAspdotnetFramework/KiAspdotnetFramework.Db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Class_db_scenes_reached
{

  public class SceneReachedDescriptor
    {
    public string address;
    public string bumper_number;
    }

  public class AgencyToScenesMap : Dictionary<string,List<string>> { }

  public class TClass_db_scenes_reached : TClass_db
    {
    private class scene_reached_summary
      {
      public string id;
      public string agency_id;
      public string address;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_scenes_reached() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(address)";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from scenes_reached"
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

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select scenes_reached.id as id"
        + " from scenes_reached"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? "asc" : "desc")),
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal AgencyToScenesMap ByAgencyFromDescriptors(IEnumerable<SceneReachedDescriptor> scenes_reached_descriptors)
      {
      var result = new AgencyToScenesMap();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " delete from scenes_reached"
        + ";"
        + " insert into scenes_reached (agency_id,address) values"
        + string.Join("\n",scenes_reached_descriptors.Select(s => $"((select agency_id from vehicle where bumper_number = '{s.bumper_number}'),'{s.address}'),"))
        + " (0,null)"
        + ";"
        + " select distinct agency_id as agency"
        + " , scenes_reached.address as address"
        + " from scenes_reached"
        + "   join agency on (agency.id=scenes_reached.agency_id)"
        + " where scenes_reached.agency_id <> 0"
        + "   and scenes_reached.address is not null"
        + " order by agency.short_designator"
        + ";"
        + " COMMIT",
        connection
        );
      var saved_agency = k.EMPTY;
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        var agency = dr["agency"].ToString();
        if (agency != saved_agency)
          {
          saved_agency = agency;
          result.Add
            (
            key:agency,
            value:new List<string>()
            );
          }
        result[agency].Add(item:dr["address"].ToString());
        }
      dr.Close();
      Close();
      return result;
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(address) USING utf8) as spec"
        + " FROM scenes_reached"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from scenes_reached where id = \"" + id + "\""), connection);
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
      out string agency_id,
      out string address
      )
      {
      agency_id = k.EMPTY;
      address = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from scenes_reached where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        address = dr["address"].ToString();
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
      string address
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + " , agency_id = '" + agency_id + "'"
      + " , address = '" + address + "'"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"scenes_reached",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    public object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM scenes_reached"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new scene_reached_summary()
        {
        id = id,
        agency_id = dr["agency_id"].ToString(),
        address = dr["address"].ToString()
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_scenes_reached

  }

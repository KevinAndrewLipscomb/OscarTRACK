// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_uniform_classes
  {
  public class TClass_db_uniform_classes: TClass_db
    {
    private class uniform_class_summary
      {
      public string id;
      public string agency_id;
      public string short_designator;
      public string long_designator;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_uniform_classes() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal string AgencyIdOf(object summary)
      {
      return (summary as uniform_class_summary).agency_id;
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      var concat_clause = "concat(IFNULL(short_designator,'-'),'|',IFNULL(long_designator,'-'))";
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
        + " from uniform_class"
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
        "select uniform_class.id as id"
        + " from uniform_class",
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_filter_id
      )
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , IF(short_designator = long_designator,short_designator,CONVERT(concat(short_designator,' - ',long_designator) USING utf8)) as spec"
        + " FROM uniform_class"
        + " where agency_id = '" + agency_filter_id + "'"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from uniform_class where id = \"" + id + "\""), connection);
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
      out string short_designator,
      out string long_designator
      )
      {
      agency_id = k.EMPTY;
      short_designator = k.EMPTY;
      long_designator = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from uniform_class where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        short_designator = dr["short_designator"].ToString();
        long_designator = dr["long_designator"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string LongDesignatorOf(object summary)
      {
      return (summary as uniform_class_summary).long_designator;
      }

    public void Set
      (
      string id,
      string agency_id,
      string short_designator,
      string long_designator
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "agency_id = NULLIF('" + agency_id + "','')"
      + " , short_designator = NULLIF('" + short_designator + "','')"
      + " , long_designator = NULLIF('" + long_designator + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"uniform_class",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal string ShortDesignatorOf(object summary)
      {
      return (summary as uniform_class_summary).short_designator;
      }

    internal object Summary(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT *"
        + " FROM uniform_class"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new uniform_class_summary()
        {
        id = id,
        agency_id = dr["agency_id"].ToString(),
        short_designator = dr["short_designator"].ToString(),
        long_designator = dr["long_designator"].ToString()
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_uniform_classes

  }

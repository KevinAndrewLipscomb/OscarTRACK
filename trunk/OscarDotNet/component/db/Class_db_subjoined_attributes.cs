// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_subjoined_attributes
  {
  public class TClass_db_subjoined_attributes: TClass_db
    {
    private class subjoined_attribute_summary
      {
      public string id;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_subjoined_attributes() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool BeAnyImplementedSince(DateTime time)
      {
      Open();
      using var mysql_command = new MySqlCommand("select IF(count(*) > 0,1,0) from subjoined_attribute where time_implemented >= '" + time.ToString("yyyy-MM-dd HH:mm:ss") + "'",connection);
      var be_any_implemented_since = "1" == mysql_command.ExecuteScalar().ToString();
      Close();
      return be_any_implemented_since;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(time_implemented,'-'),'|',IFNULL(involvement_id,'-'),'|',IFNULL(name,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from subjoined_attribute"
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
      DateTime last_login
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select involvement.description as involvement"
        + " , subjoined_attribute.name as name"
        + " from subjoined_attribute"
        +   " join involvement on (involvement.id=subjoined_attribute.involvement_id)"
        + " where time_implemented >= '" + last_login.ToString("yyyy-MM-dd HH:mm:ss") + "'"
        + " order by involvement.id,time_implemented",
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
        + " , CONVERT(concat(IFNULL(time_implemented,'-'),'|',IFNULL(involvement_id,'-'),'|',IFNULL(name,'-')) USING utf8) as spec"
        + " FROM subjoined_attribute"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from subjoined_attribute where id = \"" + id + "\""), connection);
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
      out DateTime time_implemented,
      out string involvement_id,
      out string name
      )
      {
      time_implemented = DateTime.MinValue;
      involvement_id = k.EMPTY;
      name = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from subjoined_attribute where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        time_implemented = DateTime.Parse(dr["time_implemented"].ToString());
        involvement_id = dr["involvement_id"].ToString();
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      DateTime time_implemented,
      string involvement_id,
      string name
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "time_implemented = NULLIF('" + time_implemented.ToString() + "','')"
      + " , involvement_id = NULLIF('" + involvement_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"subjoined_attribute",
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
        + " FROM subjoined_attribute"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new subjoined_attribute_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_subjoined_attributes

  }

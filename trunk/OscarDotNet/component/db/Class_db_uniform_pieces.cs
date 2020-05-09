// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_uniform_pieces
  {
  public class TClass_db_uniform_pieces: TClass_db
    {
    private class uniform_piece_summary
      {
      public string id;
      public string agency_id;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_uniform_pieces() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal string AgencyIdOf(object summary)
      {
      return (summary as uniform_piece_summary).agency_id;
      }

    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      var concat_clause = "concat(uniform_priority.value,'-',layer,'-',uniform_class.short_designator,'-',REPLACE(name,' ','-'))";
      var agency_id_filter_clause = k.EMPTY;
      if (agency_id_filter.Length > 0)
        {
        agency_id_filter_clause = " and uniform_piece.agency_id = '" + agency_id_filter + "'";
        }
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select uniform_piece.id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from uniform_piece"
        +   " join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)"
        +   " join uniform_class on (uniform_class.id=uniform_piece.class_id)"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        +     agency_id_filter_clause
        + " order by uniform_priority.value, layer, uniform_class.short_designator desc, name",
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
        "select uniform_piece.id as id"
        + " from uniform_piece",
        connection
        );
      ((target) as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id
      )
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT uniform_piece.id"
        + " , CONVERT(concat(uniform_priority.value,'-',layer,'-',uniform_class.short_designator,'-',REPLACE(name,' ','-')) USING utf8) as spec"
        + " FROM uniform_piece"
        +   " join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)"
        +   " join uniform_class on (uniform_class.id=uniform_piece.class_id)"
        +   " where uniform_piece.agency_id = '" + agency_id + "'"
        + " order by uniform_priority.value, layer, uniform_class.short_designator desc, uniform_piece.name",
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from uniform_piece where id = \"" + id + "\""), connection);
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
      out string priority_id,
      out string layer,
      out string class_id,
      out string name,
      out string authorized_quantity
      )
      {
      agency_id = k.EMPTY;
      priority_id = k.EMPTY;
      layer = k.EMPTY;
      class_id = k.EMPTY;
      name = k.EMPTY;
      authorized_quantity = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from uniform_piece where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        priority_id = dr["priority_id"].ToString();
        layer = dr["layer"].ToString();
        class_id = dr["class_id"].ToString();
        name = dr["name"].ToString();
        authorized_quantity = dr["authorized_quantity"].ToString();
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
      string priority_id,
      string layer,
      string class_id,
      string name,
      string authorized_quantity
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "agency_id = NULLIF('" + agency_id + "','')"
      + " , priority_id = NULLIF('" + priority_id + "','')"
      + " , layer = NULLIF('" + layer + "','')"
      + " , class_id = NULLIF('" + class_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + " , authorized_quantity = NULLIF('" + authorized_quantity + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"uniform_piece",
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
        + " FROM uniform_piece"
        + " where id = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new uniform_piece_summary()
        {
        id = id,
        agency_id = dr["agency_id"].ToString()
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_uniform_pieces

  }

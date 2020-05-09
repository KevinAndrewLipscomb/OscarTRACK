// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_efficipay_dockets
  {
  public class efficipay_docket_summary
    {
    public string id;
    public string agency_id;
    public string num;
    public string attachment_key;
    public bool be_ready_for_review;
    public string signer_1_member_id;
    public string signer_2_member_id;
    public string expiration_date;
    }

  public class TClass_db_efficipay_dockets: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_efficipay_dockets() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool ApplySignature
      (
      string id,
      string member_id
      )
      {
      var apply_signature = false;
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand
          (db_trail.Saved("update efficipay_docket set signer_1_member_id = '" + member_id + "' where id = '" + id + "' and signer_1_member_id is null"),connection,transaction)
          ;
        my_sql_command_1.ExecuteNonQuery();
        using var my_sql_command_2 = new MySqlCommand
          (db_trail.Saved("update efficipay_docket set signer_2_member_id = '" + member_id + "' where id = '" + id + "' and signer_2_member_id is null and signer_1_member_id is not null and signer_1_member_id <> '" + member_id + "'"),connection,transaction)
          ;
        my_sql_command_2.ExecuteNonQuery();
        using var my_sql_command_3 = new MySqlCommand("select IF(signer_1_member_id is not null and signer_2_member_id is not null,1,0) from efficipay_docket where id = '" + id + "'",connection,transaction);
        apply_signature = "1" == my_sql_command_3.ExecuteScalar().ToString();
        transaction.Commit();
        }
      catch (Exception e)
        {
        transaction.Rollback();
        throw e;
        }
      Close();
      return apply_signature;
      }

    internal bool BeNumInUse(string num)
      {
      var be_num_in_use = true;
      Open();
      using var my_sql_command = new MySqlCommand("select IF(count(*) > 0,1,0) from efficipay_docket where num = '" + num + "'",connection);
      be_num_in_use = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_num_in_use;
      }

    internal bool BeOkToSign(string id)
      {
      var be_ok_to_sign = false;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select IF((signer_1_member_id is null) or (signer_2_member_id is null),1,0) from efficipay_docket where id = '" + id + "'",
        connection
        );      
      be_ok_to_sign = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_ok_to_sign;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(agency_id,'-'),'|',IFNULL(num,'-'),'|',IFNULL(attachment_key,'-'),'|',IFNULL(be_ready_for_review,'-'),'|',IFNULL(signer_1_member_id,'-'),'|',IFNULL(signer_2_member_id,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from efficipay_docket"
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
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string ready_for_review_filter
      )
      {
      if (be_sort_order_ascending)
        {
        sort_order = sort_order.Replace("%", " asc");
        }
      else
        {
        sort_order = sort_order.Replace("%", " desc");
        }
      var filter = " where true";
      if (agency_filter.Length > 0)
        {
        filter += " and efficipay_docket.agency_id = '" + agency_filter + "'" + k.SPACE;
        }
      if (ready_for_review_filter.Length > 0)
        {
        filter += " and" + (ready_for_review_filter == "0" ? " not" : k.EMPTY) + " be_ready_for_review ";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select efficipay_docket.id as id"
        + " , num"
        + " , IF(be_ready_for_review,'Yes','No') as be_ready_for_review"
        + " , IFNULL(concat(m1.cad_num,' ',m1.first_name,' ',m1.last_name),'') as signer_1"
        + " , IFNULL(concat(m2.cad_num,' ',m2.first_name,' ',m2.last_name),'') as signer_2"
        + " from efficipay_docket"
        +   " left join member m1 on (m1.id=efficipay_docket.signer_1_member_id)"
        +   " left join member m2 on (m2.id=efficipay_docket.signer_2_member_id)"
        + filter
        + " order by " + sort_order,
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(agency_id,'-'),'|',IFNULL(num,'-'),'|',IFNULL(attachment_key,'-'),'|',IFNULL(be_ready_for_review,'-'),'|',IFNULL(signer_1_member_id,'-'),'|',IFNULL(signer_2_member_id,'-')) USING utf8) as spec"
        + " FROM efficipay_docket"
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
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from efficipay_docket where id = \"" + id + "\""), connection);
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
      out string num,
      out string attachment_key,
      out bool be_ready_for_review,
      out string signer_1_member_id,
      out string signer_2_member_id,
      out DateTime expiration_date
      )
      {
      agency_id = k.EMPTY;
      num = k.EMPTY;
      attachment_key = k.EMPTY;
      be_ready_for_review = false;
      signer_1_member_id = k.EMPTY;
      signer_2_member_id = k.EMPTY;
      expiration_date = DateTime.MinValue;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from efficipay_docket where CAST(id AS CHAR) = \"" + id + "\"", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        num = dr["num"].ToString();
        attachment_key = dr["attachment_key"].ToString();
        be_ready_for_review = (dr["be_ready_for_review"].ToString() == "1");
        signer_1_member_id = dr["signer_1_member_id"].ToString();
        signer_2_member_id = dr["signer_2_member_id"].ToString();
        expiration_date = DateTime.Parse(dr["expiration_date"].ToString());
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal string IdOf(object summary)
      {
      return (summary as efficipay_docket_summary).id;
      }

    public string Set
      (
      string id,
      string agency_id,
      string num,
      string attachment_key,
      bool be_ready_for_review,
      DateTime expiration_date
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "agency_id = NULLIF('" + agency_id + "','')"
      + " , num = NULLIF('" + num + "','')"
      + " , attachment_key = NULLIF('" + attachment_key + "','')"
      + " , be_ready_for_review = " + be_ready_for_review.ToString()
      + " , expiration_date = '" + expiration_date.ToString("yyyy-MM-dd") + "'"
      + k.EMPTY;
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand
          (
          db_trail.Saved
            (
            "insert efficipay_docket"
            + " set id = NULLIF('" + id + "','')"
            + " , " + childless_field_assignments_clause
            + " on duplicate key update "
            + childless_field_assignments_clause
            ),
            connection,
            transaction
            );
        my_sql_command_1.ExecuteNonQuery();
        if (id.Length == 0)
          {
          using var my_sql_command_2 = new MySqlCommand("select id from efficipay_docket where attachment_key = '" + attachment_key + "'",connection,transaction);
          id = my_sql_command_2.ExecuteScalar().ToString();
          }
        transaction.Commit();
        }
      catch (Exception e)
        {
        transaction.Rollback();
        throw e;
        }
      Close();
      return id;
      }

    public object Summary(string efficipay_docket_id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select agency_id"
        + " , num"
        + " , attachment_key"
        + " , be_ready_for_review"
        + " , IFNULL(signer_1_member_id,'') as signer_1_member_id"
        + " , IFNULL(signer_2_member_id,'') as signer_2_member_id"
        + " , IFNULL(DATE_FORMAT(expiration_date,'%Y-%m-%d %H:%i'),'') as expiration_date"
        + " from efficipay_docket"
        + " where id = '" + efficipay_docket_id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new efficipay_docket_summary()
        {
        id = efficipay_docket_id,
        agency_id = dr["agency_id"].ToString(),
        num = dr["num"].ToString(),
        attachment_key = dr["attachment_key"].ToString(),
        be_ready_for_review = (dr["be_ready_for_review"].ToString() == "1"),
        signer_1_member_id = dr["signer_1_member_id"].ToString(),
        signer_2_member_id = dr["signer_2_member_id"].ToString(),
        expiration_date = dr["expiration_date"].ToString(),
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_efficipay_dockets

  }

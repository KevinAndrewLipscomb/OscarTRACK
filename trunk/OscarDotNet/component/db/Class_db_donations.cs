using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_donations
  {

  public class TClass_db_donations: TClass_dbkeyclick
    {

    private TClass_dbkeyclick_trail dbkeyclick_trail = null;
    
    public TClass_db_donations() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string user_email_address,
      string watermark
      )
      {
      Open();
      (target as BaseDataList).DataSource = 
        (
        new MySqlCommand
          (
          "select per_clerk_seq_num"
          + " , amount"
          + " , IFNULL(resident_base.name,'OUR FRIENDS AT') as name"
          + " , CONCAT(house_num,' ',street.name) as address"
          + " , city.name as city"
          + " , abbreviation as state"
          + " from donation"
          +   " join resident_base using (id)"
          +   " join street on (street.id=resident_base.street_id)"
          +   " join city on (city.id=street.city_id)"
          +   " join state on (state.id=city.state_id)"
          + " where entered_by = '" + user_email_address + "'"
          +   " and donation.id > 0"
          +   (watermark.Length > 0 ? " and per_clerk_seq_num >= '" + watermark + "'" : k.EMPTY)
          + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
          connection
          )
        .ExecuteReader()
        );
      (target as BaseDataList).DataBind();
      Close();
      }
    internal void BindBaseDataList(string sort_order,bool be_sort_order_ascending,object target,string user_email_address)
      {
      BindBaseDataList(sort_order,be_sort_order_ascending,target,user_email_address,watermark:k.EMPTY);
      }

    internal void Log
      (
      string id,
      string amount,
      DateTime date,
      string in_mem_of,
      string note,
      string user_email_address,
      string donor_email_address
      )
      {
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        var per_clerk_seq_num = new MySqlCommand("select ifnull(max(per_clerk_seq_num)+1,1) as per_clerk_seq_num from donation where entered_by = '" + user_email_address + "'",connection,transaction).ExecuteScalar().ToString();
        new MySqlCommand
          (
          dbkeyclick_trail.Saved
            (
            "insert web_donor set email_address = '" + donor_email_address + "'"
            + " , resident_id = '" + id + "'"
            + " on duplicate key update resident_id = '" + id + "'"
            ),
          connection,
          transaction
          )
          .ExecuteNonQuery();
        new MySqlCommand
          (
          dbkeyclick_trail.Saved
            (
            "insert donation set id = '" + id + "'"
            + " , amount = '" + amount + "'"
            + " , date = '" + date.ToString("yyyy-MM-dd") + "'"
            + " , method = 'WEB'"
            + " , in_mem_of = NULLIF('" + in_mem_of + "','')"
            + " , note = NULLIF('" + note + "','')"
            + " , entered_by = '" + user_email_address + "'"
            + " , per_clerk_seq_num = '" + per_clerk_seq_num + "'"
            + " , web_donor_id = (select id from web_donor where email_address = '" + donor_email_address + "')"
            ),
          connection,
          transaction
          )
          .ExecuteNonQuery();
        new MySqlCommand(dbkeyclick_trail.Saved("update resident_base set year_of_last_appeal_to_become_a_donor = null where id = '" + id + "'"),connection,transaction).ExecuteNonQuery();
        transaction.Commit();
        }
      catch (Exception e)
        {
        transaction.Rollback();
        throw e;
        }
      Close();
      }

    }

  }

using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Text;
using System.Web.UI.WebControls;

namespace Class_db_donations
  {

  public class TClass_db_donations: TClass_dbkeyclick
    {

    private readonly TClass_dbkeyclick_trail dbkeyclick_trail = null;
    
    private string EnteredByConditionOf
      (
      string user_email_address,
      string entered_by_filter
      )
      {
      var entered_by_condition_of = "1=1";
      if (entered_by_filter == "You")
        {
        entered_by_condition_of = "entered_by = '" + user_email_address + "'";
        }
      else if (entered_by_filter == "Others")
        {
        entered_by_condition_of = "entered_by <> '" + user_email_address + "'";
        }
      return entered_by_condition_of;
      }

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
      string agency_scope,
      string range,
      string entered_by_filter
      )
      {
      var range_condition = "1=1";
      if (range == "LastSevenDays")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 7 DAY)";
        }
      else if (range == "LastThirtyOneDays")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 31 DAY)";
        }
      else if (range == "LastTwoMonths")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 2 MONTH)";
        }
      else if (range == "LastThreeMonths")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 3 MONTH)";
        }
      else if (range == "LastSixMonths")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 6 MONTH)";
        }
      else if (range == "LastTwelveMonths")
        {
        range_condition = "timestamp >= SUBDATE(CURDATE(),INTERVAL 1 YEAR)";
        }
      else if (range.Length > 0) // range is a particular year
        {
        range_condition = "YEAR(timestamp) = '" + range + "'";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        cmdText:new StringBuilder()
          .Append($"select CONCAT(entered_by,'-',per_clerk_seq_num) as `key`")
          .Append($" , DATE_FORMAT(date,'%Y-%m-%d') as donation_date")
          .Append($" , DATE_FORMAT(timestamp,'%Y-%m-%d %T') as timestamp")
          .Append($" , amount")
          .Append($" , IFNULL(resident_base.name,'OUR FRIENDS AT') as name")
          .Append($" , CONCAT(house_num,' ',street.name) as address")
          .Append($" , city.name as city")
          .Append($" , abbreviation as state")
          .Append($" from donation")
          .Append(  $" join resident_base using (id)")
          .Append(  $" join street on (street.id=resident_base.street_id)")
          .Append(  $" join city on (city.id=street.city_id)")
          .Append($" join state on (state.id=city.state_id)")
          .Append($" where {range_condition}")
          .Append(  $" and agency = '{agency_scope}'")
          .Append(  $" and donation.id > 0")
          .Append($" and {EnteredByConditionOf(user_email_address,entered_by_filter)}")
          .Append($" order by {sort_order.Replace("%", (be_sort_order_ascending ? " asc" : " desc"))}")
          .ToString(),
        connection:connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      Close();
      }

    internal void Log
      (
      string id,
      string amount,
      DateTime date,
      string in_mem_of,
      string note,
      string user_email_address,
      string donor_email_address,
      string donor_name = k.EMPTY
      )
      {
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        using var my_sql_command_1 = new MySqlCommand("select ifnull(max(per_clerk_seq_num)+1,1) as per_clerk_seq_num from donation where entered_by = '" + user_email_address + "'",connection,transaction);
        var per_clerk_seq_num = my_sql_command_1.ExecuteScalar().ToString();
        using var my_sql_command_2 = new MySqlCommand
          (
          dbkeyclick_trail.Saved
            (
            "insert web_donor set email_address = '" + donor_email_address + "'"
            + " , resident_id = '" + id + "'"
            + " on duplicate key update resident_id = '" + id + "'"
            ),
          connection,
          transaction
          );
        my_sql_command_2.ExecuteNonQuery();
        using var my_sql_command_3 = new MySqlCommand
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
          );
        my_sql_command_3.ExecuteNonQuery();
        using var my_sql_command = new MySqlCommand
          (dbkeyclick_trail.Saved("update resident_base set " + (donor_name.Length > 0 ? "name = '" + donor_name + "', " : k.EMPTY) + "year_of_last_appeal_to_become_a_donor = null where id = '" + id + "'"),connection,transaction);
        my_sql_command.ExecuteNonQuery();
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        throw;
        }
      Close();
      }

    internal string RecentPerClerkAsCsv
      (
      string clerk_email_address,
      string agency_scope,
      string entered_by_filter,
      string watermark
      )
      {
      var recent_per_clerk = new StringBuilder("key,amount,name,address,city,state,date");
      recent_per_clerk.AppendLine();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select CONCAT_WS('" + k.COMMA + "'"
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "CONCAT(entered_by,'-',per_clerk_seq_num)" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "amount" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "IFNULL(resident_base.name,'OUR FRIENDS AT')" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "CONCAT(house_num,' ',street.name)" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "city.name" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "abbreviation" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " , " + k.SQL_CSV_FIELDIFY_PREFIX + "date" + k.SQL_CSV_FIELDIFY_SUFFIX
        +   " ) as record"
        + " from donation"
        +   " join resident_base using (id)"
        +   " join street on (street.id=resident_base.street_id)"
        +   " join city on (city.id=street.city_id)"
        +   " join state on (state.id=city.state_id)"
        + " where donation.id > 0"
        +   " and agency = '" + agency_scope + "'"
        +   " and " + EnteredByConditionOf(clerk_email_address,entered_by_filter)
        +   " and timestamp >= '" + watermark + "'"
        + " order by timestamp desc, entered_by, per_clerk_seq_num",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        recent_per_clerk.AppendLine(dr["record"].ToString());
        }
      dr.Close();
      Close();
      return recent_per_clerk.ToString();
      }

    }

  }

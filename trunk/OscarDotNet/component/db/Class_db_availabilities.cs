using Class_dboscar;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_availabilities
  {
  public class TClass_db_availabilities: TClass_dboscar
    {

    internal k.int_nonnegative NumExtraForMemberForMonth
      (
      string member_id,
      string month_abbreviation
      )
      {
      var num_extra_for_member_for_month = new k.int_nonnegative();
      var num_extra_for_member_for_month_obj = new Object();
      Open();
      num_extra_for_member_for_month_obj = new MySqlCommand("select num_extras from avail_sheet where odnmid = '" + member_id + "' and month = '" + month_abbreviation + "'",connection).ExecuteScalar();
      if ((num_extra_for_member_for_month_obj != null) && (num_extra_for_member_for_month_obj != DBNull.Value))
        {
        num_extra_for_member_for_month.val = int.Parse(num_extra_for_member_for_month_obj.ToString());
        }
      Close();
      return num_extra_for_member_for_month;
      }

    internal void Purge()
      {
      Open();
      new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " delete avail_comment,avail_sheet"
        + " from avail_comment"
        +   " join avail_sheet on"
        +     " ("
        +       " avail_sheet.month=avail_comment.month"
        +     " and"
        +       " avail_sheet.last_name=avail_comment.last_name"
        +     " and"
        +       " avail_sheet.first_name=avail_comment.first_name"
        +     " and"
        +       " avail_sheet.timestamp=avail_comment.timestamp"
        +     " and"
        +       " avail_sheet.coord_agency=avail_comment.coord_agency"
        +     " )"
        + " where expiration < CURRENT_DATE"
        + ";"
        + " delete from avail_sheet where expiration < CURRENT_DATE"
        + ";"
        + " delete from report_cache where expiration < CURRENT_DATE"
        + ";"
        + " COMMIT",
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    internal string SpecialRequestCommentsForMemberForMonth
      (
      string member_id,
      string month_abbreviation
      )
      {
      var comments = k.EMPTY;
      Open();
      var dr = new MySqlCommand("select note from avail_sheet where odnmid = '" + member_id + "' and month = '" + month_abbreviation + "'",connection).ExecuteReader();
      while (dr.Read())
        {
        if (comments != k.EMPTY)
          {
          comments += k.NEW_LINE + ":" + k.NEW_LINE + ":" + k.NEW_LINE;
          }
        comments += k.Safe(dr["note"].ToString(),k.safe_hint_type.PUNCTUATED);
        }
      dr.Close();
      Close();
      return comments;
      }

    }
  }
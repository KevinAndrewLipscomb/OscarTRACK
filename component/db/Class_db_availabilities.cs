using Class_dboscar;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_availabilities
  {
  public class TClass_db_availabilities: TClass_dboscar
    {

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

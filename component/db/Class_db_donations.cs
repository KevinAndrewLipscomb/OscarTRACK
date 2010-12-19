using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_donations
  {

  public class TClass_db_donations: TClass_dbkeyclick
    {

    private TClass_dbkeyclick_trail dbkeyclick_trail = null;
    
    public TClass_db_donations() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    internal void Log
      (
      string id,
      string amount,
      DateTime date,
      string in_mem_of,
      string note,
      string user_email_address
      )
      {
      Open();
      new MySqlCommand
        (
        dbkeyclick_trail.Saved
          (
          "START TRANSACTION"
          + ";"
          + " insert donation set id = '" + id + "'"
          + " , amount = '" + amount + "'"
          + " , date = '" + date + "'"
          + " , method = 'WEB'"
          + " , in_mem_of = NULLIF('" + in_mem_of + "','')"
          + " , note = NULLIF('" + note + "','')"
          + " , entered_by = '" + user_email_address + "'"
          + " , per_clerk_seq_num = (select ifnull(max(per_clerk_seq_num)+1,1) as per_clerk_seq_num from donation where entered_by = '" + user_email_address + "')"
          + ";"
          + " update resident_base set year_of_last_appeal_to_become_a_donor = null where id = '" + id + "'"
          + ";"
          + "COMMIT"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }
    }

  }

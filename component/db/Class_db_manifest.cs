using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Security.Cryptography;
using System.Text;

namespace Class_db_manifest
  {

  public class TClass_db_manifest: TClass_dbkeyclick
    {

    private readonly TClass_dbkeyclick_trail dbkeyclick_trail = null;
    
    public TClass_db_manifest() : base()
      {
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Security", "CA5351:Do Not Use Broken Cryptographic Algorithms")]
    internal string NewBoardingPass
      (
      string agency_keyclick_enumerator,
      string email_address
      )
      {
      var boarding_pass_number_string = k.EMPTY;
      var ascii_encoding = new ASCIIEncoding();
      using var the_md5 = MD5.Create();
      var byte_buf = the_md5.ComputeHash(ascii_encoding.GetBytes(((new Random()).Next().ToString())));
      var i = new k.subtype<int>(0,16);
      for (i.val = 0; i.val < 16; i.val ++ )
        {
        boarding_pass_number_string += byte_buf[i.val].ToString("x2");
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        dbkeyclick_trail.Saved
          (
          "insert into manifest"
          + " set bpn = '" + boarding_pass_number_string + "'"
          + " , email_addr = '" + email_address + "'"
          + " , ip='(OscarTRACK)'"
          + " , agency = '" + agency_keyclick_enumerator + "'"
          + " , expiration_time = UNIX_TIMESTAMP() + 60*(select value from tuning_parm where name='boarding-pass-valid-minutes')"
          ),
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      return boarding_pass_number_string;
      }

    }

  }

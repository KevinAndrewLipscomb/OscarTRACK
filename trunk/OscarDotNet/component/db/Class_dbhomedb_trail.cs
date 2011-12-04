using Class_dbhomedb;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;

namespace Class_dbhomedb_trail
  {
  public class TClass_dbhomedb_trail: TClass_dbhomedb
    {

    public TClass_dbhomedb_trail() : base()
      {
      }

    public string Saved(string action)
      {
      // Make a local journal entry for convenient review.
      Open();
      new MySqlCommand
        (
        "insert into journal"
        + " set timestamp = null"
        + " , actor = \"" + HttpContext.Current.User.Identity.Name + "\""
        + " , action = \"" + Regex.Replace(action, Convert.ToString(k.QUOTE), k.DOUBLE_QUOTE) + "\"",
        connection
        )
        .ExecuteNonQuery();
      Close();
      // Send a representation of the action offsite as a contingency.
      k.SmtpMailSend
        (
        ConfigurationManager.AppSettings["sender_email_address"],
        ConfigurationManager.AppSettings["failsafe_recipient_email_address"],
        "homedb DB action by " + HttpContext.Current.User.Identity.Name,
        "/*" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + "*/ " + action
        );
      return action;
      }

    }

  }

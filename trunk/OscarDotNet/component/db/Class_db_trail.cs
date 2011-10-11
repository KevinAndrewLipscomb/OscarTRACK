using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;

namespace Class_db_trail
  {
  public class TClass_db_trail: TClass_db
    {

    public TClass_db_trail() : base()
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
        "DB action by " + HttpContext.Current.User.Identity.Name,
        "/*" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + k.SPACE + HttpContext.Current.Session["username"] + "*/ " + action
        );
      return action;
      }

    } // end TClass_db_trail

  }
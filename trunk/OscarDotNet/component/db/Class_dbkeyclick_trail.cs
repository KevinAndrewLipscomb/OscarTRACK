using Class_dbkeyclick;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;

namespace Class_dbkeyclick_trail
  {
  public class TClass_dbkeyclick_trail: TClass_dbkeyclick
    {

    public TClass_dbkeyclick_trail() : base()
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
        "keyclick DB action by " + HttpContext.Current.User.Identity.Name,
        "/*" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + "*/ " + action
        );
      return action;
      }

    }

  }

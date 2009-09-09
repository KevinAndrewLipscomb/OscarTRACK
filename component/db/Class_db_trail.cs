using MySql.Data.MySqlClient;

using System.Configuration;


using kix;

using System;



using System.Web;
using System.Text.RegularExpressions;
using Class_db;
namespace Class_db_trail
{
    public class TClass_db_trail: TClass_db
    {
        //Constructor  Create()
        public TClass_db_trail() : base()
        {
            // TODO: Add any constructor code here

        }
        public string Saved(string action)
        {
            string result;
            // Make a local journal entry for convenient review.
            this.Open();
            new MySqlCommand("insert into journal" + " set timestamp = null" + " , actor = \"" + HttpContext.Current.User.Identity.Name + "\"" + " , action = \"" + Regex.Replace(action, Convert.ToString(k.QUOTE), k.DOUBLE_QUOTE) + "\"", this.connection).ExecuteNonQuery();
            this.Close();
            // Send a representation of the action offsite as a contingency.
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["failsafe_recipient_email_address"], "DB action by " + HttpContext.Current.User.Identity.Name, "/*" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + "*/ " + action);
            result = action;

            return result;
        }

    } // end TClass_db_trail

}

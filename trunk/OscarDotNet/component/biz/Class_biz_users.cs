using System.Configuration;

using kix;

using System;

using Class_biz_notifications;
using Class_db_members;
using Class_db_users;
using Class_biz_user;
namespace Class_biz_users
{
    public class TClass_biz_users
    {
        private TClass_biz_notifications biz_notifications = null;
        private TClass_db_members db_members = null;
        private TClass_db_users db_users = null;
        //Constructor  Create()
        public TClass_biz_users() : base()
        {
            // TODO: Add any constructor code here
            biz_notifications = new TClass_biz_notifications();
            db_members = new TClass_db_members();
            db_users = new TClass_db_users();
        }
        public bool AcceptAsMember(string shared_secret, string id)
        {
            bool result;
            result = db_users.AcceptAsMember(shared_secret, id);
            return result;
        }

        public bool BeAuthorized(string username, string encoded_password)
        {
            bool result;
            result = db_users.BeAuthorized(username, encoded_password);
            return result;
        }

        public bool BeAuthorizedSysAdmin(string encoded_password)
        {
            bool result;
            result = (encoded_password == ConfigurationManager.AppSettings["sysadmin_encoded_password"]);
            return result;
        }

        public bool BeRegisteredEmailAddress(string email_address)
        {
            bool result;
            result = db_users.BeRegisteredEmailAddress(email_address);
            return result;
        }

        public bool BeRegisteredUsername(string username)
        {
            bool result;
            result = db_users.BeRegisteredUsername(username);
            return result;
        }

        public bool BeStalePassword(string id)
        {
            bool result;
            result = db_users.BeStalePassword(id);
            return result;
        }

        public bool Bind(string partial_username, object target)
        {
            bool result;
            result = db_users.Bind(partial_username, target);
            return result;
        }

        public void Delete(string username)
        {
            db_users.Delete(username);
        }

        public bool Get(string username, out string encoded_password, out bool be_stale_password, out string password_reset_email_address, out bool be_active, out uint num_unsuccessful_login_attempts, out string last_login)
          {
          return db_users.Get(username, out encoded_password, out be_stale_password, out password_reset_email_address, out be_active, out num_unsuccessful_login_attempts, out last_login);
          }

        public string IdOf(string username)
        {
            string result;
            result = db_users.IdOf(username);
            return result;
        }

        public void IssueTemporaryPassword(string username, string client_host_name)
        {
            string temporary_password;
            // Build a suitably-random password string.
            temporary_password = System.Guid.NewGuid().ToString().Substring(0, int.Parse(ConfigurationManager.AppSettings["temp_password_len"]));
            // Make the password string the user's new temporary password, and set the stale flag to force an immediate password change.
            db_users.SetTemporaryPassword(username, k.Digest(temporary_password));
            // Send the new password to the user's email address of record.
            biz_notifications.IssueForTemporaryPassword(username, client_host_name, temporary_password);
        }

        public void IssueUsernameReminder(string email_address, string client_host_name)
        {
            biz_notifications.IssueForForgottenUsername(email_address, db_users.UsernameOfEmailAddress(email_address), client_host_name);
        }

        public uint NumUnsuccessfulLoginAttemptsOf(string username)
        {
            uint result;
            result = db_users.NumUnsuccessfulLoginAttemptsOf(username);
            return result;
        }

        public string PasswordResetEmailAddressOfId(string id)
        {
            string result;
            result = db_users.PasswordResetEmailAddressOfId(id);
            return result;
        }

        public string PasswordResetEmailAddressOfUsername(string username)
        {
            string result;
            result = db_users.PasswordResetEmailAddressOfUsername(username);
            return result;
        }

        public string[] PrivilegesOf(string id)
        {
            string[] result;
            result = db_users.PrivilegesOf(id);
            return result;
        }

        public void RecordSuccessfulLogin(string id)
        {
            db_users.RecordSuccessfulLogin(id);
        }

        public void RecordUnsuccessfulLoginAttempt(string username)
        {
            db_users.RecordUnsuccessfulLoginAttempt(username);
        }

        public void RegisterNew(string username, string encoded_password, string email_address)
        {
            db_users.RegisterNew(username, encoded_password, email_address);
        }

        public string SelfEmailAddress()
        {
            string result;
            result = PasswordResetEmailAddressOfId(new TClass_biz_user().IdNum());
            return result;
        }

        public void Set(string username, bool be_stale_password, string password_reset_email_address, bool be_active)
        {
            db_users.Set(username, be_stale_password, password_reset_email_address, be_active);

        }

        public void SetEmailAddress(string id, string email_address)
        {
            db_users.SetEmailAddress(id, email_address);
            db_members.SetEmailAddress(db_members.IdOfUserId(id), email_address);
        }

        public void SetPassword(string id, string encoded_password)
        {
            db_users.SetPassword(id, encoded_password);
        }

    } // end TClass_biz_users

}

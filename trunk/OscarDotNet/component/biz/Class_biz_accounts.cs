using Class_db_accounts;
using System.Configuration;

namespace Class_biz_accounts
  {
  public class TClass_biz_accounts
    {
        private readonly TClass_db_accounts db_accounts = null;

        //Constructor  Create()
        public TClass_biz_accounts() : base()
        {
            // TODO: Add any constructor code here
            db_accounts = new TClass_db_accounts();
        }
        public bool BeStalePassword(string user_kind, string user_id)
        {
            bool result;
            result = db_accounts.BeStalePassword(user_kind, user_id);
            return result;
        }

        public bool BeValidSysAdminCredentials(string encoded_password)
        {
            bool result;
            result = (encoded_password == ConfigurationManager.AppSettings["sysadmin_encoded_password"]);
            return result;
        }

        public void BindSquadCommanders(object target)
        {
            db_accounts.BindSquadCommanders(target);
        }

        public void BindDepartmentStaffers(object target)
        {
            db_accounts.BindDepartmentStaffers(target);
        }

        public void BindMembers(object target)
        {
            db_accounts.BindMembers(target);
        }

        public void Check(string user_kind, string user_id, out bool be_stale_password, out string email_address)
        {
            db_accounts.Check(user_kind, user_id, out be_stale_password, out email_address);
        }

        public string EmailAddressByKindId(string user_kind, string user_id)
        {
            string result;
            result = db_accounts.EmailAddressByKindId(user_kind, user_id);
            return result;
        }

        public string EmailTargetByRole(string role)
        {
            string result;
            result = db_accounts.EmailTargetByRole(role);
            return result;
        }

        public bool Exists(string user_kind, string user_id, string encoded_password)
        {
            bool result;
            result = db_accounts.Exists(user_kind, user_id, encoded_password);
            return result;
        }

        public void SetEmailAddress(string user_kind, string user_id, string email_address)
        {
            db_accounts.SetEmailAddress(user_kind, user_id, email_address);
        }

        public void SetPassword(string user_kind, string user_id, string encoded_password)
        {
            db_accounts.SetPassword(user_kind, user_id, encoded_password);
        }

        public void SetTemporaryPassword(string user_kind, string user_id, string encoded_password)
        {
            db_accounts.SetTemporaryPassword(user_kind, user_id, encoded_password);
        }

    } // end TClass_biz_accounts

}

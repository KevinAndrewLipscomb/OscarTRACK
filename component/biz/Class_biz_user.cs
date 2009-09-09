using System;

using System.Web;
using Class_db_user;
using Class_db_users;
namespace Class_biz_user
{
    public class TClass_biz_user
    {
        private TClass_db_user db_user = null;
        private TClass_db_users db_users = null;
        //Constructor  Create()
        public TClass_biz_user() : base()
        {
            // TODO: Add any constructor code here
            db_user = new TClass_db_user();
            db_users = new TClass_db_users();
        }
        public string EmailAddress()
        {
            string result;
            result = db_users.PasswordResetEmailAddressOfId(IdNum());
            return result;
        }

        public string IdNum()
        {
            string result;
            result = db_users.IdOf(HttpContext.Current.User.Identity.Name);
            return result;
        }

        public string[] Privileges()
        {
            string[] result;
            result = db_users.PrivilegesOf(IdNum());
            return result;
        }

        public string[] Roles()
        {
            string[] result;
            result = db_user.RolesOf(IdNum());
            return result;
        }

    } // end TClass_biz_user

}

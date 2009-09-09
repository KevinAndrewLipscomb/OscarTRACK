using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Specialized;
using System.Web.UI.WebControls;

namespace Class_db_users
{
    public class TClass_db_users: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_users() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool AcceptAsMember(string shared_secret, string id)
        {
            bool result;
            bool accept_as_member;
            object member_id_obj;
            accept_as_member = false;
            this.Open();
            member_id_obj = new MySqlCommand("select id from member where cad_num = \"" + shared_secret + "\"", this.connection).ExecuteScalar();
            if (member_id_obj != null)
            {
                new MySqlCommand(db_trail.Saved("START TRANSACTION" + ";" + " insert user_member_map" + " set user_id = " + id + " , member_id = " + member_id_obj.ToString() + " on duplicate key update user_id = " + id + ";" + " update member" + " join user_member_map on (user_member_map.member_id=member.id)" + " join user on (user.id=user_member_map.user_id)" + " set email_address = password_reset_email_address" + " where member.id = " + member_id_obj.ToString() + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
                accept_as_member = true;
            }
            this.Close();
            result = accept_as_member;
            return result;
        }

        public bool BeAuthorized(string username, string encoded_password)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user" + " where username = \"" + username + "\"" + " and encoded_password = \"" + encoded_password + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeRegisteredEmailAddress(string email_address)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user where password_reset_email_address = \"" + email_address + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeRegisteredUsername(string username)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM user where username = \"" + username + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public bool BeStalePassword(string id)
        {
            bool result;
            this.Open();
            result = "1" == new MySqlCommand("SELECT be_stale_password FROM user where id=" + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public bool Bind(string partial_username, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT username FROM user WHERE username like \"" + partial_username + "%\" order by username", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["username"].ToString(), dr["username"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void Delete(string username)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("delete from user where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public bool Get(string username, out string encoded_password, out bool be_stale_password, out string password_reset_email_address, out bool be_active, out uint num_unsuccessful_login_attempts, out string last_login)
        {
            bool result;
            MySqlDataReader dr;

            encoded_password = k.EMPTY;
            be_stale_password = false;
            password_reset_email_address = k.EMPTY;
            be_active = false;
            num_unsuccessful_login_attempts = 0;
            last_login = k.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select username" + " , IFNULL(encoded_password,\"\") as encoded_password" + " , be_stale_password" + " , password_reset_email_address" + " , be_active" + " , num_unsuccessful_login_attempts" + " , IFNULL(last_login,\"\") as last_login" + " from user" + " where username = \"" + username + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                username = dr["username"].ToString();
                encoded_password = dr["encoded_password"].ToString();
                be_stale_password = (dr["be_stale_password"].ToString() == "1");
                password_reset_email_address = dr["password_reset_email_address"].ToString();
                be_active = (dr["be_active"].ToString() == "1");
                num_unsuccessful_login_attempts = uint.Parse(dr["num_unsuccessful_login_attempts"].ToString());
                last_login = dr["last_login"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string IdOf(string username)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select id from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public uint NumUnsuccessfulLoginAttemptsOf(string username)
        {
            uint result;
            this.Open();
            result = uint.Parse(new MySqlCommand("select num_unsuccessful_login_attempts from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString());
            this.Close();
            return result;
        }

        public string PasswordResetEmailAddressOfId(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select password_reset_email_address from user where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string PasswordResetEmailAddressOfUsername(string username)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select password_reset_email_address from user where username = \"" + username + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string[] PrivilegesOf(string id)
        {
            MySqlDataReader dr;
            StringCollection privileges_of_string_collection = new StringCollection();
            this.Open();
            dr = new MySqlCommand("select distinct name" + " from user_member_map" + " join role_member_map using (member_id)" + " join role_privilege_map using (role_id)" + " join privilege on (privilege.id=role_privilege_map.privilege_id)" + " where user_id = " + id, this.connection).ExecuteReader();
            while (dr.Read())
            {
                privileges_of_string_collection.Add(dr["name"].ToString());
            }
            dr.Close();
            this.Close();
            string[] privileges_of = new string[privileges_of_string_collection.Count];
            privileges_of_string_collection.CopyTo(privileges_of,0);
            return privileges_of;
        }

        public void RecordSuccessfulLogin(string id)
        {
            this.Open();
            // Deliberately not db_trail.Saved.
            new MySqlCommand("update user" + " set num_unsuccessful_login_attempts = 0" + " , last_login = NOW()" + " where id = " + id, this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void RecordUnsuccessfulLoginAttempt(string username)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set num_unsuccessful_login_attempts = num_unsuccessful_login_attempts + 1" + " where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void RegisterNew(string username, string encoded_password, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("insert into user" + " set username = \"" + username + "\"" + " , encoded_password = \"" + encoded_password + "\"" + " , be_stale_password = FALSE" + " , password_reset_email_address = \"" + email_address + "\"" + " , last_login = NOW()"), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void Set(string username, bool be_stale_password, string password_reset_email_address, bool be_active)
        {
            string childless_field_assignments_clause;
            childless_field_assignments_clause = " be_stale_password = " + be_stale_password.ToString() + " , password_reset_email_address = \"" + password_reset_email_address + "\"" + " , be_active = " + be_active.ToString();
            this.Open();
            new MySqlCommand(db_trail.Saved("insert user" + " set username = \"" + username + "\"" + " , " + childless_field_assignments_clause + " on duplicate key update " + childless_field_assignments_clause), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetEmailAddress(string id, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE user" + " SET password_reset_email_address = \"" + email_address + "\"" + " WHERE id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetPassword(string id, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set encoded_password = \"" + encoded_password + "\"," + " be_stale_password = FALSE " + " where id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetTemporaryPassword(string username, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update user" + " set encoded_password = \"" + encoded_password + "\"," + " be_stale_password = TRUE " + " where username = \"" + username + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public string UsernameOfEmailAddress(string email_address)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select username from user where password_reset_email_address = \"" + email_address + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    } // end TClass_db_users

}

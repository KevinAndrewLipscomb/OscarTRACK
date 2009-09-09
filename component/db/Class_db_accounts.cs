using MySql.Data.MySqlClient;
using kix;
using System;

using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
namespace Class_db_accounts
{
    public class TClass_db_accounts: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_accounts() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool BeStalePassword(string user_kind, string user_id)
        {
            bool result;
            this.Open();
            result = "1" == new MySqlCommand("SELECT be_stale_password FROM " + user_kind + "_user where id=" + user_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public void BindSquadCommanders(object target)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", "0"));
            dr = new MySqlCommand("SELECT squad_commander_user.id,concat(squad_commander_user.id,\"50\") as name" + " FROM squad_commander_user JOIN agency on (agency.id = squad_commander_user.id)" + " WHERE agency.be_active = TRUE" + " and squad_commander_user.be_active = TRUE" + " ORDER BY agency.id", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), "squad_commander_" + dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public void BindDepartmentStaffers(object target)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", "0"));
            dr = new MySqlCommand("SELECT id,name " + "FROM department_staffer_user JOIN department_staffer using (id) " + "WHERE be_active = TRUE " + "ORDER BY name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), "department_staffer_" + dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public void BindMembers(object target)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", "0"));
            dr = new MySqlCommand("SELECT id" + " , concat(last_name,\", \",first_name,ifnull(concat(\", \",cad_num),\"\")) as name" + " FROM member_user JOIN member using (id)" + " WHERE be_active = TRUE" + " ORDER BY last_name,first_name,cad_num", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), "member_" + dr["id"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public void Check(string user_kind, string user_id, out bool be_stale_password, out string email_address)
        {
            MySqlDataReader dr;
            this.Open();
            dr = new MySqlCommand("SELECT be_stale_password" + " , password_reset_email_address" + " FROM " + user_kind + "_user" + " where id = " + user_id, this.connection).ExecuteReader();
            dr.Read();
            if (dr["be_stale_password"].ToString() == "0")
            {
                be_stale_password = false;
                if (be_stale_password)
                {
                    email_address = dr["password_reset_email_address"].ToString();
                }
                else
                {
                    email_address = k.EMPTY;
                }
            }
            else
            {
                be_stale_password = true;
                email_address = k.EMPTY;
            }
            dr.Close();
            this.Close();
        }

        public string EmailAddressByKindId(string user_kind, string user_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select password_reset_email_address from " + user_kind + "_user where id = " + user_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string EmailTargetByRole(string role)
        {
            string result;
            MySqlDataReader dr;
            string email_target;
            email_target = k.EMPTY;
            this.Open();
            dr = new MySqlCommand("select password_reset_email_address" + " from department_staffer_user" + " join department_staffer_role on (department_staffer_role.user_id=department_staffer_user.id)" + " join department_staffer_group on (department_staffer_group.id=department_staffer_role.group_id)" + " where department_staffer_group.name = \"" + role + "\"", this.connection).ExecuteReader();
            while (dr.Read())
            {
                email_target = email_target + dr["password_reset_email_address"].ToString() + k.COMMA;
            }
            dr.Close();
            this.Close();
            result = email_target.Substring(0, email_target.Length - 1);
            return result;
        }

        public bool Exists(string user_kind, string user_id, string encoded_password)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("SELECT 1 FROM " + user_kind + "_user" + " where id = " + user_id + " and encoded_password = \"" + encoded_password + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

        public void SetEmailAddress(string user_kind, string user_id, string email_address)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE " + user_kind + "_user " + "SET password_reset_email_address = \"" + email_address + "\"" + "WHERE id = " + user_id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetPassword(string user_kind, string user_id, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update " + user_kind + "_user" + " set encoded_password = \"" + encoded_password + "\"," + " be_stale_password = FALSE " + " where id = " + user_id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void SetTemporaryPassword(string user_kind, string user_id, string encoded_password)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update " + user_kind + "_user" + " set encoded_password = \"" + encoded_password + "\"," + " be_stale_password = TRUE " + " where id = " + user_id), this.connection).ExecuteNonQuery();
            this.Close();
        }

    } // end TClass_db_accounts

}

using MySql.Data.MySqlClient;

using System.Configuration;


using kix;

using System;


using System.Web.UI.WebControls;
using Class_biz_data_conditions;
using Class_db;
using Class_db_trail;
namespace Class_db_notifications
{
    public class TClass_db_notifications: TClass_db
    {
        private TClass_biz_data_conditions biz_data_conditions = null;
        private TClass_db_trail db_trail = null;
        private string tier_2_match_field = String.Empty;
        private string tier_3_match_field = String.Empty;
        //Constructor  Create()
        public TClass_db_notifications() : base()
        {
            // TODO: Add any constructor code here
            biz_data_conditions = new TClass_biz_data_conditions();
            db_trail = new TClass_db_trail();
            tier_2_match_field = ConfigurationManager.AppSettings["tier_2_match_field"];
            tier_3_match_field = ConfigurationManager.AppSettings["tier_3_match_field"];
        }
        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            this.Open();
            dr = new MySqlCommand("select notification.id as notification_id" + " , name as notification_name" + " from notification" + " order by notification_name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["notification_name"].ToString(), dr["notification_id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != k.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Notification --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public void BindTallies(object DataGrid_for_cycle, object DataGrid_for_lifetime)
        {
            this.Open();
            ((DataGrid_for_cycle) as DataGrid).DataSource = new MySqlCommand("select name" + " , tally_of_events_for_cycle" + " , activity_description" + " , tally_of_messages_for_cycle" + " from notification" + " where name <> \"needs-enrollment-review\"" + " order by activity_pecking_order", this.connection).ExecuteReader();
            ((DataGrid_for_cycle) as DataGrid).DataBind();
            ((MySqlDataReader)(((DataGrid)(DataGrid_for_cycle)).DataSource)).Close();
            ((DataGrid_for_lifetime) as DataGrid).DataSource = new MySqlCommand("select name" + " , tally_of_events_for_lifetime" + " , activity_description" + " , tally_of_messages_for_lifetime" + " from notification" + " where name <> \"needs-enrollment-review\"" + " order by activity_pecking_order", this.connection).ExecuteReader();
            ((DataGrid_for_lifetime) as DataGrid).DataBind();
            ((MySqlDataReader)(((DataGrid)(DataGrid_for_lifetime)).DataSource)).Close();
            this.Close();
        }

        public void CycleTallies()
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update notification set tally_of_messages_for_cycle = 0, tally_of_events_for_cycle = 0"), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void IncrementTallies(string name, uint num_addressees)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update notification" + " set tally_of_messages_for_cycle = tally_of_messages_for_cycle + " + num_addressees.ToString() + " , tally_of_events_for_cycle = tally_of_events_for_cycle + 1" + " , tally_of_messages_for_lifetime = tally_of_messages_for_lifetime + " + num_addressees.ToString() + " , tally_of_events_for_lifetime = tally_of_events_for_lifetime + 1" + " where name = \"" + name + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void IncrementTallies(string name)
        {
            IncrementTallies(name, 0);
        }

        public string TargetOf(string name, string member_id)
        {
            string result;
            MySqlDataReader dr;
            uint num_addressees;
            string target_of;
            string tier_2_match_value;
            string tier_3_match_value;
            target_of = k.EMPTY;
            num_addressees = 0;
            this.Open();
            // Get tier 2 and 3 associations of target member.
            dr = new MySqlCommand("select " + tier_2_match_field + k.COMMA + tier_3_match_field + " from member where id = " + member_id, this.connection).ExecuteReader();
            dr.Read();
            tier_2_match_value = dr[tier_2_match_field].ToString();
            tier_3_match_value = dr[tier_3_match_field].ToString();
            dr.Close();
            // Tier 1 stakeholders
            dr = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 1" + " and notification.name = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if ((dr["data_condition_name"].ToString() == "none") || ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id)))
                    {
                        target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                        num_addressees = num_addressees + 1;
                    }
                }
            }
            dr.Close();
            // Tier 2 stakeholders
            dr = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 2" + " and " + tier_2_match_field + " = " + tier_2_match_value + " and notification.name = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if ((dr["data_condition_name"].ToString() == "none") || ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id)))
                    {
                        target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                        num_addressees = num_addressees + 1;
                    }
                }
            }
            dr.Close();
            // Tier 3 stakeholders
            dr = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 3" + " and " + tier_2_match_field + " = " + tier_2_match_value + " and " + tier_3_match_field + " = " + tier_3_match_value + " and notification.name = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if ((dr["data_condition_name"].ToString() == "none") || ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id)))
                    {
                        target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                        num_addressees = num_addressees + 1;
                    }
                }
            }
            dr.Close();
            IncrementTallies(name, num_addressees);
            this.Close();
            if (target_of != k.EMPTY)
            {
                result = target_of.Substring(0, target_of.Length - 1);
            }
            else
            {
                result = k.EMPTY;
            }
            return result;
        }

        public string TargetOfAboutAgency(string name)
          {
          return TargetOfAboutAgency(name,k.EMPTY);
          }
        public string TargetOfAboutAgency(string name, string agency_id)
        {
            string result;
            MySqlDataReader dr;
            uint num_addressees;
            string target_of_about_agency;
            var variant_condition = k.EMPTY;
            target_of_about_agency = k.EMPTY;
            num_addressees = 0;
            this.Open();
            if (agency_id == "0")
            {
                // EMS is tier 1
                variant_condition = " where (tier_id = 1)";
            }
            else if (agency_id != k.EMPTY)
            {
                // All other agencies are tier 2
                variant_condition = " where (tier_id = 2) and (agency_id = \"" + agency_id + "\")";
            }
            dr = new MySqlCommand("select email_address" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + variant_condition + " and notification.name = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    target_of_about_agency = target_of_about_agency + dr["email_address"].ToString() + k.COMMA;
                    num_addressees = num_addressees + 1;
                }
            }
            dr.Close();
            IncrementTallies(name, num_addressees);
            this.Close();
            if (target_of_about_agency != k.EMPTY)
            {
                result = target_of_about_agency.Substring(0, target_of_about_agency.Length - 1);
            }
            else
            {
                result = k.EMPTY;
            }

            return result;
        }

    } // end TClass_db_notifications

}

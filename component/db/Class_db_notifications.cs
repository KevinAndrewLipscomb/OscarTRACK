using Class_biz_data_conditions;
using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_notifications
  {

    public class TClass_db_notifications: TClass_db
    {

        private readonly TClass_biz_data_conditions biz_data_conditions = null;
        private readonly TClass_db_trail db_trail = null;
        private readonly string tier_2_match_field = String.Empty;
        private readonly string tier_3_match_field = String.Empty;

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
            Open();
            using var my_sql_command = new MySqlCommand("select notification.id as notification_id" + " , name as notification_name" + " from notification" + " order by notification_name", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["notification_name"].ToString(), dr["notification_id"].ToString()));
            }
            dr.Close();
            Close();
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
            Open();
            using var my_sql_command_1 = new MySqlCommand("select name" + " , tally_of_events_for_cycle" + " , activity_description" + " , tally_of_messages_for_cycle" + " from notification" + " where name <> \"needs-enrollment-review\"" + " order by activity_pecking_order", connection);
            ((DataGrid_for_cycle) as DataGrid).DataSource = my_sql_command_1.ExecuteReader();
            ((DataGrid_for_cycle) as DataGrid).DataBind();
            ((MySqlDataReader)(((DataGrid)(DataGrid_for_cycle)).DataSource)).Close();
            using var my_sql_command_2 = new MySqlCommand("select name" + " , tally_of_events_for_lifetime" + " , activity_description" + " , tally_of_messages_for_lifetime" + " from notification" + " where name <> \"needs-enrollment-review\"" + " order by activity_pecking_order", connection);
            ((DataGrid_for_lifetime) as DataGrid).DataSource = my_sql_command_2.ExecuteReader();
            ((DataGrid_for_lifetime) as DataGrid).DataBind();
            ((MySqlDataReader)(((DataGrid)(DataGrid_for_lifetime)).DataSource)).Close();
            Close();
        }

        public void CycleTallies()
        {
            Open();
            using var my_sql_command = new MySqlCommand(db_trail.Saved("update notification set tally_of_messages_for_cycle = 0, tally_of_events_for_cycle = 0"), connection);
            my_sql_command.ExecuteNonQuery();
            Close();
        }

        public void IncrementTallies(string name, uint num_addressees)
        {
            Open();
            using var my_sql_command = new MySqlCommand(db_trail.Saved("update notification" + " set tally_of_messages_for_cycle = tally_of_messages_for_cycle + " + num_addressees.ToString() + " , tally_of_events_for_cycle = tally_of_events_for_cycle + 1" + " , tally_of_messages_for_lifetime = tally_of_messages_for_lifetime + " + num_addressees.ToString() + " , tally_of_events_for_lifetime = tally_of_events_for_lifetime + 1" + " where name = \"" + name + "\""), connection);
            my_sql_command.ExecuteNonQuery();
            Close();
        }

        public void IncrementTallies(string name)
        {
            IncrementTallies(name, 0);
        }

        public string TargetOf
          (
          string name,
          string member_id,
          string role_name
          )
          {
            string result;
            MySqlDataReader dr;
            uint num_addressees;
            string target_of;
            string tier_2_match_value;
            string tier_3_match_value;
            target_of = k.EMPTY;
            num_addressees = 0;
            Open();
            // Get tier 2 and 3 associations of target member.
            using var my_sql_command = new MySqlCommand("select " + tier_2_match_field + k.COMMA + tier_3_match_field + " from member where id = " + member_id, connection);
            dr = my_sql_command.ExecuteReader();
            dr.Read();
            tier_2_match_value = dr[tier_2_match_field].ToString();
            tier_3_match_value = dr[tier_3_match_field].ToString();
            dr.Close();
            // Tier 1 stakeholders
            using var my_sql_command_1 = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 1" + " and notification.name = \"" + name + "\"", connection);
            dr = my_sql_command_1.ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if(
                        (dr["data_condition_name"].ToString() == "none")
                      ||
                        ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id))
                      ||
                        ((role_name != k.EMPTY) && (dr["data_condition_name"].ToString() == "BeRolePersonnelRelated") && biz_data_conditions.BeRolePersonnelRelated(role_name))
                      )
                    //
                      {
                      target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                      num_addressees++;
                      }
                }
            }
            dr.Close();
            // Tier 2 stakeholders
            using var my_sql_command_2 = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 2" + " and " + tier_2_match_field + " = " + tier_2_match_value + " and notification.name = \"" + name + "\"", connection);
            dr = my_sql_command_2.ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if(
                        (dr["data_condition_name"].ToString() == "none")
                      ||
                        ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id))
                      ||
                        ((role_name != k.EMPTY) && (dr["data_condition_name"].ToString() == "BeRolePersonnelRelated") && biz_data_conditions.BeRolePersonnelRelated(role_name))
                      )
                    //
                      {
                      target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                      num_addressees++;
                      }
                }
            }
            dr.Close();
            // Tier 3 stakeholders
            using var my_sql_command_3 = new MySqlCommand("select email_address" + " , data_condition.name as data_condition_name" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)" + " join role on (role.id=role_member_map.role_id)" + " join notification on (notification.id=role_notification_map.notification_id)" + " join data_condition on (data_condition.id=role_notification_map.data_condition_id)" + " where tier_id = 3" + " and " + tier_2_match_field + " = " + tier_2_match_value + " and " + tier_3_match_field + " = " + tier_3_match_value + " and notification.name = \"" + name + "\"", connection);
            dr = my_sql_command_3.ExecuteReader();
            if (dr != null)
            {
                while (dr.Read())
                {
                    if(
                        (dr["data_condition_name"].ToString() == "none")
                      ||
                        ((dr["data_condition_name"].ToString() == "BeMemberTrainee") && biz_data_conditions.BeMemberTrainee(member_id))
                      ||
                        ((role_name != k.EMPTY) && (dr["data_condition_name"].ToString() == "BeRolePersonnelRelated") && biz_data_conditions.BeRolePersonnelRelated(role_name))
                      )
                    //
                      {
                      target_of = target_of + dr["email_address"].ToString() + k.COMMA;
                      num_addressees++;
                      }
                }
            }
            dr.Close();
            IncrementTallies(name, num_addressees);
            Close();
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
        public string TargetOf(string name, string member_id)
          {
          return TargetOf(name,member_id,k.EMPTY);
          }

    public string TargetOfAboutAgency
      (
      string name,
      string agency_id = k.EMPTY
      )
      {
      var variant_condition = k.EMPTY;
      var target_of_about_agency = k.EMPTY;
      uint num_addressees = 0;
      Open();
      if (agency_id == "0")
        {
        // EMS is tier 1
        variant_condition = " where (tier_id = 1)";
        }
      else if (agency_id != k.EMPTY)
        {
        // All other agencies are tier 2
        variant_condition = " where (tier_id = 2) and ({AGENCY_ID_PARENT_TABLE}.agency_id = '" + agency_id + "')";
        }
      //
      MySqlDataReader dr;
      using var my_sql_command = new MySqlCommand
        (
        "select email_address"
        + " from member"
        +   " join role_member_map on (role_member_map.member_id=member.id)"
        +   " join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)"
        +   " join role on (role.id=role_member_map.role_id)"
        +   " join notification on (notification.id=role_notification_map.notification_id)"
        + variant_condition.Replace("{AGENCY_ID_PARENT_TABLE}","member")
        + " and notification.name = '" + name + "'"
        + " UNION"
        + " select email_address"
        + " from member"
        +   " join special_role_member_map on (special_role_member_map.member_id=member.id)"
        +   " join role_notification_map on (role_notification_map.role_id=special_role_member_map.role_id)"
        +   " join role on (role.id=special_role_member_map.role_id)"
        +   " join notification on (notification.id=role_notification_map.notification_id)"
        + variant_condition.Replace("{AGENCY_ID_PARENT_TABLE}","special_role_member_map")
        + " and notification.name = '" + name + "'",
        connection
        );
      dr = my_sql_command.ExecuteReader();
      if (dr != null)
        {
        while (dr.Read())
          {
          target_of_about_agency += dr["email_address"].ToString() + k.COMMA;
          num_addressees++;
          }
        }
      dr.Close();
      //
      IncrementTallies(name, num_addressees);
      Close();
      return (target_of_about_agency.Length > 0 ? target_of_about_agency.Substring(0, target_of_about_agency.Length - 1) : k.EMPTY);
      }

    } // end TClass_db_notifications

  }

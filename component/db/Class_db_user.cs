using Class_db;
using MySql.Data.MySqlClient;
using System.Collections.Specialized;
using System.Web.UI.WebControls;

namespace Class_db_user
  {

  public class TClass_db_user: TClass_db
    {

    public TClass_db_user() : base()
      {
      }

    internal void BindRolesToBaseDataList
      (
      string id,
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select role.name as role"
        + " , 1 as tier" //IF(role_member_map_scope_column_c_name is not null,4,IF(role_member_map_scope_column_b_name is not null,3,IF(role_member_map_scope_column_a_name is not null,2,1))) as tier"
        + " , '' as scope" //IF(role_member_map_scope_column_c_name is not null,concat('role_member_map_scope_c `',role_member_map_scope_column_c_ref_table.name,'`'),IF(role_member_map_scope_column_b_name is not null,concat('role_member_map_scope_b `',role_member_map_scope_column_b_ref_table.name,'`'),IF(role_member_map_scope_column_a_name is not null,concat('role_member_map_scope_a `',role_member_map_scope_column_a_ref_table.name,'`'),''))) as scope"
        + " from user"
        +   " join user_member_map on (user_member_map.user_id=user.id)"
        +   " join role_member_map using (member_id)"
        //+   " left join role_member_map_scope_column_a_ref_table on (role_member_map_scope_column_a_ref_table.id=role_member_map.role_member_map_scope_column_a_name)"
        //+   " left join role_member_map_scope_column_b_ref_table on (role_member_map_scope_column_b_ref_table.id=role_member_map.role_member_map_scope_column_b_name)"
        //+   " left join role_member_map_scope_column_c_ref_table on (role_member_map_scope_column_c_ref_table.id=role_member_map.role_member_map_scope_column_c_name)"
        +   " join role on (role.id=role_member_map.role_id)"
        + " where user.id = '" + id + "'"
        + " order by role,tier,scope",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void BindPrivilegesToBaseDataList
      (
      string id,
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select distinct privilege.name as privilege"
        + " , 1 as tier" //IF(role_member_map_scope_column_c_name is not null,4,IF(role_member_map_scope_column_b_name is not null,3,IF(role_member_map_scope_column_a_name is not null,2,1))) as tier"
        + " , '' as scope" //IF(role_member_map_scope_column_c_name is not null,concat('role_member_map_scope_c `',role_member_map_scope_column_c_ref_table.name,'`'),IF(role_member_map_scope_column_b_name is not null,concat('role_member_map_scope_b `',role_member_map_scope_column_b_ref_table.name,'`'),IF(role_member_map_scope_column_a_name is not null,concat('role_member_map_scope_a `',role_member_map_scope_column_a_ref_table.name,'`'),''))) as scope"
        + " from user"
        +   " join user_member_map on (user_member_map.user_id=user.id)"
        +   " join role_member_map using (member_id)"
        //+   " left join role_member_map_scope_column_a_ref_table on (role_member_map_scope_column_a_ref_table.id=role_member_map.role_member_map_scope_column_a_name)"
        //+   " left join role_member_map_scope_column_b_ref_table on (role_member_map_scope_column_b_ref_table.id=role_member_map.role_member_map_scope_column_b_name)"
        //+   " left join role_member_map_scope_column_c_ref_table on (role_member_map_scope_column_c_ref_table.id=role_member_map.role_member_map_scope_column_c_name)"
        +   " join role_privilege_map using (role_id)"
        +   " join privilege on (privilege.id=role_privilege_map.privilege_id)"
        + " where user.id = '" + id + "'"
        + " order by privilege,tier,scope",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    internal void BindNotificationsToBaseDataList
      (
      string id,
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select distinct notification.name as notification"
        + " , 1 as tier" //IF(role_member_map_scope_column_c_name is not null,4,IF(role_member_map_scope_column_b_name is not null,3,IF(role_member_map_scope_column_a_name is not null,2,1))) as tier"
        + " , '' as scope" //IF(role_member_map_scope_column_c_name is not null,concat('role_member_map_scope_c `',role_member_map_scope_column_c_ref_table.name,'`'),IF(role_member_map_scope_column_b_name is not null,concat('role_member_map_scope_b `',role_member_map_scope_column_b_ref_table.name,'`'),IF(role_member_map_scope_column_a_name is not null,concat('role_member_map_scope_a `',role_member_map_scope_column_a_ref_table.name,'`'),''))) as scope"
        + " from user"
        +   " join user_member_map on (user_member_map.user_id=user.id)"
        +   " join role_member_map using (member_id)"
        //+   " left join role_member_map_scope_column_a_ref_table on (role_member_map_scope_column_a_ref_table.id=role_member_map.role_member_map_scope_column_a_name)"
        //+   " left join role_member_map_scope_column_b_ref_table on (role_member_map_scope_column_b_ref_table.id=role_member_map.role_member_map_scope_column_b_name)"
        //+   " left join role_member_map_scope_column_c_ref_table on (role_member_map_scope_column_c_ref_table.id=role_member_map.role_member_map_scope_column_c_name)"
        +   " join role_notification_map using (role_id)"
        +   " join notification on (notification.id=role_notification_map.notification_id)"
        + " where user.id = '" + id + "'"
        + " order by notification,tier,scope",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public string[] RolesOf(string id)
      {
      var roles_of_string_collection = new StringCollection();
      Open();
      var dr = new MySqlCommand
        (
        "select name"
        + " from role"
        +   " join role_member_map on (role_member_map.role_id=role.id)"
        +   " join user_member_map on (user_member_map.member_id=role_member_map.member_id)"
        + " where user_member_map.user_id = '" + id + "'"
        +   " and not be_occasional"
        + " order by pecking_order",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        roles_of_string_collection.Add(dr["name"].ToString());
        }
      dr.Close();
      Close();
      var roles_of = new string[roles_of_string_collection.Count];
      roles_of_string_collection.CopyTo(roles_of,0);
      return roles_of;
      }

    } // end TClass_db_user

  }

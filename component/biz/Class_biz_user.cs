using Class_db_user;
using Class_db_users;
using kix;
using System.Web;

namespace Class_biz_user
  {

  public class TClass_biz_user
    {
  
    private TClass_db_user db_user = null;
    private TClass_db_users db_users = null;

    public TClass_biz_user() : base()
      {
      db_user = new TClass_db_user();
      db_users = new TClass_db_users();
      }

    public void BindNotificationsToBaseDataList(object target)
      {
      db_user.BindNotificationsToBaseDataList(IdNum(),target);
      }

    public void BindPrivilegesToBaseDataList(object target)
      {
      db_user.BindPrivilegesToBaseDataList(IdNum(),target);
      }

    public void BindRolesToBaseDataList(object target)
      {
      db_user.BindRolesToBaseDataList(IdNum(),target);
      }

    public string EmailAddress()
      {
      return db_users.PasswordResetEmailAddressOfId(IdNum());
      }

    internal string FullTitle()
      {
      var full_title = k.EMPTY;
      var user_id_num = IdNum();
      var tier_3_role_array = db_user.RolesOf
        (
        id:user_id_num,
        id_of_highest_tier_of_interest:"3"
        );
      var tier_3_role_array_length = tier_3_role_array.Length;
      if (tier_3_role_array_length > 0)
        {
        full_title = tier_3_role_array[0];
        }
      var tier_2_role_array = db_user.RolesOf
        (
        id:user_id_num,
        id_of_highest_tier_of_interest:"2"
        );
      var tier_2_role_array_length = tier_2_role_array.Length;
      if (tier_2_role_array_length > tier_3_role_array_length)
        {
        full_title = tier_2_role_array[0] + (full_title.Length > 0 ? " and " + full_title : k.EMPTY);
        }
      var tier_1_role_array = db_user.RolesOf(id:user_id_num);
      if (tier_1_role_array.Length > tier_2_role_array_length)
        {
        full_title = tier_1_role_array[0] + (full_title.Length > 0 ? " and " + full_title : k.EMPTY);
        }
      return (full_title.Length > 0 ? full_title : "Member");
      }

    public string IdNum()
      {
      return db_users.IdOf(HttpContext.Current.User.Identity.Name);
      }

    public string[] Privileges()
      {
      return db_users.PrivilegesOf(IdNum());
      }

    public string[] Roles(string id_of_highest_tier_of_interest = k.EMPTY)
      {
      var role_array = new string[] {};
      if (HttpContext.Current.User.Identity.Name.Length > 0)
        {
        role_array = db_user.RolesOf
          (
          id:IdNum(),
          id_of_highest_tier_of_interest:id_of_highest_tier_of_interest
          );
        }
      return (role_array.Length == 0 ? new string[] {"Member"} : role_array);
      }

    } // end TClass_biz_user

  }

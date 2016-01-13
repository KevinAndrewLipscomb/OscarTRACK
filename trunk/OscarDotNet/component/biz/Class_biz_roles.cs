using Class_biz_user;
using Class_db_roles;
using kix;
using System;

namespace Class_biz_roles
  {

  public class TClass_biz_roles
    {

    private TClass_biz_user biz_user;
    private TClass_db_roles db_roles = null;

    public TClass_biz_roles() : base()
      {
      biz_user = new TClass_biz_user();
      db_roles = new TClass_db_roles();
      }

    internal void AnalyzeForRoleComms
      (
      string[] user_role_string_array,
      string selected_role_name,
      ref bool be_scope_cross_agency,
      out bool be_role_held_by_user,
      out bool be_selected_role_in_superior_tier_to_user,
      out bool be_scope_change_allowable
      )
      {
      var tier_of_user_highest_role = new k.int_positive(int.Parse(TierOfName(user_role_string_array[0])));
      be_role_held_by_user = (Array.IndexOf(user_role_string_array,selected_role_name) > -1);
      be_selected_role_in_superior_tier_to_user = (int.Parse(TierOfName(selected_role_name)) < tier_of_user_highest_role.val);
      be_scope_cross_agency = (((be_role_held_by_user || (tier_of_user_highest_role.val == 1)) && be_scope_cross_agency) || be_selected_role_in_superior_tier_to_user);
      be_scope_change_allowable = be_role_held_by_user || (tier_of_user_highest_role.val == 1);
      }

    internal bool BeOkToAllowRoleCommsQuickMessaging
      (
      bool has_user_quickmessage_priv,
      bool be_role_held_by_user,
      bool be_specified_role_in_superior_tier_to_user,
      bool be_any_role_holders
      )
      {
      return
        (
          (
            (
              has_user_quickmessage_priv
            &&
              !be_specified_role_in_superior_tier_to_user
            )
          ||
            be_role_held_by_user
          )
        &&
          be_any_role_holders
        );
      }

    internal bool BeUserPeckingOrderAtLeast(string role_name)
      {
      return db_roles.BePeckingOrderAtLeast(biz_user.Roles()[0],role_name);
      }

    public bool Bind(string partial_name, object target)
      {
      return db_roles.Bind(partial_name, target);
      }

    public void BindDirectToListControl
      (
      object target,
      bool has_config_roles_and_matrices,
      string tier_filter = k.EMPTY,
      string unselected_literal = "-- Role --",
      string selected_value = k.EMPTY
      )
      {
      var tier_quoted_value_list = k.QUOTE + (tier_filter == "2" ? "2" + k.QUOTE + k.COMMA + k.QUOTE + "3" : tier_filter) + k.QUOTE;
      db_roles.BindDirectToListControl(target,has_config_roles_and_matrices,tier_quoted_value_list,unselected_literal,selected_value);
      }

    public bool Delete(string name)
      {
      return db_roles.Delete(name);
      }

    public bool Get
      (
      string name,
      out string tier_id,
      out string pecking_order,
      out bool be_occasional
      )
      {
      return db_roles.Get(name,out tier_id,out pecking_order,out be_occasional);
      }

    public string NameOfId(string id)
      {
      return db_roles.NameOfId(id);
      }

    public void Set
      (
      string name,
      string tier_id,
      string pecking_order,
      bool be_occasional
      )
      {
      db_roles.Set(name,tier_id,pecking_order,be_occasional);
      }

    public string TierOfId(string id)
      {
      return db_roles.TierOfId(id);
      }

    internal string TierOfName(string name)
      {
      return db_roles.TierOfName(name);
      }

    } // end TClass_biz_roles

  }

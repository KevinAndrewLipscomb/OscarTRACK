using Class_db_privileges;
using kix;
using System;

namespace Class_biz_privileges
  {
  public class TClass_biz_privileges
    {
        private readonly TClass_db_privileges db_privileges = null;

        //Constructor  Create()
        public TClass_biz_privileges() : base()
        {
            // TODO: Add any constructor code here
            db_privileges = new TClass_db_privileges();
        }

    internal void AnalyzeForPrivilegeComms
      (
      string[] user_privilege_string_array,
      string selected_privilege_name,
      ref bool be_scope_cross_agency,
      out bool be_privilege_held_by_user,
      out bool be_scope_change_allowable
      )
      {
      be_privilege_held_by_user = Array.IndexOf(user_privilege_string_array,selected_privilege_name) > -1;
      be_scope_cross_agency = (be_privilege_held_by_user) && be_scope_cross_agency;
      be_scope_change_allowable = be_privilege_held_by_user;
      }

    internal bool BeOkToAllowPrivilegeCommsQuickMessaging
      (
      bool has_user_quickmessage_priv,
      bool be_privilege_held_by_user,
      bool be_any_privilege_holders
      )
      {
      return
        (
          (
            has_user_quickmessage_priv
          ||
            be_privilege_held_by_user
          )
        &&
          be_any_privilege_holders
        );
      }

    public bool Bind
      (
      string partial_name,
      object target,
      string member_id = k.EMPTY
      )
      {
      return db_privileges.Bind(partial_name,target,member_id);
      }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            db_privileges.BindDirectToListControl(target, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Privilege --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

    public bool Get(string name)
      {
      return db_privileges.Get(name);
      }

    internal bool HasForAnySpecialAgency
      (
      string member_id,
      string privilege_name
      )
      {
      return db_privileges.HasForAnySpecialAgency(member_id,privilege_name);
      }

    internal bool HasForSpecialAgency
      (
      string member_id,
      string privilege_name,
      string agency_id,
      bool do_include_rescue_squads = false
      )
      {
      int agency_id_int;
      return (int.TryParse(s:agency_id,result:out agency_id_int) ? (do_include_rescue_squads ? true : (agency_id_int > 200)) && db_privileges.HasForSpecialAgency(member_id,privilege_name,agency_id) : false);
      }

    } // end TClass_biz_privileges

}

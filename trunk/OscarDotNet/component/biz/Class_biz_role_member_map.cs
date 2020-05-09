using Class_biz_members;
using Class_biz_notifications;
using Class_biz_user;
using Class_db_role_member_map;
using Class_db_role_member_map_logs;
using kix;
using System.Collections;

namespace Class_biz_role_member_map
  {

  public class TClass_biz_role_member_map
    {
        private readonly TClass_biz_members biz_members = null;
        private readonly TClass_biz_notifications biz_notifications = null;
        private readonly TClass_biz_user biz_user = null;
        private readonly TClass_db_role_member_map db_role_member_map = null;
        private readonly TClass_db_role_member_map_logs db_role_member_map_logs = null;

        public TClass_biz_role_member_map() : base()
        {
            biz_members = new TClass_biz_members();
            biz_notifications = new TClass_biz_notifications();
            biz_user = new TClass_biz_user();
            db_role_member_map = new TClass_db_role_member_map();
            db_role_member_map_logs = new TClass_db_role_member_map_logs();
        }

        public bool BePrivilegedToModifyTuple(bool has_config_roles_and_matrices, bool has_assign_department_roles_to_members, bool has_assign_squad_roles_to_members, string role_tier_id, string role_natural_text, string subject_member_agency_id)
        {
            bool result;
            result = has_config_roles_and_matrices || ((role_natural_text != "Application Administrator") && ((has_assign_department_roles_to_members && (role_tier_id.CompareTo("1") >= 0)) || (has_assign_squad_roles_to_members && (role_tier_id.CompareTo("2") >= 0) && (subject_member_agency_id == biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum()))))));
            return result;
        }

        public void Bind(string tier_filter, string agency_filter, string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata)
        {
            string tier_quoted_value_list;
            if (tier_filter == "2")
            {
                tier_quoted_value_list = "2" + k.QUOTE + k.COMMA + k.QUOTE + "3";
            }
            else
            {
                tier_quoted_value_list = tier_filter;
            }
            tier_quoted_value_list = k.QUOTE + tier_quoted_value_list + k.QUOTE;
            db_role_member_map.Bind(tier_quoted_value_list, agency_filter, sort_order, be_sort_order_descending, target, out crosstab_metadata);
        }

        public void BindActuals(string tier_filter, string agency_filter, string sort_order, bool be_sort_order_ascending, object target)
        {
            string tier_quoted_value_list;
            if (tier_filter == "2")
            {
                tier_quoted_value_list = "2" + k.QUOTE + k.COMMA + k.QUOTE + "3";
            }
            else
            {
                tier_quoted_value_list = tier_filter;
            }
            tier_quoted_value_list = k.QUOTE + tier_quoted_value_list + k.QUOTE;
            db_role_member_map.BindActuals(tier_quoted_value_list, agency_filter, sort_order, be_sort_order_ascending, target);
        }

    public void BindHolders
      (
      string role_name,
      object target,
      string sort_order,
      bool be_sort_order_ascending,
      string agency_filter
      )
      {
      db_role_member_map.BindHolders(role_name,target,sort_order,be_sort_order_ascending,agency_filter);
      }

        public void BindHoldersPerAgency(string agency_id, object target)
        {
            db_role_member_map.BindHoldersPerAgency(agency_id, target);
        }

        public void BindUnassignedPerAgency(string agency_id, object target)
        {
            db_role_member_map.BindUnassignedPerAgency(agency_id, target);
        }

        public string EmailTargetOf(string role_name, string agency_short_designator)
        {
            string result;
            result = db_role_member_map.EmailTargetOf(role_name, agency_short_designator);
            return result;
        }

        internal string EmailTargetOfAgencyIdList
          (
          string role_name,
          string agency_id_list
          )
          {
          return db_role_member_map.EmailTargetOfAgencyIdList(role_name,agency_id_list);
          }

        public string EmailTargetOfAppropriateScheduler(string agency_id)
          {
          return db_role_member_map.EmailTargetAboutAgencyId((agency_id == "0" ? "Department Chief Scheduler" : "Squad Scheduler"),agency_id);
          }

        public string HolderOf(string role_name)
        {
            string result;
            result = db_role_member_map.HolderOf(role_name);
            return result;
        }

    internal void PurgeMember(string member_id)
      {
      var roles_held_id_q = db_role_member_map.RolesHeldIdQueue(member_id);
      while (roles_held_id_q.Count > 0)
        {
        Save
          (
          member_id:member_id,
          role_id:roles_held_id_q.Dequeue(),
          be_granted:false
          );
        }
      }
        public void Save(string member_id, string role_id, bool be_granted)
        {
            db_role_member_map.Save(member_id, role_id, be_granted);
            db_role_member_map_logs.Enter
              (
              subject_member_id:member_id,
              be_granted:be_granted,
              role_id:role_id
              );
            biz_notifications.IssueForRoleChange(member_id, role_id, be_granted);
        }

    } // end TClass_biz_role_member_map

}

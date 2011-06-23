using Class_biz_user;
using Class_db_roles;
using kix;

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

        internal bool BeUserPeckingOrderAtLeast(string role_name)
          {
          return db_roles.BePeckingOrderAtLeast(biz_user.Roles()[0],role_name);
          }

        public bool Bind(string partial_name, object target)
        {
            bool result;
            result = db_roles.Bind(partial_name, target);
            return result;
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_filter, string unselected_literal, string selected_value)
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
            db_roles.BindDirectToListControl(target, has_config_roles_and_matrices, tier_quoted_value_list, unselected_literal, selected_value);
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, k.EMPTY);
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_filter)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, tier_filter, "-- Role --");
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_filter, string unselected_literal)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, tier_filter, unselected_literal, k.EMPTY);
        }

        public bool Delete(string name)
        {
            bool result;
            result = db_roles.Delete(name);
            return result;
        }

        public bool Get
          (
          string name,
          out string tier_id,
          out string soft_hyphenation_text,
          out string pecking_order,
          out bool be_occasional
          )
          {
          return db_roles.Get(name,out tier_id,out soft_hyphenation_text,out pecking_order,out be_occasional);
          }

        public string NameOfId(string id)
        {
            string result;
            result = db_roles.NameOfId(id);
            return result;
        }

        public void Set
          (
          string name,
          string tier_id,
          string soft_hyphenation_text,
          string pecking_order,
          bool be_occasional
          )
          {
          db_roles.Set(name,tier_id,soft_hyphenation_text,pecking_order,be_occasional);
          }

        public string TierOfId(string id)
        {
            string result;
            result = db_roles.TierOfId(id);
            return result;
        }

        internal string TierOfName(string name)
          {
          return db_roles.TierOfName(name);
          }

    } // end TClass_biz_roles

}

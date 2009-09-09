using kix;
using System;
using Class_db_roles;
namespace Class_biz_roles
{
    public class TClass_biz_roles
    {
        private TClass_db_roles db_roles = null;
        //Constructor  Create()
        public TClass_biz_roles() : base()
        {
            // TODO: Add any constructor code here
            db_roles = new TClass_db_roles();
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

        public bool Get(string name, out string tier_id, out string soft_hyphenation_text, out string pecking_order)
        {
            bool result;
            result = db_roles.Get(name, out tier_id, out soft_hyphenation_text, out pecking_order);

            return result;
        }

        public string NameOfId(string id)
        {
            string result;
            result = db_roles.NameOfId(id);
            return result;
        }

        public void Set(string name, string tier_id, string soft_hyphenation_text, string pecking_order)
        {
            db_roles.Set(name, tier_id, soft_hyphenation_text, pecking_order);

        }

        public string TierOfId(string id)
        {
            string result;
            result = db_roles.TierOfId(id);
            return result;
        }

    } // end TClass_biz_roles

}

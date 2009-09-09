using kix;
using System;

using System.Collections;
using Class_db_role_privilege_map;
using Class_biz_notifications;
namespace Class_biz_role_privilege_map
{
    public class TClass_biz_role_privilege_map
    {
        private TClass_db_role_privilege_map db_role_privilege_map = null;
        private TClass_biz_notifications biz_notifications = null;
        //Constructor  Create()
        public TClass_biz_role_privilege_map() : base()
        {
            db_role_privilege_map = new TClass_db_role_privilege_map();
            biz_notifications = new TClass_biz_notifications();
        }
        public void Bind(string tier_filter, string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata)
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
            db_role_privilege_map.Bind(tier_quoted_value_list, sort_order, be_sort_order_descending, target, out crosstab_metadata);
        }

        public void BindActuals(string tier_filter, string sort_order, bool be_sort_order_ascending, object target)
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
            db_role_privilege_map.BindActuals(tier_quoted_value_list, sort_order, be_sort_order_ascending, target);
        }

        public void Save(string member_id, string role_id, bool be_granted)
        {
            db_role_privilege_map.Save(member_id, role_id, be_granted);
        }

    } // end TClass_biz_role_privilege_map

}

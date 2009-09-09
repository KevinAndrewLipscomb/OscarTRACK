using System;

using Class_db_user_member_map;
using Class_biz_members;
namespace Class_biz_user_member_map
{
    public class TClass_biz_user_member_map
    {
        private TClass_db_user_member_map db_user_member_map = null;
        private TClass_biz_members biz_members = null;
        //Constructor  Create()
        public TClass_biz_user_member_map() : base()
        {
            db_user_member_map = new TClass_db_user_member_map();
            biz_members = new TClass_biz_members();
        }
        public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
        {
            db_user_member_map.BindActuals(sort_order, be_sort_order_ascending, target);
        }

        public void Save(string member_id, string user_id, bool be_granted)
        {
            db_user_member_map.Save(member_id, user_id, be_granted);
        }

    } // end TClass_biz_user_member_map

}

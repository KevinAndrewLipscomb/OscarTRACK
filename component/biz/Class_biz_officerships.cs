using System;
using Class_db_officerships;
namespace Class_biz_officerships
{
    public class TClass_biz_officerships
    {
        private TClass_db_officerships db_officerships = null;
        //Constructor  Create()
        public TClass_biz_officerships() : base()
        {
            // TODO: Add any constructor code here
            db_officerships = new TClass_db_officerships();
        }
        public void Bind(string member_id, object target)
        {
            db_officerships.Bind(member_id, target);
        }

    } // end TClass_biz_officerships

}

using System;
using System.Collections;
namespace Class_biz_leave
{
    public class TClass_biz_leave
    {
        //Constructor  Create()
        public TClass_biz_leave() : base()
        {
            // TODO: Add any constructor code here

        }
        public bool BeLeaf(filter_type filter)
        {
            bool result;
            result = false;
            if (new ArrayList(new filter_type[] {filter_type.OBLIGATED, filter_type.ON_LEAVE}).Contains(filter))
            {
                result = true;
            }
            return result;
        }

    } // end TClass_biz_leave

    public enum filter_type
    {
        NONE,
        BOTH,
        OBLIGATED,
        ON_LEAVE,
    } // end filter_type

}

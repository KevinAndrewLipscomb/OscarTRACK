using System;
using Class_db_residents;
namespace Class_biz_residents
{
    public class TClass_biz_residents
    {
        private TClass_db_residents db_residents = null;
        //Constructor  Create()
        public TClass_biz_residents() : base()
        {
            db_residents = new TClass_db_residents();
        }
        public bool BeExtantId(string id)
        {
            bool result;
            result = db_residents.BeExtantId(id);
            return result;
        }

    } // end TClass_biz_residents

}

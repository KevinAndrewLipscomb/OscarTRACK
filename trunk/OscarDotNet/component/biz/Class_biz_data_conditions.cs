using System;
using Class_biz_members;
namespace Class_biz_data_conditions
{
    public class TClass_biz_data_conditions
    {
        //Constructor  Create()
        public TClass_biz_data_conditions() : base()
        {
            // TODO: Add any constructor code here

        }
        public bool BeMemberTrainee(string member_id)
        {
            bool result;
            result = (new TClass_biz_members().MedicalReleaseLevelOfMemberId(member_id) == "Trainee");
            return result;
        }

    } // end TClass_biz_data_conditions

}

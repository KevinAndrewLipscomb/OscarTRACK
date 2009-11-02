using System;
using System.Collections;
using Class_db_medical_release_levels;
namespace Class_biz_medical_release_levels
{
    public class TClass_biz_medical_release_levels
    {
        private TClass_db_medical_release_levels db_medical_release_levels = null;
        //Constructor  Create()
        public TClass_biz_medical_release_levels() : base()
        {
            // TODO: Add any constructor code here
            db_medical_release_levels = new TClass_db_medical_release_levels();
        }
        public bool BeLeaf(filter_type filter)
        {
            bool result;
            result = false;
            if (!(new ArrayList(new filter_type[] {filter_type.ALL, filter_type.NOT_RELEASED, filter_type.RELEASED}).Contains(filter)))
            {
                result = true;
            }
            return result;
        }

        public bool BeRecruitAdminOrSpecOpsBoundByCode(string level_code)
        {
            bool result;
            result = (level_code == "1") || (level_code == "9");
            return result;
        }

        public bool BeRecruitAdminOrSpecOpsBoundByDescription(string level_description)
        {
            bool result;
            string lowercase_level_description;
            lowercase_level_description = level_description.ToLower();
            result = (lowercase_level_description == "none") || (lowercase_level_description == "emt intern");
            return result;
        }

        public bool BeReleased(string peck_code)
        {
            bool result;
            result = (uint.Parse(peck_code) >= Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE);
            return result;
        }

        public bool BeValidForCurrentEnrollmentLevel(string code, string enrollment_level_description)
        {
            bool result;
            result = db_medical_release_levels.BeValidForCurrentEnrollmentLevel(code, enrollment_level_description);
            return result;
        }

        public bool BeValidEnrollmentForCurrent(string enrollment_level_code, string description)
        {
            return db_medical_release_levels.BeValidEnrollmentForCurrent(enrollment_level_code, description);
        }

        public void BindListControl(object target)
        {
            db_medical_release_levels.BindListControl(target);
        }

        public string DescriptionOf(string code)
        {
            string result;
            result = db_medical_release_levels.DescriptionOf(code);
            return result;
        }

    } // end TClass_biz_medical_release_levels

    public enum filter_type
    {
        ALL,
        NOT_RELEASED,
        NONE,
        IN_CLASS,
        TRAINEE,
        RELEASED,
        EMT_B,
        EMT_ST,
        EMT_E,
        EMT_CT,
        EMT_I,
        EMT_P,
    } // end filter_type

}

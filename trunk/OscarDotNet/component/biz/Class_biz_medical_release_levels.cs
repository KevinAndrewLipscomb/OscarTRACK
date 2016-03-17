using Class_db_enrollment;
using Class_db_medical_release_levels;
using System.Collections;

namespace Class_biz_medical_release_levels
{
    public class TClass_biz_medical_release_levels
    {
        private TClass_db_enrollment db_enrollment = null;
        private TClass_db_medical_release_levels db_medical_release_levels = null;
        //Constructor  Create()
        public TClass_biz_medical_release_levels() : base()
        {
            // TODO: Add any constructor code here
            db_enrollment = new TClass_db_enrollment();
            db_medical_release_levels = new TClass_db_medical_release_levels();
        }

        internal bool BeCodeAlsForLegacyOscarPurposes(string level_code)
          {
          return uint.Parse(db_medical_release_levels.PeckCodeOf(level_code)) > 20;
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
      return new ArrayList() {"1","9","11"}.Contains(level_code);
        // none, Student, Test Candidate
      }

    public bool BeRecruitAdminOrSpecOpsBoundByDescription(string level_description)
      {
      return new ArrayList() {"none","student","test candidate"}.Contains(level_description.ToLower());
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

        public bool BeValidEnrollmentForCurrent
          (
          string enrollment_level_code,
          string description
          )
          {
          var be_valid_enrollment_level_for_current = false;
          if (!db_enrollment.BeCoreOpsCommitted(enrollment_level_code))
            {
            //
            // Although not encouraged, anyone can transition into an enrollment level that has no core ops committment.
            //
            be_valid_enrollment_level_for_current = true;
            }
          else
            {
            //
            // The member is transitioning into an enrollment level that *does* have a core ops committment.
            //
            var enrollment_description = db_enrollment.DescriptionOf(enrollment_level_code);
            if (enrollment_description == "Associate")
              {
              //
              // An Associate must be EMT-E or higher.
              //
              be_valid_enrollment_level_for_current = (PeckingOrderCompareTo(description,"EMT-E") >= 0);
              }
            else if (enrollment_description == "Tenured BLS")
              {
              be_valid_enrollment_level_for_current = (PeckingOrderCompareTo(description,"EMT-CT") < 0);
              }
            else if (enrollment_description == "Tenured ALS")
              {
              be_valid_enrollment_level_for_current = (PeckingOrderCompareTo(description,"EMT-CT") >= 0);
              }
            else
              {
              //
              // All other enrollment levels with a core ops committment require at least being a BLS Intern.
              //
              be_valid_enrollment_level_for_current = (PeckingOrderCompareTo(description,"BLS Intern") >= 0);
              }
            }
          return be_valid_enrollment_level_for_current;
          }

        internal void BindBaseDataList(object target)
          {
          db_medical_release_levels.BindBaseDataList(target);
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

        internal string PeckCodeOf(string level_code)
          {
          return db_medical_release_levels.PeckCodeOf(level_code);
          }

        internal int PeckingOrderCompareTo
          (
          string description_x,
          string description_y
          )
          {
          return db_medical_release_levels.PeckingOrderCompareTo(description_x,description_y);
          }

    } // end TClass_biz_medical_release_levels

    public enum filter_type
    {
        ALL,
        NOT_RELEASED,
        NONE,
        IN_CLASS,
        TEST_CANDIDATE,
        TRAINEE,
        RELEASED,
        EMT_B,
        EMT_ST,
        EMT_E,
        AEMT,
        EMT_CT,
        EMT_I,
        EMT_P,
        EMT_P_RSI
    } // end filter_type

}

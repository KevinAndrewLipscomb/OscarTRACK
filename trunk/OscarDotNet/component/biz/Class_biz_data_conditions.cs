using System.Collections;

namespace Class_biz_data_conditions
  {

  public class TClass_biz_data_conditions
    {

    public TClass_biz_data_conditions() : base()
      {
      }

    public bool BeMemberTrainee(string member_id)
      {
      return (new ArrayList() {"Student","BLS Intern"}).Contains(new Class_biz_members.TClass_biz_members().MedicalReleaseLevelOfMemberId(member_id));
      }

    public bool BeRolePersonnelRelated(string role_name)
      {
      return (new ArrayList() {"Squad Commander","Squad Manager","Squad Membership Coordinator","Squad Training Officer"}).Contains(role_name);
      }

    } // end TClass_biz_data_conditions

  }
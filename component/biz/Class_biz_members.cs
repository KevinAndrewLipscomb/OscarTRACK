using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_notifications;
using Class_biz_sections;
using Class_biz_user;
using Class_db_leaves;
using Class_db_members;
using Class_db_users;
using kix;
using System;
using System.Collections;

namespace Class_biz_members
{
    public class TClass_biz_members
    {
        private TClass_biz_agencies biz_agencies = null;
        private TClass_biz_enrollment biz_enrollment = null;
        private TClass_biz_medical_release_levels biz_medical_release_levels = null;
        private TClass_biz_notifications biz_notifications = null;
        private TClass_biz_sections biz_sections = null;
        private TClass_biz_user biz_user = null;
        private TClass_db_leaves db_leaves = null;
        private TClass_db_members db_members = null;
        private TClass_db_users db_users = null;
        //Constructor  Create()
        public TClass_biz_members() : base()
        {
            // TODO: Add any constructor code here
            db_leaves = new TClass_db_leaves();
            db_members = new TClass_db_members();
            db_users = new TClass_db_users();
            biz_agencies = new TClass_biz_agencies();
            biz_enrollment = new TClass_biz_enrollment();
            biz_medical_release_levels = new TClass_biz_medical_release_levels();
            biz_notifications = new TClass_biz_notifications();
            biz_sections = new TClass_biz_sections();
            biz_user = new TClass_biz_user();
        }
        public bool Add(string first_name, string last_name, string cad_num, string medical_release_code, bool be_driver_qualified, string agency_id, string email_address, DateTime enrollment_date, string enrollment_level, string phone_num)
        {
            bool result;
            result = false;
            if (!db_members.BeKnown(first_name, last_name, cad_num))
            {
                if (phone_num.Length == 7)
                {
                    phone_num = "757" + phone_num;
                }
                db_members.Add(first_name, last_name, cad_num, uint.Parse(medical_release_code), be_driver_qualified, uint.Parse(agency_id), email_address, enrollment_date, uint.Parse(enrollment_level), phone_num);
                biz_notifications.IssueForMemberAdded(db_members.IdOfFirstnameLastnameCadnum(first_name, last_name, cad_num), first_name, last_name, cad_num, biz_medical_release_levels.DescriptionOf(medical_release_code), be_driver_qualified, biz_agencies.MediumDesignatorOf(agency_id) + k.SPACE_HYPHEN_SPACE + biz_agencies.LongDesignatorOf(agency_id), email_address, enrollment_date.ToString("dd MMMM yyyy"), biz_enrollment.DescriptionOf(enrollment_level), phone_num);
                result = true;
            }
            return result;
        }

        public bool Add(string first_name, string last_name, string cad_num, string medical_release_code, bool be_driver_qualified, string agency_id, string email_address, DateTime enrollment_date)
        {
            return Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, "");
        }

        public bool Add(string first_name, string last_name, string cad_num, string medical_release_code, bool be_driver_qualified, string agency_id, string email_address, DateTime enrollment_date, string enrollment_level)
        {
            return Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, enrollment_level, "");
        }

        public string AgencyOf(object summary)
        {
            string result;
            result = db_members.AgencyOf(summary);
            return result;
        }

        public string AgencyIdOfId(string id)
        {
            string result;
            result = db_members.AgencyIdOfId(id);
            return result;
        }

        public bool BeAuthorizedTierOrSameAgency(string subject_member_id, string object_member_id)
        {
            bool result;
            result = (HighestTierOf(subject_member_id) == "1") || (AgencyIdOfId(subject_member_id) == AgencyIdOfId(object_member_id));
            return result;
        }

        public bool BeDriverQualifiedOf(object summary)
        {
            bool result;
            result = db_members.BeDriverQualifiedOf(summary);
            return result;
        }

        public bool BeTransferring(object summary)
          {
          return (EnrollmentOf(summary) == "Transferring");
          }

        public bool BeUserAuthorizedToEditEnrollments(string subject_member_id, object summary, bool has_edit_enrollments, bool has_edit_enrollments_nonreleased_ops_members_only)
          {
          return
              (BeAuthorizedTierOrSameAgency(subject_member_id, IdOf(summary)) || BeTransferring(summary))
            &&
              (has_edit_enrollments || (has_edit_enrollments_nonreleased_ops_members_only && (!BeDriverQualifiedOf(summary) || !biz_medical_release_levels.BeReleased(PeckCodeOf(summary)))));
          }

        public bool BeValidProfile(string id)
        {
            bool result;
            result = db_members.BeValidProfile(id);
            return result;
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal, string selected_value)
        {
            db_members.BindCurrentDirectToListControl(target, agency_filter, unselected_literal, selected_value);
        }

        public void BindCurrentDirectToListControl(object target)
        {
            BindCurrentDirectToListControl(target, k.EMPTY);
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter)
        {
            BindCurrentDirectToListControl(target, agency_filter, "-- Member --");
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal)
        {
            BindCurrentDirectToListControl(target, agency_filter, unselected_literal, k.EMPTY);
        }

        public void BindRankedCoreOpsSize(object target, bool do_log)
        {
            db_members.BindRankedCoreOpsSize(target, do_log);
        }

        public void BindRankedCoreOpsSize(object target)
        {
            BindRankedCoreOpsSize(target, true);
        }

        public void BindRankedCrewShiftsForecast(object target, bool do_log)
        {
            db_members.BindRankedCrewShiftsForecast(target, do_log);
        }

        public void BindRankedCrewShiftsForecast(object target)
        {
            BindRankedCrewShiftsForecast(target, true);
        }

        public void BindRankedNumMembersInPipeline(object target, bool do_log)
        {
            db_members.BindRankedNumMembersInPipeline(target, do_log);
        }

        public void BindRankedNumMembersInPipeline(object target)
        {
            BindRankedNumMembersInPipeline(target, true);
        }

        public void BindRankedStandardEnrollment(object target, bool do_log)
        {
            db_members.BindRankedStandardEnrollment(target, do_log);
        }

        public void BindRankedStandardEnrollment(object target)
        {
            BindRankedStandardEnrollment(target, true);
        }

        public void BindRankedUtilization(object target, bool do_log)
        {
            db_members.BindRankedUtilization(target, do_log);
        }

        public void BindRankedUtilization(object target)
        {
            BindRankedUtilization(target, true);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter, uint section_filter, bool running_only_filter)
        {
            db_members.BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, med_release_level_filter, section_filter, running_only_filter);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, Class_biz_enrollment.filter_type.CURRENT);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, Class_biz_leave.filter_type.NONE);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, Class_biz_medical_release_levels.filter_type.ALL);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, med_release_level_filter, 0);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter, uint section_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, med_release_level_filter, section_filter, false);
        }

        public void BindSpecialForRankedLengthOfService(object target)
        {
            db_members.BindSpecialForRankedLengthOfService(target);
        }

        public string CadNumOf(object summary)
        {
            string result;
            result = db_members.CadNumOf(summary);
            return result;
        }

        public string CadNumOfMemberId(string member_id)
        {
            string result;
            result = db_members.CadNumOfMemberId(member_id);
            return result;
        }

        public Queue CurrentMemberEmailAddressesQueue(string agency_short_designator)
        {
            Queue result;
            result = db_members.CurrentMemberEmailAddresses(agency_short_designator);
            return result;
        }

        public Queue CurrentMemberEmailAddressesQueue()
        {
            return CurrentMemberEmailAddressesQueue("");
        }

        public string CurrentMemberEmailAddressesString(string agency_short_designator)
        {
            string result;
            string current_member_email_addresses;
            uint i;
            Queue q;
            current_member_email_addresses = k.EMPTY;
            q = CurrentMemberEmailAddressesQueue(agency_short_designator);
            uint q_count = (uint)(q.Count);
            for (i = 1; i <= q_count; i ++ )
            {
                current_member_email_addresses = current_member_email_addresses + q.Dequeue().ToString() + k.COMMA_SPACE;
            }
            result = (current_member_email_addresses + k.SPACE).TrimEnd(new char[] {Convert.ToChar(k.COMMA), Convert.ToChar(k.SPACE)});
            return result;
        }

        public string CurrentMemberEmailAddressesString()
        {
            return CurrentMemberEmailAddressesString("");
        }

        public string EmailAddressOf(string member_id)
        {
            string result;
            result = db_members.EmailAddressOf(member_id);
            return result;
        }

        public string EnrollmentOf(object summary)
        {
            string result;
            result = db_members.EnrollmentOf(summary);
            return result;
        }

        public string EnrollmentOfMemberId(string member_id)
        {
            string result;
            result = db_members.EnrollmentOfMemberId(member_id);
            return result;
        }

        public string FirstNameOf(object summary)
        {
            string result;
            result = db_members.FirstNameOf(summary);
            return result;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.FirstNameOfMemberId(member_id);
            return result;
        }

        public void GetProfile(string id, out string name, out bool be_valid_profile)
        {
            db_members.GetProfile(id, out name, out be_valid_profile);
        }

        public string HighestTierOf(string id)
        {
            string result;
            result = db_members.HighestTierOf(id);
            return result;
        }

        public string IdOf(object summary)
        {
            string result;
            result = db_members.IdOf(summary);
            return result;
        }

        public string IdOfAppropriateRoleHolder(string role_name, string agency_short_designator)
        {
            string result;
            if (agency_short_designator != "EMS")
            {
                result = db_members.IdOfRoleHolderAtAgency(role_name, agency_short_designator);
            }
            else
            {
                result = db_members.IdOfRoleHolder(role_name);
            }
            return result;
        }

        public string IdOfUserId(string user_id)
        {
            string result;
            result = db_members.IdOfUserId(user_id);
            return result;
        }

        public bool InitiateTransfer
          (
          string current_agency_id,
          DateTime effective_date,
          string note,
          object summary
          )
          {
          var be_transfer_initiated = false;
          if (biz_enrollment.SetLevel(biz_enrollment.CodeOf("Transferring"),effective_date,note,IdOf(summary),summary))
            {
            db_leaves.CurtailOnEffectiveDate(IdOf(summary),effective_date);
            be_transfer_initiated = true;
            }
          return be_transfer_initiated;
          }

        public string LastNameOf(object summary)
        {
            string result;
            result = db_members.LastNameOf(summary);
            return result;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.LastNameOfMemberId(member_id);
            return result;
        }

        public string MedicalReleaseLevelOf(object summary)
        {
            string result;
            result = db_members.MedicalReleaseLevelOf(summary);
            return result;
        }

        public string MedicalReleaseLevelOfMemberId(string member_id)
        {
            string result;
            result = db_members.MedicalReleaseLevelOfMemberId(member_id);
            return result;
        }

        public string NamesSimilarTo(string first_name, string last_name, string separator)
        {
            string result;
            result = db_members.NamesSimilarTo(first_name, last_name, separator);
            return result;
        }

        public string OfficershipOf(string member_id)
        {
            string result;
            result = db_members.OfficershipOf(member_id);
            return result;
        }

        public string PhoneNumOf(string member_id)
        {
            string result;
            result = db_members.PhoneNumOf(member_id);
            return result;
        }

        public string PeckCodeOf(object summary)
        {
            string result;
            result = db_members.PeckCodeOf(summary);
            return result;
        }

        public string RetentionOf(object summary)
        {
            string result;
            result = db_members.RetentionOf(summary);
            return result;
        }

        public string SectionOf(object summary)
        {
            string result;
            result = db_members.SectionOf(summary);
            return result;
        }

        public void SetAgency(string old_agency_id, string new_agency_id, object summary)
        {
            string member_id;
            db_members.SetAgency(new_agency_id, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForAgencyChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(old_agency_id), biz_agencies.MediumDesignatorOf(new_agency_id));
        }

        public bool SetCadNum(string cad_num, object summary)
        {
            bool result;
            result = false;
            if (!db_members.BeKnown(cad_num))
            {
                db_members.SetCadNum(cad_num, summary);
                biz_notifications.IssueForCadNumChange(db_members.IdOf(summary), db_members.FirstNameOf(summary), db_members.LastNameOf(summary), cad_num);
                result = true;
            }
            return result;
        }

        public void SetDriverQualification(bool be_driver_qualified, object summary)
        {
            db_members.SetDriverQualification(be_driver_qualified, summary);
            biz_notifications.IssueForDriverQualificationChange(IdOf(summary), FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), be_driver_qualified);
        }

        public void SetEmailAddress(string id, string email_address)
        {
            db_members.SetEmailAddress(id, email_address);
        }

        public void SetName(string old_first, string old_last, string new_first, string new_last, object summary)
        {
            string member_id;
            db_members.SetName(new_first, new_last, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForMemberNameChange(member_id, CadNumOf(summary), old_first, old_last, new_first, new_last);
        }

        public void SetSection(string section_num, object summary)
        {
            string member_id;
            db_members.SetSection(section_num, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForSectionChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), section_num);
        }

        public bool SetMedicalReleaseCode(string old_level, string new_code, object summary, bool be_force_to_regular_required, DateTime effective_date)
          {
          var ok_so_far = true;
          if (be_force_to_regular_required)
            {
            ok_so_far = biz_enrollment.SetLevel(biz_enrollment.CodeOf("Regular"), effective_date, k.EMPTY, IdOf(summary), summary);
            }
          if (ok_so_far)
            {
            db_members.SetMedicalReleaseCode(new_code, summary);
            biz_notifications.IssueForMedicalReleaseLevelChange(IdOf(summary), FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), MedicalReleaseLevelOf(summary));
            }
          return ok_so_far;
          }

        public void SetPhoneNum(string phone_num, object summary)
        {
            string member_id;
            if (phone_num.Length == 7)
            {
                phone_num = "757" + phone_num;
            }
            db_members.SetPhoneNum(phone_num, summary);
            member_id = IdOf(summary);
            biz_notifications.IssueForPhoneNumChange(member_id, FirstNameOf(summary), LastNameOf(summary), CadNumOf(summary), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), phone_num);
        }

        public void SetProfile(string id, string name)
        {
            db_members.SetProfile(id, name);
        }

        public object Summary(string member_id)
          {
          return db_members.Summary(member_id);
          }

        public string UserAttributionIndicator()
          {
          var actor_member_id = IdOfUserId(biz_user.IdNum());
          return "==v==" + k.SPACE + FirstNameOfMemberId(actor_member_id) + k.SPACE + LastNameOfMemberId(actor_member_id) + k.SPACE + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + k.NEW_LINE;
          }

        public string UserIdOf(string member_id)
        {
            string result;
            result = db_members.UserIdOf(member_id);
            return result;
        }

    } // end TClass_biz_members

}

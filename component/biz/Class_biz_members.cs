using kix;
using System;

using System.Collections;
using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_leave;
using Class_biz_medical_release_levels;
using Class_biz_notifications;
using Class_biz_sections;
using Class_db_members;
using Class_db_users;
namespace Class_biz_members
{
    public class TClass_biz_members
    {
        private TClass_db_members db_members = null;
        private TClass_db_users db_users = null;
        private TClass_biz_agencies biz_agencies = null;
        private TClass_biz_enrollment biz_enrollment = null;
        private TClass_biz_medical_release_levels biz_medical_release_levels = null;
        private TClass_biz_notifications biz_notifications = null;
        private TClass_biz_sections biz_sections = null;
        //Constructor  Create()
        public TClass_biz_members() : base()
        {
            // TODO: Add any constructor code here
            db_members = new TClass_db_members();
            db_users = new TClass_db_users();
            biz_agencies = new TClass_biz_agencies();
            biz_enrollment = new TClass_biz_enrollment();
            biz_medical_release_levels = new TClass_biz_medical_release_levels();
            biz_notifications = new TClass_biz_notifications();
            biz_sections = new TClass_biz_sections();
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

        public string AgencyOf(object e_item)
        {
            string result;
            result = db_members.AgencyOf(e_item);
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

        public bool BeDriverQualifiedOf(object e_item)
        {
            bool result;
            result = db_members.BeDriverQualifiedOf(e_item);
            return result;
        }

        public bool BeUserAuthorizedToEditEnrollments(string subject_member_id, object e_item, bool has_edit_enrollments, bool has_edit_enrollments_nonreleased_ops_members_only)
        {
            bool result;
            result = BeAuthorizedTierOrSameAgency(subject_member_id, IdOf(e_item)) && (has_edit_enrollments || (has_edit_enrollments_nonreleased_ops_members_only && (!BeDriverQualifiedOf(e_item) || !biz_medical_release_levels.BeReleased(PeckCodeOf(e_item)))));
            return result;
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

        public string CadNumOf(object e_item)
        {
            string result;
            result = db_members.CadNumOf(e_item);
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
            for (i = 1; i <= q.Count; i ++ )
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

        public string EnrollmentOf(object e_item)
        {
            string result;
            result = db_members.EnrollmentOf(e_item);
            return result;
        }

        public string EnrollmentOfMemberId(string member_id)
        {
            string result;
            result = db_members.EnrollmentOfMemberId(member_id);
            return result;
        }

        public string FirstNameOf(object e_item)
        {
            string result;
            result = db_members.FirstNameOf(e_item);
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

        public string IdOf(object e_item)
        {
            string result;
            result = db_members.IdOf(e_item);
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

        public string LastNameOf(object e_item)
        {
            string result;
            result = db_members.LastNameOf(e_item);
            return result;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            result = db_members.LastNameOfMemberId(member_id);
            return result;
        }

        public string MedicalReleaseLevelOf(object e_item)
        {
            string result;
            result = db_members.MedicalReleaseLevelOf(e_item);
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

        public string PeckCodeOf(object e_item)
        {
            string result;
            result = db_members.PeckCodeOf(e_item);
            return result;
        }

        public string RetentionOf(object e_item)
        {
            string result;
            result = db_members.RetentionOf(e_item);
            return result;
        }

        public string SectionOf(object e_item)
        {
            string result;
            result = db_members.SectionOf(e_item);
            return result;
        }

        public void SetAgency(string old_agency_id, string new_agency_id, object e_item)
        {
            string member_id;
            db_members.SetAgency(new_agency_id, e_item);
            member_id = IdOf(e_item);
            biz_notifications.IssueForAgencyChange(member_id, FirstNameOf(e_item), LastNameOf(e_item), CadNumOf(e_item), biz_agencies.MediumDesignatorOf(old_agency_id), biz_agencies.MediumDesignatorOf(new_agency_id));
        }

        public bool SetCadNum(string cad_num, object e_item)
        {
            bool result;
            result = false;
            if (!db_members.BeKnown(cad_num))
            {
                db_members.SetCadNum(cad_num, e_item);
                biz_notifications.IssueForCadNumChange(db_members.IdOf(e_item), db_members.FirstNameOf(e_item), db_members.LastNameOf(e_item), cad_num);
                result = true;
            }
            return result;
        }

        public void SetDriverQualification(bool be_driver_qualified, object e_item)
        {
            db_members.SetDriverQualification(be_driver_qualified, e_item);
            biz_notifications.IssueForDriverQualificationChange(IdOf(e_item), FirstNameOf(e_item), LastNameOf(e_item), CadNumOf(e_item), be_driver_qualified);
        }

        public void SetEmailAddress(string id, string email_address)
        {
            db_members.SetEmailAddress(id, email_address);
        }

        public void SetName(string old_first, string old_last, string new_first, string new_last, object e_item)
        {
            string member_id;
            db_members.SetName(new_first, new_last, e_item);
            member_id = IdOf(e_item);
            biz_notifications.IssueForMemberNameChange(member_id, CadNumOf(e_item), old_first, old_last, new_first, new_last);
        }

        public void SetSection(string section_num, object e_item)
        {
            string member_id;
            db_members.SetSection(section_num, e_item);
            member_id = IdOf(e_item);
            biz_notifications.IssueForSectionChange(member_id, FirstNameOf(e_item), LastNameOf(e_item), CadNumOf(e_item), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), section_num);
        }

        public void SetMedicalReleaseCode(string old_level, string new_code, object e_item)
        {
            db_members.SetMedicalReleaseCode(new_code, e_item);
            biz_notifications.IssueForMedicalReleaseLevelChange(IdOf(e_item), FirstNameOf(e_item), LastNameOf(e_item), CadNumOf(e_item), MedicalReleaseLevelOf(e_item));
            if (biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByDescription(old_level) && !biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByCode(new_code))
            {
                biz_enrollment.SetLevel(biz_enrollment.CodeOf("Regular"), DateTime.Today, k.EMPTY, IdOf(e_item), e_item);
            }
        }

        public void SetPhoneNum(string phone_num, object e_item)
        {
            string member_id;
            if (phone_num.Length == 7)
            {
                phone_num = "757" + phone_num;
            }
            db_members.SetPhoneNum(phone_num, e_item);
            member_id = IdOf(e_item);
            biz_notifications.IssueForPhoneNumChange(member_id, FirstNameOf(e_item), LastNameOf(e_item), CadNumOf(e_item), biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)), phone_num);
        }

        public void SetProfile(string id, string name)
        {
            db_members.SetProfile(id, name);
        }

        public string UserIdOf(string member_id)
        {
            string result;
            result = db_members.UserIdOf(member_id);
            return result;
        }

    } // end TClass_biz_members

}

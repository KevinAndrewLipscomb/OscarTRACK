using appcommon;
using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Configuration;

namespace member_detail
{
    public partial class TWebForm_member_detail: ki_web_ui.page_class
    {
        private struct p_type
          {
          public string agency;
          public TClass_biz_agencies biz_agencies;
          public TClass_biz_enrollment biz_enrollment;
          public TClass_biz_leaves biz_leaves;
          public TClass_biz_members biz_members;
          public TClass_biz_privileges biz_privileges;
          public TClass_biz_user biz_user;
          public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
          public string cad_num_string;
          public string enrollment_description;
          public DateTime enrollment_effective_date;
          public string leave_next_month_description;
          public string leave_this_month_description;
          public string raw_member_email_address;
          public string raw_member_phone_num;
          public string target_member_agency_id;
          public string target_member_id;
          } // end p_type

        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_member_detail_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - member_detail";
                //
                var user_member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
                var be_authorized_tier_or_same_agency = p.biz_members.BeAuthorizedTierOrSameAgency(user_member_id,p.target_member_id);
                var priv_of_interest = k.EMPTY;
                //
                LinkButton_schedule_detail.Visible =
                  !p.biz_members.BePast(Session["member_summary"])
                &&
                  (
                    k.Has((string[])(Session["privilege_array"]),"schedule-squad-truck-team")
                  ||
                    k.Has((string[])(Session["privilege_array"]),"schedule-volunteer-field-supervisor-team")
                  ||
                    p.biz_privileges.HasForAnySpecialAgency(member_id:user_member_id,privilege_name:"edit-schedule")
                  ||
                    k.Has((string[])(Session["privilege_array"]), "see-other-member-schedule-detail")
                  );
                //
                if (p.raw_member_phone_num != k.EMPTY)
                {
                    Label_phone_num.Text = k.FormatAsNanpPhoneNum(p.raw_member_phone_num);
                }
                else
                {
                    Label_phone_num.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                if (p.raw_member_email_address != k.EMPTY)
                {
                    HyperLink_email_address.Text = p.raw_member_email_address;
                    HyperLink_email_address.NavigateUrl = "mailto:" + p.raw_member_email_address;
                }
                else
                {
                    HyperLink_email_address.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                //
                Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                priv_of_interest = "change-member-name";
                LinkButton_change_name.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                  || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                LinkButton_change_name.Text = k.ExpandTildePath(LinkButton_change_name.Text);
                //
                Label_cad_num.Text = p.cad_num_string;
                priv_of_interest = "change-cad-num";
                LinkButton_change_cad_num.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                  || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                LinkButton_change_cad_num.Text = k.ExpandTildePath(LinkButton_change_cad_num.Text);
                //
                Label_leave_this_month.Text = p.leave_this_month_description;
                Label_leave_next_month.Text = p.leave_next_month_description;
                LinkButton_leave_detail.Text = k.ExpandTildePath(LinkButton_leave_detail.Text);
                //
                Label_agency.Text = p.agency;
                LinkButton_change_agency.Text = k.ExpandTildePath(LinkButton_change_agency.Text);
                //
                Label_section.Text = p.biz_members.SectionOf(Session["member_summary"]);
                LinkButton_change_section.Text = k.ExpandTildePath(LinkButton_change_section.Text);
                //
                Label_medical_release_level.Text = p.biz_members.MedicalReleaseLevelOf(Session["member_summary"]);
                var first_release_as_an_aic_date = p.biz_members.FirstReleaseAsAnAicDateOf(Session["member_summary"]);
                Literal_first_release_as_aic_phrase.Text = (first_release_as_an_aic_date.Length > 0 ? "on " + first_release_as_an_aic_date : "unrecorded");
                //
                Label_enrollment.Text = p.enrollment_description;
                Label_effective_date_clause.Text = (p.enrollment_effective_date < DateTime.Today ? "since" : "effective") + k.SPACE + p.enrollment_effective_date.ToString("yyyy-MM-dd");
                Label_elaboration.Text = p.biz_enrollment.ElaborationOf(p.enrollment_description);
                LinkButton_enrollment_detail.Text = k.ExpandTildePath(LinkButton_enrollment_detail.Text);
                //
                if (p.biz_members.RetentionOf(Session["member_summary"]) != k.EMPTY)
                {
                    Label_years_of_service.Text = p.biz_members.RetentionOf(Session["member_summary"]);
                    priv_of_interest = "adjust-years-of-service";
                    LinkButton_adjust_years_of_service.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                      || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                    LinkButton_adjust_years_of_service.Text = k.ExpandTildePath(LinkButton_adjust_years_of_service.Text);
                }
                else
                {
                    Label_years_of_service.Text = "(See membership status detail)";
                }
                //
                Label_be_driver_qualified.Text = k.YesNoOf(p.biz_members.BeDriverQualifiedOf(Session["member_summary"]));
                LinkButton_change_driver_qual.Text = k.ExpandTildePath(LinkButton_change_driver_qual.Text);
                //
                priv_of_interest = "change-member-phone-num";
                LinkButton_change_member_phone_num.Visible = (p.target_member_id == user_member_id)
                  || (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                  || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                LinkButton_change_member_phone_num.Text = k.ExpandTildePath(LinkButton_change_member_phone_num.Text);
                //
                priv_of_interest = "change-member-email-address";
                LinkButton_change_member_email_address.Visible = !p.biz_members.BeRoleHolder(p.target_member_id)
                  && ((k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency) || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id));
                LinkButton_change_member_email_address.Text = k.ExpandTildePath(LinkButton_change_member_email_address.Text);
                //
                priv_of_interest = "change-med-release-level";
                LinkButton_change_medical_release_level.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency);
                LinkButton_change_medical_release_level.Text = k.ExpandTildePath(LinkButton_change_medical_release_level.Text);
                //
                priv_of_interest = "change-driver-qual";
                LinkButton_change_driver_qual.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                  || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                //
                LinkButton_change_agency.Visible = k.Has((string[])(Session["privilege_array"]), "change-agency") && p.biz_agencies.BeImmediateOutTransfersAllowed(p.agency);
                //
                priv_of_interest = "change-section";
                LinkButton_change_section.Visible = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                  || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                //
                Label_be_on_squad_truck_team.Text = k.YesNoOf(p.biz_members.BeSquadTruckTeamQualifiedOf(Session["member_summary"]));
                Label_be_flight_medic.Text = k.YesNoOf(p.biz_members.BeFlightMedicQualifiedOf(Session["member_summary"]));
                Label_be_marine_medic.Text = k.YesNoOf(p.biz_members.BeMarineMedicQualifiedOf(Session["member_summary"]));
                LinkButton_change_squad_truck_team_qual.Text = k.ExpandTildePath(LinkButton_change_squad_truck_team_qual.Text);
                LinkButton_change_flight_medic_qual.Text = k.ExpandTildePath(LinkButton_change_flight_medic_qual.Text);
                LinkButton_change_marine_medic_qual.Text = k.ExpandTildePath(LinkButton_change_marine_medic_qual.Text);
                LinkButton_change_squad_truck_team_qual.Visible = (k.Has((string[])(Session["privilege_array"]), "change-squad-truck-team-qual") && be_authorized_tier_or_same_agency)
                  || k.Has((string[])(Session["privilege_array"]), "schedule-squad-truck-team");
                LinkButton_change_flight_medic_qual.Visible = (k.Has((string[])(Session["privilege_array"]), "change-flight-medic-qual") && be_authorized_tier_or_same_agency);
                LinkButton_change_marine_medic_qual.Visible = (k.Has((string[])(Session["privilege_array"]), "change-marine-medic-qual") && be_authorized_tier_or_same_agency);
                //
                UserControl_role_member_map_log_control.SetP(subject_member_id:p.target_member_id);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session[InstanceId() + ".p"] != null))
                {
                    p = (p_type)(Session[InstanceId() + ".p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore
                    // unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    p.biz_agencies = new TClass_biz_agencies();
                    p.biz_enrollment = new TClass_biz_enrollment();
                    p.biz_leaves = new TClass_biz_leaves();
                    p.biz_members = new TClass_biz_members();
                    p.biz_privileges = new TClass_biz_privileges();
                    p.biz_user = new TClass_biz_user();
                    p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
                    //
                    p.target_member_id = p.biz_members.IdOf(Session["member_summary"]);
                    p.raw_member_phone_num = p.biz_members.PhoneNumOf(p.target_member_id);
                    p.raw_member_email_address = p.biz_members.EmailAddressOf(p.target_member_id);
                    p.cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (p.cad_num_string == k.EMPTY)
                    {
                        p.cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    p.biz_leaves.DescribeThisAndNextMonthForMember(p.target_member_id, out p.leave_this_month_description, out p.leave_next_month_description, appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
                    p.biz_enrollment.CurrentDescriptionAndEffectiveDateForMember(p.target_member_id, out p.enrollment_description, out p.enrollment_effective_date);
                    p.agency = p.biz_members.AgencyOf(Session["member_summary"]);
                    p.target_member_agency_id = p.biz_members.AgencyIdOf(Session["member_summary"]);
                }
            }
        }

        protected void LinkButton_change_member_phone_num_Click(object sender, System.EventArgs e)
        {
            SessionSet("member_phone_num", p.raw_member_phone_num);
            DropCrumbAndTransferTo("change_phone_num.aspx");
        }

        protected void LinkButton_change_name_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_name.aspx");
        }

        protected void LinkButton_change_cad_num_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_cad_num.aspx");
        }

        protected void LinkButton_change_agency_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_member_agency.aspx");
        }

        protected void LinkButton_change_section_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_member_section.aspx");
        }

        protected void LinkButton_change_driver_qual_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_member_driver_qualification.aspx");
        }

        protected void LinkButton_enrollment_detail_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("enrollment_detail.aspx");
        }

        protected void LinkButton_change_medical_release_level_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("change_member_medical_release_level.aspx");
        }

        protected void LinkButton_leave_detail_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("leave_detail.aspx");
        }

        protected void LinkButton_change_member_email_address_Click(object sender, System.EventArgs e)
        {
            SessionSet("member_email_address", p.raw_member_email_address);
            DropCrumbAndTransferTo("change_member_email_address.aspx");
        }

        private void TWebForm_member_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    protected void LinkButton_adjust_years_of_service_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("adjust_length_of_service.aspx");
      }

    protected void LinkButton_change_squad_truck_team_qual_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("change_member_squad_truck_team_qualification.aspx");
      }

    protected void LinkButton_change_flight_medic_qual_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("change_member_flight_medic_qualification.aspx");
      }

    protected void LinkButton_change_marine_medic_qual_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("change_member_marine_medic_qualification.aspx");
      }

    protected void LinkButton_schedule_detail_Click(object sender, EventArgs e)
      {
      p.msg_protected_member_schedule_detail.member_id = p.target_member_id;
      p.msg_protected_member_schedule_detail.relative_month = new k.subtype<int>(0,1);
      p.msg_protected_member_schedule_detail.member_agency_id = p.target_member_agency_id;
      MessageDropCrumbAndTransferTo
        (
        msg:p.msg_protected_member_schedule_detail,
        folder_name:"protected",
        aspx_name:"member_schedule_detail"
        );
      }

    } // end TWebForm_member_detail

}

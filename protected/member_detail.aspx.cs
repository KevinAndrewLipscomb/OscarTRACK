using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_user;
using appcommon;
namespace member_detail
{
    public partial class TWebForm_member_detail: ki_web_ui.page_class
    {
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
            string target_member_id;
            if (!IsPostBack)
            {
                Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - member_detail";
                target_member_id = p.biz_members.IdOf(Session["e_item"]);
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
                    Label_email_address.Text = p.raw_member_email_address;
                }
                else
                {
                    Label_email_address.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                Label_member_designator.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]);
                LinkButton_change_name.Visible = k.Has((string[])(Session["privilege_array"]), "change-member-name") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                LinkButton_change_name.Text = k.ExpandTildePath(LinkButton_change_name.Text);
                Label_cad_num.Text = p.cad_num_string;
                LinkButton_change_cad_num.Visible = k.Has((string[])(Session["privilege_array"]), "change-cad-num") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                LinkButton_change_cad_num.Text = k.ExpandTildePath(LinkButton_change_cad_num.Text);
                Label_leave_this_month.Text = p.leave_this_month_description;
                Label_leave_next_month.Text = p.leave_next_month_description;
                LinkButton_leave_detail.Text = k.ExpandTildePath(LinkButton_leave_detail.Text);
                Label_officership.Text = p.biz_members.OfficershipOf(p.biz_members.IdOf(Session["e_item"]));
                if (Label_officership.Text == k.EMPTY)
                {
                    Label_officership.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                LinkButton_officership_detail.Text = k.ExpandTildePath(LinkButton_officership_detail.Text);
                Label_agency.Text = p.biz_members.AgencyOf(Session["e_item"]);
                LinkButton_change_agency.Text = k.ExpandTildePath(LinkButton_change_agency.Text);
                Label_section.Text = p.biz_members.SectionOf(Session["e_item"]);
                LinkButton_change_section.Text = k.ExpandTildePath(LinkButton_change_section.Text);
                Label_medical_release_level.Text = p.biz_members.MedicalReleaseLevelOf(Session["e_item"]);
                Label_enrollment.Text = p.biz_members.EnrollmentOf(Session["e_item"]);
                Label_elaboration.Text = p.biz_enrollment.ElaborationOf(Label_enrollment.Text);
                LinkButton_enrollment_detail.Text = k.ExpandTildePath(LinkButton_enrollment_detail.Text);
                if (p.biz_members.RetentionOf(Session["e_item"]) != k.EMPTY)
                {
                    Label_years_of_service.Text = p.biz_members.RetentionOf(Session["e_item"]);
                }
                else
                {
                    Label_years_of_service.Text = "(See membership status detail)";
                }
                Label_be_driver_qualified.Text = k.YesNoOf(p.biz_members.BeDriverQualifiedOf(Session["e_item"]));
                LinkButton_change_driver_qual.Text = k.ExpandTildePath(LinkButton_change_driver_qual.Text);
                LinkButton_change_member_phone_num.Visible = (target_member_id == p.biz_members.IdOfUserId(p.biz_user.IdNum())) || (k.Has((string[])(Session["privilege_array"]), "change-member-phone-num") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id));
                LinkButton_change_member_phone_num.Text = k.ExpandTildePath(LinkButton_change_member_phone_num.Text);
                if (p.biz_members.UserIdOf(target_member_id) == k.EMPTY)
                {
                    LinkButton_change_member_email_address.Visible = k.Has((string[])(Session["privilege_array"]), "change-member-email-address") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                }
                LinkButton_change_member_email_address.Text = k.ExpandTildePath(LinkButton_change_member_email_address.Text);
                LinkButton_change_medical_release_level.Visible = k.Has((string[])(Session["privilege_array"]), "change-med-release-level") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                LinkButton_change_medical_release_level.Text = k.ExpandTildePath(LinkButton_change_medical_release_level.Text);
                LinkButton_change_driver_qual.Visible = k.Has((string[])(Session["privilege_array"]), "change-driver-qual") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                LinkButton_change_agency.Visible = k.Has((string[])(Session["privilege_array"]), "change-agency") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
                LinkButton_change_section.Visible = k.Has((string[])(Session["privilege_array"]), "change-section") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), target_member_id);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session["member_detail.p"] != null))
                {
                    p = (p_type)(Session["member_detail.p"]);
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
                    p.biz_enrollment = new TClass_biz_enrollment();
                    p.biz_leaves = new TClass_biz_leaves();
                    p.biz_members = new TClass_biz_members();
                    p.biz_user = new TClass_biz_user();
                    p.raw_member_phone_num = p.biz_members.PhoneNumOf(p.biz_members.IdOf(Session["e_item"]));
                    p.raw_member_email_address = p.biz_members.EmailAddressOf(p.biz_members.IdOf(Session["e_item"]));
                    p.cad_num_string = p.biz_members.CadNumOf(Session["e_item"]);
                    if (p.cad_num_string == k.EMPTY)
                    {
                        p.cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    p.biz_leaves.DescribeThisAndNextMonthForMember(p.biz_members.IdOf(Session["e_item"]), out p.leave_this_month_description, out p.leave_next_month_description, appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
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

        protected void LinkButton_officership_detail_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("officership_detail.aspx");
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
            SessionSet("member_detail.p", p);
        }

        private struct p_type
        {
            public TClass_biz_enrollment biz_enrollment;
            public TClass_biz_leaves biz_leaves;
            public TClass_biz_members biz_members;
            public TClass_biz_user biz_user;
            public string cad_num_string;
            public string leave_next_month_description;
            public string leave_this_month_description;
            public string raw_member_email_address;
            public string raw_member_phone_num;
        } // end p_type

    } // end TWebForm_member_detail

}

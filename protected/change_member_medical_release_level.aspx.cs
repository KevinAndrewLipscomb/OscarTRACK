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


using Class_biz_medical_release_levels;
using Class_biz_members;
namespace change_member_medical_release_level
{
    public struct p_type
    {
        public TClass_biz_medical_release_levels biz_medical_release_levels;
        public TClass_biz_members biz_members;
        public string saved_level;
    } // end p_type

    public partial class TWebForm_change_member_medical_release_level: ki_web_ui.page_class
    {
        private p_type p;
        protected new System.Web.UI.HtmlControls.HtmlTitle Title = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_change_member_medical_release_level_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
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
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_medical_release_level";
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    Label_member_name_3.Text = Label_member_name_2.Text;
                    Literal_member_name_4.Text = Label_member_name_3.Text;
                    Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                    HtmlTable_proper_release_reminder.Visible = !k.Has((string[])(Session["privilege_array"]), "release-trainees");
                    Label_current_medical_release_level.Text = p.saved_level;
                    p.biz_medical_release_levels.BindListControl(DropDownList_medical_release_level);
                    UserControl_drop_down_date_effective_date.selectedvalue = DateTime.Today;
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_members = new TClass_biz_members();
            p.biz_medical_release_levels = new TClass_biz_medical_release_levels();
            p.saved_level = p.biz_members.MedicalReleaseLevelOf(Session["member_summary"]);

        }

        protected void CustomValidator_control_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            string current_enrollment_level;
            string first_name;
            args.IsValid = false;
            current_enrollment_level = p.biz_members.EnrollmentOf(Session["member_summary"]);
            first_name = p.biz_members.FirstNameOf(Session["member_summary"]);
            if (p.biz_medical_release_levels.BeValidForCurrentEnrollmentLevel(k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM), current_enrollment_level))
            {
                args.IsValid = true;
            }
            else
            {
                CustomValidator_control.ErrorMessage = first_name + " is currently a(n) " + current_enrollment_level + " member, and " + current_enrollment_level + " members must remain certified.  If " + first_name + " is no longer certified, please go back to " + first_name + k.APOSTROPHE + "s member_detail page and give " + first_name + " a Membership status that does not require " + "certification.  Then perform your current action again.";
            }
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
          {
            if (Page.IsValid)
              {
              if(
                p.biz_members.SetMedicalReleaseCode
                  (
                  k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM),
                  Session["member_summary"],
                  Panel_effective_date.Visible,
                  UserControl_drop_down_date_effective_date.selectedvalue
                  )
                )
                {
                BackTrack();
                }
              else
                {
                Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "inveffdat", "The new enrollment status was NOT recorded.  Possible reasons are:  (1) The new membership status cannot take effect on a" + " date that is before the current membership status began; (2) A membership status may not be repeated on the same day --" + " consider advancing the effective date by one day.", true);
                }
              }
          }

        private void TWebForm_change_member_medical_release_level_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        protected void DropDownList_medical_release_level_SelectedIndexChanged(object sender, EventArgs e)
          {
          Panel_effective_date.Visible = (p.biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByDescription(p.saved_level)
          && !p.biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByCode(k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM)));
          }

    } // end TWebForm_change_member_medical_release_level

}
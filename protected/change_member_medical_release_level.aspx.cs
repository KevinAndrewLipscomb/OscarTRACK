using Class_biz_medical_release_levels;
using Class_biz_members;
using kix;
using System;
using System.Configuration;
using System.Web.UI;

namespace change_member_medical_release_level
  {

  public partial class TWebForm_change_member_medical_release_level: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_medical_release_levels biz_medical_release_levels;
      public TClass_biz_members biz_members;
      public string enrollment_level_to_force_description;
      public string saved_level;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_member_medical_release_level_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_medical_release_level";
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
            p.enrollment_level_to_force_description = k.EMPTY;
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
                CustomValidator_control.ErrorMessage = first_name + " is currently a(n) " + current_enrollment_level + " member, and " + current_enrollment_level + " members must remain certified.  If " + first_name + " is no longer certified, please go back to " + first_name + k.APOSTROPHE + "s member_detail page and give " + first_name + " a Membership Status that does not require " + "certification.  Then perform your current action again.";
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
                  new_code:k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM),
                  summary:Session["member_summary"],
                  enrollment_level_to_force_description:
                    (Panel_effective_date.Visible && Panel_will_force_physician_choice_enrollment.Visible ? k.Safe(RadioButtonList_disposition.SelectedValue,k.safe_hint_type.ALPHA_WORDS) : p.enrollment_level_to_force_description),
                  effective_date:UserControl_drop_down_date_effective_date.selectedvalue
                  )
                )
                {
                SessionSet("member_summary",p.biz_members.Summary(p.biz_members.IdOf(Session["member_summary"]))); // Update the summary session variable to make sure it holds the latest first_release_as_aic_date.
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
          p.enrollment_level_to_force_description = k.EMPTY;
          //
          var new_level_code = k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM);
          Panel_effective_date.Visible = (p.biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByDescription(p.saved_level) && !p.biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByCode(new_level_code));
          Panel_will_force_physician_choice_enrollment.Visible = Panel_effective_date.Visible && p.biz_medical_release_levels.DescriptionOf(new_level_code).Contains("Physician");
          RequiredFieldValidator_physician_choice.Enabled = Panel_will_force_physician_choice_enrollment.Visible;
          Panel_will_force_no_choice_enrollment.Visible = Panel_effective_date.Visible && !Panel_will_force_physician_choice_enrollment.Visible;
          p.enrollment_level_to_force_description = (Panel_will_force_no_choice_enrollment.Visible ? "Regular" : k.EMPTY);
          }

    } // end TWebForm_change_member_medical_release_level

}

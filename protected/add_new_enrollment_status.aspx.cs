using appcommon;
using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace add_new_enrollment_status
  {
  public partial class TWebForm_add_new_enrollment_status: ki_web_ui.page_class
    {

    private struct p_type
    {
        public bool be_member_squad_affiliation_weak;
        public bool be_ok_to_grant_associate_enrollment;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_enrollment biz_enrollment;
        public TClass_biz_medical_release_levels biz_medical_release_levels;
        public TClass_biz_members biz_members;
        public TClass_biz_schedule_assignments biz_schedule_assignments;
        public TClass_biz_user biz_user;
        public string member_id_of_user_id;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_add_new_enrollment_status_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - add_new_enrollment_status";
            string cad_num_string;
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
                    p.biz_agencies = new TClass_biz_agencies();
                    p.biz_enrollment = new TClass_biz_enrollment();
                    p.biz_medical_release_levels = new TClass_biz_medical_release_levels();
                    p.biz_members = new TClass_biz_members();
                    p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
                    p.biz_user = new TClass_biz_user();
                    cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (cad_num_string.Length == 0)
                    {
                        cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    Label_member_first_name.Text = p.biz_members.FirstNameOf(Session["member_summary"]);
                    Label_member_designator.Text = Label_member_first_name.Text + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + cad_num_string + ")";
                    p.member_id_of_user_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
                    p.biz_enrollment.BindTransitionRadioButtonList(p.biz_members.IdOf(Session["member_summary"]), p.biz_members.HighestTierOf(p.member_id_of_user_id), RadioButtonList_disposition);
                    p.be_member_squad_affiliation_weak = p.biz_members.BeTransferring(Session["member_summary"]) || p.biz_members.BePast(Session["member_summary"]);
                    if (p.be_member_squad_affiliation_weak)
                      {
                      Panel_target_agency.Visible = true;
                      Literal_member_first_name_2.Text = p.biz_members.FirstNameOf(Session["member_summary"]);
                      Literal_member_first_name_3.Text = p.biz_members.FirstNameOf(Session["member_summary"]);
                      if (p.biz_members.BeAuthorizedTierOrSameAgency(p.member_id_of_user_id,p.biz_members.IdOf(Session["member_summary"])))
                        {
                        p.biz_agencies.BindListControlShort(DropDownList_target_agency,k.EMPTY,true,"-- Select --");
                        DropDownList_target_agency.Enabled = true;
                        }
                      else
                        {
                        p.biz_agencies.BindListControlShort(DropDownList_target_agency,p.biz_members.AgencyIdOfId(p.member_id_of_user_id));
                        }
                      }
                    UserControl_effective_date.minyear = "1940";
                    UserControl_effective_date.maxyear = ((uint)(DateTime.Today.Year + 1)).ToString();
                    UserControl_effective_date.selectedvalue = DateTime.Today;
                    Label_no_transitions_available.Visible = (RadioButtonList_disposition.Items.Count == 0);
                    // UserControl_effective_date. := (RadioButtonList_disposition.items.count > 0);
                    TextBox_note.Enabled = (RadioButtonList_disposition.Items.Count > 0);
                    Button_submit.Enabled = (RadioButtonList_disposition.Items.Count > 0);
                    //
                    p.be_ok_to_grant_associate_enrollment = k.Has((string[])(Session["privilege_array"]), "grant-associate-enrollment");
                }
            }
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_cancel);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_grant_leave);
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
          {
          if (IsValid)
            {
            var target_agency_id = k.EMPTY;
            if (p.be_member_squad_affiliation_weak)
              {
              target_agency_id = k.Safe(DropDownList_target_agency.SelectedValue,k.safe_hint_type.NUM);
              }
            if (p.biz_enrollment.SetLevel(k.Safe(RadioButtonList_disposition.SelectedValue, k.safe_hint_type.NUM), UserControl_effective_date.selectedvalue, k.Safe(TextBox_note.Text, k.safe_hint_type.PUNCTUATED), p.biz_members.IdOf(Session["member_summary"]), Session["member_summary"],target_agency_id))
              {
              BackTrack();
              }
            else
              {
              Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "inveffdat", "The new enrollment status was NOT recorded.  Possible reasons are:  (1) The new membership status cannot take effect on a" + " date that is before the current membership status began; (2) A membership status may not be repeated on the same day --" + " consider advancing the effective date by one day.", true);
              }
            }
          }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_add_new_enrollment_status_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        protected void CustomValidator_med_release_level_enrollment_incompatibility_ServerValidate(object source, ServerValidateEventArgs args)
          {
          args.IsValid = false;
          var current_medical_release_level = p.biz_members.MedicalReleaseLevelOf(Session["member_summary"]);
          var first_name = p.biz_members.FirstNameOf(Session["member_summary"]);
          if (p.biz_medical_release_levels.BeValidEnrollmentForCurrent(k.Safe(RadioButtonList_disposition.SelectedValue, k.safe_hint_type.NUM),current_medical_release_level))
            {
            args.IsValid = true;
            }
          else
            {
            CustomValidator_med_release_level_enrollment_incompatibility.ErrorMessage = first_name + "'s current released cert level is '" + current_medical_release_level + "', which is incompatible with the Membership Status that you selected.  If "
            + first_name + " has been released at a different medical cert level, please go back to " + first_name + k.APOSTROPHE + "s member_detail page and change "
            + first_name + k.APOSTROPHE + "s Released cert level appropriately.  Then perform your current action again.";
            }
          }

        protected void CustomValidator_duty_selection_conflict_ServerValidate(object source, ServerValidateEventArgs args)
          {
          args.IsValid =
              p.biz_enrollment.BeCoreOpsCommitted(k.Safe(RadioButtonList_disposition.SelectedValue,k.safe_hint_type.NUM))
            ||
              !p.biz_schedule_assignments.BeMemberSelectedAfter
                (
                member_id:p.biz_members.IdOf(Session["member_summary"]),
                date:UserControl_effective_date.selectedvalue
);
          }

        protected void RadioButtonList_disposition_SelectedIndexChanged(object sender, EventArgs e)
          {
          Panel_target_agency.Visible = (RadioButtonList_disposition.SelectedValue == "13" ? false : p.be_member_squad_affiliation_weak);
          }

        protected void LinkButton_grant_leave_Click(object sender, EventArgs e)
          {
          BackTrack(2);
          }

    protected void CustomValidator_associate_enrollment_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (RadioButtonList_disposition.SelectedValue != p.biz_enrollment.CodeOf("Associate")) || p.be_ok_to_grant_associate_enrollment;
      }

    } // end TWebForm_add_new_enrollment_status

}

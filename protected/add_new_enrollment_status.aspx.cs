using appcommon;
using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_members;
using Class_biz_user;
using kix;
using System;
using System.Configuration;
using UserControl_drop_down_date;

namespace add_new_enrollment_status
{
    public struct p_type
    {
        public bool be_member_currently_transferring;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_enrollment biz_enrollment;
        public TClass_biz_members biz_members;
        public TClass_biz_user biz_user;
        public string member_id_of_user_id;
    }

    public partial class TWebForm_add_new_enrollment_status: ki_web_ui.page_class
    {
        private p_type p;
        protected TWebUserControl_drop_down_date UserControl_effective_date = null;

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_add_new_enrollment_status_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string cad_num_string;
            if (IsPostBack)
            {
                if ((Session["add_new_enrollment_status.p"] != null))
                {
                    p = (p_type)(Session["add_new_enrollment_status.p"]);
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
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - add_new_enrollment_status";
                    p.biz_agencies = new TClass_biz_agencies();
                    p.biz_enrollment = new TClass_biz_enrollment();
                    p.biz_members = new TClass_biz_members();
                    p.biz_user = new TClass_biz_user();
                    cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (cad_num_string == k.EMPTY)
                    {
                        cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    Label_member_first_name.Text = p.biz_members.FirstNameOf(Session["member_summary"]);
                    Label_member_designator.Text = Label_member_first_name.Text + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + cad_num_string + ")";
                    p.member_id_of_user_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
                    p.biz_enrollment.BindTransitionRadioButtonList(p.biz_members.IdOf(Session["member_summary"]), p.biz_members.HighestTierOf(p.member_id_of_user_id), RadioButtonList_disposition);
                    p.be_member_currently_transferring = p.biz_members.BeTransferring(Session["member_summary"]);
                    if (p.be_member_currently_transferring)
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
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            var target_agency_id = k.EMPTY;
            if (p.be_member_currently_transferring)
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

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_add_new_enrollment_status_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("add_new_enrollment_status.p", p);
        }

    } // end TWebForm_add_new_enrollment_status

}

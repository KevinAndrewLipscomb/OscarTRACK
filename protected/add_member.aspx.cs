using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_sections;
using Class_biz_sms_gateways;
using Class_biz_user;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace add_member
  {
  public partial class TWebForm_add_member: ki_web_ui.page_class
    {

    private struct p_type
    {
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_enrollment biz_enrollment;
        public TClass_biz_medical_release_levels biz_medical_release_levels;
        public TClass_biz_members biz_members;
        public TClass_biz_sections biz_sections;
        public TClass_biz_sms_gateways biz_sms_gateways;
        public TClass_biz_user biz_user;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_add_member_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - add_member";
            if (!IsPostBack)
            {
                if (k.Has((string[])(Session["privilege_array"]), "see-all-squads"))
                {
                    RadioButtonList_member_observer_guestprovider.Enabled = true;
                    RequireConfirmation
                      (
                      c:RadioButtonList_member_observer_guestprovider,
                      prompt:"If you put this form in Observer or Guest Provider mode, it will stay that way until you exit the form and re-enter it.  Are you sure you want to add an Observer or Guest Provider?"
                      );
                    TableRow_agency.Visible = true;
                    p.biz_agencies.BindListControlShortDashLong(DropDownList_agency);
                }
                else
                {
                    TableRow_agency.Visible = false;
                }
                p.biz_sections.BindListControl(DropDownList_section);
                p.biz_sms_gateways.BindDirectToListControl
                  (
                  target:DropDownList_phone_service,
                  unselected_literal:"-- Select --"
                  );
                p.biz_medical_release_levels.BindListControl(DropDownList_medical_release_level);
                UserControl_enrollment_date.minyear = "1940";
                UserControl_enrollment_date.maxyear = DateTime.Today.Year.ToString();
                p.biz_enrollment.BindUncontrolledListControl(DropDownList_enrollment_level);
                Focus(TextBox_first_name, true);
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
                    p.biz_sections = new TClass_biz_sections();
                    p.biz_sms_gateways = new TClass_biz_sms_gateways();
                    p.biz_user = new TClass_biz_user();
                }
            }
        }

    protected void Button_check_for_similarities_Click(object sender, System.EventArgs e)
      {
      var first_name = k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME);
      var last_name = k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME);
      var similars = p.biz_members.NamesSimilarTo(first_name, last_name, "<br>");
      Label_similars.Text = (similars.Length > 0 ? similars : "(None)");
      Label_first_name.Text = first_name.ToUpper();
      Label_last_name.Text = last_name.ToUpper();
      Button_add_and_repeat.Enabled = true;
      Button_add_and_stop.Enabled = true;
      }

        protected void CustomValidator_phone_num_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = k.BeValidNanpNumber(k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM));
        }

        protected void Button_add_and_repeat_Click(object sender, System.EventArgs e)
        {
            if (Add())
            {
                TextBox_first_name.Text = k.EMPTY;
                TextBox_last_name.Text = k.EMPTY;
                TextBox_cad_num.Text = k.EMPTY;
                DropDownList_medical_release_level.SelectedIndex = 0;
                RadioButtonList_driver_qualified_yes_no.SelectedIndex =  -1;
                if (k.Has((string[])(Session["privilege_array"]), "see-all-squads"))
                {
                    DropDownList_agency.SelectedIndex = 0;
                }
                TextBox_phone_num.Text = k.EMPTY;
                TextBox_email_address.Text = k.EMPTY;
                UserControl_enrollment_date.Clear();
                Label_invalid_enrollment_date.Visible = false;
                DropDownList_enrollment_level.SelectedIndex =  -1;
                Label_similars.Text = k.EMPTY;
                Label_first_name.Text = "(the";
                Label_last_name.Text = "member)";
                Button_add_and_repeat.Enabled = false;
                Button_add_and_stop.Enabled = false;
            }
        }

        protected void Button_add_and_stop_Click(object sender, System.EventArgs e)
        {
            if (Add())
            {
                BackTrack();
            }
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void CustomValidator_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value.Length == 0) || kix.k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        private void TWebForm_add_member_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        private bool Add()
        {
            bool result;
            string agency_id;
            result = false;
            if (UserControl_enrollment_date.isvalid)
            {
                if (Page.IsValid)
                {
                    if (k.Has((string[])(Session["privilege_array"]), "see-all-squads"))
                    {
                        agency_id = k.Safe(DropDownList_agency.SelectedValue, k.safe_hint_type.NUM);
                    }
                    else
                    {
                        agency_id = p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
                    }
                    if(
                      p.biz_members.Add
                        (
                        first_name:k.Safe(TextBox_first_name.Text.Trim(), k.safe_hint_type.HUMAN_NAME),
                        last_name:k.Safe(TextBox_last_name.Text.Trim(), k.safe_hint_type.HUMAN_NAME),
                        cad_num:k.Safe(TextBox_cad_num.Text, k.safe_hint_type.ALPHANUM),
                        medical_release_code:k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM),
                        be_driver_qualified:k.BooleanOfYesNo(k.Safe(RadioButtonList_driver_qualified_yes_no.SelectedValue, k.safe_hint_type.ALPHA)),
                        agency_id:agency_id,
                        email_address:k.Safe(TextBox_email_address.Text.Trim(), k.safe_hint_type.EMAIL_ADDRESS),
                        enrollment_date:UserControl_enrollment_date.selectedvalue,
                        enrollment_level:k.Safe(DropDownList_enrollment_level.SelectedValue, k.safe_hint_type.NUM),
                        phone_num:k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM),
                        phone_service_id:k.Safe(DropDownList_phone_service.SelectedValue,k.safe_hint_type.NUM),
                        section_num:k.Safe(DropDownList_section.SelectedValue, k.safe_hint_type.NUM)
                        )
                      )
                      {
                      result = true;
                      }
                    else
                      {
                      Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "alreadinsys", "NOT ADDED:  The specified name and/or CAD# is already in the system.", true);
                      }
                }
                else
                {
                    ValidationAlert(true);
                }
            }
            else
            {
                Label_invalid_enrollment_date.Visible = true;
                ValidationAlert(true);
            }
            return result;
        }

    protected void RadioButtonList_member_observer_guestprovider_SelectedIndexChanged(object sender, EventArgs e)
      {
      var nonmember_enrollment_level = k.Safe(RadioButtonList_member_observer_guestprovider.SelectedValue,k.safe_hint_type.ALPHA_WORDS);
      RequiredFieldValidator_phone_num.Enabled = true;
      RequiredFieldValidator_email_address.Enabled = true;
      TextBox_cad_num.Text = p.biz_members.NextGuestDesignator();
      TextBox_cad_num.Enabled = false;
      RegularExpressionValidator_cad_num.Enabled = false;
      if (nonmember_enrollment_level == "Observer")
        {
        DropDownList_medical_release_level.ClearSelection();
        DropDownList_medical_release_level.Items.FindByValue("1").Selected = true;
        DropDownList_medical_release_level.Enabled = false;
        }
      else if (nonmember_enrollment_level == "Guest Provider")
        {
        DropDownList_medical_release_level.ClearSelection();
        DropDownList_medical_release_level.Items.FindByText("Guest Intern").Selected = true;
        DropDownList_medical_release_level.Enabled = false;
        }
      RadioButtonList_driver_qualified_yes_no.ClearSelection();
      RadioButtonList_driver_qualified_yes_no.Items.FindByValue("No").Selected = true;
      RadioButtonList_driver_qualified_yes_no.Enabled = false;
      DropDownList_agency.ClearSelection();
      DropDownList_agency.Items.FindByValue("0").Selected = true;
      DropDownList_agency.Enabled = false;
      UserControl_enrollment_date.selectedvalue = DateTime.Today;
      UserControl_enrollment_date.enabled = false;
      DropDownList_enrollment_level.ClearSelection();
      DropDownList_enrollment_level.Items.Insert(index:0,item:new ListItem(text:nonmember_enrollment_level,value:p.biz_enrollment.CodeOf(nonmember_enrollment_level)));
      DropDownList_enrollment_level.Items[0].Selected = true;
      DropDownList_enrollment_level.Enabled = false;
      RequiredFieldValidator_enrollment_level.Enabled = false;
      //
      RadioButtonList_member_observer_guestprovider.Enabled = false;
      }

    } // end TWebForm_add_member

}

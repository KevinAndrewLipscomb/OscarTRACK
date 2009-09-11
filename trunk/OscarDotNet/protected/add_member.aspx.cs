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


using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_user;
using UserControl_drop_down_date;
namespace add_member
{
    public struct p_type
    {
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_enrollment biz_enrollment;
        public TClass_biz_medical_release_levels biz_medical_release_levels;
        public TClass_biz_members biz_members;
        public TClass_biz_user biz_user;
    } // end p_type

    public partial class TWebForm_add_member: ki_web_ui.page_class
    {
        private p_type p;
        protected TWebUserControl_drop_down_date UserControl_enrollment_date = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_add_member_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - add_member";
                if (k.Has((string[])(Session["privilege_array"]), "see-all-squads"))
                {
                    TableRow_agency.Visible = true;
                    p.biz_agencies.BindListControlShortDashLong(DropDownList_agency);
                }
                else
                {
                    TableRow_agency.Visible = false;
                }
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
                if ((Session["add_member.p"] != null))
                {
                    p = (p_type)(Session["add_member.p"]);
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
                    p.biz_user = new TClass_biz_user();
                }
            }
        }

        protected void Button_check_for_similarities_Click(object sender, System.EventArgs e)
        {
            string first_name;
            string last_name;
            string similars;
            first_name = k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME);
            last_name = k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME);
            similars = p.biz_members.NamesSimilarTo(first_name, last_name, "<br>");
            if (similars != k.EMPTY)
            {
                Label_similars.Text = similars;
            }
            else
            {
                Label_similars.Text = "(None)";
            }
            Label_first_name.Text = first_name;
            Label_last_name.Text = last_name;
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
            args.IsValid = (args.Value == k.EMPTY) || kix.k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        private void TWebForm_add_member_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("add_member.p", p);
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
                    if (p.biz_members.Add(k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME), k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME), k.Safe(TextBox_cad_num.Text, k.safe_hint_type.NUM), k.Safe(DropDownList_medical_release_level.SelectedValue, k.safe_hint_type.NUM), k.BooleanOfYesNo(k.Safe(RadioButtonList_driver_qualified_yes_no.SelectedValue, k.safe_hint_type.ALPHA)), agency_id, k.Safe(TextBox_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS), UserControl_enrollment_date.selectedvalue, k.Safe(DropDownList_enrollment_level.SelectedValue, k.safe_hint_type.NUM), k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM)))
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

    } // end TWebForm_add_member

}

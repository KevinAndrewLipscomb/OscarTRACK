using Class_biz_members;
using kix;
using System;
using System.Configuration;

namespace change_member_flight_medic_qualification
{
    public partial class TWebForm_change_member_flight_medic_qualification: ki_web_ui.page_class
    {
    private struct p_type
    {
        public bool be_flight_medic_initially_qualified;
        public TClass_biz_members biz_members;
    }

        private p_type p;

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_member_flight_medic_qualification_PreRender;
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
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_flight_medic_qualification";
                    p.biz_members = new TClass_biz_members();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.be_flight_medic_initially_qualified = p.biz_members.BeFlightMedicQualifiedOf(Session["member_summary"]);
                    RadioButtonList_flight_medic_qualified_yes_no.SelectedValue = k.YesNoOf(p.be_flight_medic_initially_qualified);
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            bool be_flight_medic_qualified;
            be_flight_medic_qualified = k.BooleanOfYesNo(RadioButtonList_flight_medic_qualified_yes_no.SelectedValue);
            if (be_flight_medic_qualified != p.be_flight_medic_initially_qualified)
            {
                p.biz_members.SetFlightMedicQualification(be_flight_medic_qualified, Session["member_summary"]);
            }
            BackTrack();
        }

        private void TWebForm_change_member_flight_medic_qualification_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_member_flight_medic_qualification

}

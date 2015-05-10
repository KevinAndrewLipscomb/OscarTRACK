using Class_biz_members;
using kix;
using System;
using System.Configuration;

namespace change_member_squad_truck_team_qualification
{
    public struct p_type
    {
        public bool be_squad_truck_team_initially_qualified;
        public TClass_biz_members biz_members;
    } // end p_type

    public partial class TWebForm_change_member_squad_truck_team_qualification: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_change_member_squad_truck_team_qualification_PreRender;
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
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_squad_truck_team_qualification";
                    p.biz_members = new TClass_biz_members();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.be_squad_truck_team_initially_qualified = p.biz_members.BeSquadTruckTeamQualifiedOf(Session["member_summary"]);
                    RadioButtonList_squad_truck_team_qualified_yes_no.SelectedValue = k.YesNoOf(p.be_squad_truck_team_initially_qualified);
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
            bool be_squad_truck_team_qualified;
            be_squad_truck_team_qualified = k.BooleanOfYesNo(RadioButtonList_squad_truck_team_qualified_yes_no.SelectedValue);
            if (be_squad_truck_team_qualified != p.be_squad_truck_team_initially_qualified)
            {
                p.biz_members.SetSquadTruckTeamQualification(be_squad_truck_team_qualified, Session["member_summary"]);
            }
            BackTrack();
        }

        private void TWebForm_change_member_squad_truck_team_qualification_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_member_squad_truck_team_qualification

}

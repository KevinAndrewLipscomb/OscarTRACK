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
using Class_biz_members;
namespace change_member_agency
{
    public struct p_type
    {
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_members biz_members;
        public string saved_agency_id;
    } // end p_type

    public partial class TWebForm_change_member_agency: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_change_member_agency_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session["change_member_agency.p"] != null))
                {
                    p = (p_type)(Session["change_member_agency.p"]);
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
                    Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_agency";
                    p.biz_members = new TClass_biz_members();
                    p.biz_agencies = new TClass_biz_agencies();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.saved_agency_id = p.biz_agencies.IdOfShortDesignator(p.biz_members.AgencyOf(Session["e_item"]));
                    p.biz_agencies.BindListControlShort(DropDownList_agency, p.saved_agency_id, false);
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
            p.biz_members.SetAgency(p.saved_agency_id, k.Safe(DropDownList_agency.SelectedValue, k.safe_hint_type.NUM), Session["e_item"]);
            BackTrack();
        }

        private void TWebForm_change_member_agency_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("change_member_agency.p", p);
        }

    } // end TWebForm_change_member_agency

}

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


using Class_biz_members;
namespace change_member_driver_qualification
{
    public struct p_type
    {
        public bool be_driver_initially_qualified;
        public TClass_biz_members biz_members;
    } // end p_type

    public partial class TWebForm_change_member_driver_qualification: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_change_member_driver_qualification_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session["change_member_driver_qualification.p"] != null))
                {
                    p = (p_type)(Session["change_member_driver_qualification.p"]);
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
                    Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_driver_qualification";
                    p.biz_members = new TClass_biz_members();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.be_driver_initially_qualified = p.biz_members.BeDriverQualifiedOf(Session["e_item"]);
                    RadioButtonList_driver_qualified_yes_no.SelectedValue = k.YesNoOf(p.be_driver_initially_qualified);
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
            bool be_driver_qualified;
            be_driver_qualified = k.BooleanOfYesNo(RadioButtonList_driver_qualified_yes_no.SelectedValue);
            if (be_driver_qualified != p.be_driver_initially_qualified)
            {
                p.biz_members.SetDriverQualification(be_driver_qualified, Session["e_item"]);
            }
            BackTrack();
        }

        private void TWebForm_change_member_driver_qualification_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("change_member_driver_qualification.p", p);
        }

    } // end TWebForm_change_member_driver_qualification

}

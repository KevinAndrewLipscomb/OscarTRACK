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
using Class_biz_users;
namespace change_cad_num
{
    public struct p_type
    {
        public TClass_biz_members biz_members;
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_change_cad_num: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_change_cad_num_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_cad_num";
                Label_old_cad_num.Text = p.biz_members.CadNumOf(Session["e_item"]);
                Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]);
                Label_member_name_2.Text = Label_member_name_1.Text;
                Focus(TextBox_cad_num, true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session["change_cad_num.p"] != null))
                {
                    p = (p_type)(Session["change_cad_num.p"]);
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
                    p.biz_members = new TClass_biz_members();
                    p.biz_users = new TClass_biz_users();
                }
            }

        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (p.biz_members.SetCadNum(k.Safe(TextBox_cad_num.Text, k.safe_hint_type.NUM), Session["e_item"]))
            {
                BackTrack();
            }
            else
            {
                Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "cadnumtakn", "NOT CHANGED:  The specified CAD # is already in the system.", true);
            }
        }

        private void TWebForm_change_cad_num_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("change_cad_num.p", p);
        }

    } // end TWebForm_change_cad_num

}

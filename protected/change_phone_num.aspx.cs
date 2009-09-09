using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;



using System.Web.UI;
using Class_biz_members;
namespace change_phone_num
{
    public struct p_type
    {
        public TClass_biz_members biz_members;
    } // end p_type

    public partial class TWebForm_change_phone_num: ki_web_ui.page_class
    {
        private p_type p;
        protected new System.Web.UI.HtmlControls.HtmlTitle Title = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_change_phone_num_PreRender;
            this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session["change_phone_num.p"] != null))
                {
                    p = (p_type)(Session["change_phone_num.p"]);
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
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                Title.Text = ConfigurationManager.AppSettings["application_name"] + " - change_phone_num";
                p.biz_members = new TClass_biz_members();
                Label_name.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]);
                TextBox_phone_num.Text = k.FormatAsNanpPhoneNum(Session["member_phone_num"].ToString());
                Focus(TextBox_phone_num, true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void CustomValidator_phone_num_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = k.BeValidNanpNumber(k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM));
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_change_phone_num_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("change_phone_num.p", p);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_members.SetPhoneNum(k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM), Session["e_item"]);
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

    } // end TWebForm_change_phone_num

}

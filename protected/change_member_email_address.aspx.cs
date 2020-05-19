using Class_biz_members;
using Class_biz_users;
using kix;
using System;
using System.Configuration;

namespace change_member_email_address
  {
  public partial class TWebForm_change_member_email_address: ki_web_ui.page_class
    {
    private struct p_type
    {
        public TClass_biz_members biz_members;
        public TClass_biz_users biz_users;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_member_email_address_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_email_address";
                Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                Label_member_name_2.Text = Label_member_name_1.Text;
                Label_member_name_3.Text = Label_member_name_2.Text;
                TextBox_member_email_address.Text = Session["member_email_address"].ToString();
                Focus(TextBox_member_email_address, true);
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
            p.biz_members.SetEmailAddress(p.biz_members.IdOf(Session["member_summary"]), k.Safe(TextBox_member_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS));
            BackTrack();
        }

        protected void CustomValidator_member_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value.Length == 0) || kix.k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        private void TWebForm_change_member_email_address_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_member_email_address

}

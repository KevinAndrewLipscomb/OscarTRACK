using Class_biz_members;
using Class_biz_users;
using kix;
using System;
using System.Configuration;

namespace change_name
  {
  public partial class TWebForm_change_name: ki_web_ui.page_class
    {

    private struct p_type
    {
        public TClass_biz_members biz_members;
        public TClass_biz_users biz_users;
        public string saved_first_name;
        public string saved_last_name;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_name_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_name";
            if (!IsPostBack)
            {
                Label_member_name.Text = p.saved_first_name + k.SPACE + p.saved_last_name;
                TextBox_first_name.Text = p.saved_first_name;
                TextBox_last_name.Text = p.saved_last_name;
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
                    p.biz_members = new TClass_biz_members();
                    p.biz_users = new TClass_biz_users();
                    p.saved_first_name = p.biz_members.FirstNameOf(Session["member_summary"]);
                    p.saved_last_name = p.biz_members.LastNameOf(Session["member_summary"]);
                }
            }

        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            p.biz_members.SetName(p.saved_first_name, p.saved_last_name, k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME).ToUpper(), k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME).ToUpper(), Session["member_summary"]);
            BackTrack();
        }

        private void TWebForm_change_name_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_name

}

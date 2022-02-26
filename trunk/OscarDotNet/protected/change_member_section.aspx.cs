using Class_biz_members;
using Class_biz_sections;
using kix;
using System;
using System.Configuration;

namespace change_member_section
  {
  public partial class TWebForm_change_member_section: ki_web_ui.page_class
    {
    private struct p_type
    {
        public TClass_biz_sections biz_sections;
        public TClass_biz_members biz_members;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_member_section_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_section";
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
                    p.biz_sections = new TClass_biz_sections();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.biz_sections.BindListControl(DropDownList_section, p.biz_members.SectionOf(Session["member_summary"]));
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
            p.biz_members.SetSection(k.Safe(DropDownList_section.SelectedValue, k.safe_hint_type.NUM), Session["member_summary"]);
            BackTrack();
        }

        private void TWebForm_change_member_section_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_member_section

}

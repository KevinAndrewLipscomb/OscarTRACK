using Class_biz_users;
using System;
using System.Configuration;
using System.Web.UI;

namespace verify_efficipay_signature
{
    public struct p_type
    {
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_verify_efficipay_signature: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_verify_efficipay_signature_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            switch(NatureOfVisit(InstanceId() + ".p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - verify_efficipay_signature";
                    p.biz_users = new TClass_biz_users();
                    Focus(TextBox_check_num, true);
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session[InstanceId() + ".p"]);
                    break;
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
            Server.Transfer("login.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
            }
            else
            {
                ValidationAlert(true);
            }
        }

        private void TWebForm_verify_efficipay_signature_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_verify_efficipay_signature

}

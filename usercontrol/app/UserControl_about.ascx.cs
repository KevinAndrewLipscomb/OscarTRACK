using System.Configuration;


using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

namespace UserControl_about
{
    public struct p_type
    {
        public bool be_loaded;
    } // end p_type

    public partial class TWebUserControl_about: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_about.p"] != null) && (Session["UserControl_about.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_about.p"]);
            }
            else
            {
                p.be_loaded = false;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebUserControl_about_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_about_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_about.p", p);
        }

        public TWebUserControl_about Fresh()
        {
            TWebUserControl_about result;
            Session.Remove("UserControl_about.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_about

}

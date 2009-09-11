using System.Configuration;


using System;
using System.Web.UI.WebControls;

namespace UserControl_common_header_bar
{
    // / <summary>
    // / Summary description for WebUserControl1.
    // / </summary>
    public partial class TWebUserControl_common_header_bar: ki_web_ui.usercontrol_class
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
        }

    } // end TWebUserControl_common_header_bar

}

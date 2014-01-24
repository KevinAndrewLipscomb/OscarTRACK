using OscarDotNet.component.ss;
using System;
using System.Web;

namespace all_call_agent
{
    public partial class TWebForm_all_call_agent: System.Web.UI.Page
    {
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            new Class_ss_vbemsbridge().RecentIncidents();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm_all_call_agent

}

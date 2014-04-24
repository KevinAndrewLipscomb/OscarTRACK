using ki_windows_forms;
using OscarDotNet.component.ss;
using System;
using System.Threading;

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
        var web_browser_context = new webbrowsercontext_class();
        var recent_incidents = new Class_ss_vbemsbridge().RecentIncidents(web_browser_context);
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm_all_call_agent

}

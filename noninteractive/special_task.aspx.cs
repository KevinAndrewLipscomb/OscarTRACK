using Class_biz_schedule_assignments;
using System;
using System.Web;

namespace special_task
{
    public partial class TWebForm_special_task: System.Web.UI.Page
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
#warning Intended for one-time use only, as part of initial "Strength chart" implementation.
        new TClass_biz_schedule_assignments().SetMusterToLogOnAndOffTimeSpans();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm_special_task

}

using Class_biz_scheduled_tasks;
using System;
using System.Web;

namespace avail_submission_deadline_tasks
{
    public partial class TWebForm_avail_submission_deadline_tasks: ki_web_ui.page_class
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
            new TClass_biz_scheduled_tasks().DoAvailSubmissionDeadlineChores();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm_avail_submission_deadline_tasks

}

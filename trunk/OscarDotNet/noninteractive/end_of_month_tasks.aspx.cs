using Class_biz_scheduled_tasks;
using System;

namespace end_of_month_tasks
{
    public partial class TWebForm_end_of_month_tasks: ki_web_ui.page_class
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
            if (DateTime.Today == new DateTime(DateTime.Today.Year,DateTime.Today.Month,1).AddMonths(1).AddDays(-1)) // then this is the last day of the month
              {
              new TClass_biz_scheduled_tasks().DoEndOfMonthChores(Server.MapPath("scratch"));
              }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

    } // end TWebForm_end_of_month_tasks

}

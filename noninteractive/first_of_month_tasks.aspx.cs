using Class_biz_scheduled_tasks;
using System;

namespace first_of_month_tasks
  {

  public partial class TWebForm_first_of_month_tasks: System.Web.UI.Page
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
      new TClass_biz_scheduled_tasks().DoFirstOfMonthChores(Server.MapPath("scratch"));
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    } // end TWebForm_first_of_month_tasks

  }
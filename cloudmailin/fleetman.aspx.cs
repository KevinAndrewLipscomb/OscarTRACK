using Class_biz_fleetman;
using System;

namespace fleetman
  {

  public partial class TWebForm_fleetman: System.Web.UI.Page
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
      new TClass_biz_fleetman().ProcessCloudmailinRequest
        (
        x_from_header:Request.Unvalidated["x_from_header"],
        x_to_header:Request.Unvalidated["x_to_header"],
        subject:Request.Unvalidated["subject"],
        plain:Request.Unvalidated["plain"]
        );
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    } // end TWebForm_fleetman

  }

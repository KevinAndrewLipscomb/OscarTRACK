using Class_biz_members;
using kix;
using System;
using System.Configuration;
using UserControl_fleet;

namespace fleet_status
  {
  public partial class TWebForm_fleet_status: ki_web_ui.page_class
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
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - fleet_status";
        Meta_control.Content = ((Session.Timeout - 2)*60).ToString();
        LinkButton_log_in.Text += ConfigurationManager.AppSettings["application_name"];
        //
        Session.Remove("mode:report/pub-fleet-status");
        //
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      Session.Add("mode:report/pub-fleet-status", k.EMPTY);
      var c = ((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx")));
      PlaceHolder_fleet_status.Controls.Add(c);
      c.SetP(agency_short_designator:k.Safe(Request["agency"].ToString(),k.safe_hint_type.ALPHANUM));
//
// Uncomment the following line to disable partial page rendering.
//
//ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      }

    protected void LinkButton_log_in_Click(object sender, EventArgs e)
      {
      Server.Transfer("~/Default.aspx");
      }
    } // end TWebForm_fleet_status

  }

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
        Session.Clear();
        Session.Abandon();
        //
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var agency = Request["agency"].ToString();
      Session.Add("mode:report", k.EMPTY);
      Session.Add("member_id",new TClass_biz_members().IdOfAppropriateRoleHolder((agency == "EMS" ? "Department Fleet Supervisor" : "Squad Fleet Coordinator"),agency));
      PlaceHolder_fleet_status.Controls.Add(((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx"))));
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

// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_user;
using System;
using System.Configuration;
using UserControl_gripe_sheet;

namespace gripe_sheet
  {
  public partial class TWebForm_gripe_sheet: ki_web_ui.page_class
    {
    private struct p_type
      {
      public TClass_biz_user biz_user;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_gripe_sheet_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - gripe_sheet";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_user = new TClass_biz_user();
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      var UserControl_gripe_sheet = ((LoadControl("~/usercontrol/app/UserControl_gripe_sheet.ascx") as TWebUserControl_gripe_sheet));
      PlaceHolder_gripe_sheet.Controls.Add(UserControl_gripe_sheet);
      UserControl_gripe_sheet.SetFilter(p.biz_user.IdNum(),Session["vehicle_summary"],p.biz_user.Roles()[0]);
      }

    private void TWebForm_gripe_sheet_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_gripe_sheet

  }

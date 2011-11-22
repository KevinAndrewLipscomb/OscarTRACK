using Class_biz_agencies;
using Class_biz_vehicles;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.Text;
using System.Web.UI;
using System.IO;
using UserControl_gripe_sheet;

namespace report_commanded_gripe_sheet
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_commanded_gripe_sheet: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_vehicles biz_vehicles;
      public TClass_biz_role_member_map biz_role_member_map;
      }

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_commanded_gripe_sheet_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_commanded_gripe_sheet";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit_unlimited = NatureOfVisitUnlimited(InstanceId() + ".p");
      if(
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_COLD_CALL)
        ||
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_INITIAL)
        )
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-gripe-sheet", k.EMPTY);
        //
        var UserControl_gripe_sheet = ((LoadControl("~/usercontrol/app/UserControl_gripe_sheet.ascx") as TWebUserControl_gripe_sheet));
        PlaceHolder_gripe_sheet.Controls.Add(UserControl_gripe_sheet);
        UserControl_gripe_sheet.SetFilter
          (
          k.Safe(Request["user_id"],k.safe_hint_type.NUM),
          p.biz_vehicles.Summary(k.Safe(Request["vehicle_id"],k.safe_hint_type.NUM)),
          k.Safe(Request["work_order_coordinator_title"],k.safe_hint_type.ALPHA_WORDS),
          Request["serialized_gripe_inclusion_hashtable"]
          );
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_commanded_gripe_sheet_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      var squad_fleet_coordinator_target = p.biz_role_member_map.EmailTargetOf("Squad Fleet Coordinator",p.biz_agencies.ShortDesignatorOf(p.biz_vehicles.AgencyIdOfId(k.Safe(Request["vehicle_id"],k.safe_hint_type.NUM))));
      k.SmtpMailSend
        (
        ConfigurationManager.AppSettings["sender_email_address"],
        k.Safe(Request["target"],k.safe_hint_type.EMAIL_ADDRESS),
        "VB EMS vehicle work order",
        body,
        true,
        squad_fleet_coordinator_target,
        k.EMPTY,
        squad_fleet_coordinator_target
        );
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_gripe_sheet

  }

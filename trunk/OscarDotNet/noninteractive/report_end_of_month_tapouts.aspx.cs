using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_tapouts;

namespace report_end_of_month_tapouts
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_end_of_month_tapouts: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_id;
      public string agency_short_designator;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public k.subtype<int> relative_month;
      }

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_end_of_month_tapouts_PreRender;
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_end_of_month_tapouts";
        //
        var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
        Literal_scope.Text = (p.agency_id.Length > 0 ? p.biz_agencies.MediumDesignatorOf(p.agency_id).ToUpper() : "CITYWIDE");
        HyperLink_web_site.Text = url;
        HyperLink_web_site.NavigateUrl = url;
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
        p.biz_members = new TClass_biz_members();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        p.agency_short_designator = k.Safe(Request["agency"] ?? k.EMPTY,k.safe_hint_type.ALPHANUM);
        p.relative_month = new k.subtype<int>(0,1);
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/end-of-month-tapouts", k.EMPTY);
        Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder("Squad Commander", p.agency_short_designator));
        //
        var UserControl_tapouts_control = ((LoadControl("~/usercontrol/app/UserControl_tapouts.ascx") as TWebUserControl_tapouts));
        PlaceHolder_tapouts.Controls.Add(UserControl_tapouts_control);
        p.agency_id = (p.agency_short_designator.Length > 0 ? p.biz_agencies.IdOfShortDesignator(p.agency_short_designator) : k.EMPTY);
        UserControl_tapouts_control.SetP(agency_id:p.agency_id);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_end_of_month_tapouts_PreRender(object sender, System.EventArgs e)
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
      var email_target = k.EMPTY;
      if (p.agency_short_designator.Length == 0)
        {
        email_target = p.biz_role_member_map.EmailTargetOf("Department Chief Scheduler","EMS");
        }
      else if (p.agency_short_designator == "EMS")
        {
        email_target = p.biz_role_member_map.EmailTargetOf("Department Jump Seat Scheduler","EMS");
        }
      else
        {
        email_target = p.biz_role_member_map.EmailTargetOf("Assistant Squad Commander",p.agency_short_designator)
        + k.COMMA
        + p.biz_role_member_map.EmailTargetOf("Squad Manager (possibly paid)",p.agency_short_designator)
        + k.COMMA
        + p.biz_role_member_map.EmailTargetOf("Squad Commander",p.agency_short_designator)
        + k.COMMA
        + p.biz_role_member_map.EmailTargetOf("Squad Tapout Tracker",p.agency_short_designator);
        }
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:email_target,
        subject:DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM yyyy").ToUpper() + " Tapouts, " + (p.agency_short_designator.Length > 0 ? p.agency_short_designator : "CITYWIDE"),
        message_string:body,
        be_html:true,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:email_target
        );
      Session.Abandon();
      }

    } // end TWebForm_report_end_of_month_tapouts

  }

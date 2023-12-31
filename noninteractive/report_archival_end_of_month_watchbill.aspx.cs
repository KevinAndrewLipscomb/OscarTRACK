using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_schedule_proposal;

namespace report_archival_end_of_month_watchbill
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_archival_end_of_month_watchbill: ki_web_ui.page_class
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

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_archival_end_of_month_watchbill_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - report_archival_end_of_month_watchbill";
      if (!IsPostBack)
        {
        //
        var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
        Literal_scope.Text = (p.agency_short_designator == "EMS" ? "SYSTEM-WIDE" : p.biz_agencies.MediumDesignatorOf(p.agency_id).ToUpper());
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
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/archival-end-of-month-watchbill-noninteractive", k.EMPTY);
        //
        p.relative_month = (Request["RetryLastMonth"] is null ? new k.subtype<int>(0,1) : new k.subtype<int>(-1,-1)); // that is, appending "&RetryLastMonth=" to URI allows recovery from initial failure
        //
        var UserControl_schedule_proposal_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx") as TWebUserControl_schedule_proposal));
        PlaceHolder_schedule_proposal.Controls.Add(UserControl_schedule_proposal_control);
        UserControl_schedule_proposal_control.SetInteractivity(false);
        p.agency_short_designator = k.Safe(Request["agency"],k.safe_hint_type.ALPHANUM);
        p.agency_id = p.biz_agencies.IdOfShortDesignator(p.agency_short_designator);
        UserControl_schedule_proposal_control.SetFilter((p.agency_short_designator == "EMS" ? k.EMPTY : p.agency_id),k.EMPTY,p.relative_month);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_archival_end_of_month_watchbill_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
      base.Render(html_text_writer);
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      var email_target = p.biz_role_member_map.EmailTargetForArchivalEndOfMonthWatchbill(p.agency_short_designator);
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:email_target,
        subject:"*Archival* " + DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM yyyy").ToUpper() + " Ambulance Watchbill, " + (p.agency_short_designator == "EMS" ? "SYSTEM-WIDE" : p.agency_short_designator) + " (scalable)",
        message_string:body,
        be_html:true,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:email_target
        );
      Session.Abandon();
      }

    } // end TWebForm_report_archival_end_of_month_watchbill

  }

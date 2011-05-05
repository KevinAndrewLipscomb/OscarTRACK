// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace report_commanded_member_schedule_detail
  {

  public partial class TWebForm_report_commanded_member_schedule_detail: ki_web_ui.page_class
    {

    private struct p_type
      {
      public bool be_virgin_watchbill;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public string member_agency_id;
      public string member_id;
      public string other_agency_ids;
      public string publisher;
      public k.subtype<int> relative_month;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_report_commanded_member_schedule_detail_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - report_commanded_member_schedule_detail";
        Literal_member_name.Text = p.biz_members.FirstNameOfMemberId(p.member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(p.member_id);
        if (p.relative_month.val == 0)
          {
          Literal_which_month.Text = "THIS";
          }
        else if (p.relative_month.val == 1)
          {
          Literal_which_month.Text = "NEXT";
          }
        //
        var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
        HyperLink_web_site.Text = url;
        HyperLink_web_site.NavigateUrl = url;
        //
        Literal_publisher.Text = p.publisher;
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit_unlimited = NatureOfVisitUnlimited("report_commanded_member_schedule_detail.p");
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
        p.be_virgin_watchbill = bool.Parse(k.Safe(Request["be_virgin_watchbill"],k.safe_hint_type.ALPHA));
        p.member_agency_id = k.Safe(Request["member_agency_id"],k.safe_hint_type.NUM);
        p.member_id = k.Safe(Request["member_id"],k.safe_hint_type.NUM);
        p.other_agency_ids = k.Safe(Request["other_agency_ids"],k.safe_hint_type.NUM_CSV);
        p.publisher = k.Safe(Request["publisher"],k.safe_hint_type.HUMAN_NAME);
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        //
        SessionSet("mode:report",k.EMPTY);
        //
        UserControl_member_schedule_detail_control.SetInteractivity(false);
        UserControl_member_schedule_detail_control.SetFilter(p.member_agency_id,p.relative_month,p.member_id,p.be_virgin_watchbill);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["report_commanded_member_schedule_detail.p"]);
        }
      }

    private void TWebForm_report_commanded_member_schedule_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("report_commanded_member_schedule_detail.p", p);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      var squad_scheduler_target = p.biz_role_member_map.EmailTargetOfAppropriateScheduler(p.member_agency_id);
      var squad_schedule_monitor_target = p.biz_role_member_map.EmailTargetOf("Squad Schedule Monitor",p.biz_agencies.ShortDesignatorOf(p.member_agency_id));
      if (squad_schedule_monitor_target.Length > 0)
        {
        squad_schedule_monitor_target = k.COMMA + squad_schedule_monitor_target;
        }
      var other_squad_schedule_coordinator_target = p.biz_role_member_map.EmailTargetOfAgencyIdList("Squad Scheduler",p.other_agency_ids);
      if (other_squad_schedule_coordinator_target.Length > 0)
        {
        other_squad_schedule_coordinator_target = k.COMMA + other_squad_schedule_coordinator_target;
        }
      var other_squad_schedule_monitor_target = p.biz_role_member_map.EmailTargetOfAgencyIdList("Squad Schedule Monitor",p.other_agency_ids);
      if (other_squad_schedule_monitor_target.Length > 0)
        {
        other_squad_schedule_monitor_target = k.COMMA + other_squad_schedule_monitor_target;
        }
      var member_email_address = p.biz_members.EmailAddressOf(p.member_id).Trim();
      k.SmtpMailSend
        (
        ConfigurationManager.AppSettings["sender_email_address"],
        (member_email_address.Length > 0 ? member_email_address : "MEMBER_EMAIL_ADDRESS_NOT_KNOWN@frompaper2web.com"),
        DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM").ToUpper() + " Schedule Assignments" + (p.be_virgin_watchbill ? k.EMPTY : " (REVISED)"),
        body,
        true,
        ((p.be_virgin_watchbill ? k.EMPTY : p.biz_role_member_map.EmailTargetOf("Department Chief Scheduler","EMS") + k.COMMA + squad_scheduler_target + squad_schedule_monitor_target + other_squad_schedule_coordinator_target + other_squad_schedule_monitor_target)),
        k.EMPTY,
        squad_scheduler_target
        );
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_member_schedule_detail

  }

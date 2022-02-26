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
      public bool be_limited_preview;
      public bool be_virgin_watchbill;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public string member_agency_id;
      public string member_id;
      public string other_agency_ids;
      public string publisher;
      public k.subtype<int> relative_month;
      public string time_triggered;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - report_commanded_member_schedule_detail";
      if (!IsPostBack)
        {
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
        Table_consider_auto_calendaring.Visible = !p.be_limited_preview;
        //
        Literal_publisher.Text = p.publisher + (p.be_limited_preview ? " performing a Refresh" : k.EMPTY);
        Literal_time_triggered.Text = p.time_triggered;
        //
        UserControl_member_icalendar_control.Publish(member_id:p.member_id);
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
        p.be_limited_preview = bool.Parse(k.Safe(Request["be_limited_preview"],k.safe_hint_type.ALPHA));
        p.be_virgin_watchbill = bool.Parse(k.Safe(Request["be_virgin_watchbill"],k.safe_hint_type.ALPHA));
        p.member_agency_id = k.Safe(Request["member_agency_id"],k.safe_hint_type.NUM);
        p.member_id = k.Safe(Request["member_id"],k.safe_hint_type.NUM);
        p.other_agency_ids = k.Safe(Request["other_agency_ids"],k.safe_hint_type.NUM_CSV);
        p.publisher = k.Safe(Request["publisher"],k.safe_hint_type.HUMAN_NAME);
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        p.time_triggered = k.Safe(Request["time_triggered"],k.safe_hint_type.DATE_TIME);
        //
        SessionSet("mode:report",k.EMPTY);
        //
        UserControl_member_schedule_detail_control.SetInteractivity(false);
        UserControl_member_schedule_detail_control.SetFilter(p.member_agency_id,p.relative_month,p.member_id,p.be_virgin_watchbill,p.be_limited_preview);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_commanded_member_schedule_detail_PreRender(object sender, System.EventArgs e)
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
      var member_email_address = (p.be_limited_preview ? k.EMPTY : p.biz_members.EmailAddressOf(p.member_id).Trim());
      var squad_scheduler_target = p.biz_role_member_map.EmailTargetOfAppropriateScheduler(p.member_agency_id);
      var officer_target = p.biz_members.OfficerTargetForReportCommandedMemberScheduleDetail
        (
        be_virgin_watchbill:p.be_virgin_watchbill,
        do_send_member_sched_details_to_dept_chief_scheduler:bool.Parse(ConfigurationManager.AppSettings["do_send_member_sched_details_to_dept_chief_scheduler"]),
        member_agency_id:p.member_agency_id,
        other_agency_ids:p.other_agency_ids,
        squad_scheduler_target:squad_scheduler_target,
        member_id:p.member_id
        );
      if (p.be_limited_preview)
        {
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:officer_target,
          subject:DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM").ToUpper() + " Schedule Assignments" + (p.be_virgin_watchbill ? k.EMPTY : " (*PREVIEW*)"),
          message_string:body,
          be_html:true,
          cc:k.EMPTY,
          bcc:k.EMPTY,
          reply_to:ConfigurationManager.AppSettings["bouncer_email_address"]
          );
        }
      else
        {
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:(member_email_address.Length > 0 ? member_email_address : "MEMBER_EMAIL_ADDRESS_NOT_KNOWN@frompaper2web.com"),
          subject:DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM").ToUpper() + " Schedule Assignments" + (p.be_virgin_watchbill ? k.EMPTY : " (REVISED)"),
          message_string:body,
          be_html:true,
          cc:officer_target,
          bcc:k.EMPTY,
          reply_to:squad_scheduler_target
          );
        }
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_member_schedule_detail

  }

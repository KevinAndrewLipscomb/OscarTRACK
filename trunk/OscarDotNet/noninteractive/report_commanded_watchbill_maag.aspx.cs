using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_watchbill_maag;

namespace report_commanded_watchbill_maag
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_commanded_watchbill_maag: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_filter;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public string publisher;
      public k.subtype<int> relative_month;
      public string time_triggered;
      }

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_commanded_watchbill_maag_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_commanded_watchbill_maag";
        Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        Literal_publisher.Text = p.publisher;
        Literal_time_triggered.Text = p.time_triggered;
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
        p.agency_filter = k.Safe(Request["agency_id"],k.safe_hint_type.NUM);
        p.publisher = k.Safe(Request["publisher"],k.safe_hint_type.HUMAN_NAME);
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        p.time_triggered = k.Safe(Request["time_triggered"],k.safe_hint_type.DATE_TIME);
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-watchbill-maag-noninteractive", k.EMPTY);
        //
        var UserControl_watchbill_maag_control = ((LoadControl("~/usercontrol/app/UserControl_watchbill_maag.ascx") as TWebUserControl_watchbill_maag));
        PlaceHolder_watchbill_maag.Controls.Add(UserControl_watchbill_maag_control);
        UserControl_watchbill_maag_control.SetFilter(p.agency_filter,p.relative_month);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_commanded_watchbill_maag_PreRender(object sender, System.EventArgs e)
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
      var recipient_q = p.biz_members.CurrentMemberEmailAddressesQueue((p.agency_filter.Length == 0 ? k.EMPTY : p.biz_agencies.ShortDesignatorOf(p.agency_filter)),true);
      var recipient_q_count = recipient_q.Count;
      for (var i = new k.subtype<int>(0,recipient_q_count); i.val < recipient_q_count; i.val++ )
        {
        k.SmtpMailSend
          (
          ConfigurationManager.AppSettings["sender_email_address"],
          recipient_q.Dequeue().ToString(),
          DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM").ToUpper() + " Ambulance Watchbill (MAAG)",
          body,
          true,
          k.EMPTY,
          k.EMPTY,
          p.biz_role_member_map.EmailTargetOfAppropriateScheduler(p.agency_filter)
          );
        }
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_watchbill_maag

  }

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_schedule_assignments_audit;

namespace report_end_of_month_schedule_assignments_audit
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_end_of_month_schedule_assignments_audit: ki_web_ui.page_class
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
      PreRender += TWebForm_report_end_of_month_schedule_assignments_audit_PreRender;
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_end_of_month_schedule_assignments_audit";
        //
        var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
        Literal_scope.Text = p.biz_agencies.MediumDesignatorOf(p.agency_id).ToUpper();
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
        p.agency_short_designator = k.Safe(Request["agency"],k.safe_hint_type.ALPHANUM);
        p.relative_month = new k.subtype<int>(0,1);
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/end-of-month-personnel-results", k.EMPTY);
        Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder("Squad Commander", p.agency_short_designator));
        //
        var UserControl_schedule_assignments_audit_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_assignments_audit.ascx") as TWebUserControl_schedule_assignments_audit));
        PlaceHolder_schedule_assignments_audit.Controls.Add(UserControl_schedule_assignments_audit_control);
        p.agency_id = p.biz_agencies.IdOfShortDesignator(p.agency_short_designator);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_end_of_month_schedule_assignments_audit_PreRender(object sender, System.EventArgs e)
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
      email_target = p.biz_role_member_map.EmailTargetOf("Assistant Squad Commander",p.agency_short_designator)
      + k.COMMA
      + p.biz_role_member_map.EmailTargetOf("Squad Manager (possibly paid)",p.agency_short_designator)
      + k.COMMA
      + p.biz_role_member_map.EmailTargetOf("Squad Commander",p.agency_short_designator);
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:email_target,
        subject:DateTime.Today.AddMonths(p.relative_month.val).ToString("MMMM yyyy").ToUpper() + " Personnel Results, " + p.agency_short_designator,
        message_string:body,
        be_html:true,
        cc:k.EMPTY,
        bcc:k.EMPTY,
        reply_to:email_target
        );
      Session.Abandon();
      }

    } // end TWebForm_report_end_of_month_schedule_assignments_audit

  }

// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_members;
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
      public TClass_biz_members biz_members;
      public string member_id;
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
        p.biz_members = new TClass_biz_members();
        //
        p.member_id = k.Safe(Request["member_id"],k.safe_hint_type.NUM);
        //
        SessionSet("mode:report",k.EMPTY);
        //
        var relative_month = new k.subtype<int>(0,1);
        relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        UserControl_member_schedule_detail_control.SetInteractivity(false);
        UserControl_member_schedule_detail_control.SetFilter(k.Safe(Request["member_agency_id"],k.safe_hint_type.NUM),relative_month,p.member_id);
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
      k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"],p.biz_members.EmailAddressOf(p.member_id),"Ambulance Duty Assignments",body,true);
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_member_schedule_detail

  }

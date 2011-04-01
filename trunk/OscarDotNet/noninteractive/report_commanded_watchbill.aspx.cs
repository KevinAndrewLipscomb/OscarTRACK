using Class_biz_agencies;
using Class_biz_members;
using kix;
using System;
using System.Configuration;
using System.Text;
using System.Web.UI;
using System.IO;
using UserControl_schedule_proposal;

namespace report_commanded_watchbill
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_commanded_watchbill: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_filter;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public string release_filter;
      public k.subtype<int> relative_month;
      }

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_commanded_watchbill_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_commanded_watchbill";
        //
        if (p.agency_filter == k.EMPTY)
          {
          Literal_agency.Text = "ALL RESCUE SQUADS";
          }
        else
          {
          Literal_agency.Text = p.biz_agencies.MediumDesignatorOf(p.agency_filter).ToUpper();
          }
        if (p.release_filter == k.EMPTY)
          {
          Literal_release_filter.Text = "all assigned personnel";
          }
        else if (p.release_filter == "1")
          {
          Literal_release_filter.Text = "only personnel who are released";
          }
        else if (p.release_filter == "0")
          {
          Literal_release_filter.Text = "only personnel who are not released";
          }
        //
        var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
        HyperLink_web_site.Text = url;
        HyperLink_web_site.NavigateUrl = url;
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit_unlimited = NatureOfVisitUnlimited("report_commanded_watchbill.p");
      if(
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_COLD_CALL)
        ||
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_INITIAL)
        )
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        //
        p.agency_filter = k.Safe(Request["agency_id"],k.safe_hint_type.NUM);
        p.release_filter = k.Safe(Request["release_filter"],k.safe_hint_type.NUM);
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-watchbill", k.EMPTY);
        //
        var UserControl_schedule_proposal_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx") as TWebUserControl_schedule_proposal));
        PlaceHolder_schedule_proposal.Controls.Add(UserControl_schedule_proposal_control);
        UserControl_schedule_proposal_control.SetInteractivity(false);
        UserControl_schedule_proposal_control.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["report_commanded_watchbill.p"]);
        }
      }

    private void TWebForm_report_commanded_watchbill_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("report_commanded_watchbill.p", p);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb),k.EMPTY));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      var recipient_q = p.biz_members.CurrentMemberEmailAddressesQueue((p.agency_filter == k.EMPTY ? k.EMPTY : p.biz_agencies.ShortDesignatorOf(p.agency_filter)),true);
      var recipient_q_count = recipient_q.Count;
      for (var i = new k.subtype<int>(0,recipient_q_count); i.val < recipient_q_count; i.val++ )
       {
        k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"],recipient_q.Dequeue().ToString(),"Ambulance Watchbill",body,true);
        }
      this.Session.Abandon();
      }

    } // end TWebForm_report_commanded_watchbill

  }
